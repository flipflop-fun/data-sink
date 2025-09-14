/* PostGraphile Express server with CORS and connection-filter plugin */
const express = require('express');
const { postgraphile } = require('postgraphile');
const ConnectionFilterPlugin = require('postgraphile-plugin-connection-filter');

const {
  // DB settings
  DB_USER = 'postgres',
  DB_PASSWORD = '',
  DB_HOST = 'postgres',
  DB_PORT = '5432',
  DB_NAME = 'substreams',
  DB_SSLMODE = 'disable',
  DB_DSN, // optional: if provided, will override assembled DSN

  // Server & pool settings
  GRAPH_PORT, // preferred
  PORT,       // fallback
  GRAPHIQL_PATH = '/graphiql',
  GRAPH_PATH = '/graphql',
  PGPOOL_MAX = '50',
} = process.env;

// Assemble DSN if not provided via env DB_DSN
const assembledDsn =
  DB_DSN ||
  `postgres://${encodeURIComponent(DB_USER)}:${encodeURIComponent(DB_PASSWORD)}@` +
  `${DB_HOST}:${DB_PORT}/${DB_NAME}` +
  `?sslmode=${DB_SSLMODE}` +
  `&connect_timeout=5&keepalives=1&keepalives_idle=30&keepalives_interval=10&keepalives_count=3`;

const listenPort = parseInt(GRAPH_PORT || PORT || '5050', 10);
const poolSize = parseInt(PGPOOL_MAX || '50', 10);

const app = express();

// Global CORS (Access-Control-Allow-Methods 包含 OPTIONS)
const rawCors = process.env.GRAPH_CORS;
console.log("cors", rawCors);
const allowAnyOrigin = !rawCors || rawCors.trim() === '' || rawCors.trim() === '*';
const allowedOrigins = allowAnyOrigin
  ? null
  : new Set(rawCors.split(',').map(s => s.trim()).filter(Boolean));

app.use((req, res, next) => {
  const origin = req.headers.origin;
  if (allowAnyOrigin) {
    res.setHeader('Access-Control-Allow-Origin', '*');
  } else if (origin && allowedOrigins.has(origin)) {
    res.setHeader('Access-Control-Allow-Origin', origin);
  }
  res.setHeader('Vary', 'Origin');
  res.setHeader('Access-Control-Allow-Methods', 'GET,HEAD,POST,OPTIONS');
  res.setHeader(
    'Access-Control-Allow-Headers',
    req.headers['access-control-request-headers'] || '*'
  );
  res.setHeader('Access-Control-Max-Age', '86400');
  if (req.method === 'OPTIONS') {
    res.statusCode = 204;
    return res.end();
  }
  next();
});

// PostGraphile middleware
const pgMiddleware = postgraphile(assembledDsn, 'public', {
    enhanceGraphiql: true,
    graphiql: true,
    graphqlRoute: GRAPH_PATH || '/graphql',
    graphiqlRoute: GRAPHIQL_PATH || '/graphiql',
    watchPg: true,
    disableQueryLog: true,
    enableCors: false,
    appendPlugins: [ConnectionFilterPlugin],
    graphileBuildOptions: {
        connectionFilterRelations: true,
        connectionFilterAllowNullInput: true,
        connectionFilterAllowedOperators: [
        'isNull','equalTo','notEqualTo','lessThan','lessThanOrEqualTo',
        'greaterThan','greaterThanOrEqualTo','in','notIn',
        'includesInsensitive','like','ilike','startsWith','endsWith',
        ],
    },
    pgPoolSize: poolSize,
    pgSettings: {
        statement_timeout: '15000',
        idle_in_transaction_session_timeout: '5000',
    },
});

app.use(pgMiddleware);

app.listen(listenPort, '0.0.0.0', () => {
  console.log(
    `[graph] listening on ${listenPort}, path=${GRAPH_PATH}, pool=${poolSize}, DSN=${assembledDsn}`
  );
});