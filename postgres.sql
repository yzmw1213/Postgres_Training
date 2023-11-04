--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS user_db.users ALTER COLUMN user_id DROP DEFAULT;
DROP SEQUENCE IF EXISTS user_db.users_user_id_seq;
DROP TABLE IF EXISTS user_db.users;
DROP FUNCTION IF EXISTS public.set_update_time();
DROP SCHEMA IF EXISTS user_db;
--
-- Name: user_db; Type: SCHEMA; Schema: -; Owner: postgres_user
--

CREATE SCHEMA user_db;


ALTER SCHEMA user_db OWNER TO postgres_user;

--
-- Name: set_update_time(); Type: FUNCTION; Schema: public; Owner: postgres_user
--

CREATE FUNCTION public.set_update_time() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
    new.updated := 'now';
    return new;
  end;
$$;


ALTER FUNCTION public.set_update_time() OWNER TO postgres_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: user_db; Owner: postgres_user
--

CREATE TABLE user_db.users (
    user_id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    created timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE user_db.users OWNER TO postgres_user;

--
-- Name: COLUMN users.user_id; Type: COMMENT; Schema: user_db; Owner: postgres_user
--

COMMENT ON COLUMN user_db.users.user_id IS 'ユーザーID';


--
-- Name: COLUMN users.name; Type: COMMENT; Schema: user_db; Owner: postgres_user
--

COMMENT ON COLUMN user_db.users.name IS '名前';


--
-- Name: COLUMN users.created; Type: COMMENT; Schema: user_db; Owner: postgres_user
--

COMMENT ON COLUMN user_db.users.created IS '作成日時';


--
-- Name: COLUMN users.updated; Type: COMMENT; Schema: user_db; Owner: postgres_user
--

COMMENT ON COLUMN user_db.users.updated IS '更新日時';


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: user_db; Owner: postgres_user
--

CREATE SEQUENCE user_db.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE user_db.users_user_id_seq OWNER TO postgres_user;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: user_db; Owner: postgres_user
--

ALTER SEQUENCE user_db.users_user_id_seq OWNED BY user_db.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: user_db; Owner: postgres_user
--

ALTER TABLE ONLY user_db.users ALTER COLUMN user_id SET DEFAULT nextval('user_db.users_user_id_seq'::regclass);


--
-- PostgreSQL database dump complete
--

