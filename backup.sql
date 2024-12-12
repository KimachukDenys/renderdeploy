--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: rubyadmin
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO rubyadmin;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: rubyadmin
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_attachments_id_seq OWNER TO rubyadmin;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rubyadmin
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: rubyadmin
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO rubyadmin;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: rubyadmin
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_blobs_id_seq OWNER TO rubyadmin;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rubyadmin
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: rubyadmin
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO rubyadmin;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: rubyadmin
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNER TO rubyadmin;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rubyadmin
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: rubyadmin
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO rubyadmin;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: rubyadmin
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO rubyadmin;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: rubyadmin
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO rubyadmin;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rubyadmin
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: rubyadmin
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    name character varying,
    ref character varying,
    area character varying,
    area_description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.cities OWNER TO rubyadmin;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: rubyadmin
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_id_seq OWNER TO rubyadmin;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rubyadmin
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: rubyadmin
--

CREATE TABLE public.order_items (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.order_items OWNER TO rubyadmin;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: rubyadmin
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO rubyadmin;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rubyadmin
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: rubyadmin
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    status character varying,
    total numeric,
    delivery_method character varying,
    payment_method character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name character varying,
    email character varying,
    phone character varying,
    total_price numeric,
    novaposhta_office character varying,
    novaposhta_office_ref character varying,
    city character varying,
    warehouse_name character varying
);


ALTER TABLE public.orders OWNER TO rubyadmin;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: rubyadmin
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO rubyadmin;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rubyadmin
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: rubyadmin
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying,
    description text,
    price numeric,
    category_id bigint NOT NULL,
    image character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.products OWNER TO rubyadmin;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: rubyadmin
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO rubyadmin;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rubyadmin
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: rubyadmin
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO rubyadmin;

--
-- Name: users; Type: TABLE; Schema: public; Owner: rubyadmin
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    role character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp(6) without time zone,
    last_sign_in_at timestamp(6) without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    phone character varying
);


ALTER TABLE public.users OWNER TO rubyadmin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: rubyadmin
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO rubyadmin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rubyadmin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: warehouses; Type: TABLE; Schema: public; Owner: rubyadmin
--

CREATE TABLE public.warehouses (
    id bigint NOT NULL,
    ref character varying,
    city_description character varying,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.warehouses OWNER TO rubyadmin;

--
-- Name: warehouses_id_seq; Type: SEQUENCE; Schema: public; Owner: rubyadmin
--

CREATE SEQUENCE public.warehouses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.warehouses_id_seq OWNER TO rubyadmin;

--
-- Name: warehouses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rubyadmin
--

ALTER SEQUENCE public.warehouses_id_seq OWNED BY public.warehouses.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: warehouses id; Type: DEFAULT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.warehouses ALTER COLUMN id SET DEFAULT nextval('public.warehouses_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: rubyadmin
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
2	image	Product	39	2	2024-12-10 22:13:52.812966
3	image	Product	40	3	2024-12-10 22:52:56.136342
4	image	Product	41	4	2024-12-10 22:53:51.755269
5	image	Product	42	5	2024-12-10 22:55:12.273105
6	image	Product	43	6	2024-12-10 22:56:11.303088
7	image	Product	70	7	2024-12-10 22:57:12.692548
8	image	Product	56	8	2024-12-10 22:59:04.205556
9	image	Product	44	9	2024-12-10 23:04:18.5216
10	image	Product	45	10	2024-12-10 23:05:09.06271
11	image	Product	46	11	2024-12-10 23:06:37.865992
12	image	Product	47	12	2024-12-10 23:07:16.026497
13	image	Product	48	13	2024-12-10 23:07:59.287644
14	image	Product	49	14	2024-12-10 23:08:41.511244
15	image	Product	50	15	2024-12-10 23:09:28.074295
16	image	Product	51	16	2024-12-10 23:10:11.711659
17	image	Product	52	17	2024-12-10 23:11:24.139692
18	image	Product	53	18	2024-12-10 23:11:52.229647
20	image	Product	55	20	2024-12-10 23:19:50.29066
21	image	Product	57	21	2024-12-10 23:21:21.877943
22	image	Product	58	22	2024-12-10 23:22:10.173596
23	image	Product	59	23	2024-12-10 23:22:58.30632
24	image	Product	60	24	2024-12-10 23:23:23.959351
25	image	Product	61	25	2024-12-10 23:23:59.818568
26	image	Product	62	26	2024-12-10 23:26:43.542291
27	image	Product	63	27	2024-12-10 23:27:11.079573
28	image	Product	64	28	2024-12-10 23:28:03.340701
29	image	Product	65	29	2024-12-10 23:29:02.284381
30	image	Product	66	30	2024-12-10 23:30:18.636767
31	image	Product	67	31	2024-12-10 23:31:49.535639
32	image	Product	69	32	2024-12-10 23:35:11.65011
33	image	Product	68	33	2024-12-10 23:37:18.96729
34	image	Product	54	34	2024-12-10 23:38:48.938147
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: rubyadmin
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
22	zexxc79kzbo1e94oqa0qi1f3o6c9	micro.webp	image/webp	{"identified":true,"analyzed":true}	local	212136	YbENbm8IylGH15ggKeBbwQ==	2024-12-10 23:22:10.091911
2	pbwrwqygj630a717iz8bwjneh7lx	philips-led.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	27677	rtH/dCXSxHNU65Dy7b2+Tw==	2024-12-10 22:13:52.768823
3	y6j7mmer1eshl07tq9b8n9527eyw	str-osram.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	191658	GdLMyi3a2lPHlbLdZjgmzg==	2024-12-10 22:52:56.114064
4	het9xvgggojkorgkxn6jwf1rdwq7	svitul.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	10737	BiL+IDWYPjBdNmrEOPTEvA==	2024-12-10 22:53:51.700653
5	t2pazky1pcszkp4kk53vheuwejp5	led-lixtar.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	61235	0FQqnSIdncVM2eVn2G0JLA==	2024-12-10 22:55:12.24214
6	91kszgpld9zgiempkdx4q5yvftbd	mono-panel.png	image/png	{"identified":true,"analyzed":true}	local	6797	M2TAR6pMnA72WFFu9o3gMQ==	2024-12-10 22:56:11.294371
7	spqqstjxwyqzv8iqor3nck4q5vh1	honey.webp	image/webp	{"identified":true,"analyzed":true}	local	31882	mv+BQ0vAB4NgEdDgoO458w==	2024-12-10 22:57:12.636739
8	x2tder05ozfdeh7ohoq5besbxdpi	xolod-samsung.webp	image/webp	{"identified":true,"analyzed":true}	local	30618	G/SzjchTiCimtcNwNTFfsg==	2024-12-10 22:59:04.119675
9	wgq1lunkjvv41t3g30br7i2vkb5p	son200w.webp	image/webp	{"identified":true,"analyzed":true}	local	168252	HowEXoeIkIkCIxjqbDfgFQ==	2024-12-10 23:04:18.467245
10	40t7g9gk5vy9w1ux0rq9v2wj9up8	son200w.webp	image/webp	{"identified":true,"analyzed":true}	local	168252	HowEXoeIkIkCIxjqbDfgFQ==	2024-12-10 23:05:09.058767
11	f31yoh9ggnle088c1fum6c1n5y83	gnychka.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	139979	kupDPKHvRMTyLX4sxeJppg==	2024-12-10 23:06:37.834038
12	uvefyjihm55s24spwidvf4foc7se	nestterm.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	58426	dvCVnIwVHsE56LVs1LmX0w==	2024-12-10 23:07:15.989372
13	rtzdruc28jf21z7v6yexawixesxy	termhoney.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	44380	S9kmlenz5GsbUUPF9Sou1Q==	2024-12-10 23:07:59.25457
14	do6a3uib1n0a59ln8hmp62mnu098	ST_Wired_SK.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	32879	JJEeKtSTLrjGwTnhaQEsuA==	2024-12-10 23:08:41.470539
15	eh40v0p28zuvka91y1j086s80mnw	evowent.png	image/png	{"identified":true,"analyzed":true}	local	4305	/0UyFTSCH5g9F1RDsa7/LA==	2024-12-10 23:09:28.032851
16	eo1je9q3pdz8tx44zxtcpa2nuq9p	tesla700x700.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	38030	IUt0nd0tzHsbcHAvbpp1LQ==	2024-12-10 23:10:11.657571
17	29t2si28ijp0tmld8qjsg2ml4hc5	byd-box.webp	image/webp	{"identified":true,"analyzed":true}	local	35838	m7+qS/DCpLLu7cmAbFh8Xw==	2024-12-10 23:11:24.100335
18	6nillf1cnllm05zz0p9yrrs8q4tc	65pylo.png	image/png	{"identified":true,"analyzed":true}	local	64651	t5Sl3vls2/MJyemM86SpIw==	2024-12-10 23:11:52.190275
20	1spkfmo1fij5tyt4qfcs8mw8mhu6	bosch-WAN2820FPL-scaled.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	291963	D3omeEG2weXdGi/jph6Tfw==	2024-12-10 23:19:50.25234
21	nkrg5qv42jxrbbl73w87b5iv4d3k	Zmywarka-BOSCH-SRV4XMX28E-front-500x500.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	28178	EViwjyfZJOpzESVGVctN+Q==	2024-12-10 23:21:21.824172
23	3drydc4tre31o4qtxkfpwzpxwuao	teslagen3eu3.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	23681	QJ5PuxCJsLM8Wld3Epw/mQ==	2024-12-10 23:22:58.265619
24	xwsfyim55xu759kkl0ix3rv3azqj	evbox-wallbox-elvi-wifi-10a-to-32a-single-phase-or-three-phases.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	33347	Wvch8rQ28v7XxZhnGqBDzw==	2024-12-10 23:23:23.911014
25	0mhnjgtt3b4klmdj1lwxgkdnt7u7	93660481389304.png	image/png	{"identified":true,"analyzed":true}	local	182081	irkNVjG1m3H7Rt5SwpH6SA==	2024-12-10 23:23:59.811436
26	7a87ihuisgjyyq23r0ll9b84dmt1	ZAPPI_UNTETHERED_3QTR_LEFT_WHITE_optimised.png	image/png	{"identified":true,"analyzed":true}	local	1388438	UdVGGtFsgzhpMKafMQyYiA==	2024-12-10 23:26:43.509763
27	unxjk9fcvi85djofl77b0ct5ymbo	3326932501_w600_h600_3326932501.webp	image/webp	{"identified":true,"analyzed":true}	local	15870	e0IpAqlEZNh1c36Ho/ju/w==	2024-12-10 23:27:11.042527
28	9f63vdpiinifhwtz64e6t0zdreps	rockmin-ua.1800x1200w.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	77564	Bsyomf/b0xSDC3zPjMJD/A==	2024-12-10 23:28:03.296215
29	1oi677ovvqyzdk4fgmkui4wabav2	666be8e2-c663-48c1-a704-5d501835ed0b-1-1024x1024.webp	image/webp	{"identified":true,"analyzed":true}	local	58186	9FtAj1IQ29FgEGVU+bVr7w==	2024-12-10 23:29:02.2297
30	isklaqsf2xeefzw9m05lio7c2csz	3573906424_w600_h600_3573906424.webp	image/webp	{"identified":true,"analyzed":true}	local	39824	rlqohc94q7YKnRrMEGeqIA==	2024-12-10 23:30:18.571837
31	nh6eiqejyf0ske7iwl7fijzxogin	main_big.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	29570	fGtoH1La6XjDaXHz9G4vpQ==	2024-12-10 23:31:49.491613
32	fmjk0y10atg35qm0e747pif1gyb5	2c649c63328a4a150ba6e47d0a2d0487.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	117195	H5GriGbB0bibUg5Auw88ZQ==	2024-12-10 23:35:11.616715
33	x4k2468infi69ikj1z8vhrqc4fbi	A9MEM3250.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	71223	alh8in1W/FqbHi131bMMyQ==	2024-12-10 23:37:18.943154
34	smwtgtcee44b1psadcbc3o6cfsdp	at73a342.png	image/jpeg	{"identified":true,"analyzed":true}	local	155333	dPn/ektJ+EiaqHUhzHkSVg==	2024-12-10 23:38:48.905786
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: rubyadmin
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: rubyadmin
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-12-08 19:46:09.617523	2024-12-08 19:46:09.617523
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: rubyadmin
--

COPY public.categories (id, name, description, created_at, updated_at) FROM stdin;
3	 Світлодіодне освітлення	Лампи та освітлювальні прилади, які споживають значно менше енергії, ніж традиційні джерела світла.	2024-12-10 21:28:46.95387	2024-12-10 21:28:46.95387
4	Сонячні панелі	Пристрої для генерування електроенергії з сонячного світла, що дозволяють знижувати витрати на електрику.	2024-12-10 21:29:02.332738	2024-12-10 21:29:02.332738
5	Розумні термостати	Інтелектуальні пристрої для контролю клімату у приміщеннях, які допомагають оптимізувати споживання енергії.	2024-12-10 21:29:22.094361	2024-12-10 21:29:22.094361
6	Акумуляторні системи	Енергозберігаючі рішення для зберігання електроенергії, включаючи літій-іонні батареї та системи безперебійного живлення.	2024-12-10 21:29:37.419902	2024-12-10 21:29:37.419902
7	Енергозберігаючі побутові прилади	Ефективна побутова техніка, яка дозволяє зменшити витрати енергії та води.	2024-12-10 21:29:55.022772	2024-12-10 21:29:55.022772
8	Зарядні станції для електромобілів	Енергозберігаючі системи для зарядки електротранспорту вдома або в офісі.	2024-12-10 21:30:14.609245	2024-12-10 21:30:14.609245
9	Утеплювачі та ізоляційні матеріали	Матеріали для зменшення втрат тепла у будівлях, що сприяють зниженню витрат на опалення.	2024-12-10 21:39:36.94332	2024-12-10 21:39:36.94332
10	Системи управління енергією	Розумні рішення для моніторингу та оптимізації енергоспоживання в будинках та офісах.	2024-12-10 21:39:59.731207	2024-12-10 21:39:59.731207
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: rubyadmin
--

COPY public.cities (id, name, ref, area, area_description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: rubyadmin
--

COPY public.order_items (id, order_id, product_id, quantity, created_at, updated_at) FROM stdin;
92	96	41	3	2024-12-10 23:52:11.600081	2024-12-10 23:52:11.600081
93	96	40	2	2024-12-10 23:52:11.633738	2024-12-10 23:52:11.633738
94	96	42	1	2024-12-10 23:52:11.677895	2024-12-10 23:52:11.677895
95	97	56	1	2024-12-11 00:02:28.811048	2024-12-11 00:02:28.811048
96	97	43	1	2024-12-11 00:02:28.837747	2024-12-11 00:02:28.837747
97	98	63	50	2024-12-11 00:11:54.595151	2024-12-11 00:11:54.595151
98	99	43	3	2024-12-11 17:48:00.029004	2024-12-11 17:48:00.029004
99	99	41	2	2024-12-11 17:48:00.036467	2024-12-11 17:48:00.036467
100	99	40	10	2024-12-11 17:48:00.039166	2024-12-11 17:48:00.039166
101	99	42	2	2024-12-11 17:48:00.041996	2024-12-11 17:48:00.041996
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: rubyadmin
--

COPY public.orders (id, user_id, status, total, delivery_method, payment_method, created_at, updated_at, name, email, phone, total_price, novaposhta_office, novaposhta_office_ref, city, warehouse_name) FROM stdin;
96	1	\N	6180.0	Нова Пошта	Наложений платіж	2024-12-10 23:52:11.515078	2024-12-10 23:52:11.515078	Admin	admin@test.com	+380901123232	\N	\N	\N	Яблунька	Пункт приймання-видачі (до 30 кг): вул. Могильницького, 104
97	1	\N	27000.0	Нова Пошта	Наложений платіж	2024-12-11 00:02:28.763922	2024-12-11 00:02:28.763922	Admin	admin@test.com	+380901123232	\N	\N	\N	Полтава	Пункт №978 (до 10 кг): вул. Соборності, 32 (маг. MOYO)
98	2	\N	15000.0	Нова Пошта	Наложений платіж	2024-12-11 00:11:54.584252	2024-12-11 00:11:54.584252	Денис	test@example.com	+380112223344	\N	\N	\N	Яблунька	Пункт приймання-видачі (до 30 кг): вул. Могильницького, 104
99	3	\N	63700.0	Нова Пошта	Наложений платіж	2024-12-11 17:48:00.020288	2024-12-11 17:48:00.020288	Тестовий Користувач	testuser@example.com	+380110001122	\N	\N	\N	Івано-Франківськ	Відділення №21 (до 30 кг на одне місце): вул. Чорновола, 98
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: rubyadmin
--

COPY public.products (id, name, description, price, category_id, image, created_at, updated_at) FROM stdin;
40	Світлодіодна стрічка Osram	Стрічка для декору, яка має регульовану яскравість.	1590.0	3	link_to_image2.jpg	2024-12-10 22:07:56.918048	2024-12-10 22:52:56.160503
42	LED ліхтар 20W	Потужний освітлювач для вулиці з довгим терміном служби.	600	3	link_to_image4.jpg	2024-12-10 22:07:56.918048	2024-12-10 22:55:12.306114
43	Сонячна панель Mono 300W	Високопродуктивна панель для житлових і комерційних об'єктів.	15000	4	link_to_image5.jpg	2024-12-10 22:07:56.918048	2024-12-10 22:56:11.359543
56	Холодильник Samsung Eco	Холодильник з низьким споживанням енергії.	12000	7	link_to_image18.jpg	2024-12-10 22:07:56.918048	2024-12-10 22:59:04.266635
44	Сонячна батарея для дому 200W	Компактна панель для використання в домашніх умовах.	10000	4	link_to_image6.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:04:18.543214
45	Сонячна панель для дачі 150W	Ідеальний варіант для дачних будинків та малих об'єктів.	7000	4	link_to_image7.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:05:09.089085
46	Гнучка сонячна панель 100W	Легка та зручна панель для мобільних установок.	5500	4	link_to_image8.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:06:37.893395
47	Розумний термостат Nest	Підключення до Wi-Fi для автоматичного контролю температури.	3000	5	link_to_image9.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:07:16.050836
48	Термостат Honeywell Lyric T5	Регулювання температури через смартфон або голосові команди.	2500	5	link_to_image10.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:07:59.342437
49	Tado Smart Thermostat	Дистанційне керування температурою через мобільний додаток.	3200	5	link_to_image11.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:08:41.534185
50	Ecovent Smart Thermostat	Інтелектуальне управління кліматом в кожній кімнаті.	3500	5	link_to_image12.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:09:28.097133
52	Акумуляторний блок BYD B-Box	Гнучка система зберігання для вашої енергосистеми.	120000	6	link_to_image14.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:11:24.172411
51	Акумуляторна система Tesla Powerwall	Система зберігання енергії для будинку.	350000.0	6	link_to_image13.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:10:11.751609
53	Pylontech US3000C	Модуль для зберігання енергії з високою ємністю.	40000	6	link_to_image15.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:11:52.262548
41	Світильник настінний LED	Призначений для освітлення інтер'єрів з низьким споживанням енергії.	800.99	3	link_to_image3.jpg	2024-12-10 22:07:56.918048	2024-12-12 11:20:00.785909
55	Енергозберігаюча пральна машина Bosch	Пральна машина з класом енергоефективності A+++. 	10500	7	link_to_image17.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:19:50.296272
57	Енергозберігаюча посудомийна машина	Сучасний прилад з ефективним споживанням води та електрики.	7500	7	link_to_image19.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:21:21.921516
58	Мікрохвильова піч Sharp	Мікрохвильова піч з енергозберігаючими функціями.	2800	7	link_to_image20.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:22:10.214216
59	Зарядна станція Tesla Wall Connector	Станція для швидкого заряджання електромобілів Tesla.	18000	8	link_to_image21.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:22:58.323771
60	EVBox Elvi Charging Station	Зарядна станція для всіх типів електромобілів.	16000	8	link_to_image22.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:23:23.990114
61	Wallbox Pulsar Plus	Компактна зарядна станція для дому.	14000	8	link_to_image23.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:23:59.85756
62	Zappi Charger	Зарядка для електромобілів з можливістю використання сонячної енергії.	22000	8	link_to_image24.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:26:43.55531
63	Пінополістирол для утеплення	Легкий та ефективний матеріал для теплоізоляції.	300	9	link_to_image25.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:27:11.103383
64	Мінеральна вата Rockwool	Ефективний утеплювач для будівель.	350	9	link_to_image26.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:28:03.363584
65	Фольгований утеплювач	Теплоізоляція, яка відображає тепло назад у приміщення.	400	9	link_to_image27.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:29:02.326409
68	Система моніторингу енергії Schneider Electric	Підключення до мережі для ефективного керування споживанням.	20000	10	link_to_image30.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:37:19.013512
66	Ізоляція труб UKRIZOL	Натуральний матеріал для утеплення без шкідливих домішок.	29.0	9	link_to_image28.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:30:18.712044
67	Siemens RAA21 електромеханічний кімнатний	Інтелектуальна система для моніторингу споживання енергії.	1000.0	10	link_to_image29.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:31:49.557052
69	Rave Smart Energy Management	Рішення для оптимізації енергоспоживання в будинку.	32000.0	10	link_to_image31.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:35:11.672706
54	LG Chem RESU 10H	Система зберігання енергії для дому з високою ефективністю.	75000	6	link_to_image16.jpg	2024-12-10 22:07:56.918048	2024-12-10 23:38:48.954259
39	Світлодіодна лампа Philips 10W	Енергоефективна лампа з довгим терміном служби.	200	3	link_to_image1.jpg	2024-12-10 22:07:56.918048	2024-12-10 22:13:52.828587
70	Керування енергоспоживанням Honeywell	Розумна система для автоматизації енергоспоживання.	18000	10	link_to_image32.jpg	2024-12-10 22:07:56.918048	2024-12-10 22:57:12.748106
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: rubyadmin
--

COPY public.schema_migrations (version) FROM stdin;
20241207153834
20241207153836
20241207153838
20241207153840
20241207153843
20241207164538
20241207172423
20241208212705
20241208212837
20241208213210
20241208215127
20241208220152
20241208221301
20241208233415
20241208234930
20241209153427
20241209153453
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rubyadmin
--

COPY public.users (id, name, email, encrypted_password, role, created_at, updated_at, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, phone) FROM stdin;
2	Денис	test@example.com	$2a$12$XVluJLMR25PLl7DcFOWWOuztAdGOYr5g2e4tMVovpxQXTBP8vjmMy	\N	2024-12-10 13:33:24.92001	2024-12-10 13:33:24.92001	\N	\N	\N	0	\N	\N	\N	\N	+380112223344
1	Admin	admin@test.com	$2a$12$P1gBwH4PYyWWGGvQzvYkM.UDNfiEfF37hrjqq7RcaaZaHfGYMlypm	admin	2024-12-08 19:47:06.233401	2024-12-10 21:34:20.557046	\N	\N	\N	0	\N	\N	\N	\N	+380901123232
3	Тестовий Користувач	testuser@example.com	$2a$12$1ZZ1WX/pSPSfOIibzvR27ebZACy1puxb5T58zE2pm6PzhR0NgalxS	\N	2024-12-11 17:44:09.756583	2024-12-11 17:44:09.756583	\N	\N	\N	0	\N	\N	\N	\N	+380110001122
\.


--
-- Data for Name: warehouses; Type: TABLE DATA; Schema: public; Owner: rubyadmin
--

COPY public.warehouses (id, ref, city_description, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rubyadmin
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 34, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rubyadmin
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 34, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rubyadmin
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rubyadmin
--

SELECT pg_catalog.setval('public.categories_id_seq', 10, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rubyadmin
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rubyadmin
--

SELECT pg_catalog.setval('public.order_items_id_seq', 101, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rubyadmin
--

SELECT pg_catalog.setval('public.orders_id_seq', 99, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rubyadmin
--

SELECT pg_catalog.setval('public.products_id_seq', 70, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rubyadmin
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: warehouses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rubyadmin
--

SELECT pg_catalog.setval('public.warehouses_id_seq', 1, false);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: rubyadmin
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: rubyadmin
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: rubyadmin
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: rubyadmin
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_order_items_on_order_id; Type: INDEX; Schema: public; Owner: rubyadmin
--

CREATE INDEX index_order_items_on_order_id ON public.order_items USING btree (order_id);


--
-- Name: index_order_items_on_product_id; Type: INDEX; Schema: public; Owner: rubyadmin
--

CREATE INDEX index_order_items_on_product_id ON public.order_items USING btree (product_id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: rubyadmin
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- Name: index_products_on_category_id; Type: INDEX; Schema: public; Owner: rubyadmin
--

CREATE INDEX index_products_on_category_id ON public.products USING btree (category_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: rubyadmin
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: order_items fk_rails_e3cb28f071; Type: FK CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_rails_e3cb28f071 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_items fk_rails_f1a29ddd47; Type: FK CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_rails_f1a29ddd47 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: orders fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: products fk_rails_fb915499a4; Type: FK CONSTRAINT; Schema: public; Owner: rubyadmin
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_fb915499a4 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- PostgreSQL database dump complete
--

