## Install 
```
brew install streamingfast/tap/substreams
brew install protobuf
brew install streamingfast/tap/substreams-sink-sql
```

## Build the substreams and sink from yaml
```
substreams build --manifest substreams-devnet.yaml
substreams build --manifest substreams-mainnet.yaml
```
You will have two spkg files: `flipflop-indexer-devnet-v0.1.0.spkg` and `flipflop-indexer-mainnet-v0.1.0.spkg`

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

If the `entrypoint.sh` updated, you need to rebuild the docker image:
```
docker compose build --no-cache flipflop-indexer-mainnet
docker compose up -d --force-recreate --no-deps flipflop-indexer-mainnet

or

docker compose build --no-cache flipflop-indexer-devnet
docker compose up -d --force-recreate --no-deps flipflop-indexer-devnet
```

## Run substreams indexer on devnet
```
// Step 1: Initialize database tables and indexes from `schema.sql`
docker-compose run --rm -e RUN_MODE=setup flipflop-indexer-devnet

// Step 2: Run indexer
docker-compose up -d flipflop-indexer-devnet

docker-compose logs -f flipflop-indexer-devnet

// Step 3: Run PostGraphile to support graphql
docker-compose up -d flipflop-graph-devnet
```

## Run substreams indexer on mainnet
```
// Step 1: Initialize database tables and indexes from `schema.sql`
docker-compose run --rm -e RUN_MODE=setup flipflop-indexer-mainnet

// Step 2: Run indexer
docker-compose up -d flipflop-indexer-mainnet

docker-compose logs -f flipflop-indexer-mainnet

// Step 3: Run PostGraphile to support graphql
docker-compose up -d flipflop-graph-mainnet
```

## Problem solving
If you get Error: `ResourceExhausted desc = Concurrent stream limit exceeded`, please try to get a new API key from https://thegraph.market with different account.

