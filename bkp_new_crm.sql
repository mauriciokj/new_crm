--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: conexoes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE conexoes (
    id integer NOT NULL,
    descricao character varying(255),
    adapter character varying(255),
    host character varying(255),
    username character varying(255),
    password character varying(255),
    database character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.conexoes OWNER TO postgres;

--
-- Name: conexoes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conexoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conexoes_id_seq OWNER TO postgres;

--
-- Name: conexoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE conexoes_id_seq OWNED BY conexoes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: tarefas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tarefas (
    id integer NOT NULL,
    descricao character varying(255),
    acao character varying(255),
    seletor character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    conexao_id integer
);


ALTER TABLE public.tarefas OWNER TO postgres;

--
-- Name: tarefas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tarefas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tarefas_id_seq OWNER TO postgres;

--
-- Name: tarefas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tarefas_id_seq OWNED BY tarefas.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conexoes ALTER COLUMN id SET DEFAULT nextval('conexoes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarefas ALTER COLUMN id SET DEFAULT nextval('tarefas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Data for Name: conexoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY conexoes (id, descricao, adapter, host, username, password, database, created_at, updated_at) FROM stdin;
1	Conexao Ouvidoria	postgresql	localhost	postgres	postgres	ouvidoria_development	2014-01-27 13:17:21.928253	2014-01-27 13:18:50.585262
2	CRM	postgresql	localhost	postgres	postgres	new_crm_development	2014-01-27 13:39:21.248344	2014-01-27 13:39:21.248344
\.


--
-- Name: conexoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('conexoes_id_seq', 2, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20140127121347
20140127130421
20140127191802
20140128122207
\.


--
-- Data for Name: tarefas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tarefas (id, descricao, acao, seletor, created_at, updated_at, conexao_id) FROM stdin;
1	Enviar email	tomar_atitude	ouvidoria_categoria_seletor	2014-01-27 12:19:04.645513	2014-01-29 18:19:03.803148	1
2	envia novo email	enviar_email	ouvidoria_chamado_seletor	2014-01-27 18:27:14.866997	2014-01-29 18:19:13.185634	1
\.


--
-- Name: tarefas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tarefas_id_seq', 2, true);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuarios (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	mauriciokj@gmail.com	$2a$10$.BdFmUirOfnR9dcEJ3PJ6OH26T.SoHZBzksgetxv524iki02Tz7NS	\N	\N	2014-01-28 16:45:04.906025	10	2014-01-29 18:12:12.075354	2014-01-29 16:22:22.999065	127.0.0.1	127.0.0.1	2014-01-27 19:21:35.804899	2014-01-29 18:12:12.077167
\.


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_seq', 1, true);


--
-- Name: conexoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY conexoes
    ADD CONSTRAINT conexoes_pkey PRIMARY KEY (id);


--
-- Name: tarefas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tarefas
    ADD CONSTRAINT tarefas_pkey PRIMARY KEY (id);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: index_usuarios_on_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_usuarios_on_email ON usuarios USING btree (email);


--
-- Name: index_usuarios_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_usuarios_on_reset_password_token ON usuarios USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: mauriciokj
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM mauriciokj;
GRANT ALL ON SCHEMA public TO mauriciokj;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

