--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', 'public', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: graph-node
--

-- CREATE SCHEMA IF NOT EXISTS public;


ALTER SCHEMA public OWNER TO "graph-node";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: close_token_event_entity; Type: TABLE; Schema: public; Owner: graph-node
--

CREATE TABLE IF NOT EXISTS public.close_token_event_entity (
    vid bigint NOT NULL,
    block_height numeric NOT NULL,
    id text NOT NULL,
    tx_id text NOT NULL,
    mint text NOT NULL,
    config_account text NOT NULL,
    token_vault text NOT NULL
);


ALTER TABLE public.close_token_event_entity OWNER TO "graph-node";

--
-- Name: close_token_event_entity_vid_seq; Type: SEQUENCE; Schema: public; Owner: graph-node
--

CREATE SEQUENCE IF NOT EXISTS public.close_token_event_entity_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.close_token_event_entity_vid_seq OWNER TO "graph-node";

--
-- Name: close_token_event_entity_vid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph-node
--

ALTER SEQUENCE public.close_token_event_entity_vid_seq OWNED BY public.close_token_event_entity.vid;


--
-- Name: holders_entity; Type: TABLE; Schema: public; Owner: graph-node
--

CREATE TABLE IF NOT EXISTS public.holders_entity (
    vid bigint NOT NULL,
    id text NOT NULL,
    owner text NOT NULL,
    mint text NOT NULL,
    amount numeric NOT NULL,
    freeze_status boolean
);


ALTER TABLE public.holders_entity OWNER TO "graph-node";

--
-- Name: holders_entity_vid_seq; Type: SEQUENCE; Schema: public; Owner: graph-node
--

CREATE SEQUENCE IF NOT EXISTS public.holders_entity_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.holders_entity_vid_seq OWNER TO "graph-node";

--
-- Name: holders_entity_vid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph-node
--

ALTER SEQUENCE public.holders_entity_vid_seq OWNED BY public.holders_entity.vid;


--
-- Name: initialize_token_event_entity; Type: TABLE; Schema: public; Owner: graph-node
--

CREATE TABLE IF NOT EXISTS public.initialize_token_event_entity (
    vid bigint NOT NULL,
    block_height numeric NOT NULL,
    id text NOT NULL,
    tx_id text NOT NULL,
    admin text NOT NULL,
    token_id numeric NOT NULL,
    mint text NOT NULL,
    config_account text NOT NULL,
    metadata_account text NOT NULL,
    token_vault text NOT NULL,
    "timestamp" numeric NOT NULL,
    start_timestamp numeric NOT NULL,
    metadata_timestamp numeric NOT NULL,
    value_manager text NOT NULL,
    wsol_vault text NOT NULL,
    token_name text,
    token_symbol text,
    token_uri text,
    supply numeric NOT NULL,
    current_era numeric NOT NULL,
    current_epoch numeric NOT NULL,
    elapsed_seconds_epoch numeric NOT NULL,
    start_timestamp_epoch numeric NOT NULL,
    last_difficulty_coefficient_epoch numeric NOT NULL,
    difficulty_coefficient_epoch numeric NOT NULL,
    mint_size_epoch numeric NOT NULL,
    quantity_minted_epoch numeric NOT NULL,
    target_mint_size_epoch numeric NOT NULL,
    total_mint_fee numeric NOT NULL,
    total_referrer_fee numeric NOT NULL,
    total_tokens numeric NOT NULL,
    graduate_epoch numeric NOT NULL,
    target_eras numeric,
    epoches_per_era numeric,
    target_seconds_per_epoch numeric NOT NULL,
    reduce_ratio numeric NOT NULL,
    initial_mint_size numeric NOT NULL,
    initial_target_mint_size_per_epoch numeric NOT NULL,
    fee_rate numeric NOT NULL,
    liquidity_tokens_ratio numeric NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public.initialize_token_event_entity OWNER TO "graph-node";

--
-- Name: initialize_token_event_entity_vid_seq; Type: SEQUENCE; Schema: public; Owner: graph-node
--

CREATE SEQUENCE IF NOT EXISTS public.initialize_token_event_entity_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.initialize_token_event_entity_vid_seq OWNER TO "graph-node";

--
-- Name: initialize_token_event_entity_vid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph-node
--

ALTER SEQUENCE public.initialize_token_event_entity_vid_seq OWNED BY public.initialize_token_event_entity.vid;


--
-- Name: mint_token_entity; Type: TABLE; Schema: public; Owner: graph-node
--

CREATE TABLE IF NOT EXISTS public.mint_token_entity (
    vid bigint NOT NULL,
    block_height numeric NOT NULL,
    id text NOT NULL,
    tx_id text NOT NULL,
    sender text NOT NULL,
    mint text NOT NULL,
    config_account text NOT NULL,
    token_vault text NOT NULL,
    referral_account text NOT NULL,
    referrer_main text NOT NULL,
    referrer_ata text NOT NULL,
    refund_account text NOT NULL,
    "timestamp" numeric NOT NULL,
    mint_fee numeric NOT NULL,
    referrer_fee numeric NOT NULL,
    wsol_vault text NOT NULL,
    supply numeric NOT NULL,
    current_era numeric NOT NULL,
    current_epoch numeric NOT NULL,
    elapsed_seconds_epoch numeric NOT NULL,
    start_timestamp_epoch numeric NOT NULL,
    last_difficulty_coefficient_epoch numeric NOT NULL,
    difficulty_coefficient_epoch numeric NOT NULL,
    mint_size_epoch numeric NOT NULL,
    quantity_minted_epoch numeric NOT NULL,
    target_mint_size_epoch numeric NOT NULL,
    total_mint_fee numeric NOT NULL,
    total_referrer_fee numeric NOT NULL,
    total_tokens numeric NOT NULL,
    graduate_epoch numeric NOT NULL
);


ALTER TABLE public.mint_token_entity OWNER TO "graph-node";

--
-- Name: mint_token_entity_vid_seq; Type: SEQUENCE; Schema: public; Owner: graph-node
--

CREATE SEQUENCE IF NOT EXISTS public.mint_token_entity_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mint_token_entity_vid_seq OWNER TO "graph-node";

--
-- Name: mint_token_entity_vid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph-node
--

ALTER SEQUENCE public.mint_token_entity_vid_seq OWNED BY public.mint_token_entity.vid;

--
-- Name: my_entity_vid_seq; Type: SEQUENCE; Schema: public; Owner: graph-node
--

CREATE SEQUENCE IF NOT EXISTS public.my_entity_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.my_entity_vid_seq OWNER TO "graph-node";

--
-- Name: proxy_burn_lp_tokens_event_entity; Type: TABLE; Schema: public; Owner: graph-node
--

CREATE TABLE IF NOT EXISTS public.proxy_burn_lp_tokens_event_entity (
    vid bigint NOT NULL,
    block_height numeric NOT NULL,
    id text NOT NULL,
    tx_id text NOT NULL,
    token_mint text NOT NULL,
    token_name text NOT NULL,
    token_symbol text NOT NULL,
    lp_mint text NOT NULL,
    lp_amount numeric NOT NULL,
    block_timestamp numeric NOT NULL
);


ALTER TABLE public.proxy_burn_lp_tokens_event_entity OWNER TO "graph-node";

--
-- Name: proxy_burn_lp_tokens_event_entity_vid_seq; Type: SEQUENCE; Schema: public; Owner: graph-node
--

CREATE SEQUENCE IF NOT EXISTS public.proxy_burn_lp_tokens_event_entity_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proxy_burn_lp_tokens_event_entity_vid_seq OWNER TO "graph-node";

--
-- Name: proxy_burn_lp_tokens_event_entity_vid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph-node
--

ALTER SEQUENCE public.proxy_burn_lp_tokens_event_entity_vid_seq OWNED BY public.proxy_burn_lp_tokens_event_entity.vid;


--
-- Name: proxy_liquidity_event_entity; Type: TABLE; Schema: public; Owner: graph-node
--

CREATE TABLE IF NOT EXISTS public.proxy_liquidity_event_entity (
    vid bigint NOT NULL,
    block_height numeric NOT NULL,
    id text NOT NULL,
    tx_id text NOT NULL,
    token_mint text NOT NULL,
    token_name text NOT NULL,
    token_symbol text NOT NULL,
    action text NOT NULL,
    token_0_mint text NOT NULL,
    token_1_mint text NOT NULL,
    token_0_amount numeric NOT NULL,
    token_1_amount numeric NOT NULL,
    pool_state text NOT NULL,
    lp_mint text NOT NULL,
    lp_amount numeric NOT NULL,
    block_timestamp numeric NOT NULL
);


ALTER TABLE public.proxy_liquidity_event_entity OWNER TO "graph-node";

--
-- Name: proxy_liquidity_event_entity_vid_seq; Type: SEQUENCE; Schema: public; Owner: graph-node
--

CREATE SEQUENCE IF NOT EXISTS public.proxy_liquidity_event_entity_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proxy_liquidity_event_entity_vid_seq OWNER TO "graph-node";

--
-- Name: proxy_liquidity_event_entity_vid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph-node
--

ALTER SEQUENCE public.proxy_liquidity_event_entity_vid_seq OWNED BY public.proxy_liquidity_event_entity.vid;


--
-- Name: proxy_swap_base_event_entity; Type: TABLE; Schema: public; Owner: graph-node
--

CREATE TABLE IF NOT EXISTS public.proxy_swap_base_event_entity (
    vid bigint NOT NULL,
    block_height numeric NOT NULL,
    id text NOT NULL,
    tx_id text NOT NULL,
    token_mint text NOT NULL,
    token_name text NOT NULL,
    token_symbol text NOT NULL,
    action text NOT NULL,
    base_mint text NOT NULL,
    price_mint text NOT NULL,
    base_amount numeric NOT NULL,
    price_amount numeric NOT NULL,
    pool_state text NOT NULL,
    block_timestamp numeric NOT NULL
);


ALTER TABLE public.proxy_swap_base_event_entity OWNER TO "graph-node";

--
-- Name: proxy_swap_base_event_entity_vid_seq; Type: SEQUENCE; Schema: public; Owner: graph-node
--

CREATE SEQUENCE IF NOT EXISTS public.proxy_swap_base_event_entity_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proxy_swap_base_event_entity_vid_seq OWNER TO "graph-node";

--
-- Name: proxy_swap_base_event_entity_vid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph-node
--

ALTER SEQUENCE public.proxy_swap_base_event_entity_vid_seq OWNED BY public.proxy_swap_base_event_entity.vid;


--
-- Name: refund_event_entity; Type: TABLE; Schema: public; Owner: graph-node
--

CREATE TABLE IF NOT EXISTS public.refund_event_entity (
    vid bigint NOT NULL,
    block_height numeric NOT NULL,
    id text NOT NULL,
    tx_id text NOT NULL,
    sender text NOT NULL,
    mint text NOT NULL,
    refund_account text NOT NULL,
    config_account text NOT NULL,
    token_vault text NOT NULL,
    token_ata text NOT NULL,
    "timestamp" numeric NOT NULL,
    supply numeric NOT NULL,
    total_tokens numeric NOT NULL,
    total_mint_fee numeric NOT NULL,
    refund_fee numeric NOT NULL,
    refund_amount_including_fee numeric NOT NULL,
    burn_amount_from_vault numeric NOT NULL,
    burn_amount_from_user numeric NOT NULL
);


ALTER TABLE public.refund_event_entity OWNER TO "graph-node";

--
-- Name: refund_event_entity_vid_seq; Type: SEQUENCE; Schema: public; Owner: graph-node
--

CREATE SEQUENCE IF NOT EXISTS public.refund_event_entity_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.refund_event_entity_vid_seq OWNER TO "graph-node";

--
-- Name: refund_event_entity_vid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph-node
--

ALTER SEQUENCE public.refund_event_entity_vid_seq OWNED BY public.refund_event_entity.vid;


--
-- Name: set_referer_code_event_entity; Type: TABLE; Schema: public; Owner: graph-node
--

CREATE TABLE IF NOT EXISTS public.set_referer_code_event_entity (
    vid bigint NOT NULL,
    block_height numeric NOT NULL,
    id text NOT NULL,
    tx_id text NOT NULL,
    mint text NOT NULL,
    referral_account text NOT NULL,
    referrer_ata text NOT NULL,
    referrer_main text NOT NULL,
    active_timestamp numeric NOT NULL
);


ALTER TABLE public.set_referer_code_event_entity OWNER TO "graph-node";

--
-- Name: set_referer_code_event_entity_vid_seq; Type: SEQUENCE; Schema: public; Owner: graph-node
--

CREATE SEQUENCE IF NOT EXISTS public.set_referer_code_event_entity_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.set_referer_code_event_entity_vid_seq OWNER TO "graph-node";

--
-- Name: set_referer_code_event_entity_vid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph-node
--

ALTER SEQUENCE public.set_referer_code_event_entity_vid_seq OWNED BY public.set_referer_code_event_entity.vid;


--
-- Name: update_token_metadata_event_entity; Type: TABLE; Schema: public; Owner: graph-node
--

CREATE TABLE IF NOT EXISTS public.update_token_metadata_event_entity (
    vid bigint NOT NULL,
    block_height numeric NOT NULL,
    id text NOT NULL,
    tx_id text NOT NULL,
    token_name text,
    token_symbol text,
    token_uri text,
    admin text NOT NULL,
    mint text NOT NULL,
    config_account text NOT NULL,
    metadata_account text NOT NULL,
    "timestamp" numeric NOT NULL
);


ALTER TABLE public.update_token_metadata_event_entity OWNER TO "graph-node";

--
-- Name: update_token_metadata_event_entity_vid_seq; Type: SEQUENCE; Schema: public; Owner: graph-node
--

CREATE SEQUENCE IF NOT EXISTS public.update_token_metadata_event_entity_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.update_token_metadata_event_entity_vid_seq OWNER TO "graph-node";

--
-- Name: update_token_metadata_event_entity_vid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: graph-node
--

ALTER SEQUENCE public.update_token_metadata_event_entity_vid_seq OWNED BY public.update_token_metadata_event_entity.vid;


--
-- Name: close_token_event_entity vid; Type: DEFAULT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.close_token_event_entity ALTER COLUMN vid SET DEFAULT nextval('public.close_token_event_entity_vid_seq'::regclass);


--
-- Name: holders_entity vid; Type: DEFAULT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.holders_entity ALTER COLUMN vid SET DEFAULT nextval('public.holders_entity_vid_seq'::regclass);


--
-- Name: initialize_token_event_entity vid; Type: DEFAULT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.initialize_token_event_entity ALTER COLUMN vid SET DEFAULT nextval('public.initialize_token_event_entity_vid_seq'::regclass);


--
-- Name: mint_token_entity vid; Type: DEFAULT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.mint_token_entity ALTER COLUMN vid SET DEFAULT nextval('public.mint_token_entity_vid_seq'::regclass);

--
-- Name: proxy_burn_lp_tokens_event_entity vid; Type: DEFAULT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.proxy_burn_lp_tokens_event_entity ALTER COLUMN vid SET DEFAULT nextval('public.proxy_burn_lp_tokens_event_entity_vid_seq'::regclass);


--
-- Name: proxy_liquidity_event_entity vid; Type: DEFAULT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.proxy_liquidity_event_entity ALTER COLUMN vid SET DEFAULT nextval('public.proxy_liquidity_event_entity_vid_seq'::regclass);


--
-- Name: proxy_swap_base_event_entity vid; Type: DEFAULT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.proxy_swap_base_event_entity ALTER COLUMN vid SET DEFAULT nextval('public.proxy_swap_base_event_entity_vid_seq'::regclass);


--
-- Name: refund_event_entity vid; Type: DEFAULT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.refund_event_entity ALTER COLUMN vid SET DEFAULT nextval('public.refund_event_entity_vid_seq'::regclass);


--
-- Name: set_referer_code_event_entity vid; Type: DEFAULT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.set_referer_code_event_entity ALTER COLUMN vid SET DEFAULT nextval('public.set_referer_code_event_entity_vid_seq'::regclass);


--
-- Name: update_token_metadata_event_entity vid; Type: DEFAULT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.update_token_metadata_event_entity ALTER COLUMN vid SET DEFAULT nextval('public.update_token_metadata_event_entity_vid_seq'::regclass);


--
-- Name: close_token_event_entity close_token_event_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.close_token_event_entity
    ADD CONSTRAINT close_token_event_entity_pkey PRIMARY KEY (id);

--
-- Name: holders_entity holders_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.holders_entity
    ADD CONSTRAINT holders_entity_pkey PRIMARY KEY (id);


--
-- Name: initialize_token_event_entity initialize_token_event_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.initialize_token_event_entity
    ADD CONSTRAINT initialize_token_event_entity_pkey PRIMARY KEY (id);


--
-- Name: mint_token_entity mint_token_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.mint_token_entity
    ADD CONSTRAINT mint_token_entity_pkey PRIMARY KEY (id);

--
-- Name: proxy_burn_lp_tokens_event_entity proxy_burn_lp_tokens_event_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.proxy_burn_lp_tokens_event_entity
    ADD CONSTRAINT proxy_burn_lp_tokens_event_entity_pkey PRIMARY KEY (id);


--
-- Name: proxy_liquidity_event_entity proxy_liquidity_event_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.proxy_liquidity_event_entity
    ADD CONSTRAINT proxy_liquidity_event_entity_pkey PRIMARY KEY (id);


--
-- Name: proxy_swap_base_event_entity proxy_swap_base_event_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.proxy_swap_base_event_entity
    ADD CONSTRAINT proxy_swap_base_event_entity_pkey PRIMARY KEY (id);


--
-- Name: refund_event_entity refund_event_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.refund_event_entity
    ADD CONSTRAINT refund_event_entity_pkey PRIMARY KEY (id);


--
-- Name: set_referer_code_event_entity set_referer_code_event_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.set_referer_code_event_entity
    ADD CONSTRAINT set_referer_code_event_entity_pkey PRIMARY KEY (id);


--
-- Name: update_token_metadata_event_entity update_token_metadata_event_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: graph-node
--

ALTER TABLE ONLY public.update_token_metadata_event_entity
    ADD CONSTRAINT update_token_metadata_event_entity_pkey PRIMARY KEY (id);


--
-- Name: attr_10_0_proxy_burn_lp_tokens_event_entity_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_10_0_proxy_burn_lp_tokens_event_entity_id ON public.proxy_burn_lp_tokens_event_entity USING btree (id);


--
-- Name: attr_10_1_proxy_burn_lp_tokens_event_entity_tx_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_10_1_proxy_burn_lp_tokens_event_entity_tx_id ON public.proxy_burn_lp_tokens_event_entity USING btree ("left"(tx_id, 256));


--
-- Name: attr_10_2_proxy_burn_lp_tokens_event_entity_token_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_10_2_proxy_burn_lp_tokens_event_entity_token_mint ON public.proxy_burn_lp_tokens_event_entity USING btree ("left"(token_mint, 256));


--
-- Name: attr_10_3_proxy_burn_lp_tokens_event_entity_token_name; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_10_3_proxy_burn_lp_tokens_event_entity_token_name ON public.proxy_burn_lp_tokens_event_entity USING btree ("left"(token_name, 256));


--
-- Name: attr_10_4_proxy_burn_lp_tokens_event_entity_token_symbol; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_10_4_proxy_burn_lp_tokens_event_entity_token_symbol ON public.proxy_burn_lp_tokens_event_entity USING btree ("left"(token_symbol, 256));


--
-- Name: attr_10_5_proxy_burn_lp_tokens_event_entity_lp_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_10_5_proxy_burn_lp_tokens_event_entity_lp_mint ON public.proxy_burn_lp_tokens_event_entity USING btree ("left"(lp_mint, 256));


--
-- Name: attr_10_6_proxy_burn_lp_tokens_event_entity_lp_amount; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_10_6_proxy_burn_lp_tokens_event_entity_lp_amount ON public.proxy_burn_lp_tokens_event_entity USING btree (lp_amount);


--
-- Name: attr_10_7_proxy_burn_lp_tokens_event_entity_block_timestamp; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_10_7_proxy_burn_lp_tokens_event_entity_block_timestamp ON public.proxy_burn_lp_tokens_event_entity USING btree (block_timestamp);

--
-- Name: attr_1_0_initialize_token_event_entity_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_0_initialize_token_event_entity_id ON public.initialize_token_event_entity USING btree (id);


--
-- Name: attr_1_10_initialize_token_event_entity_metadata_timestamp; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_10_initialize_token_event_entity_metadata_timestamp ON public.initialize_token_event_entity USING btree (metadata_timestamp);


--
-- Name: attr_1_11_initialize_token_event_entity_value_manager; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_11_initialize_token_event_entity_value_manager ON public.initialize_token_event_entity USING btree ("left"(value_manager, 256));


--
-- Name: attr_1_12_initialize_token_event_entity_wsol_vault; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_12_initialize_token_event_entity_wsol_vault ON public.initialize_token_event_entity USING btree ("left"(wsol_vault, 256));


--
-- Name: attr_1_13_initialize_token_event_entity_token_name; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_13_initialize_token_event_entity_token_name ON public.initialize_token_event_entity USING btree ("left"(token_name, 256));


--
-- Name: attr_1_14_initialize_token_event_entity_token_symbol; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_14_initialize_token_event_entity_token_symbol ON public.initialize_token_event_entity USING btree ("left"(token_symbol, 256));


--
-- Name: attr_1_15_initialize_token_event_entity_token_uri; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_15_initialize_token_event_entity_token_uri ON public.initialize_token_event_entity USING btree ("left"(token_uri, 256));


--
-- Name: attr_1_16_initialize_token_event_entity_supply; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_16_initialize_token_event_entity_supply ON public.initialize_token_event_entity USING btree (supply);


--
-- Name: attr_1_17_initialize_token_event_entity_current_era; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_17_initialize_token_event_entity_current_era ON public.initialize_token_event_entity USING btree (current_era);


--
-- Name: attr_1_18_initialize_token_event_entity_current_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_18_initialize_token_event_entity_current_epoch ON public.initialize_token_event_entity USING btree (current_epoch);


--
-- Name: attr_1_19_initialize_token_event_entity_elapsed_seconds_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_19_initialize_token_event_entity_elapsed_seconds_epoch ON public.initialize_token_event_entity USING btree (elapsed_seconds_epoch);


--
-- Name: attr_1_1_initialize_token_event_entity_tx_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_1_initialize_token_event_entity_tx_id ON public.initialize_token_event_entity USING btree ("left"(tx_id, 256));


--
-- Name: attr_1_20_initialize_token_event_entity_start_timestamp_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_20_initialize_token_event_entity_start_timestamp_epoch ON public.initialize_token_event_entity USING btree (start_timestamp_epoch);


--
-- Name: attr_1_21_initialize_token_event_entity_last_difficulty_coeffic; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_21_initialize_token_event_entity_last_difficulty_coeffic ON public.initialize_token_event_entity USING btree (last_difficulty_coefficient_epoch);


--
-- Name: attr_1_22_initialize_token_event_entity_difficulty_coefficient_; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_22_initialize_token_event_entity_difficulty_coefficient_ ON public.initialize_token_event_entity USING btree (difficulty_coefficient_epoch);


--
-- Name: attr_1_23_initialize_token_event_entity_mint_size_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_23_initialize_token_event_entity_mint_size_epoch ON public.initialize_token_event_entity USING btree (mint_size_epoch);


--
-- Name: attr_1_24_initialize_token_event_entity_quantity_minted_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_24_initialize_token_event_entity_quantity_minted_epoch ON public.initialize_token_event_entity USING btree (quantity_minted_epoch);


--
-- Name: attr_1_25_initialize_token_event_entity_target_mint_size_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_25_initialize_token_event_entity_target_mint_size_epoch ON public.initialize_token_event_entity USING btree (target_mint_size_epoch);


--
-- Name: attr_1_26_initialize_token_event_entity_total_mint_fee; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_26_initialize_token_event_entity_total_mint_fee ON public.initialize_token_event_entity USING btree (total_mint_fee);


--
-- Name: attr_1_27_initialize_token_event_entity_total_referrer_fee; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_27_initialize_token_event_entity_total_referrer_fee ON public.initialize_token_event_entity USING btree (total_referrer_fee);


--
-- Name: attr_1_28_initialize_token_event_entity_total_tokens; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_28_initialize_token_event_entity_total_tokens ON public.initialize_token_event_entity USING btree (total_tokens);


--
-- Name: attr_1_29_initialize_token_event_entity_graduate_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_29_initialize_token_event_entity_graduate_epoch ON public.initialize_token_event_entity USING btree (graduate_epoch);


--
-- Name: attr_1_2_initialize_token_event_entity_admin; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_2_initialize_token_event_entity_admin ON public.initialize_token_event_entity USING btree ("left"(admin, 256));


--
-- Name: attr_1_30_initialize_token_event_entity_target_eras; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_30_initialize_token_event_entity_target_eras ON public.initialize_token_event_entity USING btree (target_eras);


--
-- Name: attr_1_31_initialize_token_event_entity_epoches_per_era; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_31_initialize_token_event_entity_epoches_per_era ON public.initialize_token_event_entity USING btree (epoches_per_era);


--
-- Name: attr_1_32_initialize_token_event_entity_target_seconds_per_epoc; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_32_initialize_token_event_entity_target_seconds_per_epoc ON public.initialize_token_event_entity USING btree (target_seconds_per_epoch);


--
-- Name: attr_1_33_initialize_token_event_entity_reduce_ratio; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_33_initialize_token_event_entity_reduce_ratio ON public.initialize_token_event_entity USING btree (reduce_ratio);


--
-- Name: attr_1_34_initialize_token_event_entity_initial_mint_size; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_34_initialize_token_event_entity_initial_mint_size ON public.initialize_token_event_entity USING btree (initial_mint_size);


--
-- Name: attr_1_35_initialize_token_event_entity_initial_target_mint_siz; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_35_initialize_token_event_entity_initial_target_mint_siz ON public.initialize_token_event_entity USING btree (initial_target_mint_size_per_epoch);


--
-- Name: attr_1_36_initialize_token_event_entity_fee_rate; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_36_initialize_token_event_entity_fee_rate ON public.initialize_token_event_entity USING btree (fee_rate);


--
-- Name: attr_1_37_initialize_token_event_entity_liquidity_tokens_ratio; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_37_initialize_token_event_entity_liquidity_tokens_ratio ON public.initialize_token_event_entity USING btree (liquidity_tokens_ratio);


--
-- Name: attr_1_38_initialize_token_event_entity_status; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_38_initialize_token_event_entity_status ON public.initialize_token_event_entity USING btree (status);


--
-- Name: attr_1_3_initialize_token_event_entity_token_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_3_initialize_token_event_entity_token_id ON public.initialize_token_event_entity USING btree (token_id);


--
-- Name: attr_1_4_initialize_token_event_entity_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_4_initialize_token_event_entity_mint ON public.initialize_token_event_entity USING btree ("left"(mint, 256));


--
-- Name: attr_1_5_initialize_token_event_entity_config_account; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_5_initialize_token_event_entity_config_account ON public.initialize_token_event_entity USING btree ("left"(config_account, 256));


--
-- Name: attr_1_6_initialize_token_event_entity_metadata_account; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_6_initialize_token_event_entity_metadata_account ON public.initialize_token_event_entity USING btree ("left"(metadata_account, 256));


--
-- Name: attr_1_7_initialize_token_event_entity_token_vault; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_7_initialize_token_event_entity_token_vault ON public.initialize_token_event_entity USING btree ("left"(token_vault, 256));


--
-- Name: attr_1_8_initialize_token_event_entity_timestamp; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_8_initialize_token_event_entity_timestamp ON public.initialize_token_event_entity USING btree ("timestamp");


--
-- Name: attr_1_9_initialize_token_event_entity_start_timestamp; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_1_9_initialize_token_event_entity_start_timestamp ON public.initialize_token_event_entity USING btree (start_timestamp);


--
-- Name: attr_2_0_mint_token_entity_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_0_mint_token_entity_id ON public.mint_token_entity USING btree (id);


--
-- Name: attr_2_10_mint_token_entity_timestamp; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_10_mint_token_entity_timestamp ON public.mint_token_entity USING btree ("timestamp");


--
-- Name: attr_2_11_mint_token_entity_mint_fee; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_11_mint_token_entity_mint_fee ON public.mint_token_entity USING btree (mint_fee);


--
-- Name: attr_2_12_mint_token_entity_referrer_fee; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_12_mint_token_entity_referrer_fee ON public.mint_token_entity USING btree (referrer_fee);


--
-- Name: attr_2_13_mint_token_entity_wsol_vault; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_13_mint_token_entity_wsol_vault ON public.mint_token_entity USING btree ("left"(wsol_vault, 256));


--
-- Name: attr_2_14_mint_token_entity_supply; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_14_mint_token_entity_supply ON public.mint_token_entity USING btree (supply);


--
-- Name: attr_2_15_mint_token_entity_current_era; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_15_mint_token_entity_current_era ON public.mint_token_entity USING btree (current_era);


--
-- Name: attr_2_16_mint_token_entity_current_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_16_mint_token_entity_current_epoch ON public.mint_token_entity USING btree (current_epoch);


--
-- Name: attr_2_17_mint_token_entity_elapsed_seconds_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_17_mint_token_entity_elapsed_seconds_epoch ON public.mint_token_entity USING btree (elapsed_seconds_epoch);


--
-- Name: attr_2_18_mint_token_entity_start_timestamp_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_18_mint_token_entity_start_timestamp_epoch ON public.mint_token_entity USING btree (start_timestamp_epoch);


--
-- Name: attr_2_19_mint_token_entity_last_difficulty_coefficient_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_19_mint_token_entity_last_difficulty_coefficient_epoch ON public.mint_token_entity USING btree (last_difficulty_coefficient_epoch);


--
-- Name: attr_2_1_mint_token_entity_tx_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_1_mint_token_entity_tx_id ON public.mint_token_entity USING btree ("left"(tx_id, 256));


--
-- Name: attr_2_20_mint_token_entity_difficulty_coefficient_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_20_mint_token_entity_difficulty_coefficient_epoch ON public.mint_token_entity USING btree (difficulty_coefficient_epoch);


--
-- Name: attr_2_21_mint_token_entity_mint_size_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_21_mint_token_entity_mint_size_epoch ON public.mint_token_entity USING btree (mint_size_epoch);


--
-- Name: attr_2_22_mint_token_entity_quantity_minted_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_22_mint_token_entity_quantity_minted_epoch ON public.mint_token_entity USING btree (quantity_minted_epoch);


--
-- Name: attr_2_23_mint_token_entity_target_mint_size_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_23_mint_token_entity_target_mint_size_epoch ON public.mint_token_entity USING btree (target_mint_size_epoch);


--
-- Name: attr_2_24_mint_token_entity_total_mint_fee; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_24_mint_token_entity_total_mint_fee ON public.mint_token_entity USING btree (total_mint_fee);


--
-- Name: attr_2_25_mint_token_entity_total_referrer_fee; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_25_mint_token_entity_total_referrer_fee ON public.mint_token_entity USING btree (total_referrer_fee);


--
-- Name: attr_2_26_mint_token_entity_total_tokens; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_26_mint_token_entity_total_tokens ON public.mint_token_entity USING btree (total_tokens);


--
-- Name: attr_2_27_mint_token_entity_graduate_epoch; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_27_mint_token_entity_graduate_epoch ON public.mint_token_entity USING btree (graduate_epoch);


--
-- Name: attr_2_2_mint_token_entity_sender; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_2_mint_token_entity_sender ON public.mint_token_entity USING btree ("left"(sender, 256));


--
-- Name: attr_2_3_mint_token_entity_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_3_mint_token_entity_mint ON public.mint_token_entity USING btree ("left"(mint, 256));


--
-- Name: attr_2_4_mint_token_entity_config_account; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_4_mint_token_entity_config_account ON public.mint_token_entity USING btree ("left"(config_account, 256));


--
-- Name: attr_2_5_mint_token_entity_token_vault; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_5_mint_token_entity_token_vault ON public.mint_token_entity USING btree ("left"(token_vault, 256));


--
-- Name: attr_2_6_mint_token_entity_referral_account; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_6_mint_token_entity_referral_account ON public.mint_token_entity USING btree ("left"(referral_account, 256));


--
-- Name: attr_2_7_mint_token_entity_referrer_main; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_7_mint_token_entity_referrer_main ON public.mint_token_entity USING btree ("left"(referrer_main, 256));


--
-- Name: attr_2_8_mint_token_entity_referrer_ata; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_8_mint_token_entity_referrer_ata ON public.mint_token_entity USING btree ("left"(referrer_ata, 256));


--
-- Name: attr_2_9_mint_token_entity_refund_account; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_2_9_mint_token_entity_refund_account ON public.mint_token_entity USING btree ("left"(refund_account, 256));


--
-- Name: attr_3_0_holders_entity_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_3_0_holders_entity_id ON public.holders_entity USING btree (id);


--
-- Name: attr_3_1_holders_entity_owner; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_3_1_holders_entity_owner ON public.holders_entity USING btree ("left"(owner, 256));


--
-- Name: attr_3_2_holders_entity_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_3_2_holders_entity_mint ON public.holders_entity USING btree ("left"(mint, 256));


--
-- Name: attr_3_3_holders_entity_amount; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_3_3_holders_entity_amount ON public.holders_entity USING btree (amount);


--
-- Name: attr_3_4_holders_entity_freeze_status; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_3_4_holders_entity_freeze_status ON public.holders_entity USING btree (freeze_status);


--
-- Name: attr_4_0_set_referer_code_event_entity_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_4_0_set_referer_code_event_entity_id ON public.set_referer_code_event_entity USING btree (id);


--
-- Name: attr_4_1_set_referer_code_event_entity_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_4_1_set_referer_code_event_entity_mint ON public.set_referer_code_event_entity USING btree ("left"(mint, 256));


--
-- Name: attr_4_2_set_referer_code_event_entity_referral_account; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_4_2_set_referer_code_event_entity_referral_account ON public.set_referer_code_event_entity USING btree ("left"(referral_account, 256));


--
-- Name: attr_4_3_set_referer_code_event_entity_referrer_ata; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_4_3_set_referer_code_event_entity_referrer_ata ON public.set_referer_code_event_entity USING btree ("left"(referrer_ata, 256));


--
-- Name: attr_4_4_set_referer_code_event_entity_referrer_main; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_4_4_set_referer_code_event_entity_referrer_main ON public.set_referer_code_event_entity USING btree ("left"(referrer_main, 256));


--
-- Name: attr_4_5_set_referer_code_event_entity_active_timestamp; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_4_5_set_referer_code_event_entity_active_timestamp ON public.set_referer_code_event_entity USING btree (active_timestamp);


--
-- Name: attr_5_0_refund_event_entity_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_0_refund_event_entity_id ON public.refund_event_entity USING btree (id);


--
-- Name: attr_5_10_refund_event_entity_total_tokens; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_10_refund_event_entity_total_tokens ON public.refund_event_entity USING btree (total_tokens);


--
-- Name: attr_5_11_refund_event_entity_total_mint_fee; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_11_refund_event_entity_total_mint_fee ON public.refund_event_entity USING btree (total_mint_fee);


--
-- Name: attr_5_12_refund_event_entity_refund_fee; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_12_refund_event_entity_refund_fee ON public.refund_event_entity USING btree (refund_fee);


--
-- Name: attr_5_13_refund_event_entity_refund_amount_including_fee; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_13_refund_event_entity_refund_amount_including_fee ON public.refund_event_entity USING btree (refund_amount_including_fee);


--
-- Name: attr_5_14_refund_event_entity_burn_amount_from_vault; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_14_refund_event_entity_burn_amount_from_vault ON public.refund_event_entity USING btree (burn_amount_from_vault);


--
-- Name: attr_5_15_refund_event_entity_burn_amount_from_user; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_15_refund_event_entity_burn_amount_from_user ON public.refund_event_entity USING btree (burn_amount_from_user);


--
-- Name: attr_5_1_refund_event_entity_tx_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_1_refund_event_entity_tx_id ON public.refund_event_entity USING btree ("left"(tx_id, 256));


--
-- Name: attr_5_2_refund_event_entity_sender; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_2_refund_event_entity_sender ON public.refund_event_entity USING btree ("left"(sender, 256));


--
-- Name: attr_5_3_refund_event_entity_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_3_refund_event_entity_mint ON public.refund_event_entity USING btree ("left"(mint, 256));


--
-- Name: attr_5_4_refund_event_entity_refund_account; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_4_refund_event_entity_refund_account ON public.refund_event_entity USING btree ("left"(refund_account, 256));


--
-- Name: attr_5_5_refund_event_entity_config_account; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_5_refund_event_entity_config_account ON public.refund_event_entity USING btree ("left"(config_account, 256));


--
-- Name: attr_5_6_refund_event_entity_token_vault; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_6_refund_event_entity_token_vault ON public.refund_event_entity USING btree ("left"(token_vault, 256));


--
-- Name: attr_5_7_refund_event_entity_token_ata; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_7_refund_event_entity_token_ata ON public.refund_event_entity USING btree ("left"(token_ata, 256));


--
-- Name: attr_5_8_refund_event_entity_timestamp; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_8_refund_event_entity_timestamp ON public.refund_event_entity USING btree ("timestamp");


--
-- Name: attr_5_9_refund_event_entity_supply; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_5_9_refund_event_entity_supply ON public.refund_event_entity USING btree (supply);


--
-- Name: attr_6_0_update_token_metadata_event_entity_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_6_0_update_token_metadata_event_entity_id ON public.update_token_metadata_event_entity USING btree (id);


--
-- Name: attr_6_1_update_token_metadata_event_entity_token_name; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_6_1_update_token_metadata_event_entity_token_name ON public.update_token_metadata_event_entity USING btree ("left"(token_name, 256));


--
-- Name: attr_6_2_update_token_metadata_event_entity_token_symbol; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_6_2_update_token_metadata_event_entity_token_symbol ON public.update_token_metadata_event_entity USING btree ("left"(token_symbol, 256));


--
-- Name: attr_6_3_update_token_metadata_event_entity_token_uri; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_6_3_update_token_metadata_event_entity_token_uri ON public.update_token_metadata_event_entity USING btree ("left"(token_uri, 256));


--
-- Name: attr_6_4_update_token_metadata_event_entity_admin; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_6_4_update_token_metadata_event_entity_admin ON public.update_token_metadata_event_entity USING btree ("left"(admin, 256));


--
-- Name: attr_6_5_update_token_metadata_event_entity_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_6_5_update_token_metadata_event_entity_mint ON public.update_token_metadata_event_entity USING btree ("left"(mint, 256));


--
-- Name: attr_6_6_update_token_metadata_event_entity_config_account; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_6_6_update_token_metadata_event_entity_config_account ON public.update_token_metadata_event_entity USING btree ("left"(config_account, 256));


--
-- Name: attr_6_7_update_token_metadata_event_entity_metadata_account; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_6_7_update_token_metadata_event_entity_metadata_account ON public.update_token_metadata_event_entity USING btree ("left"(metadata_account, 256));


--
-- Name: attr_6_8_update_token_metadata_event_entity_timestamp; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_6_8_update_token_metadata_event_entity_timestamp ON public.update_token_metadata_event_entity USING btree ("timestamp");


--
-- Name: attr_7_0_close_token_event_entity_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_7_0_close_token_event_entity_id ON public.close_token_event_entity USING btree (id);


--
-- Name: attr_7_1_close_token_event_entity_tx_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_7_1_close_token_event_entity_tx_id ON public.close_token_event_entity USING btree ("left"(tx_id, 256));


--
-- Name: attr_7_2_close_token_event_entity_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_7_2_close_token_event_entity_mint ON public.close_token_event_entity USING btree ("left"(mint, 256));


--
-- Name: attr_7_3_close_token_event_entity_config_account; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_7_3_close_token_event_entity_config_account ON public.close_token_event_entity USING btree ("left"(config_account, 256));


--
-- Name: attr_7_4_close_token_event_entity_token_vault; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_7_4_close_token_event_entity_token_vault ON public.close_token_event_entity USING btree ("left"(token_vault, 256));


--
-- Name: attr_8_0_proxy_liquidity_event_entity_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_0_proxy_liquidity_event_entity_id ON public.proxy_liquidity_event_entity USING btree (id);


--
-- Name: attr_8_10_proxy_liquidity_event_entity_pool_state; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_10_proxy_liquidity_event_entity_pool_state ON public.proxy_liquidity_event_entity USING btree ("left"(pool_state, 256));


--
-- Name: attr_8_11_proxy_liquidity_event_entity_lp_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_11_proxy_liquidity_event_entity_lp_mint ON public.proxy_liquidity_event_entity USING btree ("left"(lp_mint, 256));


--
-- Name: attr_8_12_proxy_liquidity_event_entity_lp_amount; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_12_proxy_liquidity_event_entity_lp_amount ON public.proxy_liquidity_event_entity USING btree (lp_amount);


--
-- Name: attr_8_13_proxy_liquidity_event_entity_block_timestamp; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_13_proxy_liquidity_event_entity_block_timestamp ON public.proxy_liquidity_event_entity USING btree (block_timestamp);


--
-- Name: attr_8_1_proxy_liquidity_event_entity_tx_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_1_proxy_liquidity_event_entity_tx_id ON public.proxy_liquidity_event_entity USING btree ("left"(tx_id, 256));


--
-- Name: attr_8_2_proxy_liquidity_event_entity_token_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_2_proxy_liquidity_event_entity_token_mint ON public.proxy_liquidity_event_entity USING btree ("left"(token_mint, 256));


--
-- Name: attr_8_3_proxy_liquidity_event_entity_token_name; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_3_proxy_liquidity_event_entity_token_name ON public.proxy_liquidity_event_entity USING btree ("left"(token_name, 256));


--
-- Name: attr_8_4_proxy_liquidity_event_entity_token_symbol; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_4_proxy_liquidity_event_entity_token_symbol ON public.proxy_liquidity_event_entity USING btree ("left"(token_symbol, 256));


--
-- Name: attr_8_5_proxy_liquidity_event_entity_action; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_5_proxy_liquidity_event_entity_action ON public.proxy_liquidity_event_entity USING btree ("left"(action, 256));


--
-- Name: attr_8_6_proxy_liquidity_event_entity_token_0_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_6_proxy_liquidity_event_entity_token_0_mint ON public.proxy_liquidity_event_entity USING btree ("left"(token_0_mint, 256));


--
-- Name: attr_8_7_proxy_liquidity_event_entity_token_1_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_7_proxy_liquidity_event_entity_token_1_mint ON public.proxy_liquidity_event_entity USING btree ("left"(token_1_mint, 256));


--
-- Name: attr_8_8_proxy_liquidity_event_entity_token_0_amount; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_8_proxy_liquidity_event_entity_token_0_amount ON public.proxy_liquidity_event_entity USING btree (token_0_amount);


--
-- Name: attr_8_9_proxy_liquidity_event_entity_token_1_amount; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_8_9_proxy_liquidity_event_entity_token_1_amount ON public.proxy_liquidity_event_entity USING btree (token_1_amount);


--
-- Name: attr_9_0_proxy_swap_base_event_entity_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_9_0_proxy_swap_base_event_entity_id ON public.proxy_swap_base_event_entity USING btree (id);


--
-- Name: attr_9_10_proxy_swap_base_event_entity_pool_state; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_9_10_proxy_swap_base_event_entity_pool_state ON public.proxy_swap_base_event_entity USING btree ("left"(pool_state, 256));


--
-- Name: attr_9_11_proxy_swap_base_event_entity_block_timestamp; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_9_11_proxy_swap_base_event_entity_block_timestamp ON public.proxy_swap_base_event_entity USING btree (block_timestamp);


--
-- Name: attr_9_1_proxy_swap_base_event_entity_tx_id; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_9_1_proxy_swap_base_event_entity_tx_id ON public.proxy_swap_base_event_entity USING btree ("left"(tx_id, 256));


--
-- Name: attr_9_2_proxy_swap_base_event_entity_token_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_9_2_proxy_swap_base_event_entity_token_mint ON public.proxy_swap_base_event_entity USING btree ("left"(token_mint, 256));


--
-- Name: attr_9_3_proxy_swap_base_event_entity_token_name; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_9_3_proxy_swap_base_event_entity_token_name ON public.proxy_swap_base_event_entity USING btree ("left"(token_name, 256));


--
-- Name: attr_9_4_proxy_swap_base_event_entity_token_symbol; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_9_4_proxy_swap_base_event_entity_token_symbol ON public.proxy_swap_base_event_entity USING btree ("left"(token_symbol, 256));


--
-- Name: attr_9_5_proxy_swap_base_event_entity_action; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_9_5_proxy_swap_base_event_entity_action ON public.proxy_swap_base_event_entity USING btree ("left"(action, 256));


--
-- Name: attr_9_6_proxy_swap_base_event_entity_base_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_9_6_proxy_swap_base_event_entity_base_mint ON public.proxy_swap_base_event_entity USING btree ("left"(base_mint, 256));


--
-- Name: attr_9_7_proxy_swap_base_event_entity_price_mint; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_9_7_proxy_swap_base_event_entity_price_mint ON public.proxy_swap_base_event_entity USING btree ("left"(price_mint, 256));


--
-- Name: attr_9_8_proxy_swap_base_event_entity_base_amount; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_9_8_proxy_swap_base_event_entity_base_amount ON public.proxy_swap_base_event_entity USING btree (base_amount);


--
-- Name: attr_9_9_proxy_swap_base_event_entity_price_amount; Type: INDEX; Schema: public; Owner: graph-node
--

CREATE INDEX attr_9_9_proxy_swap_base_event_entity_price_amount ON public.proxy_swap_base_event_entity USING btree (price_amount);


-- 可选的业务唯一性保证（与 id 组合一致，仅用于数据约束/查询加速）
CREATE UNIQUE INDEX IF NOT EXISTS holders_entity_unique_triple
  ON public.holders_entity (mint, owner);

-- 触发器函数：在 UPDATE 时，把 NEW.amount 从“增量”改为“旧值 + 增量”
CREATE OR REPLACE FUNCTION holders_entity_accumulate_amount()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    -- 将 UPDATE 传入的 NEW.amount（即本次增量）与 OLD.amount 做加法
    -- 如需防止负数，可用 GREATEST(0, ...)；如允许负余额，去掉 GREATEST
    NEW.amount := GREATEST(0, COALESCE(OLD.amount, 0) + COALESCE(NEW.amount, 0));
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 安全重建触发器
DROP TRIGGER IF EXISTS trg_holders_entity_accumulate_amount ON public.holders_entity;

CREATE TRIGGER trg_holders_entity_accumulate_amount
BEFORE UPDATE ON public.holders_entity
FOR EACH ROW
EXECUTE FUNCTION holders_entity_accumulate_amount();

