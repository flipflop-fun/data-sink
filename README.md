## Install 
```
brew install streamingfast/tap/substreams
brew install protobuf
brew install streamingfast/tap/substreams-sink-sql
```

## Build the substreams and sink
```
substreams build --manifest substreams-devnet.yaml
substreams build --manifest substreams-mainnet.yaml
```

## Prepare the environment
Get substreams API key from https://thegraph.market.

Set the `.env` as `.env.example`

If the connection of postgres support ssl, set `DB_SSLMODE=require`

## Start postgres in docker
```
docker-compose up -d postgres
```

## Build the docker image
```
docker-compose -f docker-compose.yml build --pull
```

## Run substreams indexer on devnet
```
// Step 1: Initialize database tables and indexes from `schema.sql`
docker-compose run --rm -e RUN_MODE=setup flipflop-indexer-devnet

// Step 2: Run indexer
docker-compose up -d flipflop-indexer-devnet

// Step 3: Run PostGraphile to support graphql
docker-compose up -d flipflop-graph-devnet
```

## Run substreams indexer on mainnet
```
// Step 1: Initialize database tables and indexes from `schema.sql`
docker-compose run --rm -e RUN_MODE=setup flipflop-indexer-mainnet

// Step 2: Run indexer
docker-compose up -d flipflop-indexer-mainnet

// Step 3: Run PostGraphile to support graphql
docker-compose up -d flipflop-graph-mainnet
```

