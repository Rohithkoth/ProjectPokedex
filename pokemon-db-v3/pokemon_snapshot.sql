--
-- PostgreSQL database dump
--

\restrict afVXjPvriuVYR74EuETNcdh257kbU6uobEJu46N57e3sJGEdUROhpAVuSNV8bnE

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: pokemon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemon (
    id bigint NOT NULL,
    base_id integer NOT NULL,
    form_id integer DEFAULT 0 NOT NULL,
    slug text NOT NULL,
    name text NOT NULL,
    form_name text,
    type1 text NOT NULL,
    type2 text,
    egg_group_1 text NOT NULL,
    egg_group_2 text,
    gender_1 text NOT NULL,
    gender_2 text,
    gender_ratio integer,
    color text,
    experience_group text,
    shape integer,
    generation integer NOT NULL,
    evolution_ids jsonb DEFAULT '[]'::jsonb NOT NULL,
    hidden_moves jsonb DEFAULT '{}'::jsonb NOT NULL,
    is_mega boolean DEFAULT false NOT NULL,
    is_battle_only boolean DEFAULT false NOT NULL,
    has_gigantamax boolean DEFAULT false NOT NULL,
    is_legendary boolean DEFAULT false NOT NULL,
    is_mythical boolean DEFAULT false NOT NULL,
    is_sublegendary boolean DEFAULT false NOT NULL,
    is_paradox boolean DEFAULT false NOT NULL
);


ALTER TABLE public.pokemon OWNER TO postgres;

--
-- Name: base_pokemon; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.base_pokemon AS
 SELECT id,
    base_id,
    form_id,
    slug,
    name,
    form_name,
    type1,
    type2,
    egg_group_1,
    egg_group_2,
    gender_1,
    gender_2,
    gender_ratio,
    color,
    experience_group,
    shape,
    generation,
    evolution_ids,
    hidden_moves,
    is_mega,
    is_battle_only,
    has_gigantamax,
    is_legendary,
    is_mythical,
    is_sublegendary,
    is_paradox
   FROM public.pokemon
  WHERE (form_id = 0)
  ORDER BY base_id;


ALTER VIEW public.base_pokemon OWNER TO postgres;

--
-- Name: pokemon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pokemon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pokemon_id_seq OWNER TO postgres;

--
-- Name: pokemon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pokemon_id_seq OWNED BY public.pokemon.id;


--
-- Name: special_pokemon; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.special_pokemon AS
 SELECT id,
    base_id,
    form_id,
    slug,
    name,
    form_name,
    type1,
    type2,
    egg_group_1,
    egg_group_2,
    gender_1,
    gender_2,
    gender_ratio,
    color,
    experience_group,
    shape,
    generation,
    evolution_ids,
    hidden_moves,
    is_mega,
    is_battle_only,
    has_gigantamax,
    is_legendary,
    is_mythical,
    is_sublegendary,
    is_paradox
   FROM public.pokemon
  WHERE (is_legendary OR is_mythical OR is_sublegendary)
  ORDER BY base_id;


ALTER VIEW public.special_pokemon OWNER TO postgres;

--
-- Name: pokemon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon ALTER COLUMN id SET DEFAULT nextval('public.pokemon_id_seq'::regclass);


--
-- Data for Name: pokemon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokemon (id, base_id, form_id, slug, name, form_name, type1, type2, egg_group_1, egg_group_2, gender_1, gender_2, gender_ratio, color, experience_group, shape, generation, evolution_ids, hidden_moves, is_mega, is_battle_only, has_gigantamax, is_legendary, is_mythical, is_sublegendary, is_paradox) FROM stdin;
1	1	0	bulbasaur	Bulbasaur	\N	grass	poison	monster	grass	mf	\N	1	green	Medium Slow	5	1	[[2, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "flash": [2, 3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
2	2	0	ivysaur	Ivysaur	\N	grass	poison	monster	grass	mf	\N	1	green	Medium Slow	5	1	[[3, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "flash": [2, 3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
3	3	0	venusaur	Venusaur	\N	grass	poison	monster	grass	fd	md	1	green	Medium Slow	5	1	[]	{"cut": [1, 2, 3, 4, 5, 6], "flash": [2, 3], "strength": [3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	t	f	f	f	f
4	3	1	venusaur-mega	Venusaur	Mega Venusaur	grass	poison	monster	grass	mf	\N	1	green	Medium Slow	5	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
5	4	0	charmander	Charmander	\N	fire	\N	monster	dragon	mf	\N	1	red	Medium Slow	10	1	[[5, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
6	5	0	charmeleon	Charmeleon	\N	fire	\N	monster	dragon	mf	\N	1	red	Medium Slow	10	1	[[6, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
7	6	0	charizard	Charizard	\N	fire	flying	monster	dragon	mf	\N	1	red	Medium Slow	10	1	[]	{"cut": [1, 2, 3, 4, 5, 6], "fly": [2, 3, 4, 5, 6], "defog": [4], "strength": [1, 2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	t	f	f	f	f
8	6	1	charizard-mega-x	Charizard	Mega Charizard X	fire	dragon	monster	dragon	mf	\N	1	black	Medium Slow	10	6	[]	{"cut": [6], "fly": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
9	6	2	charizard-mega-y	Charizard	Mega Charizard Y	fire	flying	monster	dragon	mf	\N	1	red	Medium Slow	10	6	[]	{"cut": [6], "fly": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
10	7	0	squirtle	Squirtle	\N	water	\N	monster	water_1	mf	\N	1	blue	Medium Slow	10	1	[[8, 0]]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
11	8	0	wartortle	Wartortle	\N	water	\N	monster	water_1	mf	\N	1	blue	Medium Slow	10	1	[[9, 0]]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
12	9	0	blastoise	Blastoise	\N	water	\N	monster	water_1	mf	\N	1	blue	Medium Slow	10	1	[]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	t	f	f	f	f
13	9	1	blastoise-mega	Blastoise	Mega Blastoise	water	\N	monster	water_1	mf	\N	1	blue	Medium Slow	10	6	[]	{"dive": [6], "surf": [6], "strength": [6], "waterfall": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
14	10	0	caterpie	Caterpie	\N	bug	\N	bug	\N	mf	\N	4	green	Medium Fast	4	1	[[11, 0]]	{}	f	f	f	f	f	f	f
15	11	0	metapod	Metapod	\N	bug	\N	bug	\N	mf	\N	4	green	Medium Fast	13	1	[[12, 0]]	{}	f	f	f	f	f	f	f
16	12	0	butterfree	Butterfree	\N	bug	flying	bug	\N	fd	md	4	white	Medium Fast	6	1	[]	{"defog": [4], "flash": [2, 3]}	f	f	t	f	f	f	f
17	13	0	weedle	Weedle	\N	bug	poison	bug	\N	mf	\N	4	brown	Medium Fast	4	1	[[14, 0]]	{}	f	f	f	f	f	f	f
18	14	0	kakuna	Kakuna	\N	bug	poison	bug	\N	mf	\N	4	yellow	Medium Fast	13	1	[[15, 0]]	{}	f	f	f	f	f	f	f
19	15	0	beedrill	Beedrill	\N	bug	poison	bug	\N	mf	\N	4	yellow	Medium Fast	6	1	[]	{"cut": [1, 2, 3, 4, 5, 6], "defog": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
20	15	1	beedrill-mega	Beedrill	Mega Beedrill	bug	poison	bug	\N	mf	\N	4	yellow	Medium Fast	6	6	[]	{"cut": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
21	16	0	pidgey	Pidgey	\N	normal	flying	flying	\N	mf	\N	4	brown	Medium Slow	12	1	[[17, 0]]	{"fly": [1, 2, 3, 4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
22	17	0	pidgeotto	Pidgeotto	\N	normal	flying	flying	\N	mf	\N	4	brown	Medium Slow	12	1	[[18, 0]]	{"fly": [1, 2, 3, 4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
23	18	0	pidgeot	Pidgeot	\N	normal	flying	flying	\N	mf	\N	4	brown	Medium Slow	12	1	[]	{"fly": [1, 2, 3, 4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
24	18	1	pidgeot-mega	Pidgeot	Mega Pidgeot	normal	flying	flying	\N	mf	\N	4	brown	Medium Slow	12	6	[]	{"fly": [6]}	t	t	f	f	f	f	f
25	19	0	rattata	Rattata	\N	normal	\N	field	\N	fd	md	4	purple	Medium Fast	5	1	[[20, 0]]	{"cut": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
26	19	1	rattata-alola	Rattata	Alolan Form	dark	normal	field	\N	mf	\N	4	black	Medium Fast	5	7	[[20, 1]]	{}	f	f	f	f	f	f	f
27	20	0	raticate	Raticate	\N	normal	\N	field	\N	fd	md	4	brown	Medium Fast	5	1	[]	{"cut": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
28	20	1	raticate-alola	Raticate	Alolan Form	dark	normal	field	\N	mf	\N	4	black	Medium Fast	5	7	[]	{}	f	f	f	f	f	f	f
29	21	0	spearow	Spearow	\N	normal	flying	flying	\N	mf	\N	4	brown	Medium Fast	12	1	[[22, 0]]	{"fly": [1, 2, 3, 4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
30	22	0	fearow	Fearow	\N	normal	flying	flying	\N	mf	\N	4	brown	Medium Fast	12	1	[]	{"fly": [1, 2, 3, 4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
31	23	0	ekans	Ekans	\N	poison	\N	field	dragon	mf	\N	4	purple	Medium Fast	13	1	[[24, 0]]	{"strength": [1, 2, 3, 4, 5, 6]}	f	f	f	f	f	f	f
32	24	0	arbok	Arbok	\N	poison	\N	field	dragon	mf	\N	4	purple	Medium Fast	13	1	[]	{"strength": [1, 2, 3, 4, 5, 6]}	f	f	f	f	f	f	f
33	25	0	pikachu	Pikachu	\N	electric	\N	field	fairy	fd	md	4	yellow	Medium Fast	5	1	[[26, 0], [26, 1]]	{"flash": [1, 2, 3], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	t	f	f	f	f
34	26	0	raichu	Raichu	\N	electric	\N	field	fairy	fd	md	4	yellow	Medium Fast	10	1	[]	{"flash": [1, 2, 3], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
35	26	1	raichu-alola	Raichu	Alolan Form	electric	psychic	field	fairy	mf	\N	4	brown	Medium Fast	10	7	[]	{}	f	f	f	f	f	f	f
36	26	2	raichu-mega-x	Raichu	Mega Raichu X	electric	\N	field	fairy	mf	\N	4	yellow	Medium Fast	10	9	[]	{}	t	t	f	f	f	f	f
37	26	3	raichu-mega-y	Raichu	Mega Raichu Y	electric	\N	field	fairy	mf	\N	4	yellow	Medium Fast	10	9	[]	{}	t	t	f	f	f	f	f
38	27	0	sandshrew	Sandshrew	\N	ground	\N	field	\N	mf	\N	4	yellow	Medium Fast	10	1	[[28, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
39	27	1	sandshrew-alola	Sandshrew	Alolan Form	ice	steel	field	\N	mf	\N	4	white	Medium Fast	10	7	[[28, 1]]	{}	f	f	f	f	f	f	f
40	28	0	sandslash	Sandslash	\N	ground	\N	field	\N	mf	\N	4	yellow	Medium Fast	10	1	[]	{"cut": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
41	28	1	sandslash-alola	Sandslash	Alolan Form	ice	steel	field	\N	mf	\N	4	blue	Medium Fast	10	7	[]	{}	f	f	f	f	f	f	f
42	29	0	nidoran-f	Nidoran♀	\N	poison	\N	monster	field	fo	\N	8	blue	Medium Slow	5	1	[[30, 0]]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
43	30	0	nidorina	Nidorina	\N	poison	\N	undiscovered	\N	fo	\N	8	blue	Medium Slow	5	1	[[31, 0]]	{"cut": [3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
44	31	0	nidoqueen	Nidoqueen	\N	poison	ground	undiscovered	\N	fo	\N	8	blue	Medium Slow	10	1	[]	{"cut": [3, 4, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
45	32	0	nidoran-m	Nidoran♂	\N	poison	\N	monster	field	mo	\N	0	purple	Medium Slow	5	1	[[33, 0]]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
46	33	0	nidorino	Nidorino	\N	poison	\N	monster	field	mo	\N	0	purple	Medium Slow	5	1	[[34, 0]]	{"cut": [3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
47	34	0	nidoking	Nidoking	\N	poison	ground	monster	field	mo	\N	0	purple	Medium Slow	10	1	[]	{"cut": [3, 4, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
48	35	0	clefairy	Clefairy	\N	fairy	\N	fairy	\N	mf	\N	6	pink	Fast	10	1	[[36, 0]]	{"flash": [1, 2, 3], "strength": [1, 2, 3, 4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
49	36	0	clefable	Clefable	\N	fairy	\N	fairy	\N	mf	\N	6	pink	Fast	10	1	[]	{"flash": [1, 2, 3], "strength": [1, 2, 3, 4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
50	36	1	clefable-mega	Clefable	Mega Clefable	fairy	flying	fairy	\N	mf	\N	6	pink	Fast	10	9	[]	{}	t	t	f	f	f	f	f
51	37	0	vulpix	Vulpix	\N	fire	\N	field	\N	mf	\N	6	brown	Medium Fast	5	1	[[38, 0]]	{}	f	f	f	f	f	f	f
52	37	1	vulpix-alola	Vulpix	Alolan Form	ice	\N	field	\N	mf	\N	6	white	Medium Fast	5	7	[[38, 1]]	{}	f	f	f	f	f	f	f
53	38	0	ninetales	Ninetales	\N	fire	\N	field	\N	mf	\N	6	yellow	Medium Fast	5	1	[]	{}	f	f	f	f	f	f	f
54	38	1	ninetales-alola	Ninetales	Alolan Form	ice	fairy	field	\N	mf	\N	6	blue	Medium Fast	5	7	[]	{}	f	f	f	f	f	f	f
55	39	0	jigglypuff	Jigglypuff	\N	normal	fairy	fairy	\N	mf	\N	6	pink	Fast	11	1	[[40, 0]]	{"flash": [1, 2, 3], "strength": [1, 2, 3, 4, 5, 6]}	f	f	f	f	f	f	f
56	40	0	wigglytuff	Wigglytuff	\N	normal	fairy	fairy	\N	mf	\N	6	pink	Fast	11	1	[]	{"flash": [1, 2, 3], "strength": [1, 2, 3, 4, 5, 6]}	f	f	f	f	f	f	f
57	41	0	zubat	Zubat	\N	poison	flying	flying	\N	fd	md	4	purple	Medium Fast	12	1	[[42, 0]]	{"fly": [4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
58	42	0	golbat	Golbat	\N	poison	flying	flying	\N	fd	md	4	purple	Medium Fast	12	1	[[169, 0]]	{"fly": [4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
59	43	0	oddish	Oddish	\N	grass	poison	grass	\N	mf	\N	4	blue	Medium Slow	2	1	[[44, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "flash": [2, 3]}	f	f	f	f	f	f	f
60	44	0	gloom	Gloom	\N	grass	poison	grass	\N	fd	md	4	blue	Medium Slow	11	1	[[45, 0], [182, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "flash": [2, 3]}	f	f	f	f	f	f	f
61	45	0	vileplume	Vileplume	\N	grass	poison	grass	\N	fd	md	4	red	Medium Slow	11	1	[]	{"cut": [1, 2, 3, 4, 5, 6], "flash": [2, 3]}	f	f	f	f	f	f	f
62	46	0	paras	Paras	\N	bug	grass	bug	grass	mf	\N	4	red	Medium Fast	4	1	[[47, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "flash": [2, 3], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
63	47	0	parasect	Parasect	\N	bug	grass	bug	grass	mf	\N	4	red	Medium Fast	4	1	[]	{"cut": [1, 2, 3, 4, 5, 6], "flash": [2, 3], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
64	48	0	venonat	Venonat	\N	bug	poison	bug	\N	mf	\N	4	purple	Medium Fast	11	1	[[49, 0]]	{"flash": [3]}	f	f	f	f	f	f	f
65	49	0	venomoth	Venomoth	\N	bug	poison	bug	\N	mf	\N	4	purple	Medium Fast	6	1	[]	{"defog": [4], "flash": [2, 3]}	f	f	f	f	f	f	f
66	50	0	diglett	Diglett	\N	ground	\N	field	\N	mf	\N	4	brown	Medium Fast	9	1	[[51, 0]]	{"cut": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
67	50	1	diglett-alola	Diglett	Alolan Form	ground	steel	field	\N	mf	\N	4	brown	Medium Fast	9	7	[[51, 1]]	{}	f	f	f	f	f	f	f
68	51	0	dugtrio	Dugtrio	\N	ground	\N	field	\N	mf	\N	4	brown	Medium Fast	7	1	[]	{"cut": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
69	51	1	dugtrio-alola	Dugtrio	Alolan Form	ground	steel	field	\N	mf	\N	4	brown	Medium Fast	7	7	[]	{}	f	f	f	f	f	f	f
70	52	0	meowth	Meowth	\N	normal	\N	field	\N	mf	\N	4	yellow	Medium Fast	5	1	[[53, 0]]	{"cut": [3, 4, 5, 6], "flash": [3]}	f	f	t	f	f	f	f
71	52	1	meowth-alola	Meowth	Alolan Form	dark	\N	field	\N	mf	\N	4	blue	Medium Fast	5	7	[[53, 1]]	{}	f	f	f	f	f	f	f
72	52	2	meowth-galar	Meowth	Galarian Form	steel	\N	field	\N	mf	\N	4	brown	Medium Fast	10	8	[[863, 0]]	{}	f	f	f	f	f	f	f
73	53	0	persian	Persian	\N	normal	\N	field	\N	mf	\N	4	yellow	Medium Fast	5	1	[]	{"cut": [3, 4, 5, 6], "flash": [3]}	f	f	f	f	f	f	f
74	53	1	persian-alola	Persian	Alolan Form	dark	\N	field	\N	mf	\N	4	blue	Medium Fast	5	7	[]	{}	f	f	f	f	f	f	f
75	54	0	psyduck	Psyduck	\N	water	\N	water_1	field	mf	\N	4	yellow	Medium Fast	10	1	[[55, 0]]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "flash": [2, 3], "strength": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
76	55	0	golduck	Golduck	\N	water	\N	water_1	field	mf	\N	4	blue	Medium Fast	10	1	[]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "flash": [2, 3], "strength": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
77	56	0	mankey	Mankey	\N	fighting	\N	field	\N	mf	\N	4	brown	Medium Fast	10	1	[[57, 0]]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
78	57	0	primeape	Primeape	\N	fighting	\N	field	\N	mf	\N	4	brown	Medium Fast	10	1	[[979, 0]]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
79	58	0	growlithe	Growlithe	\N	fire	\N	field	\N	mf	\N	2	brown	Slow	5	1	[[59, 0]]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
80	58	1	growlithe-hisui	Growlithe	Hisuian Form	fire	rock	field	\N	mf	\N	2	brown	Slow	5	8	[[59, 1]]	{}	f	f	f	f	f	f	f
81	59	0	arcanine	Arcanine	\N	fire	\N	field	\N	mf	\N	2	brown	Slow	5	1	[]	{"strength": [3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
82	59	1	arcanine-hisui	Arcanine	Hisuian Form	fire	rock	field	\N	mf	\N	2	brown	Slow	5	8	[]	{}	f	f	f	f	f	f	f
83	60	0	poliwag	Poliwag	\N	water	\N	water_1	\N	mf	\N	4	blue	Medium Slow	2	1	[[61, 0]]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
84	61	0	poliwhirl	Poliwhirl	\N	water	\N	water_1	\N	mf	\N	4	blue	Medium Slow	11	1	[[62, 0], [186, 0]]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
85	62	0	poliwrath	Poliwrath	\N	water	fighting	water_1	\N	mf	\N	4	blue	Medium Slow	11	1	[]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
86	63	0	abra	Abra	\N	psychic	\N	human_like	\N	mf	\N	2	brown	Medium Slow	10	1	[[64, 0]]	{"flash": [1, 2, 3]}	f	f	f	f	f	f	f
87	64	0	kadabra	Kadabra	\N	psychic	\N	human_like	\N	fd	md	2	brown	Medium Slow	10	1	[[65, 0]]	{"flash": [1, 2, 3]}	f	f	f	f	f	f	f
88	65	0	alakazam	Alakazam	\N	psychic	\N	human_like	\N	fd	md	2	brown	Medium Slow	11	1	[]	{"flash": [1, 2, 3]}	f	f	f	f	f	f	f
89	65	1	alakazam-mega	Alakazam	Mega Alakazam	psychic	\N	human_like	\N	mf	\N	2	brown	Medium Slow	11	6	[]	{}	t	t	f	f	f	f	f
90	66	0	machop	Machop	\N	fighting	\N	human_like	\N	mf	\N	2	gray	Medium Slow	10	1	[[67, 0]]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
91	67	0	machoke	Machoke	\N	fighting	\N	human_like	\N	mf	\N	2	gray	Medium Slow	11	1	[[68, 0]]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
92	68	0	machamp	Machamp	\N	fighting	\N	human_like	\N	mf	\N	2	gray	Medium Slow	11	1	[]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	t	f	f	f	f
93	69	0	bellsprout	Bellsprout	\N	grass	poison	grass	\N	mf	\N	4	green	Medium Slow	11	1	[[70, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "flash": [2, 3]}	f	f	f	f	f	f	f
94	70	0	weepinbell	Weepinbell	\N	grass	poison	grass	\N	mf	\N	4	green	Medium Slow	9	1	[[71, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "flash": [2, 3]}	f	f	f	f	f	f	f
95	71	0	victreebel	Victreebel	\N	grass	poison	grass	\N	mf	\N	4	green	Medium Slow	9	1	[]	{"cut": [1, 2, 3, 4, 5, 6], "flash": [2, 3]}	f	f	f	f	f	f	f
96	71	1	victreebel-mega	Victreebel	Mega Victreebel	grass	poison	grass	\N	mf	\N	4	yellow	Medium Slow	9	9	[]	{}	t	t	f	f	f	f	f
97	72	0	tentacool	Tentacool	\N	water	poison	water_3	\N	mf	\N	4	blue	Slow	8	1	[[73, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
98	73	0	tentacruel	Tentacruel	\N	water	poison	water_3	\N	mf	\N	4	blue	Slow	8	1	[]	{"cut": [1, 2, 3, 4, 5, 6], "dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
99	74	0	geodude	Geodude	\N	rock	ground	mineral	\N	mf	\N	4	brown	Medium Slow	14	1	[[75, 0]]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
100	74	1	geodude-alola	Geodude	Alolan Form	rock	electric	mineral	\N	mf	\N	4	gray	Medium Slow	14	7	[[75, 1]]	{}	f	f	f	f	f	f	f
101	75	0	graveler	Graveler	\N	rock	ground	mineral	\N	mf	\N	4	brown	Medium Slow	11	1	[[76, 0]]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
102	75	1	graveler-alola	Graveler	Alolan Form	rock	electric	mineral	\N	mf	\N	4	gray	Medium Slow	11	7	[[76, 1]]	{}	f	f	f	f	f	f	f
103	76	0	golem	Golem	\N	rock	ground	mineral	\N	mf	\N	4	brown	Medium Slow	11	1	[]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
104	76	1	golem-alola	Golem	Alolan Form	rock	electric	mineral	\N	mf	\N	4	gray	Medium Slow	11	7	[]	{}	f	f	f	f	f	f	f
105	77	0	ponyta	Ponyta	\N	fire	\N	field	\N	mf	\N	4	yellow	Medium Fast	5	1	[[78, 0]]	{"strength": [3, 4, 5, 6]}	f	f	f	f	f	f	f
106	77	1	ponyta-galar	Ponyta	Galarian Form	psychic	\N	field	\N	mf	\N	4	white	Medium Fast	5	8	[[78, 1]]	{}	f	f	f	f	f	f	f
107	78	0	rapidash	Rapidash	\N	fire	\N	field	\N	mf	\N	4	yellow	Medium Fast	5	1	[]	{"strength": [3, 4, 5, 6]}	f	f	f	f	f	f	f
108	78	1	rapidash-galar	Rapidash	Galarian Form	psychic	fairy	field	\N	mf	\N	4	white	Medium Fast	5	8	[]	{}	f	f	f	f	f	f	f
109	79	0	slowpoke	Slowpoke	\N	water	psychic	monster	water_1	mf	\N	4	pink	Medium Fast	5	1	[[80, 0], [199, 0]]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "flash": [1, 2, 3], "strength": [1, 2, 3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
110	79	1	slowpoke-galar	Slowpoke	Galarian Form	psychic	\N	monster	water_1	mf	\N	4	pink	Medium Fast	5	8	[[80, 2], [199, 1]]	{}	f	f	f	f	f	f	f
111	80	0	slowbro	Slowbro	\N	water	psychic	monster	water_1	mf	\N	4	pink	Medium Fast	10	1	[]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "flash": [1, 2, 3], "strength": [1, 2, 3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
112	80	1	slowbro-mega	Slowbro	Mega Slowbro	water	psychic	monster	water_1	mf	\N	4	pink	Medium Fast	14	6	[]	{"dive": [6], "surf": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
113	80	2	slowbro-galar	Slowbro	Galarian Form	poison	psychic	monster	water_1	mf	\N	4	pink	Medium Fast	10	8	[]	{}	f	f	f	f	f	f	f
114	81	0	magnemite	Magnemite	\N	electric	steel	mineral	\N	uk	\N	-1	gray	Medium Fast	14	1	[[82, 0]]	{"flash": [1, 2, 3]}	f	f	f	f	f	f	f
115	82	0	magneton	Magneton	\N	electric	steel	mineral	\N	uk	\N	-1	gray	Medium Fast	7	1	[[462, 0]]	{"flash": [1, 2, 3]}	f	f	f	f	f	f	f
116	83	0	farfetchd	Farfetch'd	\N	normal	flying	flying	field	mf	\N	4	brown	Medium Fast	12	1	[]	{"cut": [1, 2, 3, 4, 5, 6], "fly": [1, 2, 3, 4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
117	83	1	farfetchd-galar	Farfetch'd	Galarian Form	fighting	\N	flying	field	mf	\N	4	brown	Medium Fast	12	8	[[865, 0]]	{}	f	f	f	f	f	f	f
118	84	0	doduo	Doduo	\N	normal	flying	flying	\N	fd	md	4	brown	Medium Fast	2	1	[[85, 0]]	{"fly": [1, 2, 3, 4, 5, 6]}	f	f	f	f	f	f	f
119	85	0	dodrio	Dodrio	\N	normal	flying	flying	\N	fd	md	4	brown	Medium Fast	2	1	[]	{"fly": [1, 2, 3, 4, 5, 6]}	f	f	f	f	f	f	f
120	86	0	seel	Seel	\N	water	\N	water_1	field	mf	\N	4	white	Medium Fast	3	1	[[87, 0]]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
121	87	0	dewgong	Dewgong	\N	water	ice	water_1	field	mf	\N	4	white	Medium Fast	3	1	[]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
122	88	0	grimer	Grimer	\N	poison	\N	amorphous	\N	mf	\N	4	purple	Medium Fast	14	1	[[89, 0]]	{"strength": [4, 5, 6]}	f	f	f	f	f	f	f
123	88	1	grimer-alola	Grimer	Alolan Form	poison	dark	amorphous	\N	mf	\N	4	green	Medium Fast	14	7	[[89, 1]]	{}	f	f	f	f	f	f	f
124	89	0	muk	Muk	\N	poison	\N	amorphous	\N	mf	\N	4	purple	Medium Fast	14	1	[]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
125	89	1	muk-alola	Muk	Alolan Form	poison	dark	amorphous	\N	mf	\N	4	green	Medium Fast	14	7	[]	{}	f	f	f	f	f	f	f
126	90	0	shellder	Shellder	\N	water	\N	water_3	\N	mf	\N	4	purple	Slow	1	1	[[91, 0]]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
127	91	0	cloyster	Cloyster	\N	water	ice	water_3	\N	mf	\N	4	purple	Slow	1	1	[]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
128	92	0	gastly	Gastly	\N	ghost	poison	amorphous	\N	mf	\N	4	purple	Medium Slow	1	1	[[93, 0]]	{}	f	f	f	f	f	f	f
129	93	0	haunter	Haunter	\N	ghost	poison	amorphous	\N	mf	\N	4	purple	Medium Slow	14	1	[[94, 0]]	{}	f	f	f	f	f	f	f
130	94	0	gengar	Gengar	\N	ghost	poison	amorphous	\N	mf	\N	4	purple	Medium Slow	10	1	[]	{"strength": [1, 2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	t	f	f	f	f
131	94	1	gengar-mega	Gengar	Mega Gengar	ghost	poison	amorphous	\N	mf	\N	4	purple	Medium Slow	10	6	[]	{"strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
132	95	0	onix	Onix	\N	rock	ground	mineral	\N	mf	\N	4	gray	Medium Fast	13	1	[[208, 0]]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
133	96	0	drowzee	Drowzee	\N	psychic	\N	human_like	\N	mf	\N	4	yellow	Medium Fast	11	1	[[97, 0]]	{"flash": [1, 2, 3]}	f	f	f	f	f	f	f
134	97	0	hypno	Hypno	\N	psychic	\N	human_like	\N	fd	md	4	yellow	Medium Fast	11	1	[]	{"flash": [1, 2, 3]}	f	f	f	f	f	f	f
226	166	0	ledian	Ledian	\N	bug	flying	bug	\N	fd	md	4	red	Fast	12	2	[]	{"flash": [2, 3], "strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
135	98	0	krabby	Krabby	\N	water	\N	water_3	\N	mf	\N	4	red	Medium Fast	4	1	[[99, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
136	99	0	kingler	Kingler	\N	water	\N	water_3	\N	mf	\N	4	red	Medium Fast	4	1	[]	{"cut": [1, 2, 3, 4, 5, 6], "dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	t	f	f	f	f
137	100	0	voltorb	Voltorb	\N	electric	\N	mineral	\N	uk	\N	-1	red	Medium Fast	1	1	[[101, 0]]	{"flash": [1, 2, 3]}	f	f	f	f	f	f	f
138	100	1	voltorb-hisui	Voltorb	Hisuian Form	electric	grass	mineral	\N	uk	\N	-1	red	Medium Fast	1	8	[[101, 1]]	{}	f	f	f	f	f	f	f
139	101	0	electrode	Electrode	\N	electric	\N	mineral	\N	uk	\N	-1	red	Medium Fast	1	1	[]	{"flash": [1, 2, 3]}	f	f	f	f	f	f	f
140	101	1	electrode-hisui	Electrode	Hisuian Form	electric	grass	mineral	\N	uk	\N	-1	red	Medium Fast	1	8	[]	{}	f	f	f	f	f	f	f
141	102	0	exeggcute	Exeggcute	\N	grass	psychic	grass	\N	mf	\N	4	pink	Slow	7	1	[[103, 0], [103, 1]]	{"flash": [2, 3], "strength": [2, 3, 4, 5, 6]}	f	f	f	f	f	f	f
142	103	0	exeggutor	Exeggutor	\N	grass	psychic	grass	\N	mf	\N	4	yellow	Slow	2	1	[]	{"flash": [2, 3], "strength": [1, 2, 3, 4, 5, 6]}	f	f	f	f	f	f	f
143	103	1	exeggutor-alola	Exeggutor	Alolan Form	grass	dragon	grass	\N	mf	\N	4	yellow	Slow	2	7	[]	{}	f	f	f	f	f	f	f
144	104	0	cubone	Cubone	\N	ground	\N	monster	\N	mf	\N	4	brown	Medium Fast	10	1	[[105, 0], [105, 1]]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
145	105	0	marowak	Marowak	\N	ground	\N	monster	\N	mf	\N	4	brown	Medium Fast	10	1	[]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
146	105	1	marowak-alola	Marowak	Alolan Form	fire	ghost	monster	\N	mf	\N	4	purple	Medium Fast	10	7	[]	{}	f	f	f	f	f	f	f
147	106	0	hitmonlee	Hitmonlee	\N	fighting	\N	human_like	\N	mo	\N	0	brown	Medium Fast	11	1	[]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
148	107	0	hitmonchan	Hitmonchan	\N	fighting	\N	human_like	\N	mo	\N	0	brown	Medium Fast	11	1	[]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
149	108	0	lickitung	Lickitung	\N	normal	\N	monster	\N	mf	\N	4	pink	Medium Fast	10	1	[[463, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
150	109	0	koffing	Koffing	\N	poison	\N	amorphous	\N	mf	\N	4	purple	Medium Fast	1	1	[[110, 0], [110, 1]]	{"flash": [3]}	f	f	f	f	f	f	f
151	110	0	weezing	Weezing	\N	poison	\N	amorphous	\N	mf	\N	4	purple	Medium Fast	7	1	[]	{"flash": [3]}	f	f	f	f	f	f	f
152	110	1	weezing-galar	Weezing	Galarian Form	poison	fairy	amorphous	\N	mf	\N	4	gray	Medium Fast	7	8	[]	{}	f	f	f	f	f	f	f
153	111	0	rhyhorn	Rhyhorn	\N	ground	rock	monster	field	fd	md	4	gray	Slow	5	1	[[112, 0]]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
154	112	0	rhydon	Rhydon	\N	ground	rock	monster	field	fd	md	4	gray	Slow	10	1	[[464, 0]]	{"cut": [3, 4, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
155	113	0	chansey	Chansey	\N	normal	\N	fairy	\N	fo	\N	8	pink	Fast	10	1	[[242, 0]]	{"flash": [1, 2, 3], "strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
156	114	0	tangela	Tangela	\N	grass	\N	grass	\N	mf	\N	4	blue	Medium Fast	2	1	[[465, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "flash": [2, 3], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
157	115	0	kangaskhan	Kangaskhan	\N	normal	\N	monster	\N	fo	\N	8	brown	Medium Fast	10	1	[]	{"cut": [3, 4, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
158	115	1	kangaskhan-mega	Kangaskhan	Mega Kangaskhan	normal	\N	monster	\N	fo	\N	8	brown	Medium Fast	10	6	[]	{"cut": [6], "surf": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
227	167	0	spinarak	Spinarak	\N	bug	poison	bug	\N	mf	\N	4	green	Fast	4	2	[[168, 0]]	{"flash": [2, 3]}	f	f	f	f	f	f	f
159	116	0	horsea	Horsea	\N	water	\N	water_1	dragon	mf	\N	4	blue	Medium Fast	9	1	[[117, 0]]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
160	117	0	seadra	Seadra	\N	water	\N	water_1	dragon	mf	\N	4	blue	Medium Fast	9	1	[[230, 0]]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
161	118	0	goldeen	Goldeen	\N	water	\N	water_2	\N	fd	md	4	red	Medium Fast	3	1	[[119, 0]]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
162	119	0	seaking	Seaking	\N	water	\N	water_2	\N	fd	md	4	red	Medium Fast	3	1	[]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
163	120	0	staryu	Staryu	\N	water	\N	water_3	\N	uk	\N	-1	brown	Slow	9	1	[[121, 0]]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "flash": [1, 2, 3], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
164	121	0	starmie	Starmie	\N	water	psychic	water_3	\N	uk	\N	-1	purple	Slow	9	1	[]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "flash": [1, 2, 3], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
165	121	1	starmie-mega	Starmie	Mega Starmie	water	psychic	water_3	\N	uk	\N	-1	purple	Slow	9	9	[]	{}	t	t	f	f	f	f	f
166	122	0	mr-mime	Mr. Mime	\N	psychic	fairy	human_like	\N	mf	\N	4	pink	Medium Fast	11	1	[]	{"flash": [1, 2, 3]}	f	f	f	f	f	f	f
167	122	1	mr-mime-galar	Mr. Mime	Galarian Form	ice	psychic	human_like	\N	mf	\N	4	white	Medium Fast	11	8	[[866, 0]]	{}	f	f	f	f	f	f	f
168	123	0	scyther	Scyther	\N	bug	flying	bug	\N	fd	md	4	green	Medium Fast	6	1	[[212, 0], [900, 0]]	{"cut": [1, 2, 3, 4, 5, 6], "defog": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
169	124	0	jynx	Jynx	\N	ice	psychic	human_like	\N	fo	\N	8	red	Medium Fast	11	1	[]	{"flash": [3]}	f	f	f	f	f	f	f
170	125	0	electabuzz	Electabuzz	\N	electric	\N	human_like	\N	mf	\N	2	yellow	Medium Fast	10	1	[[466, 0]]	{"flash": [1, 2, 3], "strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
171	126	0	magmar	Magmar	\N	fire	\N	human_like	\N	mf	\N	2	red	Medium Fast	10	1	[[467, 0]]	{"strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
172	127	0	pinsir	Pinsir	\N	bug	\N	bug	\N	mf	\N	4	brown	Slow	11	1	[]	{"cut": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
173	127	1	pinsir-mega	Pinsir	Mega Pinsir	bug	flying	bug	\N	mf	\N	4	brown	Slow	6	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
174	128	0	tauros	Tauros	\N	normal	\N	field	\N	mo	\N	0	brown	Slow	5	1	[]	{"surf": [2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
175	128	1	tauros-paldea-combat	Tauros	Paldean Form	fighting	\N	field	\N	md	\N	0	black	Slow	5	9	[]	{}	f	f	f	f	f	f	f
176	128	2	tauros-paldea-blaze	Tauros	Paldean Form	fighting	fire	field	\N	md	\N	0	black	Slow	5	9	[]	{}	f	f	f	f	f	f	f
177	128	3	tauros-paldea-aqua	Tauros	Paldean Form	fighting	water	field	\N	md	\N	0	black	Slow	5	9	[]	{}	f	f	f	f	f	f	f
178	129	0	magikarp	Magikarp	\N	water	\N	water_2	dragon	fd	md	4	red	Slow	3	1	[[130, 0]]	{}	f	f	f	f	f	f	f
179	130	0	gyarados	Gyarados	\N	water	flying	water_2	dragon	fd	md	4	blue	Slow	13	1	[]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
180	130	1	gyarados-mega	Gyarados	Mega Gyarados	water	dark	water_2	dragon	mf	\N	4	blue	Slow	13	6	[]	{"dive": [6], "surf": [6], "strength": [6], "waterfall": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
181	131	0	lapras	Lapras	\N	water	ice	monster	water_1	mf	\N	4	blue	Slow	3	1	[]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	t	f	f	f	f
182	132	0	ditto	Ditto	\N	normal	\N	ditto	\N	uk	\N	-1	purple	Medium Fast	1	1	[]	{}	f	f	f	f	f	f	f
228	168	0	ariados	Ariados	\N	bug	poison	bug	\N	mf	\N	4	red	Fast	4	2	[]	{"flash": [2, 3]}	f	f	f	f	f	f	f
183	133	0	eevee	Eevee	\N	normal	\N	field	\N	fd	md	1	brown	Medium Fast	5	1	[[134, 0], [135, 0], [136, 0], [196, 0], [197, 0], [470, 0], [471, 0], [700, 0]]	{}	f	f	t	f	f	f	f
184	134	0	vaporeon	Vaporeon	\N	water	\N	field	\N	mf	\N	1	blue	Medium Fast	5	1	[]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "strength": [4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
185	135	0	jolteon	Jolteon	\N	electric	\N	field	\N	mf	\N	1	yellow	Medium Fast	5	1	[]	{"flash": [1, 2, 3], "strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
186	136	0	flareon	Flareon	\N	fire	\N	field	\N	mf	\N	1	red	Medium Fast	5	1	[]	{"strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
187	137	0	porygon	Porygon	\N	normal	\N	mineral	\N	uk	\N	-1	pink	Medium Fast	2	1	[[233, 0]]	{"flash": [1, 2, 3]}	f	f	f	f	f	f	f
188	138	0	omanyte	Omanyte	\N	rock	water	water_1	water_3	mf	\N	1	blue	Medium Fast	8	1	[[139, 0]]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
189	139	0	omastar	Omastar	\N	rock	water	water_1	water_3	mf	\N	1	blue	Medium Fast	8	1	[]	{"dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [2, 4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
190	140	0	kabuto	Kabuto	\N	rock	water	water_1	water_3	mf	\N	1	brown	Medium Fast	4	1	[[141, 0]]	{"surf": [1, 3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
191	141	0	kabutops	Kabutops	\N	rock	water	water_1	water_3	mf	\N	1	brown	Medium Fast	10	1	[]	{"cut": [2, 3, 4, 5, 6], "dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [2, 4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
192	142	0	aerodactyl	Aerodactyl	\N	rock	flying	flying	\N	mf	\N	1	purple	Slow	12	1	[]	{"fly": [1, 2, 3, 4, 5, 6], "defog": [4], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
193	142	1	aerodactyl-mega	Aerodactyl	Mega Aerodactyl	rock	flying	flying	\N	mf	\N	1	purple	Slow	12	6	[]	{"fly": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
194	143	0	snorlax	Snorlax	\N	normal	\N	monster	\N	mf	\N	1	black	Slow	11	1	[]	{"surf": [1, 2, 3, 4, 5, 6], "strength": [1, 2, 3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	t	f	f	f	f
195	144	0	articuno	Articuno	\N	ice	flying	undiscovered	\N	uk	\N	-1	blue	Slow	12	1	[]	{"fly": [1, 2, 3, 4, 5, 6], "defog": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	t	f
196	144	1	articuno-galar	Articuno	Galarian Form	psychic	flying	undiscovered	\N	uk	\N	-1	purple	Slow	12	8	[]	{}	f	f	f	f	f	t	f
197	145	0	zapdos	Zapdos	\N	electric	flying	undiscovered	\N	uk	\N	-1	yellow	Slow	12	1	[]	{"fly": [1, 2, 3, 4, 5, 6], "defog": [4], "flash": [1, 2, 3], "rock_smash": [3, 4, 6]}	f	f	f	f	f	t	f
198	145	1	zapdos-galar	Zapdos	Galarian Form	fighting	flying	undiscovered	\N	uk	\N	-1	yellow	Slow	12	8	[]	{}	f	f	f	f	f	t	f
199	146	0	moltres	Moltres	\N	fire	flying	undiscovered	\N	uk	\N	-1	yellow	Slow	12	1	[]	{"fly": [1, 2, 3, 4, 5, 6], "defog": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	t	f
200	146	1	moltres-galar	Moltres	Galarian Form	dark	flying	undiscovered	\N	uk	\N	-1	red	Slow	12	8	[]	{}	f	f	f	f	f	t	f
201	147	0	dratini	Dratini	\N	dragon	\N	water_1	dragon	mf	\N	4	blue	Slow	13	1	[[148, 0]]	{"surf": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
202	148	0	dragonair	Dragonair	\N	dragon	\N	water_1	dragon	mf	\N	4	blue	Slow	13	1	[[149, 0]]	{"surf": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
203	149	0	dragonite	Dragonite	\N	dragon	flying	water_1	dragon	mf	\N	4	brown	Slow	10	1	[]	{"cut": [3, 4, 5, 6], "fly": [2, 3, 4, 5, 6], "dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "defog": [4], "strength": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
204	149	1	dragonite-mega	Dragonite	Mega Dragonite	dragon	flying	water_1	dragon	mf	\N	4	brown	Slow	10	9	[]	{}	t	t	f	f	f	f	f
423	313	0	volbeat	Volbeat	\N	bug	\N	bug	human_like	mo	\N	0	gray	Erratic	10	3	[]	{"flash": [3]}	f	f	f	f	f	f	f
205	150	0	mewtwo	Mewtwo	\N	psychic	\N	undiscovered	\N	uk	\N	-1	purple	Slow	10	1	[]	{"dive": [6], "flash": [1, 2, 3], "strength": [1, 2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	t	f	f	f
206	150	1	mewtwo-mega-x	Mewtwo	Mega Mewtwo X	psychic	fighting	undiscovered	\N	uk	\N	-1	purple	Slow	10	6	[]	{"dive": [6], "strength": [6], "rock_smash": [6]}	t	t	f	t	f	f	f
207	150	2	mewtwo-mega-y	Mewtwo	Mega Mewtwo Y	psychic	\N	undiscovered	\N	uk	\N	-1	purple	Slow	10	6	[]	{"dive": [6], "strength": [6], "rock_smash": [6]}	t	t	f	t	f	f	f
208	151	0	mew	Mew	\N	psychic	\N	undiscovered	\N	uk	\N	-1	pink	Medium Slow	10	1	[]	{"cut": [1, 2, 3, 4, 5, 6], "fly": [1, 2, 3, 4, 5, 6], "dive": [3, 5, 6], "surf": [1, 2, 3, 4, 5, 6], "defog": [4], "flash": [1, 2, 3], "strength": [1, 2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	t	f	f
209	152	0	chikorita	Chikorita	\N	grass	\N	monster	grass	mf	\N	1	green	Medium Slow	5	2	[[153, 0]]	{"cut": [2, 3, 4, 5, 6], "flash": [2, 3]}	f	f	f	f	f	f	f
210	153	0	bayleef	Bayleef	\N	grass	\N	monster	grass	mf	\N	1	green	Medium Slow	5	2	[[154, 0]]	{"cut": [2, 3, 4, 5, 6], "flash": [2, 3], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
211	154	0	meganium	Meganium	\N	grass	\N	monster	grass	fd	md	1	green	Medium Slow	5	2	[]	{"cut": [2, 3, 4, 5, 6], "flash": [2, 3], "strength": [2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
212	154	1	meganium-mega	Meganium	Mega Meganium	grass	fairy	monster	grass	mf	\N	1	green	Medium Slow	5	9	[]	{}	t	t	f	f	f	f	f
213	155	0	cyndaquil	Cyndaquil	\N	fire	\N	field	\N	mf	\N	1	yellow	Medium Slow	11	2	[[156, 0]]	{"cut": [2, 3, 4, 5, 6]}	f	f	f	f	f	f	f
214	156	0	quilava	Quilava	\N	fire	\N	field	\N	mf	\N	1	yellow	Medium Slow	5	2	[[157, 0], [157, 1]]	{"cut": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
215	157	0	typhlosion	Typhlosion	\N	fire	\N	field	\N	mf	\N	1	yellow	Medium Slow	5	2	[]	{"cut": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
216	157	1	typhlosion-hisui	Typhlosion	Hisuian Form	fire	ghost	field	\N	mf	\N	1	yellow	Medium Slow	5	8	[]	{}	f	f	f	f	f	f	f
217	158	0	totodile	Totodile	\N	water	\N	monster	water_1	mf	\N	1	blue	Medium Slow	10	2	[[159, 0]]	{"cut": [2, 3, 4, 5, 6], "dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
218	159	0	croconaw	Croconaw	\N	water	\N	monster	water_1	mf	\N	1	blue	Medium Slow	10	2	[[160, 0]]	{"cut": [2, 3, 4, 5, 6], "dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
219	160	0	feraligatr	Feraligatr	\N	water	\N	monster	water_1	mf	\N	1	blue	Medium Slow	10	2	[]	{"cut": [2, 3, 4, 5, 6], "dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [2, 4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
220	160	1	feraligatr-mega	Feraligatr	Mega Feraligatr	water	dragon	monster	water_1	mf	\N	1	blue	Medium Slow	10	9	[]	{}	t	t	f	f	f	f	f
221	161	0	sentret	Sentret	\N	normal	\N	field	\N	mf	\N	4	brown	Medium Fast	5	2	[[162, 0]]	{"cut": [2, 3, 4, 5, 6], "surf": [2, 3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
222	162	0	furret	Furret	\N	normal	\N	field	\N	mf	\N	4	brown	Medium Fast	5	2	[]	{"cut": [2, 3, 4, 5, 6], "surf": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
223	163	0	hoothoot	Hoothoot	\N	normal	flying	flying	\N	mf	\N	4	brown	Medium Fast	12	2	[[164, 0]]	{"fly": [2, 3, 4, 5, 6], "defog": [4], "flash": [2, 3]}	f	f	f	f	f	f	f
224	164	0	noctowl	Noctowl	\N	normal	flying	flying	\N	mf	\N	4	brown	Medium Fast	12	2	[]	{"fly": [2, 3, 4, 5, 6], "defog": [4], "flash": [2, 3]}	f	f	f	f	f	f	f
225	165	0	ledyba	Ledyba	\N	bug	flying	bug	\N	fd	md	4	red	Fast	12	2	[[166, 0]]	{"flash": [2, 3]}	f	f	f	f	f	f	f
649	492	0	shaymin	Shaymin	Land Forme	grass	\N	undiscovered	\N	uk	\N	-1	green	Medium Slow	5	4	[]	{}	f	f	f	f	t	f	f
229	169	0	crobat	Crobat	\N	poison	flying	flying	\N	mf	\N	4	purple	Medium Fast	6	2	[]	{"fly": [2, 3, 4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
230	170	0	chinchou	Chinchou	\N	water	electric	water_2	\N	mf	\N	4	blue	Slow	3	2	[[171, 0]]	{"dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "flash": [2, 3], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
231	171	0	lanturn	Lanturn	\N	water	electric	water_2	\N	mf	\N	4	blue	Slow	3	2	[]	{"dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "flash": [2, 3], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
232	172	0	pichu	Pichu	\N	electric	\N	undiscovered	\N	mf	\N	4	yellow	Medium Fast	5	2	[[25, 0]]	{"flash": [2, 3]}	f	f	f	f	f	f	f
233	173	0	cleffa	Cleffa	\N	fairy	\N	undiscovered	\N	mf	\N	6	pink	Fast	10	2	[[35, 0]]	{"flash": [2, 3]}	f	f	f	f	f	f	f
234	174	0	igglybuff	Igglybuff	\N	normal	fairy	undiscovered	\N	mf	\N	6	pink	Fast	11	2	[[39, 0]]	{"flash": [2, 3]}	f	f	f	f	f	f	f
235	175	0	togepi	Togepi	\N	fairy	\N	undiscovered	\N	mf	\N	1	white	Fast	11	2	[[176, 0]]	{"flash": [2, 3], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
236	176	0	togetic	Togetic	\N	fairy	flying	flying	fairy	mf	\N	1	white	Fast	11	2	[[468, 0]]	{"fly": [2, 3, 4, 5, 6], "defog": [4], "flash": [2, 3], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
237	177	0	natu	Natu	\N	psychic	flying	flying	\N	mf	\N	4	green	Medium Fast	12	2	[[178, 0]]	{"flash": [2, 3]}	f	f	f	f	f	f	f
238	178	0	xatu	Xatu	\N	psychic	flying	flying	\N	fd	md	4	green	Medium Fast	12	2	[]	{"fly": [2, 3, 4, 5, 6], "defog": [4], "flash": [2, 3]}	f	f	f	f	f	f	f
239	179	0	mareep	Mareep	\N	electric	\N	monster	field	mf	\N	4	white	Medium Slow	5	2	[[180, 0]]	{"flash": [2, 3]}	f	f	f	f	f	f	f
240	180	0	flaaffy	Flaaffy	\N	electric	\N	monster	field	mf	\N	4	pink	Medium Slow	10	2	[[181, 0]]	{"flash": [2, 3], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
241	181	0	ampharos	Ampharos	\N	electric	\N	monster	field	mf	\N	4	yellow	Medium Slow	10	2	[]	{"flash": [2, 3], "strength": [2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
242	181	1	ampharos-mega	Ampharos	Mega Ampharos	electric	dragon	monster	field	mf	\N	4	yellow	Medium Slow	10	6	[]	{"strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
243	182	0	bellossom	Bellossom	\N	grass	\N	grass	\N	mf	\N	4	green	Medium Slow	11	2	[]	{"cut": [2, 3, 4, 5, 6], "flash": [2, 3]}	f	f	f	f	f	f	f
244	183	0	marill	Marill	\N	water	fairy	water_1	fairy	mf	\N	4	blue	Fast	10	2	[[184, 0]]	{"dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
245	184	0	azumarill	Azumarill	\N	water	fairy	water_1	fairy	mf	\N	4	blue	Fast	10	2	[]	{"dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
246	185	0	sudowoodo	Sudowoodo	\N	rock	\N	mineral	\N	fd	md	4	brown	Medium Fast	11	2	[]	{"strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
247	186	0	politoed	Politoed	\N	water	\N	water_1	\N	fd	md	4	green	Medium Slow	11	2	[]	{"dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
248	187	0	hoppip	Hoppip	\N	grass	flying	fairy	grass	mf	\N	4	pink	Medium Slow	10	2	[[188, 0]]	{"flash": [2, 3]}	f	f	f	f	f	f	f
249	188	0	skiploom	Skiploom	\N	grass	flying	fairy	grass	mf	\N	4	green	Medium Slow	10	2	[[189, 0]]	{"flash": [2, 3]}	f	f	f	f	f	f	f
250	189	0	jumpluff	Jumpluff	\N	grass	flying	fairy	grass	mf	\N	4	blue	Medium Slow	10	2	[]	{"flash": [2, 3]}	f	f	f	f	f	f	f
251	190	0	aipom	Aipom	\N	normal	\N	field	\N	fd	md	4	purple	Fast	10	2	[[424, 0]]	{"cut": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
252	191	0	sunkern	Sunkern	\N	grass	\N	grass	\N	mf	\N	4	yellow	Medium Slow	1	2	[[192, 0]]	{"cut": [2, 3, 4, 5, 6], "flash": [2, 3]}	f	f	f	f	f	f	f
253	192	0	sunflora	Sunflora	\N	grass	\N	grass	\N	mf	\N	4	yellow	Medium Slow	11	2	[]	{"cut": [2, 3, 4, 5, 6], "flash": [2, 3]}	f	f	f	f	f	f	f
254	193	0	yanma	Yanma	\N	bug	flying	bug	\N	mf	\N	4	red	Medium Fast	6	2	[[469, 0]]	{"defog": [4], "flash": [2, 3]}	f	f	f	f	f	f	f
255	194	0	wooper	Wooper	\N	water	ground	water_1	field	fd	md	4	blue	Medium Fast	2	2	[[195, 0]]	{"dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "flash": [2, 3], "waterfall": [3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
256	194	1	wooper-paldea	Wooper	Paldean Form	poison	ground	water_1	field	mf	\N	4	brown	Medium Fast	2	9	[[980, 0]]	{}	f	f	f	f	f	f	f
257	195	0	quagsire	Quagsire	\N	water	ground	water_1	field	fd	md	4	blue	Medium Fast	10	2	[]	{"dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "flash": [2, 3], "strength": [2, 3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
258	196	0	espeon	Espeon	\N	psychic	\N	field	\N	mf	\N	1	purple	Medium Fast	5	2	[]	{"cut": [2, 3, 4, 5, 6], "flash": [2, 3]}	f	f	f	f	f	f	f
259	197	0	umbreon	Umbreon	\N	dark	\N	field	\N	mf	\N	1	black	Medium Fast	5	2	[]	{"cut": [2, 3, 4, 5, 6], "flash": [2, 3]}	f	f	f	f	f	f	f
260	198	0	murkrow	Murkrow	\N	dark	flying	flying	\N	fd	md	4	black	Medium Slow	12	2	[[430, 0]]	{"fly": [2, 3, 4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
261	199	0	slowking	Slowking	\N	water	psychic	monster	water_1	mf	\N	4	pink	Medium Fast	10	2	[]	{"dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "flash": [2, 3], "strength": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
262	199	1	slowking-galar	Slowking	Galarian Form	poison	psychic	monster	water_1	mf	\N	4	pink	Medium Fast	10	8	[]	{}	f	f	f	f	f	f	f
263	200	0	misdreavus	Misdreavus	\N	ghost	\N	amorphous	\N	mf	\N	4	gray	Fast	1	2	[[429, 0]]	{"flash": [2, 3]}	f	f	f	f	f	f	f
264	201	0	unown	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
265	201	1	unown-b	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
266	201	2	unown-c	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
267	201	3	unown-d	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
268	201	4	unown-e	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
269	201	5	unown-f	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
270	201	6	unown-g	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
271	201	7	unown-h	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
272	201	8	unown-i	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
273	201	9	unown-j	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
274	201	10	unown-k	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
275	201	11	unown-l	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
276	201	12	unown-m	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
277	201	13	unown-n	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
278	201	14	unown-o	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
279	201	15	unown-p	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
280	201	16	unown-q	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
281	201	17	unown-r	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
282	201	18	unown-s	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
283	201	19	unown-t	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
284	201	20	unown-u	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
285	201	21	unown-v	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
286	201	22	unown-w	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
287	201	23	unown-x	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
288	201	24	unown-y	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
289	201	25	unown-z	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	2	[]	{}	f	f	f	f	f	f	f
290	201	26	unown-excl	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	3	[]	{}	f	f	f	f	f	f	f
291	201	27	unown-quest	Unown	One form	psychic	\N	undiscovered	\N	uk	\N	-1	black	Medium Fast	1	3	[]	{}	f	f	f	f	f	f	f
292	202	0	wobbuffet	Wobbuffet	\N	psychic	\N	amorphous	\N	fd	md	4	blue	Medium Fast	9	2	[]	{}	f	f	f	f	f	f	f
293	203	0	girafarig	Girafarig	\N	normal	psychic	field	\N	fd	md	4	yellow	Medium Fast	5	2	[[981, 0]]	{"flash": [3], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
345	247	0	pupitar	Pupitar	\N	rock	ground	monster	\N	mf	\N	4	gray	Slow	13	2	[[248, 0]]	{"rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
294	204	0	pineco	Pineco	\N	bug	\N	bug	\N	mf	\N	4	gray	Medium Fast	1	2	[[205, 0]]	{"strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
295	205	0	forretress	Forretress	\N	bug	steel	bug	\N	mf	\N	4	purple	Medium Fast	1	2	[]	{"strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
296	206	0	dunsparce	Dunsparce	\N	normal	\N	field	\N	mf	\N	4	yellow	Medium Fast	13	2	[[982, 0], [982, 1]]	{"strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
297	207	0	gligar	Gligar	\N	ground	flying	bug	\N	fd	md	4	purple	Medium Slow	12	2	[[472, 0]]	{"cut": [2, 3, 4, 5, 6], "defog": [4], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
298	208	0	steelix	Steelix	\N	steel	ground	mineral	\N	fd	md	4	gray	Medium Fast	13	2	[]	{"cut": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
299	208	1	steelix-mega	Steelix	Mega Steelix	steel	ground	mineral	\N	mf	\N	4	gray	Medium Fast	13	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
300	209	0	snubbull	Snubbull	\N	fairy	\N	field	fairy	mf	\N	6	pink	Fast	11	2	[[210, 0]]	{"strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
301	210	0	granbull	Granbull	\N	fairy	\N	field	fairy	mf	\N	6	purple	Fast	10	2	[]	{"strength": [2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
302	211	0	qwilfish	Qwilfish	\N	water	poison	water_2	\N	mf	\N	4	gray	Medium Fast	3	2	[]	{"dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
303	211	1	qwilfish-hisui	Qwilfish	Hisuian Form	dark	poison	water_2	\N	mf	\N	4	black	Medium Fast	3	8	[[904, 0]]	{}	f	f	f	f	f	f	f
304	212	0	scizor	Scizor	\N	bug	steel	bug	\N	fd	md	4	red	Medium Fast	6	2	[]	{"cut": [2, 3, 4, 5, 6], "defog": [4], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
305	212	1	scizor-mega	Scizor	Mega Scizor	bug	steel	bug	\N	mf	\N	4	red	Medium Fast	6	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
306	213	0	shuckle	Shuckle	\N	bug	rock	bug	\N	mf	\N	4	yellow	Medium Slow	4	2	[]	{"flash": [2, 3], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
307	214	0	heracross	Heracross	\N	bug	fighting	bug	\N	fd	md	4	blue	Slow	11	2	[]	{"cut": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
308	214	1	heracross-mega	Heracross	Mega Heracross	bug	fighting	bug	\N	mf	\N	4	blue	Slow	11	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
309	215	0	sneasel	Sneasel	\N	dark	ice	field	\N	fd	md	4	black	Medium Slow	10	2	[[461, 0]]	{"cut": [2, 3, 4, 5, 6], "surf": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
310	215	1	sneasel-hisui	Sneasel	Hisuian Form	fighting	poison	field	\N	fd	md	4	gray	Medium Slow	10	8	[[903, 0]]	{}	f	f	f	f	f	f	f
311	216	0	teddiursa	Teddiursa	\N	normal	\N	field	\N	mf	\N	4	brown	Medium Fast	10	2	[[217, 0]]	{"cut": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
312	217	0	ursaring	Ursaring	\N	normal	\N	field	\N	fd	md	4	brown	Medium Fast	10	2	[[901, 0]]	{"cut": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
313	218	0	slugma	Slugma	\N	fire	\N	amorphous	\N	mf	\N	4	red	Medium Fast	13	2	[[219, 0]]	{"rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
314	219	0	magcargo	Magcargo	\N	fire	rock	amorphous	\N	mf	\N	4	red	Medium Fast	13	2	[]	{"strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
315	220	0	swinub	Swinub	\N	ice	ground	field	\N	mf	\N	4	brown	Slow	5	2	[[221, 0]]	{"strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
316	221	0	piloswine	Piloswine	\N	ice	ground	field	\N	fd	md	4	brown	Slow	5	2	[[473, 0]]	{"strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
317	222	0	corsola	Corsola	\N	water	rock	water_1	water_3	mf	\N	6	pink	Fast	4	2	[]	{"surf": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
318	222	1	corsola-galar	Corsola	Galarian Form	ghost	\N	water_1	water_3	mf	\N	6	white	Fast	4	8	[[864, 0]]	{}	f	f	f	f	f	f	f
319	223	0	remoraid	Remoraid	\N	water	\N	water_1	water_2	mf	\N	4	gray	Medium Fast	3	2	[[224, 0]]	{"dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
320	224	0	octillery	Octillery	\N	water	\N	water_1	water_2	fd	md	4	red	Medium Fast	8	2	[]	{"dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
321	225	0	delibird	Delibird	\N	ice	flying	water_1	field	mf	\N	4	red	Fast	12	2	[]	{"fly": [2, 3, 4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
322	226	0	mantine	Mantine	\N	water	flying	water_1	\N	mf	\N	4	purple	Slow	12	2	[]	{"dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "defog": [4], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
323	227	0	skarmory	Skarmory	\N	steel	flying	flying	\N	mf	\N	4	gray	Slow	12	2	[]	{"cut": [2, 3, 4, 5, 6], "fly": [2, 3, 4, 5, 6], "defog": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
324	227	1	skarmory-mega	Skarmory	Mega Skarmory	steel	flying	flying	\N	mf	\N	4	yellow	Slow	12	9	[]	{}	t	t	f	f	f	f	f
325	228	0	houndour	Houndour	\N	dark	fire	field	\N	mf	\N	4	black	Slow	5	2	[[229, 0]]	{"rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
326	229	0	houndoom	Houndoom	\N	dark	fire	field	\N	fd	md	4	black	Slow	5	2	[]	{"strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
327	229	1	houndoom-mega	Houndoom	Mega Houndoom	dark	fire	field	\N	mf	\N	4	black	Slow	5	6	[]	{"strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
328	230	0	kingdra	Kingdra	\N	water	dragon	water_1	dragon	mf	\N	4	blue	Medium Fast	9	2	[]	{"dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4]}	f	f	f	f	f	f	f
329	231	0	phanpy	Phanpy	\N	ground	\N	field	\N	mf	\N	4	blue	Medium Fast	5	2	[[232, 0]]	{"strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
330	232	0	donphan	Donphan	\N	ground	\N	field	\N	fd	md	4	gray	Medium Fast	5	2	[]	{"strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
331	233	0	porygon2	Porygon2	\N	normal	\N	mineral	\N	uk	\N	-1	red	Medium Fast	2	2	[[474, 0]]	{"flash": [2, 3]}	f	f	f	f	f	f	f
332	234	0	stantler	Stantler	\N	normal	\N	field	\N	mf	\N	4	brown	Slow	5	2	[[899, 0]]	{"flash": [2, 3]}	f	f	f	f	f	f	f
333	235	0	smeargle	Smeargle	\N	normal	\N	field	\N	mf	\N	4	white	Fast	10	2	[]	{}	f	f	f	f	f	f	f
334	236	0	tyrogue	Tyrogue	\N	fighting	\N	undiscovered	\N	mo	\N	0	purple	Medium Fast	11	2	[[106, 0], [107, 0], [237, 0]]	{"strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
335	237	0	hitmontop	Hitmontop	\N	fighting	\N	human_like	\N	mo	\N	0	brown	Medium Fast	10	2	[]	{"strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
336	238	0	smoochum	Smoochum	\N	ice	psychic	undiscovered	\N	fo	\N	8	pink	Medium Fast	11	2	[[124, 0]]	{"flash": [3]}	f	f	f	f	f	f	f
337	239	0	elekid	Elekid	\N	electric	\N	undiscovered	\N	mf	\N	2	yellow	Medium Fast	11	2	[[125, 0]]	{"flash": [2, 3], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
338	240	0	magby	Magby	\N	fire	\N	undiscovered	\N	mf	\N	2	red	Medium Fast	10	2	[[126, 0]]	{"rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
339	241	0	miltank	Miltank	\N	normal	\N	field	\N	fo	\N	8	pink	Slow	10	2	[]	{"surf": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
340	242	0	blissey	Blissey	\N	normal	\N	fairy	\N	fo	\N	8	pink	Fast	11	2	[]	{"flash": [2, 3], "strength": [2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
341	243	0	raikou	Raikou	\N	electric	\N	undiscovered	\N	uk	\N	-1	yellow	Slow	5	2	[]	{"cut": [2, 3, 4, 5, 6], "flash": [2, 3], "strength": [2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	t	f
342	244	0	entei	Entei	\N	fire	\N	undiscovered	\N	uk	\N	-1	brown	Slow	5	2	[]	{"cut": [2, 3, 4, 5, 6], "flash": [2, 3], "strength": [2, 3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	t	f
343	245	0	suicune	Suicune	\N	water	\N	undiscovered	\N	uk	\N	-1	blue	Slow	5	2	[]	{"cut": [2, 3, 4, 5, 6], "dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	t	f
344	246	0	larvitar	Larvitar	\N	rock	ground	monster	\N	mf	\N	4	green	Slow	10	2	[[247, 0]]	{"rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
346	248	0	tyranitar	Tyranitar	\N	rock	dark	monster	\N	mf	\N	4	green	Slow	10	2	[]	{"cut": [2, 3, 4, 5, 6], "surf": [2, 3, 4, 5, 6], "strength": [2, 3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
347	248	1	tyranitar-mega	Tyranitar	Mega Tyranitar	rock	dark	monster	\N	mf	\N	4	green	Slow	10	6	[]	{"cut": [6], "surf": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
348	249	0	lugia	Lugia	\N	psychic	flying	undiscovered	\N	uk	\N	-1	white	Slow	12	2	[]	{"fly": [2, 3, 4, 5, 6], "dive": [3, 5, 6], "surf": [2, 3, 4, 5, 6], "defog": [4], "strength": [2, 3, 4, 5, 6], "waterfall": [2, 3, 4, 5, 6], "whirlpool": [2, 4], "rock_smash": [3, 4, 6]}	f	f	f	t	f	f	f
349	250	0	ho-oh	Ho-Oh	\N	fire	flying	undiscovered	\N	uk	\N	-1	red	Slow	12	2	[]	{"fly": [2, 3, 4, 5, 6], "defog": [4], "flash": [2, 3], "strength": [2, 3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	t	f	f	f
350	251	0	celebi	Celebi	\N	psychic	grass	undiscovered	\N	uk	\N	-1	green	Medium Slow	11	2	[]	{"cut": [3, 4, 5, 6], "flash": [2, 3]}	f	f	f	f	t	f	f
351	252	0	treecko	Treecko	\N	grass	\N	monster	dragon	mf	\N	1	green	Medium Slow	10	3	[[253, 0]]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
352	253	0	grovyle	Grovyle	\N	grass	\N	monster	dragon	mf	\N	1	green	Medium Slow	10	3	[[254, 0]]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
353	254	0	sceptile	Sceptile	\N	grass	\N	monster	dragon	mf	\N	1	green	Medium Slow	10	3	[]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
354	254	1	sceptile-mega	Sceptile	Mega Sceptile	grass	dragon	monster	dragon	mf	\N	1	green	Medium Slow	10	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
355	255	0	torchic	Torchic	\N	fire	\N	field	\N	fd	md	1	red	Medium Slow	2	3	[[256, 0]]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
356	256	0	combusken	Combusken	\N	fire	fighting	field	\N	fd	md	1	red	Medium Slow	10	3	[[257, 0]]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
357	257	0	blaziken	Blaziken	\N	fire	fighting	field	\N	fd	md	1	red	Medium Slow	10	3	[]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
358	257	1	blaziken-mega	Blaziken	Mega Blaziken	fire	fighting	field	\N	mf	\N	1	red	Medium Slow	10	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
359	258	0	mudkip	Mudkip	\N	water	\N	monster	water_1	mf	\N	1	blue	Medium Slow	5	3	[[259, 0]]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
360	259	0	marshtomp	Marshtomp	\N	water	ground	monster	water_1	mf	\N	1	blue	Medium Slow	10	3	[[260, 0]]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
361	260	0	swampert	Swampert	\N	water	ground	monster	water_1	mf	\N	1	blue	Medium Slow	10	3	[]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
362	260	1	swampert-mega	Swampert	Mega Swampert	water	ground	monster	water_1	mf	\N	1	blue	Medium Slow	10	6	[]	{"dive": [6], "surf": [6], "strength": [6], "waterfall": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
363	261	0	poochyena	Poochyena	\N	dark	\N	field	\N	mf	\N	4	gray	Medium Fast	5	3	[[262, 0]]	{"rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
364	262	0	mightyena	Mightyena	\N	dark	\N	field	\N	mf	\N	4	gray	Medium Fast	5	3	[]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
365	263	0	zigzagoon	Zigzagoon	\N	normal	\N	field	\N	mf	\N	4	brown	Medium Fast	5	3	[[264, 0]]	{"cut": [3, 4, 5, 6], "surf": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
366	263	1	zigzagoon-galar	Zigzagoon	Galarian Form	dark	normal	field	\N	mf	\N	4	white	Medium Fast	5	8	[[264, 1]]	{}	f	f	f	f	f	f	f
650	492	1	shaymin-sky	Shaymin	Sky Forme	grass	flying	undiscovered	\N	uk	\N	-1	green	Medium Slow	5	4	[]	{}	f	f	f	f	t	f	f
367	264	0	linoone	Linoone	\N	normal	\N	field	\N	mf	\N	4	white	Medium Fast	5	3	[]	{"cut": [3, 4, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
368	264	1	linoone-galar	Linoone	Galarian Form	dark	normal	field	\N	mf	\N	4	white	Medium Fast	5	8	[[862, 0]]	{}	f	f	f	f	f	f	f
369	265	0	wurmple	Wurmple	\N	bug	\N	bug	\N	mf	\N	4	red	Medium Fast	4	3	[[266, 0], [268, 0]]	{}	f	f	f	f	f	f	f
370	266	0	silcoon	Silcoon	\N	bug	\N	bug	\N	mf	\N	4	white	Medium Fast	1	3	[[267, 0]]	{}	f	f	f	f	f	f	f
371	267	0	beautifly	Beautifly	\N	bug	flying	bug	\N	fd	md	4	yellow	Medium Fast	6	3	[]	{"defog": [4], "flash": [3]}	f	f	f	f	f	f	f
372	268	0	cascoon	Cascoon	\N	bug	\N	bug	\N	mf	\N	4	purple	Medium Fast	1	3	[[269, 0]]	{}	f	f	f	f	f	f	f
373	269	0	dustox	Dustox	\N	bug	poison	bug	\N	fd	md	4	green	Medium Fast	6	3	[]	{"defog": [4], "flash": [3]}	f	f	f	f	f	f	f
374	270	0	lotad	Lotad	\N	water	grass	water_1	grass	mf	\N	4	green	Medium Slow	4	3	[[271, 0]]	{"surf": [3, 4, 5, 6], "flash": [3], "whirlpool": [4]}	f	f	f	f	f	f	f
375	271	0	lombre	Lombre	\N	water	grass	water_1	grass	mf	\N	4	green	Medium Slow	11	3	[[272, 0]]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
376	272	0	ludicolo	Ludicolo	\N	water	grass	water_1	grass	fd	md	4	green	Medium Slow	11	3	[]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
377	273	0	seedot	Seedot	\N	grass	\N	field	grass	mf	\N	4	brown	Medium Slow	2	3	[[274, 0]]	{"flash": [3], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
378	274	0	nuzleaf	Nuzleaf	\N	grass	dark	field	grass	fd	md	4	brown	Medium Slow	11	3	[[275, 0]]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
379	275	0	shiftry	Shiftry	\N	grass	dark	field	grass	fd	md	4	brown	Medium Slow	11	3	[]	{"cut": [3, 4, 5, 6], "defog": [4], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
380	276	0	taillow	Taillow	\N	normal	flying	flying	\N	mf	\N	4	blue	Medium Slow	12	3	[[277, 0]]	{"fly": [3, 4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
381	277	0	swellow	Swellow	\N	normal	flying	flying	\N	mf	\N	4	blue	Medium Slow	12	3	[]	{"fly": [3, 4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
382	278	0	wingull	Wingull	\N	water	flying	water_1	flying	mf	\N	4	white	Medium Fast	12	3	[[279, 0]]	{"fly": [3, 4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
383	279	0	pelipper	Pelipper	\N	water	flying	water_1	flying	mf	\N	4	yellow	Medium Fast	12	3	[]	{"fly": [3, 4, 5, 6], "surf": [3, 4, 5, 6], "defog": [4], "whirlpool": [4]}	f	f	f	f	f	f	f
384	280	0	ralts	Ralts	\N	psychic	fairy	amorphous	\N	mf	\N	4	white	Slow	11	3	[[281, 0]]	{"flash": [3]}	f	f	f	f	f	f	f
385	281	0	kirlia	Kirlia	\N	psychic	fairy	amorphous	\N	mf	\N	4	white	Slow	11	3	[[282, 0], [475, 0]]	{"flash": [3]}	f	f	f	f	f	f	f
386	282	0	gardevoir	Gardevoir	\N	psychic	fairy	amorphous	\N	mf	\N	4	white	Slow	11	3	[]	{"flash": [3]}	f	f	f	f	f	f	f
387	282	1	gardevoir-mega	Gardevoir	Mega Gardevoir	psychic	fairy	amorphous	\N	mf	\N	4	white	Slow	11	6	[]	{}	t	t	f	f	f	f	f
388	283	0	surskit	Surskit	\N	bug	water	water_1	bug	mf	\N	4	blue	Medium Fast	4	3	[[284, 0]]	{"flash": [3]}	f	f	f	f	f	f	f
389	284	0	masquerain	Masquerain	\N	bug	flying	water_1	bug	mf	\N	4	blue	Medium Fast	6	3	[]	{"defog": [4], "flash": [3]}	f	f	f	f	f	f	f
390	285	0	shroomish	Shroomish	\N	grass	\N	fairy	grass	mf	\N	4	brown	Fluctuating	2	3	[[286, 0]]	{"flash": [3]}	f	f	f	f	f	f	f
391	286	0	breloom	Breloom	\N	grass	fighting	fairy	grass	mf	\N	4	green	Fluctuating	10	3	[]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
392	287	0	slakoth	Slakoth	\N	normal	\N	field	\N	mf	\N	4	brown	Slow	5	3	[[288, 0]]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
393	288	0	vigoroth	Vigoroth	\N	normal	\N	field	\N	mf	\N	4	white	Slow	10	3	[[289, 0]]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
394	289	0	slaking	Slaking	\N	normal	\N	field	\N	mf	\N	4	brown	Slow	11	3	[]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
395	290	0	nincada	Nincada	\N	bug	ground	bug	\N	mf	\N	4	gray	Erratic	4	3	[[291, 0], [292, 0]]	{"cut": [3, 4, 5, 6], "flash": [3]}	f	f	f	f	f	f	f
396	291	0	ninjask	Ninjask	\N	bug	flying	bug	\N	mf	\N	4	yellow	Erratic	6	3	[]	{"cut": [3, 4, 5, 6], "defog": [4], "flash": [3]}	f	f	f	f	f	f	f
397	292	0	shedinja	Shedinja	\N	bug	ghost	mineral	\N	uk	\N	-1	brown	Erratic	9	3	[]	{"cut": [3, 4, 5, 6], "flash": [3]}	f	f	f	f	f	f	f
398	293	0	whismur	Whismur	\N	normal	\N	monster	field	mf	\N	4	pink	Medium Slow	10	3	[[294, 0]]	{}	f	f	f	f	f	f	f
399	294	0	loudred	Loudred	\N	normal	\N	monster	field	mf	\N	4	blue	Medium Slow	10	3	[[295, 0]]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
400	295	0	exploud	Exploud	\N	normal	\N	monster	field	mf	\N	4	blue	Medium Slow	10	3	[]	{"surf": [4, 5, 6], "strength": [3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
401	296	0	makuhita	Makuhita	\N	fighting	\N	human_like	\N	mf	\N	2	yellow	Fluctuating	11	3	[[297, 0]]	{"surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
402	297	0	hariyama	Hariyama	\N	fighting	\N	human_like	\N	mf	\N	2	brown	Fluctuating	11	3	[]	{"surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
403	298	0	azurill	Azurill	\N	normal	fairy	undiscovered	\N	mf	\N	6	blue	Fast	2	3	[[183, 0]]	{"surf": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
404	299	0	nosepass	Nosepass	\N	rock	\N	mineral	\N	mf	\N	4	gray	Medium Fast	11	3	[[476, 0]]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
405	300	0	skitty	Skitty	\N	normal	\N	field	fairy	mf	\N	6	pink	Fast	5	3	[[301, 0]]	{"flash": [3]}	f	f	f	f	f	f	f
406	301	0	delcatty	Delcatty	\N	normal	\N	field	fairy	mf	\N	6	purple	Fast	5	3	[]	{"flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
407	302	0	sableye	Sableye	\N	dark	ghost	human_like	\N	mf	\N	4	purple	Medium Slow	11	3	[]	{"cut": [3, 4, 5, 6], "flash": [3], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
408	302	1	sableye-mega	Sableye	Mega Sableye	dark	ghost	human_like	\N	mf	\N	4	purple	Medium Slow	11	6	[]	{"cut": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
409	303	0	mawile	Mawile	\N	steel	fairy	field	fairy	mf	\N	4	black	Fast	11	3	[]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
410	303	1	mawile-mega	Mawile	Mega Mawile	steel	fairy	field	fairy	mf	\N	4	black	Fast	11	6	[]	{"strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
411	304	0	aron	Aron	\N	steel	rock	monster	\N	mf	\N	4	gray	Slow	5	3	[[305, 0]]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
412	305	0	lairon	Lairon	\N	steel	rock	monster	\N	mf	\N	4	gray	Slow	5	3	[[306, 0]]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
413	306	0	aggron	Aggron	\N	steel	rock	monster	\N	mf	\N	4	gray	Slow	10	3	[]	{"cut": [3, 4, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
414	306	1	aggron-mega	Aggron	Mega Aggron	steel	\N	monster	\N	mf	\N	4	gray	Slow	10	6	[]	{"cut": [6], "surf": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
415	307	0	meditite	Meditite	\N	fighting	psychic	human_like	\N	fd	md	4	blue	Medium Fast	11	3	[[308, 0]]	{"flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
416	308	0	medicham	Medicham	\N	fighting	psychic	human_like	\N	fd	md	4	red	Medium Fast	11	3	[]	{"flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
417	308	1	medicham-mega	Medicham	Mega Medicham	fighting	psychic	human_like	\N	mf	\N	4	red	Medium Fast	11	6	[]	{"strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
418	309	0	electrike	Electrike	\N	electric	\N	field	\N	mf	\N	4	green	Slow	5	3	[[310, 0]]	{"flash": [3], "strength": [3, 4, 5, 6]}	f	f	f	f	f	f	f
419	310	0	manectric	Manectric	\N	electric	\N	field	\N	mf	\N	4	yellow	Slow	5	3	[]	{"flash": [3], "strength": [3, 4, 5, 6]}	f	f	f	f	f	f	f
420	310	1	manectric-mega	Manectric	Mega Manectric	electric	\N	field	\N	mf	\N	4	yellow	Slow	5	6	[]	{"strength": [6]}	t	t	f	f	f	f	f
421	311	0	plusle	Plusle	\N	electric	\N	fairy	\N	mf	\N	4	yellow	Medium Fast	10	3	[]	{"flash": [3]}	f	f	f	f	f	f	f
422	312	0	minun	Minun	\N	electric	\N	fairy	\N	mf	\N	4	yellow	Medium Fast	10	3	[]	{"flash": [3]}	f	f	f	f	f	f	f
424	314	0	illumise	Illumise	\N	bug	\N	bug	human_like	fo	\N	8	purple	Fluctuating	11	3	[]	{"flash": [3]}	f	f	f	f	f	f	f
425	315	0	roselia	Roselia	\N	grass	poison	fairy	grass	fd	md	4	green	Medium Slow	11	3	[[407, 0]]	{"cut": [3, 4, 5, 6], "flash": [3]}	f	f	f	f	f	f	f
426	316	0	gulpin	Gulpin	\N	poison	\N	amorphous	\N	fd	md	4	green	Fluctuating	14	3	[[317, 0]]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
427	317	0	swalot	Swalot	\N	poison	\N	amorphous	\N	fd	md	4	purple	Fluctuating	14	3	[]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
428	318	0	carvanha	Carvanha	\N	water	dark	water_2	\N	mf	\N	4	red	Slow	3	3	[[319, 0]]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
429	319	0	sharpedo	Sharpedo	\N	water	dark	water_2	\N	mf	\N	4	blue	Slow	3	3	[]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
430	319	1	sharpedo-mega	Sharpedo	Mega Sharpedo	water	dark	water_2	\N	mf	\N	4	blue	Slow	3	6	[]	{"dive": [6], "surf": [6], "strength": [6], "waterfall": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
431	320	0	wailmer	Wailmer	\N	water	\N	field	water_2	mf	\N	4	blue	Fluctuating	3	3	[[321, 0]]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
432	321	0	wailord	Wailord	\N	water	\N	field	water_2	mf	\N	4	blue	Fluctuating	3	3	[]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
433	322	0	numel	Numel	\N	fire	ground	field	\N	fd	md	4	yellow	Medium Fast	5	3	[[323, 0]]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
434	323	0	camerupt	Camerupt	\N	fire	ground	field	\N	fd	md	4	red	Medium Fast	5	3	[]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
435	323	1	camerupt-mega	Camerupt	Mega Camerupt	fire	ground	field	\N	mf	\N	4	red	Medium Fast	5	6	[]	{"strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
436	324	0	torkoal	Torkoal	\N	fire	\N	field	\N	mf	\N	4	brown	Medium Fast	5	3	[]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
437	325	0	spoink	Spoink	\N	psychic	\N	field	\N	mf	\N	4	black	Fast	14	3	[[326, 0]]	{"flash": [3]}	f	f	f	f	f	f	f
438	326	0	grumpig	Grumpig	\N	psychic	\N	field	\N	mf	\N	4	purple	Fast	10	3	[]	{"flash": [3]}	f	f	f	f	f	f	f
439	327	0	spinda	Spinda	\N	normal	\N	field	human_like	mf	\N	4	brown	Fast	10	3	[]	{"flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
440	328	0	trapinch	Trapinch	\N	ground	\N	bug	\N	mf	\N	4	brown	Medium Slow	4	3	[[329, 0]]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
441	329	0	vibrava	Vibrava	\N	ground	dragon	bug	\N	mf	\N	4	green	Medium Slow	6	3	[[330, 0]]	{"fly": [3, 4, 5, 6], "defog": [4], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
442	330	0	flygon	Flygon	\N	ground	dragon	bug	\N	mf	\N	4	green	Medium Slow	12	3	[]	{"fly": [3, 4, 5, 6], "defog": [4], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
443	331	0	cacnea	Cacnea	\N	grass	\N	grass	human_like	mf	\N	4	green	Medium Slow	11	3	[[332, 0]]	{"cut": [3, 4, 5, 6], "flash": [3]}	f	f	f	f	f	f	f
444	332	0	cacturne	Cacturne	\N	grass	dark	grass	human_like	fd	md	4	green	Medium Slow	11	3	[]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6]}	f	f	f	f	f	f	f
445	333	0	swablu	Swablu	\N	normal	flying	flying	dragon	mf	\N	4	blue	Erratic	12	3	[[334, 0]]	{"fly": [3, 4, 5, 6]}	f	f	f	f	f	f	f
446	334	0	altaria	Altaria	\N	dragon	flying	flying	dragon	mf	\N	4	blue	Erratic	12	3	[]	{"fly": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
447	334	1	altaria-mega	Altaria	Mega Altaria	dragon	fairy	flying	dragon	mf	\N	4	blue	Erratic	12	6	[]	{"fly": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
448	335	0	zangoose	Zangoose	\N	normal	\N	field	\N	mf	\N	4	white	Erratic	10	3	[]	{"strength": [3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
449	336	0	seviper	Seviper	\N	poison	\N	field	dragon	mf	\N	4	black	Fluctuating	13	3	[]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
450	337	0	lunatone	Lunatone	\N	rock	psychic	mineral	\N	uk	\N	-1	yellow	Fast	1	3	[]	{"flash": [3]}	f	f	f	f	f	f	f
451	338	0	solrock	Solrock	\N	rock	psychic	mineral	\N	uk	\N	-1	red	Fast	1	3	[]	{"flash": [3]}	f	f	f	f	f	f	f
452	339	0	barboach	Barboach	\N	water	ground	water_2	\N	mf	\N	4	gray	Medium Fast	3	3	[[340, 0]]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
453	340	0	whiscash	Whiscash	\N	water	ground	water_2	\N	mf	\N	4	blue	Medium Fast	3	3	[]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
454	341	0	corphish	Corphish	\N	water	\N	water_1	water_3	mf	\N	4	red	Fluctuating	4	3	[[342, 0]]	{"cut": [3, 4, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
455	342	0	crawdaunt	Crawdaunt	\N	water	dark	water_1	water_3	mf	\N	4	red	Fluctuating	4	3	[]	{"cut": [3, 4, 5, 6], "dive": [3, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
456	343	0	baltoy	Baltoy	\N	ground	psychic	mineral	\N	uk	\N	-1	brown	Medium Fast	14	3	[[344, 0]]	{"flash": [3]}	f	f	f	f	f	f	f
457	344	0	claydol	Claydol	\N	ground	psychic	mineral	\N	uk	\N	-1	black	Medium Fast	14	3	[]	{"flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
458	345	0	lileep	Lileep	\N	rock	grass	water_3	\N	mf	\N	1	purple	Erratic	9	3	[[346, 0]]	{}	f	f	f	f	f	f	f
459	346	0	cradily	Cradily	\N	rock	grass	water_3	\N	mf	\N	1	green	Erratic	9	3	[]	{"strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
460	347	0	anorith	Anorith	\N	rock	bug	water_3	\N	mf	\N	1	gray	Erratic	4	3	[[348, 0]]	{"cut": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
461	348	0	armaldo	Armaldo	\N	rock	bug	water_3	\N	mf	\N	1	gray	Erratic	10	3	[]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
462	349	0	feebas	Feebas	\N	water	\N	water_1	dragon	mf	\N	4	brown	Erratic	3	3	[[350, 0]]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
463	350	0	milotic	Milotic	\N	water	\N	water_1	dragon	fd	md	4	pink	Erratic	13	3	[]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
464	351	0	castform	Castform	Normal	normal	\N	fairy	amorphous	mf	\N	4	gray	Medium Fast	1	3	[]	{"flash": [3]}	f	f	f	f	f	f	f
465	351	1	castform-sunny	Castform	Sunny Form	fire	\N	fairy	amorphous	mf	\N	4	red	Medium Fast	1	3	[]	{}	f	t	f	f	f	f	f
466	351	2	castform-rainy	Castform	Rainy Form	water	\N	fairy	amorphous	mf	\N	4	blue	Medium Fast	1	3	[]	{}	f	t	f	f	f	f	f
467	351	3	castform-snowy	Castform	Snowy Form	ice	\N	fairy	amorphous	mf	\N	4	white	Medium Fast	1	3	[]	{}	f	t	f	f	f	f	f
468	352	0	kecleon	Kecleon	\N	normal	\N	field	\N	mf	\N	4	green	Medium Slow	10	3	[]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
469	353	0	shuppet	Shuppet	\N	ghost	\N	amorphous	\N	mf	\N	4	black	Fast	1	3	[[354, 0]]	{"flash": [3]}	f	f	f	f	f	f	f
470	354	0	banette	Banette	\N	ghost	\N	amorphous	\N	mf	\N	4	black	Fast	10	3	[]	{"flash": [3]}	f	f	f	f	f	f	f
471	354	1	banette-mega	Banette	Mega Banette	ghost	\N	amorphous	\N	mf	\N	4	black	Fast	10	6	[]	{}	t	t	f	f	f	f	f
472	355	0	duskull	Duskull	\N	ghost	\N	amorphous	\N	mf	\N	4	black	Fast	14	3	[[356, 0]]	{"flash": [3]}	f	f	f	f	f	f	f
473	356	0	dusclops	Dusclops	\N	ghost	\N	amorphous	\N	mf	\N	4	black	Fast	11	3	[[477, 0]]	{"flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
474	357	0	tropius	Tropius	\N	grass	flying	monster	grass	mf	\N	4	green	Slow	5	3	[]	{"cut": [3, 4, 5, 6], "fly": [3, 4, 5, 6], "defog": [4], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
475	358	0	chimecho	Chimecho	\N	psychic	\N	amorphous	\N	mf	\N	4	blue	Fast	14	3	[]	{"flash": [3]}	f	f	f	f	f	f	f
476	358	1	chimecho-mega	Chimecho	Mega Chimecho	psychic	steel	amorphous	\N	mf	\N	4	blue	Fast	7	9	[]	{}	t	t	f	f	f	f	f
477	359	0	absol	Absol	\N	dark	\N	field	\N	mf	\N	4	white	Medium Slow	5	3	[]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
478	359	1	absol-mega	Absol	Mega Absol	dark	\N	field	\N	mf	\N	4	white	Medium Slow	5	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
479	359	2	absol-mega-z	Absol	Mega Absol Z	dark	ghost	field	\N	mf	\N	4	black	Medium Slow	5	9	[]	{}	t	t	f	f	f	f	f
480	360	0	wynaut	Wynaut	\N	psychic	\N	undiscovered	\N	mf	\N	4	blue	Medium Fast	10	3	[[202, 0]]	{}	f	f	f	f	f	f	f
481	361	0	snorunt	Snorunt	\N	ice	\N	fairy	mineral	mf	\N	4	gray	Medium Fast	11	3	[[362, 0], [478, 0]]	{"flash": [3]}	f	f	f	f	f	f	f
482	362	0	glalie	Glalie	\N	ice	\N	fairy	mineral	mf	\N	4	gray	Medium Fast	1	3	[]	{"flash": [3]}	f	f	f	f	f	f	f
483	362	1	glalie-mega	Glalie	Mega Glalie	ice	\N	fairy	mineral	mf	\N	4	gray	Medium Fast	1	6	[]	{}	t	t	f	f	f	f	f
484	363	0	spheal	Spheal	\N	ice	water	water_1	field	mf	\N	4	blue	Medium Slow	3	3	[[364, 0]]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
485	364	0	sealeo	Sealeo	\N	ice	water	water_1	field	mf	\N	4	blue	Medium Slow	3	3	[[365, 0]]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
486	365	0	walrein	Walrein	\N	ice	water	water_1	field	mf	\N	4	blue	Medium Slow	5	3	[]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
487	366	0	clamperl	Clamperl	\N	water	\N	water_1	\N	mf	\N	4	blue	Erratic	1	3	[[367, 0], [368, 0]]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
488	367	0	huntail	Huntail	\N	water	\N	water_1	\N	mf	\N	4	blue	Erratic	13	3	[]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
489	368	0	gorebyss	Gorebyss	\N	water	\N	water_1	\N	mf	\N	4	pink	Erratic	13	3	[]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
490	369	0	relicanth	Relicanth	\N	water	rock	water_1	water_2	fd	md	1	gray	Slow	3	3	[]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
491	370	0	luvdisc	Luvdisc	\N	water	\N	water_2	\N	mf	\N	6	pink	Fast	3	3	[]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
492	371	0	bagon	Bagon	\N	dragon	\N	dragon	\N	mf	\N	4	blue	Slow	11	3	[[372, 0]]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
493	372	0	shelgon	Shelgon	\N	dragon	\N	dragon	\N	mf	\N	4	white	Slow	5	3	[[373, 0]]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
494	373	0	salamence	Salamence	\N	dragon	flying	dragon	\N	mf	\N	4	blue	Slow	5	3	[]	{"cut": [3, 4, 5, 6], "fly": [3, 4, 5, 6], "defog": [4], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
495	373	1	salamence-mega	Salamence	Mega Salamence	dragon	flying	dragon	\N	mf	\N	4	blue	Slow	5	6	[]	{"cut": [6], "fly": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
496	374	0	beldum	Beldum	\N	steel	psychic	mineral	\N	uk	\N	-1	blue	Slow	9	3	[[375, 0]]	{}	f	f	f	f	f	f	f
497	375	0	metang	Metang	\N	steel	psychic	mineral	\N	uk	\N	-1	blue	Slow	14	3	[[376, 0]]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
498	376	0	metagross	Metagross	\N	steel	psychic	mineral	\N	uk	\N	-1	blue	Slow	7	3	[]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	f	f	f
499	376	1	metagross-mega	Metagross	Mega Metagross	steel	psychic	mineral	\N	uk	\N	-1	blue	Slow	7	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
500	377	0	regirock	Regirock	\N	rock	\N	undiscovered	\N	uk	\N	-1	brown	Slow	11	3	[]	{"strength": [3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	t	f
501	378	0	regice	Regice	\N	ice	\N	undiscovered	\N	uk	\N	-1	blue	Slow	11	3	[]	{"strength": [3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	t	f
502	379	0	registeel	Registeel	\N	steel	\N	undiscovered	\N	uk	\N	-1	gray	Slow	11	3	[]	{"strength": [3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	f	f	t	f
612	467	0	magmortar	Magmortar	\N	fire	\N	human_like	\N	mf	\N	2	red	Medium Fast	10	4	[]	{"strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
503	380	0	latias	Latias	\N	dragon	psychic	undiscovered	\N	fo	\N	8	red	Slow	12	3	[]	{"cut": [3, 4, 5, 6], "fly": [3, 4, 5, 6], "dive": [3, 5, 6], "surf": [3, 4, 5, 6], "defog": [4], "flash": [3], "waterfall": [3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	t	f
504	380	1	latias-mega	Latias	Mega Latias	dragon	psychic	undiscovered	\N	fo	\N	8	purple	Slow	12	6	[]	{"cut": [6], "fly": [6], "dive": [6], "surf": [6], "waterfall": [6]}	t	t	f	f	f	t	f
505	381	0	latios	Latios	\N	dragon	psychic	undiscovered	\N	mo	\N	0	blue	Slow	12	3	[]	{"cut": [3, 4, 5, 6], "fly": [3, 4, 5, 6], "dive": [3, 5, 6], "surf": [3, 4, 5, 6], "defog": [4], "flash": [3], "waterfall": [3, 4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	t	f
506	381	1	latios-mega	Latios	Mega Latios	dragon	psychic	undiscovered	\N	mo	\N	0	purple	Slow	12	6	[]	{"cut": [6], "fly": [6], "dive": [6], "surf": [6], "waterfall": [6]}	t	t	f	f	f	t	f
507	382	0	kyogre	Kyogre	\N	water	\N	undiscovered	\N	uk	\N	-1	blue	Slow	3	3	[]	{"dive": [3, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	t	f	f	f
508	382	1	kyogre-primal	Kyogre	Primal Reversion	water	\N	undiscovered	\N	uk	\N	-1	blue	Slow	3	6	[]	{}	f	t	f	t	f	f	f
509	383	0	groudon	Groudon	\N	ground	\N	undiscovered	\N	uk	\N	-1	red	Slow	10	3	[]	{"cut": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "rock_climb": [4], "rock_smash": [3, 4, 6]}	f	f	f	t	f	f	f
510	383	1	groudon-primal	Groudon	Primal Reversion	ground	fire	undiscovered	\N	uk	\N	-1	red	Slow	10	6	[]	{}	f	t	f	t	f	f	f
511	384	0	rayquaza	Rayquaza	\N	dragon	flying	undiscovered	\N	uk	\N	-1	green	Slow	13	3	[]	{"fly": [3, 4, 5, 6], "dive": [3, 5, 6], "surf": [3, 4, 5, 6], "strength": [3, 4, 5, 6], "waterfall": [3, 4, 5, 6], "whirlpool": [4], "rock_smash": [3, 4, 6]}	f	f	f	t	f	f	f
512	384	1	rayquaza-mega	Rayquaza	Mega Rayquaza	dragon	flying	undiscovered	\N	uk	\N	-1	green	Slow	13	6	[]	{"fly": [6], "dive": [6], "surf": [6], "strength": [6], "waterfall": [6], "rock_smash": [6]}	t	t	f	t	f	f	f
513	385	0	jirachi	Jirachi	\N	steel	psychic	undiscovered	\N	uk	\N	-1	yellow	Slow	11	3	[]	{"flash": [3]}	f	f	f	f	t	f	f
514	386	0	deoxys	Deoxys	Normal Forme	psychic	\N	undiscovered	\N	uk	\N	-1	red	Slow	11	3	[]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	t	f	f
515	386	1	deoxys-attack	Deoxys	Attack Forme	psychic	\N	undiscovered	\N	uk	\N	-1	red	Slow	11	3	[]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	t	f	f
516	386	2	deoxys-defense	Deoxys	Defense Forme	psychic	\N	undiscovered	\N	uk	\N	-1	red	Slow	11	3	[]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	t	f	f
517	386	3	deoxys-speed	Deoxys	Speed Forme	psychic	\N	undiscovered	\N	uk	\N	-1	red	Slow	11	3	[]	{"cut": [3, 4, 5, 6], "flash": [3], "strength": [3, 4, 5, 6], "rock_smash": [3, 4, 6]}	f	f	f	f	t	f	f
518	387	0	turtwig	Turtwig	\N	grass	\N	monster	grass	mf	\N	1	green	Medium Slow	5	4	[[388, 0]]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
519	388	0	grotle	Grotle	\N	grass	\N	monster	grass	mf	\N	1	green	Medium Slow	5	4	[[389, 0]]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
520	389	0	torterra	Torterra	\N	grass	ground	monster	grass	mf	\N	1	green	Medium Slow	5	4	[]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
521	390	0	chimchar	Chimchar	\N	fire	\N	field	human_like	mf	\N	1	brown	Medium Slow	10	4	[[391, 0]]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
522	391	0	monferno	Monferno	\N	fire	fighting	field	human_like	mf	\N	1	brown	Medium Slow	10	4	[[392, 0]]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
523	392	0	infernape	Infernape	\N	fire	fighting	field	human_like	mf	\N	1	brown	Medium Slow	10	4	[]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
524	393	0	piplup	Piplup	\N	water	\N	water_1	field	mf	\N	1	blue	Medium Slow	11	4	[[394, 0]]	{"cut": [4, 5, 6], "dive": [5, 6], "surf": [4, 5, 6], "defog": [4], "waterfall": [4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
525	394	0	prinplup	Prinplup	\N	water	\N	water_1	field	mf	\N	1	blue	Medium Slow	10	4	[[395, 0]]	{"cut": [4, 5, 6], "dive": [5, 6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
526	395	0	empoleon	Empoleon	\N	water	steel	water_1	field	mf	\N	1	blue	Medium Slow	10	4	[]	{"cut": [4, 5, 6], "dive": [5, 6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
527	396	0	starly	Starly	\N	normal	flying	flying	\N	fd	md	4	brown	Medium Slow	12	4	[[397, 0]]	{"fly": [4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
528	397	0	staravia	Staravia	\N	normal	flying	flying	\N	fd	md	4	brown	Medium Slow	12	4	[[398, 0]]	{"fly": [4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
529	398	0	staraptor	Staraptor	\N	normal	flying	flying	\N	fd	md	4	brown	Medium Slow	12	4	[]	{"fly": [4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
530	398	1	staraptor-mega	Staraptor	Mega Staraptor	fighting	flying	flying	\N	mf	\N	4	gray	Medium Slow	12	9	[]	{}	t	t	f	f	f	f	f
531	399	0	bidoof	Bidoof	\N	normal	\N	water_1	field	fd	md	4	brown	Medium Fast	5	4	[[400, 0]]	{"cut": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
532	400	0	bibarel	Bibarel	\N	normal	water	water_1	field	fd	md	4	brown	Medium Fast	10	4	[]	{"cut": [4, 5, 6], "dive": [5, 6], "surf": [4, 5, 6], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
533	401	0	kricketot	Kricketot	\N	bug	\N	bug	\N	fd	md	4	red	Medium Slow	11	4	[[402, 0]]	{}	f	f	f	f	f	f	f
534	402	0	kricketune	Kricketune	\N	bug	\N	bug	\N	fd	md	4	red	Medium Slow	6	4	[]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
535	403	0	shinx	Shinx	\N	electric	\N	field	\N	fd	md	4	blue	Medium Slow	5	4	[[404, 0]]	{"strength": [4, 5, 6]}	f	f	f	f	f	f	f
536	404	0	luxio	Luxio	\N	electric	\N	field	\N	fd	md	4	blue	Medium Slow	5	4	[[405, 0]]	{"strength": [4, 5, 6]}	f	f	f	f	f	f	f
537	405	0	luxray	Luxray	\N	electric	\N	field	\N	fd	md	4	blue	Medium Slow	5	4	[]	{"strength": [4, 5, 6]}	f	f	f	f	f	f	f
538	406	0	budew	Budew	\N	grass	poison	undiscovered	\N	mf	\N	4	green	Medium Slow	11	4	[[315, 0]]	{"cut": [4, 5, 6]}	f	f	f	f	f	f	f
539	407	0	roserade	Roserade	\N	grass	poison	fairy	grass	fd	md	4	green	Medium Slow	11	4	[]	{"cut": [4, 5, 6]}	f	f	f	f	f	f	f
540	408	0	cranidos	Cranidos	\N	rock	\N	monster	\N	mf	\N	1	blue	Erratic	10	4	[[409, 0]]	{"strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
541	409	0	rampardos	Rampardos	\N	rock	\N	monster	\N	mf	\N	1	blue	Erratic	10	4	[]	{"cut": [4, 5, 6], "surf": [4, 5, 6], "strength": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
542	410	0	shieldon	Shieldon	\N	rock	steel	monster	\N	mf	\N	1	gray	Erratic	5	4	[[411, 0]]	{"strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
543	411	0	bastiodon	Bastiodon	\N	rock	steel	monster	\N	mf	\N	1	gray	Erratic	5	4	[]	{"strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
544	412	0	burmy	Burmy	Plant Cloak	bug	\N	bug	\N	mf	\N	4	green	Medium Fast	9	4	[[413, 0], [414, 0]]	{}	f	f	f	f	f	f	f
545	412	1	burmy-sandy	Burmy	Sandy Cloak	bug	\N	bug	\N	mf	\N	4	brown	Medium Fast	9	4	[[413, 1], [414, 0]]	{}	f	f	f	f	f	f	f
546	412	2	burmy-trash	Burmy	Trash Cloak	bug	\N	bug	\N	mf	\N	4	red	Medium Fast	9	4	[[413, 2], [414, 0]]	{}	f	f	f	f	f	f	f
547	413	0	wormadam	Wormadam	Plant Cloak	bug	grass	bug	\N	fo	\N	8	green	Medium Fast	9	4	[]	{}	f	f	f	f	f	f	f
548	413	1	wormadam-sandy	Wormadam	Sandy Cloak	bug	ground	bug	\N	fo	\N	8	brown	Medium Fast	9	4	[]	{}	f	f	f	f	f	f	f
549	413	2	wormadam-trash	Wormadam	Trash Cloak	bug	steel	bug	\N	fo	\N	8	red	Medium Fast	9	4	[]	{}	f	f	f	f	f	f	f
550	414	0	mothim	Mothim	\N	bug	flying	bug	\N	mo	\N	0	yellow	Medium Fast	6	4	[]	{"defog": [4]}	f	f	f	f	f	f	f
551	415	0	combee	Combee	\N	bug	flying	bug	\N	fd	md	1	yellow	Medium Slow	7	4	[[416, 0]]	{}	f	f	f	f	f	f	f
552	416	0	vespiquen	Vespiquen	\N	bug	flying	bug	\N	fo	\N	8	yellow	Medium Slow	6	4	[]	{"cut": [4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
553	417	0	pachirisu	Pachirisu	\N	electric	\N	field	fairy	fd	md	4	white	Medium Fast	5	4	[]	{"cut": [4, 5, 6]}	f	f	f	f	f	f	f
554	418	0	buizel	Buizel	\N	water	\N	water_1	field	fd	md	4	brown	Medium Fast	5	4	[[419, 0]]	{"dive": [5, 6], "surf": [4, 5, 6], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
767	576	0	gothitelle	Gothitelle	\N	psychic	\N	human_like	\N	mf	\N	6	purple	Medium Slow	11	5	[]	{}	f	f	f	f	f	f	f
555	419	0	floatzel	Floatzel	\N	water	\N	water_1	field	fd	md	4	brown	Medium Fast	5	4	[]	{"dive": [5, 6], "surf": [4, 5, 6], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
556	420	0	cherubi	Cherubi	\N	grass	\N	fairy	grass	mf	\N	4	pink	Medium Fast	7	4	[[421, 0]]	{}	f	f	f	f	f	f	f
557	421	0	cherrim	Cherrim	Overcast Form	grass	\N	fairy	grass	mf	\N	4	purple	Medium Fast	2	4	[]	{}	f	t	f	f	f	f	f
558	421	1	cherrim-sunshine	Cherrim	Sunshine Form	grass	\N	fairy	grass	mf	\N	4	pink	Medium Fast	2	4	[]	{}	f	f	f	f	f	f	f
559	422	0	shellos	Shellos	West Sea	water	\N	water_1	amorphous	mf	\N	4	purple	Medium Fast	13	4	[[423, 0]]	{"dive": [5, 6], "surf": [4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
560	422	1	shellos-east	Shellos	East Sea	water	\N	water_1	amorphous	mf	\N	4	blue	Medium Fast	13	4	[[423, 1]]	{"dive": [5, 6], "surf": [4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
561	423	0	gastrodon	Gastrodon	West Sea	water	ground	water_1	amorphous	mf	\N	4	purple	Medium Fast	13	4	[]	{"dive": [5, 6], "surf": [4, 5, 6], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
562	423	1	gastrodon-east	Gastrodon	East Sea	water	ground	water_1	amorphous	mf	\N	4	blue	Medium Fast	13	4	[]	{"dive": [5, 6], "surf": [4, 5, 6], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
563	424	0	ambipom	Ambipom	\N	normal	\N	field	\N	fd	md	4	purple	Fast	10	4	[]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
564	425	0	drifloon	Drifloon	\N	ghost	flying	amorphous	\N	mf	\N	4	purple	Fluctuating	14	4	[[426, 0]]	{"cut": [4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
565	426	0	drifblim	Drifblim	\N	ghost	flying	amorphous	\N	mf	\N	4	purple	Fluctuating	14	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
566	427	0	buneary	Buneary	\N	normal	\N	field	human_like	mf	\N	4	brown	Medium Fast	10	4	[[428, 0]]	{"cut": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
567	428	0	lopunny	Lopunny	\N	normal	\N	field	human_like	mf	\N	4	brown	Medium Fast	10	4	[]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
568	428	1	lopunny-mega	Lopunny	Mega Lopunny	normal	fighting	field	human_like	mf	\N	4	brown	Medium Fast	10	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
569	429	0	mismagius	Mismagius	\N	ghost	\N	amorphous	\N	mf	\N	4	purple	Fast	1	4	[]	{}	f	f	f	f	f	f	f
570	430	0	honchkrow	Honchkrow	\N	dark	flying	flying	\N	mf	\N	4	black	Medium Slow	12	4	[]	{"fly": [4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
571	431	0	glameow	Glameow	\N	normal	\N	field	\N	mf	\N	6	gray	Fast	5	4	[[432, 0]]	{"cut": [4, 5, 6]}	f	f	f	f	f	f	f
572	432	0	purugly	Purugly	\N	normal	\N	field	\N	mf	\N	6	gray	Fast	5	4	[]	{"cut": [4, 5, 6]}	f	f	f	f	f	f	f
573	433	0	chingling	Chingling	\N	psychic	\N	undiscovered	\N	mf	\N	4	yellow	Fast	11	4	[[358, 0]]	{}	f	f	f	f	f	f	f
574	434	0	stunky	Stunky	\N	poison	dark	field	\N	mf	\N	4	purple	Medium Fast	5	4	[[435, 0]]	{"cut": [4, 5, 6], "defog": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
575	435	0	skuntank	Skuntank	\N	poison	dark	field	\N	mf	\N	4	purple	Medium Fast	5	4	[]	{"cut": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
576	436	0	bronzor	Bronzor	\N	steel	psychic	mineral	\N	uk	\N	-1	green	Medium Fast	1	4	[[437, 0]]	{}	f	f	f	f	f	f	f
577	437	0	bronzong	Bronzong	\N	steel	psychic	mineral	\N	uk	\N	-1	green	Medium Fast	14	4	[]	{"strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
578	438	0	bonsly	Bonsly	\N	rock	\N	undiscovered	\N	mf	\N	4	brown	Medium Fast	2	4	[[185, 0]]	{}	f	f	f	f	f	f	f
579	439	0	mime-jr	Mime Jr.	\N	psychic	fairy	undiscovered	\N	mf	\N	4	pink	Medium Fast	11	4	[[122, 0], [122, 1]]	{}	f	f	f	f	f	f	f
580	440	0	happiny	Happiny	\N	normal	\N	undiscovered	\N	fo	\N	8	pink	Fast	11	4	[[113, 0]]	{}	f	f	f	f	f	f	f
581	441	0	chatot	Chatot	\N	normal	flying	flying	\N	mf	\N	4	black	Medium Slow	12	4	[]	{"fly": [4, 5, 6], "defog": [4]}	f	f	f	f	f	f	f
582	442	0	spiritomb	Spiritomb	\N	ghost	dark	amorphous	\N	mf	\N	4	purple	Medium Fast	9	4	[]	{}	f	f	f	f	f	f	f
583	443	0	gible	Gible	\N	dragon	ground	monster	dragon	fd	md	4	blue	Slow	10	4	[[444, 0]]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
584	444	0	gabite	Gabite	\N	dragon	ground	monster	dragon	fd	md	4	blue	Slow	10	4	[[445, 0]]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
613	468	0	togekiss	Togekiss	\N	fairy	flying	flying	fairy	mf	\N	1	white	Fast	12	4	[]	{"fly": [4, 5, 6], "defog": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
585	445	0	garchomp	Garchomp	\N	dragon	ground	monster	dragon	fd	md	4	blue	Slow	10	4	[]	{"cut": [4, 5, 6], "surf": [4, 5, 6], "strength": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
586	445	1	garchomp-mega	Garchomp	Mega Garchomp	dragon	ground	monster	dragon	mf	\N	4	blue	Slow	10	6	[]	{"cut": [6], "surf": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
587	445	2	garchomp-mega-z	Garchomp	Mega Garchomp Z	dragon	\N	monster	dragon	mf	\N	4	blue	Slow	10	9	[]	{}	t	t	f	f	f	f	f
588	446	0	munchlax	Munchlax	\N	normal	\N	undiscovered	\N	mf	\N	1	black	Slow	11	4	[[143, 0]]	{"surf": [4, 5, 6], "strength": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
589	447	0	riolu	Riolu	\N	fighting	\N	undiscovered	\N	mf	\N	1	blue	Medium Slow	10	4	[[448, 0]]	{"strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
590	448	0	lucario	Lucario	\N	fighting	steel	field	human_like	mf	\N	1	blue	Medium Slow	10	4	[]	{"strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
591	448	1	lucario-mega	Lucario	Mega Lucario	fighting	steel	field	human_like	mf	\N	1	blue	Medium Slow	10	6	[]	{"strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
592	448	2	lucario-mega-z	Lucario	Mega Lucario Z	fighting	steel	field	human_like	mf	\N	1	gray	Medium Slow	10	9	[]	{}	t	t	f	f	f	f	f
593	449	0	hippopotas	Hippopotas	\N	ground	\N	field	\N	fd	md	4	brown	Slow	5	4	[[450, 0]]	{"strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
594	450	0	hippowdon	Hippowdon	\N	ground	\N	field	\N	fd	md	4	brown	Slow	5	4	[]	{"strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
595	451	0	skorupi	Skorupi	\N	poison	bug	bug	water_3	mf	\N	4	purple	Slow	4	4	[[452, 0]]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
596	452	0	drapion	Drapion	\N	poison	dark	bug	water_3	mf	\N	4	purple	Slow	4	4	[]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
597	453	0	croagunk	Croagunk	\N	poison	fighting	human_like	\N	fd	md	4	blue	Medium Fast	11	4	[[454, 0]]	{"strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
598	454	0	toxicroak	Toxicroak	\N	poison	fighting	human_like	\N	fd	md	4	blue	Medium Fast	11	4	[]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
599	455	0	carnivine	Carnivine	\N	grass	\N	grass	\N	mf	\N	4	green	Slow	8	4	[]	{"cut": [4, 5, 6]}	f	f	f	f	f	f	f
600	456	0	finneon	Finneon	\N	water	\N	water_2	\N	fd	md	4	blue	Erratic	3	4	[[457, 0]]	{"dive": [5, 6], "surf": [4, 5, 6], "defog": [4], "waterfall": [4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
601	457	0	lumineon	Lumineon	\N	water	\N	water_2	\N	fd	md	4	blue	Erratic	3	4	[]	{"dive": [5, 6], "surf": [4, 5, 6], "defog": [4], "waterfall": [4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
602	458	0	mantyke	Mantyke	\N	water	flying	undiscovered	\N	mf	\N	4	blue	Slow	12	4	[[226, 0]]	{"dive": [5, 6], "surf": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4]}	f	f	f	f	f	f	f
603	459	0	snover	Snover	\N	grass	ice	monster	grass	fd	md	4	white	Slow	10	4	[[460, 0]]	{}	f	f	f	f	f	f	f
604	460	0	abomasnow	Abomasnow	\N	grass	ice	monster	grass	fd	md	4	white	Slow	10	4	[]	{"strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
605	460	1	abomasnow-mega	Abomasnow	Mega Abomasnow	grass	ice	monster	grass	mf	\N	4	white	Slow	10	6	[]	{"strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
606	461	0	weavile	Weavile	\N	dark	ice	field	\N	fd	md	4	black	Medium Slow	10	4	[]	{"cut": [4, 5, 6], "surf": [4, 5, 6], "strength": [4, 5, 6], "whirlpool": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
607	462	0	magnezone	Magnezone	\N	electric	steel	mineral	\N	uk	\N	-1	gray	Medium Fast	14	4	[]	{}	f	f	f	f	f	f	f
608	463	0	lickilicky	Lickilicky	\N	normal	\N	monster	\N	mf	\N	4	pink	Medium Fast	11	4	[]	{"cut": [4, 5, 6], "surf": [4, 5, 6], "strength": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
609	464	0	rhyperior	Rhyperior	\N	ground	rock	monster	field	fd	md	4	gray	Slow	10	4	[]	{"cut": [4, 5, 6], "surf": [4, 5, 6], "strength": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
610	465	0	tangrowth	Tangrowth	\N	grass	\N	grass	\N	fd	md	4	blue	Medium Fast	11	4	[]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
611	466	0	electivire	Electivire	\N	electric	\N	human_like	\N	mf	\N	2	yellow	Medium Fast	10	4	[]	{"strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
614	469	0	yanmega	Yanmega	\N	bug	flying	bug	\N	mf	\N	4	green	Medium Fast	6	4	[]	{"defog": [4]}	f	f	f	f	f	f	f
615	470	0	leafeon	Leafeon	\N	grass	\N	field	\N	mf	\N	1	green	Medium Fast	5	4	[]	{"strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
616	471	0	glaceon	Glaceon	\N	ice	\N	field	\N	mf	\N	1	blue	Medium Fast	5	4	[]	{"strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
617	472	0	gliscor	Gliscor	\N	ground	flying	bug	\N	mf	\N	4	purple	Medium Slow	12	4	[]	{"cut": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
618	473	0	mamoswine	Mamoswine	\N	ice	ground	field	\N	fd	md	4	brown	Slow	5	4	[]	{"strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
619	474	0	porygon-z	Porygon-Z	\N	normal	\N	mineral	\N	uk	\N	-1	red	Medium Fast	14	4	[]	{}	f	f	f	f	f	f	f
620	475	0	gallade	Gallade	\N	psychic	fighting	amorphous	\N	mo	\N	0	white	Slow	11	4	[]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
621	475	1	gallade-mega	Gallade	Mega Gallade	psychic	fighting	amorphous	\N	mo	\N	0	white	Slow	11	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	t	t	f	f	f	f	f
622	476	0	probopass	Probopass	\N	rock	steel	mineral	\N	mf	\N	4	gray	Medium Fast	7	4	[]	{"strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
623	477	0	dusknoir	Dusknoir	\N	ghost	\N	amorphous	\N	mf	\N	4	black	Fast	14	4	[]	{"strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	f	f	f	f
624	478	0	froslass	Froslass	\N	ice	ghost	fairy	mineral	fo	\N	8	white	Medium Fast	14	4	[]	{}	f	f	f	f	f	f	f
625	478	1	froslass-mega	Froslass	Mega Froslass	ice	ghost	fairy	mineral	fo	\N	8	white	Medium Fast	14	9	[]	{}	t	t	f	f	f	f	f
626	479	0	rotom	Rotom	\N	electric	ghost	amorphous	\N	uk	\N	-1	red	Medium Fast	1	4	[]	{}	f	f	f	f	f	f	f
627	479	1	rotom-heat	Rotom	Heat Rotom	electric	fire	amorphous	\N	uk	\N	-1	red	Medium Fast	1	4	[]	{}	f	f	f	f	f	f	f
628	479	2	rotom-wash	Rotom	Wash Rotom	electric	water	amorphous	\N	uk	\N	-1	red	Medium Fast	1	4	[]	{}	f	f	f	f	f	f	f
629	479	3	rotom-frost	Rotom	Frost Rotom	electric	ice	amorphous	\N	uk	\N	-1	red	Medium Fast	1	4	[]	{}	f	f	f	f	f	f	f
630	479	4	rotom-fan	Rotom	Fan Rotom	electric	flying	amorphous	\N	uk	\N	-1	red	Medium Fast	1	4	[]	{}	f	f	f	f	f	f	f
631	479	5	rotom-mow	Rotom	Mow Rotom	electric	grass	amorphous	\N	uk	\N	-1	red	Medium Fast	1	4	[]	{}	f	f	f	f	f	f	f
632	480	0	uxie	Uxie	\N	psychic	\N	undiscovered	\N	uk	\N	-1	yellow	Slow	10	4	[]	{}	f	f	f	f	f	t	f
633	481	0	mesprit	Mesprit	\N	psychic	\N	undiscovered	\N	uk	\N	-1	pink	Slow	10	4	[]	{}	f	f	f	f	f	t	f
634	482	0	azelf	Azelf	\N	psychic	\N	undiscovered	\N	uk	\N	-1	blue	Slow	10	4	[]	{}	f	f	f	f	f	t	f
635	483	0	dialga	Dialga	\N	steel	dragon	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_smash": [4, 6]}	f	f	f	t	f	f	f
636	483	1	dialga-origin	Dialga	Origin Forme	steel	dragon	undiscovered	\N	uk	\N	-1	blue	Slow	5	8	[]	{}	f	f	f	t	f	f	f
637	484	0	palkia	Palkia	\N	water	dragon	undiscovered	\N	uk	\N	-1	purple	Slow	10	4	[]	{"cut": [4, 5, 6], "dive": [5, 6], "surf": [4, 5, 6], "strength": [4, 5, 6], "whirlpool": [4], "rock_smash": [4, 6]}	f	f	f	t	f	f	f
638	484	1	palkia-origin	Palkia	Origin Forme	water	dragon	undiscovered	\N	uk	\N	-1	purple	Slow	5	8	[]	{}	f	f	f	t	f	f	f
639	485	0	heatran	Heatran	\N	fire	steel	undiscovered	\N	mf	\N	4	brown	Slow	5	4	[]	{"strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	t	f
640	485	1	heatran-mega	Heatran	Mega Heatran	fire	steel	undiscovered	\N	mf	\N	4	brown	Slow	5	9	[]	{}	t	t	f	f	f	t	f
641	486	0	regigigas	Regigigas	\N	normal	\N	undiscovered	\N	uk	\N	-1	white	Slow	11	4	[]	{"strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	f	t	f
642	487	0	giratina	Giratina	Altered Forme	ghost	dragon	undiscovered	\N	uk	\N	-1	black	Slow	8	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	t	f	f	f
643	487	1	giratina-origin	Giratina	Origin Forme	ghost	dragon	undiscovered	\N	uk	\N	-1	black	Slow	13	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	t	f	f	f
644	488	0	cresselia	Cresselia	\N	psychic	\N	undiscovered	\N	fo	\N	8	yellow	Slow	13	4	[]	{}	f	f	f	f	f	t	f
645	489	0	phione	Phione	\N	water	\N	water_1	fairy	uk	\N	-1	blue	Slow	14	4	[]	{"dive": [5, 6], "surf": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4]}	f	f	f	f	t	f	f
646	490	0	manaphy	Manaphy	\N	water	\N	water_1	fairy	uk	\N	-1	blue	Slow	11	4	[]	{"dive": [5, 6], "surf": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4]}	f	f	f	f	t	f	f
647	491	0	darkrai	Darkrai	\N	dark	\N	undiscovered	\N	uk	\N	-1	black	Slow	11	4	[]	{"cut": [4, 5, 6], "strength": [4, 5, 6], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
648	491	1	darkrai-mega	Darkrai	Mega Darkrai	dark	\N	undiscovered	\N	uk	\N	-1	black	Slow	14	9	[]	{}	t	t	f	f	t	f	f
651	493	0	arceus	Arceus	\N	normal	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
652	493	1	arceus-fighting	Arceus	\N	fighting	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
653	493	2	arceus-flying	Arceus	\N	flying	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
654	493	3	arceus-poison	Arceus	\N	poison	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
655	493	4	arceus-ground	Arceus	\N	ground	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
656	493	5	arceus-rock	Arceus	\N	rock	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
657	493	6	arceus-bug	Arceus	\N	bug	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
658	493	7	arceus-ghost	Arceus	\N	ghost	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
659	493	8	arceus-steel	Arceus	\N	steel	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
660	493	9	arceus-fire	Arceus	\N	fire	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
661	493	10	arceus-water	Arceus	\N	water	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
662	493	11	arceus-grass	Arceus	\N	grass	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
663	493	12	arceus-electric	Arceus	\N	electric	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
691	514	0	simisear	Simisear	\N	fire	\N	field	\N	mf	\N	1	red	Medium Fast	10	5	[]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
729	549	0	lilligant	Lilligant	\N	grass	\N	grass	\N	fo	\N	8	green	Medium Fast	9	5	[]	{"cut": [5, 6]}	f	f	f	f	f	f	f
807	609	0	chandelure	Chandelure	\N	ghost	fire	amorphous	\N	mf	\N	4	black	Medium Slow	14	5	[]	{}	f	f	f	f	f	f	f
664	493	13	arceus-psychic	Arceus	\N	psychic	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
665	493	14	arceus-ice	Arceus	\N	ice	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
666	493	15	arceus-dragon	Arceus	\N	dragon	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
667	493	16	arceus-dark	Arceus	\N	dark	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	4	[]	{"cut": [4, 5, 6], "fly": [4, 5, 6], "dive": [6], "surf": [4, 5, 6], "defog": [4], "strength": [4, 5, 6], "waterfall": [4, 5, 6], "whirlpool": [4], "rock_climb": [4], "rock_smash": [4, 6]}	f	f	f	f	t	f	f
668	493	17	arceus-fairy	Arceus	\N	fairy	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	6	[]	{"cut": [6], "fly": [6], "dive": [6], "surf": [6], "strength": [6], "waterfall": [6], "rock_smash": [6]}	f	f	f	f	t	f	f
669	494	0	victini	Victini	\N	psychic	fire	undiscovered	\N	uk	\N	-1	yellow	Slow	11	5	[]	{"rock_smash": [6]}	f	f	f	f	t	f	f
670	495	0	snivy	Snivy	\N	grass	\N	field	grass	mf	\N	1	green	Medium Slow	10	5	[[496, 0]]	{"cut": [5, 6]}	f	f	f	f	f	f	f
671	496	0	servine	Servine	\N	grass	\N	field	grass	mf	\N	1	green	Medium Slow	10	5	[[497, 0]]	{"cut": [5, 6]}	f	f	f	f	f	f	f
672	497	0	serperior	Serperior	\N	grass	\N	field	grass	mf	\N	1	green	Medium Slow	13	5	[]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
673	498	0	tepig	Tepig	\N	fire	\N	field	\N	mf	\N	1	red	Medium Slow	5	5	[[499, 0]]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
674	499	0	pignite	Pignite	\N	fire	fighting	field	\N	mf	\N	1	red	Medium Slow	10	5	[[500, 0]]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
675	500	0	emboar	Emboar	\N	fire	fighting	field	\N	mf	\N	1	red	Medium Slow	10	5	[]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
676	500	1	emboar-mega	Emboar	Mega Emboar	fire	fighting	field	\N	mf	\N	1	red	Medium Slow	10	9	[]	{}	t	t	f	f	f	f	f
677	501	0	oshawott	Oshawott	\N	water	\N	field	\N	mf	\N	1	blue	Medium Slow	10	5	[[502, 0]]	{"cut": [5, 6], "dive": [5, 6], "surf": [5, 6], "waterfall": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
678	502	0	dewott	Dewott	\N	water	\N	field	\N	mf	\N	1	blue	Medium Slow	10	5	[[503, 0], [503, 1]]	{"cut": [5, 6], "dive": [5, 6], "surf": [5, 6], "waterfall": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
679	503	0	samurott	Samurott	\N	water	\N	field	\N	mf	\N	1	blue	Medium Slow	5	5	[]	{"cut": [5, 6], "dive": [5, 6], "surf": [5, 6], "strength": [5, 6], "waterfall": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
680	503	1	samurott-hisui	Samurott	Hisuian Form	water	dark	field	\N	mf	\N	1	blue	Medium Slow	5	8	[]	{}	f	f	f	f	f	f	f
681	504	0	patrat	Patrat	\N	normal	\N	field	\N	mf	\N	4	brown	Medium Fast	5	5	[[505, 0]]	{"cut": [5, 6]}	f	f	f	f	f	f	f
682	505	0	watchog	Watchog	\N	normal	\N	field	\N	mf	\N	4	brown	Medium Fast	10	5	[]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
683	506	0	lillipup	Lillipup	\N	normal	\N	field	\N	mf	\N	4	brown	Medium Slow	5	5	[[507, 0]]	{"rock_smash": [6]}	f	f	f	f	f	f	f
684	507	0	herdier	Herdier	\N	normal	\N	field	\N	mf	\N	4	gray	Medium Slow	5	5	[[508, 0]]	{"surf": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
685	508	0	stoutland	Stoutland	\N	normal	\N	field	\N	mf	\N	4	gray	Medium Slow	5	5	[]	{"surf": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
686	509	0	purrloin	Purrloin	\N	dark	\N	field	\N	mf	\N	4	purple	Medium Fast	5	5	[[510, 0]]	{"cut": [5, 6]}	f	f	f	f	f	f	f
687	510	0	liepard	Liepard	\N	dark	\N	field	\N	mf	\N	4	purple	Medium Fast	5	5	[]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
688	511	0	pansage	Pansage	\N	grass	\N	field	\N	mf	\N	1	green	Medium Fast	10	5	[[512, 0]]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
689	512	0	simisage	Simisage	\N	grass	\N	field	\N	mf	\N	1	green	Medium Fast	10	5	[]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
690	513	0	pansear	Pansear	\N	fire	\N	field	\N	mf	\N	1	red	Medium Fast	10	5	[[514, 0]]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
692	515	0	panpour	Panpour	\N	water	\N	field	\N	mf	\N	1	blue	Medium Fast	10	5	[[516, 0]]	{"cut": [5, 6], "dive": [5, 6], "surf": [5, 6], "waterfall": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
693	516	0	simipour	Simipour	\N	water	\N	field	\N	mf	\N	1	blue	Medium Fast	10	5	[]	{"cut": [5, 6], "dive": [5, 6], "surf": [5, 6], "waterfall": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
694	517	0	munna	Munna	\N	psychic	\N	field	\N	mf	\N	4	pink	Fast	5	5	[[518, 0]]	{}	f	f	f	f	f	f	f
695	518	0	musharna	Musharna	\N	psychic	\N	field	\N	mf	\N	4	pink	Fast	11	5	[]	{}	f	f	f	f	f	f	f
696	519	0	pidove	Pidove	\N	normal	flying	flying	\N	mf	\N	4	gray	Medium Slow	12	5	[[520, 0]]	{"fly": [5, 6]}	f	f	f	f	f	f	f
697	520	0	tranquill	Tranquill	\N	normal	flying	flying	\N	mf	\N	4	gray	Medium Slow	12	5	[[521, 0]]	{"fly": [5, 6]}	f	f	f	f	f	f	f
698	521	0	unfezant	Unfezant	\N	normal	flying	flying	\N	fd	md	4	gray	Medium Slow	12	5	[]	{"fly": [5, 6]}	f	f	f	f	f	f	f
699	522	0	blitzle	Blitzle	\N	electric	\N	field	\N	mf	\N	4	black	Medium Fast	5	5	[[523, 0]]	{}	f	f	f	f	f	f	f
700	523	0	zebstrika	Zebstrika	\N	electric	\N	field	\N	mf	\N	4	black	Medium Fast	5	5	[]	{"rock_smash": [6]}	f	f	f	f	f	f	f
701	524	0	roggenrola	Roggenrola	\N	rock	\N	mineral	\N	mf	\N	4	blue	Medium Slow	2	5	[[525, 0]]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
702	525	0	boldore	Boldore	\N	rock	\N	mineral	\N	mf	\N	4	blue	Medium Slow	8	5	[[526, 0]]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
703	526	0	gigalith	Gigalith	\N	rock	\N	mineral	\N	mf	\N	4	blue	Medium Slow	8	5	[]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
704	527	0	woobat	Woobat	\N	psychic	flying	flying	field	mf	\N	4	blue	Medium Fast	12	5	[[528, 0]]	{"fly": [5, 6]}	f	f	f	f	f	f	f
705	528	0	swoobat	Swoobat	\N	psychic	flying	flying	field	mf	\N	4	blue	Medium Fast	12	5	[]	{"fly": [5, 6]}	f	f	f	f	f	f	f
706	529	0	drilbur	Drilbur	\N	ground	\N	field	\N	mf	\N	4	gray	Medium Fast	10	5	[[530, 0]]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
707	530	0	excadrill	Excadrill	\N	ground	steel	field	\N	mf	\N	4	gray	Medium Fast	11	5	[]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
708	530	1	excadrill-mega	Excadrill	Mega Excadrill	ground	steel	field	\N	mf	\N	4	gray	Medium Fast	11	9	[]	{}	t	t	f	f	f	f	f
709	531	0	audino	Audino	\N	normal	\N	fairy	\N	mf	\N	4	pink	Fast	10	5	[]	{"surf": [5, 6]}	f	f	f	f	f	f	f
710	531	1	audino-mega	Audino	Mega Audino	normal	fairy	fairy	\N	mf	\N	4	white	Fast	10	6	[]	{"surf": [6]}	t	t	f	f	f	f	f
711	532	0	timburr	Timburr	\N	fighting	\N	human_like	\N	mf	\N	2	gray	Medium Slow	11	5	[[533, 0]]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
712	533	0	gurdurr	Gurdurr	\N	fighting	\N	human_like	\N	mf	\N	2	gray	Medium Slow	11	5	[[534, 0]]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
713	534	0	conkeldurr	Conkeldurr	\N	fighting	\N	human_like	\N	mf	\N	2	brown	Medium Slow	11	5	[]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
714	535	0	tympole	Tympole	\N	water	\N	water_1	\N	mf	\N	4	blue	Medium Slow	3	5	[[536, 0]]	{"surf": [5, 6]}	f	f	f	f	f	f	f
715	536	0	palpitoad	Palpitoad	\N	water	ground	water_1	\N	mf	\N	4	blue	Medium Slow	10	5	[[537, 0]]	{"surf": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
716	537	0	seismitoad	Seismitoad	\N	water	ground	water_1	\N	mf	\N	4	blue	Medium Slow	11	5	[]	{"surf": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
717	538	0	throh	Throh	\N	fighting	\N	human_like	\N	mo	\N	0	red	Medium Fast	11	5	[]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
718	539	0	sawk	Sawk	\N	fighting	\N	human_like	\N	mo	\N	0	blue	Medium Fast	11	5	[]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
719	540	0	sewaddle	Sewaddle	\N	bug	grass	bug	\N	mf	\N	4	yellow	Medium Slow	4	5	[[541, 0]]	{"cut": [5, 6]}	f	f	f	f	f	f	f
720	541	0	swadloon	Swadloon	\N	bug	grass	bug	\N	mf	\N	4	green	Medium Slow	14	5	[[542, 0]]	{"cut": [5, 6]}	f	f	f	f	f	f	f
721	542	0	leavanny	Leavanny	\N	bug	grass	bug	\N	mf	\N	4	yellow	Medium Slow	11	5	[]	{"cut": [5, 6]}	f	f	f	f	f	f	f
722	543	0	venipede	Venipede	\N	bug	poison	bug	\N	mf	\N	4	red	Medium Slow	4	5	[[544, 0]]	{"rock_smash": [6]}	f	f	f	f	f	f	f
723	544	0	whirlipede	Whirlipede	\N	bug	poison	bug	\N	mf	\N	4	gray	Medium Slow	1	5	[[545, 0]]	{"rock_smash": [6]}	f	f	f	f	f	f	f
724	545	0	scolipede	Scolipede	\N	bug	poison	bug	\N	mf	\N	4	red	Medium Slow	4	5	[]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
725	545	1	scolipede-mega	Scolipede	Mega Scolipede	bug	poison	bug	\N	mf	\N	4	purple	Medium Slow	4	9	[]	{}	t	t	f	f	f	f	f
726	546	0	cottonee	Cottonee	\N	grass	fairy	fairy	grass	mf	\N	4	green	Medium Fast	1	5	[[547, 0]]	{}	f	f	f	f	f	f	f
727	547	0	whimsicott	Whimsicott	\N	grass	fairy	fairy	grass	mf	\N	4	green	Medium Fast	11	5	[]	{}	f	f	f	f	f	f	f
728	548	0	petilil	Petilil	\N	grass	\N	grass	\N	fo	\N	8	green	Medium Fast	9	5	[[549, 0], [549, 1]]	{"cut": [5, 6]}	f	f	f	f	f	f	f
730	549	1	lilligant-hisui	Lilligant	Hisuian Form	grass	fighting	grass	\N	fo	\N	8	green	Medium Fast	11	8	[]	{}	f	f	f	f	f	f	f
731	550	0	basculin	Basculin	Red-Striped Form	water	\N	water_2	\N	mf	\N	4	green	Medium Fast	3	5	[]	{"cut": [5, 6], "dive": [5, 6], "surf": [5, 6], "waterfall": [5, 6]}	f	f	f	f	f	f	f
732	550	1	basculin-blue-striped	Basculin	Blue-Striped Form	water	\N	water_2	\N	mf	\N	4	green	Medium Fast	3	5	[]	{"cut": [5, 6], "dive": [5, 6], "surf": [5, 6], "waterfall": [5, 6]}	f	f	f	f	f	f	f
733	550	2	basculin-white-striped	Basculin	White-Striped Form	water	\N	water_2	\N	mf	\N	4	green	Medium Fast	3	8	[[902, 0], [902, 1]]	{}	f	f	f	f	f	f	f
734	551	0	sandile	Sandile	\N	ground	dark	field	\N	mf	\N	4	brown	Medium Slow	5	5	[[552, 0]]	{"cut": [5, 6]}	f	f	f	f	f	f	f
735	552	0	krokorok	Krokorok	\N	ground	dark	field	\N	mf	\N	4	brown	Medium Slow	5	5	[[553, 0]]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
736	553	0	krookodile	Krookodile	\N	ground	dark	field	\N	mf	\N	4	red	Medium Slow	10	5	[]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
737	554	0	darumaka	Darumaka	\N	fire	\N	field	\N	mf	\N	4	red	Medium Slow	11	5	[[555, 0]]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
738	554	1	darumaka-galar	Darumaka	Galarian Form	ice	\N	field	\N	mf	\N	4	white	Medium Slow	11	8	[[555, 2]]	{}	f	f	f	f	f	f	f
739	555	0	darmanitan	Darmanitan	Standard Mode	fire	\N	field	\N	mf	\N	4	red	Medium Slow	5	5	[]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
740	555	1	darmanitan-zen	Darmanitan	Zen Mode	fire	psychic	field	\N	mf	\N	4	blue	Medium Slow	5	5	[]	{}	f	t	f	f	f	f	f
741	555	2	darmanitan-galar	Darmanitan	Galarian Form	ice	\N	field	\N	mf	\N	4	white	Medium Slow	5	8	[]	{}	f	f	f	f	f	f	f
742	555	3	darmanitan-galar-zen	Darmanitan	Zen Mode	ice	fire	field	\N	mf	\N	4	white	Medium Slow	5	8	[]	{}	f	t	f	f	f	f	f
743	556	0	maractus	Maractus	\N	grass	\N	grass	\N	mf	\N	4	green	Medium Fast	9	5	[]	{}	f	f	f	f	f	f	f
744	557	0	dwebble	Dwebble	\N	bug	rock	bug	mineral	mf	\N	4	red	Medium Fast	4	5	[[558, 0]]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
745	558	0	crustle	Crustle	\N	bug	rock	bug	mineral	mf	\N	4	red	Medium Fast	4	5	[]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
746	559	0	scraggy	Scraggy	\N	dark	fighting	field	dragon	mf	\N	4	yellow	Medium Fast	10	5	[[560, 0]]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
747	560	0	scrafty	Scrafty	\N	dark	fighting	field	dragon	mf	\N	4	red	Medium Fast	10	5	[]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
748	560	1	scrafty-mega	Scrafty	Mega Scrafty	dark	fighting	field	dragon	mf	\N	4	brown	Medium Fast	10	9	[]	{}	t	t	f	f	f	f	f
749	561	0	sigilyph	Sigilyph	\N	psychic	flying	flying	\N	mf	\N	4	black	Medium Fast	12	5	[]	{"fly": [5, 6]}	f	f	f	f	f	f	f
750	562	0	yamask	Yamask	\N	ghost	\N	mineral	amorphous	mf	\N	4	black	Medium Fast	14	5	[[563, 0]]	{}	f	f	f	f	f	f	f
751	562	1	yamask-galar	Yamask	Galarian Form	ground	ghost	mineral	amorphous	mf	\N	4	black	Medium Fast	14	8	[[867, 0]]	{}	f	f	f	f	f	f	f
752	563	0	cofagrigus	Cofagrigus	\N	ghost	\N	mineral	amorphous	mf	\N	4	yellow	Medium Fast	9	5	[]	{}	f	f	f	f	f	f	f
753	564	0	tirtouga	Tirtouga	\N	water	rock	water_1	water_3	mf	\N	1	blue	Medium Fast	5	5	[[565, 0]]	{"dive": [5, 6], "surf": [5, 6], "strength": [5, 6], "waterfall": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
754	565	0	carracosta	Carracosta	\N	water	rock	water_1	water_3	mf	\N	1	blue	Medium Fast	10	5	[]	{"dive": [5, 6], "surf": [5, 6], "strength": [5, 6], "waterfall": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
755	566	0	archen	Archen	\N	rock	flying	flying	water_3	mf	\N	1	yellow	Medium Fast	12	5	[[567, 0]]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
756	567	0	archeops	Archeops	\N	rock	flying	flying	water_3	mf	\N	1	yellow	Medium Fast	12	5	[]	{"cut": [5, 6], "fly": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
757	568	0	trubbish	Trubbish	\N	poison	\N	mineral	\N	mf	\N	4	green	Medium Fast	11	5	[[569, 0]]	{}	f	f	f	f	f	f	f
758	569	0	garbodor	Garbodor	\N	poison	\N	mineral	\N	mf	\N	4	green	Medium Fast	11	5	[]	{}	f	f	t	f	f	f	f
759	570	0	zorua	Zorua	\N	dark	\N	field	\N	mf	\N	1	gray	Medium Slow	5	5	[[571, 0]]	{"cut": [5, 6]}	f	f	f	f	f	f	f
760	570	1	zorua-hisui	Zorua	Hisuian Form	normal	ghost	field	\N	mf	\N	1	gray	Medium Slow	5	8	[[571, 1]]	{}	f	f	f	f	f	f	f
761	571	0	zoroark	Zoroark	\N	dark	\N	field	\N	mf	\N	1	gray	Medium Slow	10	5	[]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
762	571	1	zoroark-hisui	Zoroark	Hisuian Form	normal	ghost	field	\N	mf	\N	1	gray	Medium Slow	10	8	[]	{}	f	f	f	f	f	f	f
763	572	0	minccino	Minccino	\N	normal	\N	field	\N	mf	\N	6	gray	Fast	5	5	[[573, 0]]	{}	f	f	f	f	f	f	f
764	573	0	cinccino	Cinccino	\N	normal	\N	field	\N	mf	\N	6	gray	Fast	5	5	[]	{}	f	f	f	f	f	f	f
765	574	0	gothita	Gothita	\N	psychic	\N	human_like	\N	mf	\N	6	purple	Medium Slow	11	5	[[575, 0]]	{}	f	f	f	f	f	f	f
766	575	0	gothorita	Gothorita	\N	psychic	\N	human_like	\N	mf	\N	6	purple	Medium Slow	11	5	[[576, 0]]	{}	f	f	f	f	f	f	f
768	577	0	solosis	Solosis	\N	psychic	\N	amorphous	\N	mf	\N	4	green	Medium Slow	1	5	[[578, 0]]	{}	f	f	f	f	f	f	f
769	578	0	duosion	Duosion	\N	psychic	\N	amorphous	\N	mf	\N	4	green	Medium Slow	1	5	[[579, 0]]	{}	f	f	f	f	f	f	f
770	579	0	reuniclus	Reuniclus	\N	psychic	\N	amorphous	\N	mf	\N	4	green	Medium Slow	14	5	[]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
771	580	0	ducklett	Ducklett	\N	water	flying	water_1	flying	mf	\N	4	blue	Medium Fast	12	5	[[581, 0]]	{"fly": [5, 6], "dive": [5, 6], "surf": [5, 6]}	f	f	f	f	f	f	f
772	581	0	swanna	Swanna	\N	water	flying	water_1	flying	mf	\N	4	white	Medium Fast	12	5	[]	{"fly": [5, 6], "dive": [5, 6], "surf": [5, 6]}	f	f	f	f	f	f	f
773	582	0	vanillite	Vanillite	\N	ice	\N	mineral	\N	mf	\N	4	white	Slow	9	5	[[583, 0]]	{}	f	f	f	f	f	f	f
774	583	0	vanillish	Vanillish	\N	ice	\N	mineral	\N	mf	\N	4	white	Slow	9	5	[[584, 0]]	{}	f	f	f	f	f	f	f
775	584	0	vanilluxe	Vanilluxe	\N	ice	\N	mineral	\N	mf	\N	4	white	Slow	7	5	[]	{}	f	f	f	f	f	f	f
776	585	0	deerling	Deerling	Spring Form	normal	grass	field	\N	mf	\N	4	pink	Medium Fast	5	5	[[586, 0]]	{}	f	f	f	f	f	f	f
777	585	1	deerling-summer	Deerling	Summer Form	normal	grass	field	\N	mf	\N	4	green	Medium Fast	5	5	[[586, 1]]	{}	f	f	f	f	f	f	f
778	585	2	deerling-autumn	Deerling	Autumn Form	normal	grass	field	\N	mf	\N	4	red	Medium Fast	5	5	[[586, 2]]	{}	f	f	f	f	f	f	f
779	585	3	deerling-winter	Deerling	Winter Form	normal	grass	field	\N	mf	\N	4	brown	Medium Fast	5	5	[[586, 3]]	{}	f	f	f	f	f	f	f
780	586	0	sawsbuck	Sawsbuck	Spring Form	normal	grass	field	\N	mf	\N	4	brown	Medium Fast	5	5	[]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
781	586	1	sawsbuck-summer	Sawsbuck	Summer Form	normal	grass	field	\N	mf	\N	4	brown	Medium Fast	5	5	[]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
782	586	2	sawsbuck-autumn	Sawsbuck	Autumn Form	normal	grass	field	\N	mf	\N	4	brown	Medium Fast	5	5	[]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
783	586	3	sawsbuck-winter	Sawsbuck	Winter Form	normal	grass	field	\N	mf	\N	4	brown	Medium Fast	5	5	[]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
784	587	0	emolga	Emolga	\N	electric	flying	field	\N	mf	\N	4	white	Medium Fast	5	5	[]	{"cut": [5, 6]}	f	f	f	f	f	f	f
785	588	0	karrablast	Karrablast	\N	bug	\N	bug	\N	mf	\N	4	blue	Medium Fast	11	5	[[589, 0]]	{"cut": [5, 6]}	f	f	f	f	f	f	f
786	589	0	escavalier	Escavalier	\N	bug	steel	bug	\N	mf	\N	4	gray	Medium Fast	14	5	[]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
787	590	0	foongus	Foongus	\N	grass	poison	grass	\N	mf	\N	4	white	Medium Fast	14	5	[[591, 0]]	{}	f	f	f	f	f	f	f
788	591	0	amoonguss	Amoonguss	\N	grass	poison	grass	\N	mf	\N	4	white	Medium Fast	14	5	[]	{}	f	f	f	f	f	f	f
789	592	0	frillish	Frillish	\N	water	ghost	amorphous	\N	fd	md	4	white	Medium Fast	8	5	[[593, 0]]	{"dive": [5, 6], "surf": [5, 6], "waterfall": [5, 6]}	f	f	f	f	f	f	f
790	593	0	jellicent	Jellicent	\N	water	ghost	amorphous	\N	fd	md	4	white	Medium Fast	8	5	[]	{"dive": [5, 6], "surf": [5, 6], "waterfall": [5, 6]}	f	f	f	f	f	f	f
791	594	0	alomomola	Alomomola	\N	water	\N	water_1	water_2	mf	\N	4	pink	Fast	3	5	[]	{"dive": [5, 6], "surf": [5, 6], "waterfall": [5, 6]}	f	f	f	f	f	f	f
792	595	0	joltik	Joltik	\N	bug	electric	bug	\N	mf	\N	4	yellow	Medium Fast	4	5	[[596, 0]]	{"cut": [5, 6]}	f	f	f	f	f	f	f
793	596	0	galvantula	Galvantula	\N	bug	electric	bug	\N	mf	\N	4	yellow	Medium Fast	4	5	[]	{"cut": [5, 6]}	f	f	f	f	f	f	f
794	597	0	ferroseed	Ferroseed	\N	grass	steel	grass	mineral	mf	\N	4	gray	Medium Fast	1	5	[[598, 0]]	{"rock_smash": [6]}	f	f	f	f	f	f	f
795	598	0	ferrothorn	Ferrothorn	\N	grass	steel	grass	mineral	mf	\N	4	gray	Medium Fast	8	5	[]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
796	599	0	klink	Klink	\N	steel	\N	mineral	\N	uk	\N	-1	gray	Medium Slow	7	5	[[600, 0]]	{"rock_smash": [6]}	f	f	f	f	f	f	f
797	600	0	klang	Klang	\N	steel	\N	mineral	\N	uk	\N	-1	gray	Medium Slow	7	5	[[601, 0]]	{"rock_smash": [6]}	f	f	f	f	f	f	f
798	601	0	klinklang	Klinklang	\N	steel	\N	mineral	\N	uk	\N	-1	gray	Medium Slow	7	5	[]	{"rock_smash": [6]}	f	f	f	f	f	f	f
799	602	0	tynamo	Tynamo	\N	electric	\N	amorphous	\N	mf	\N	4	white	Slow	3	5	[[603, 0]]	{}	f	f	f	f	f	f	f
800	603	0	eelektrik	Eelektrik	\N	electric	\N	amorphous	\N	mf	\N	4	blue	Slow	3	5	[[604, 0]]	{}	f	f	f	f	f	f	f
801	604	0	eelektross	Eelektross	\N	electric	\N	amorphous	\N	mf	\N	4	blue	Slow	3	5	[]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
802	604	1	eelektross-mega	Eelektross	Mega Eelektross	electric	\N	amorphous	\N	mf	\N	4	blue	Slow	3	9	[]	{}	t	t	f	f	f	f	f
803	605	0	elgyem	Elgyem	\N	psychic	\N	human_like	\N	mf	\N	4	blue	Medium Fast	10	5	[[606, 0]]	{}	f	f	f	f	f	f	f
804	606	0	beheeyem	Beheeyem	\N	psychic	\N	human_like	\N	mf	\N	4	brown	Medium Fast	11	5	[]	{}	f	f	f	f	f	f	f
805	607	0	litwick	Litwick	\N	ghost	fire	amorphous	\N	mf	\N	4	white	Medium Slow	9	5	[[608, 0]]	{}	f	f	f	f	f	f	f
806	608	0	lampent	Lampent	\N	ghost	fire	amorphous	\N	mf	\N	4	black	Medium Slow	14	5	[[609, 0]]	{}	f	f	f	f	f	f	f
808	609	1	chandelure-mega	Chandelure	Mega Chandelure	ghost	fire	amorphous	\N	mf	\N	4	black	Medium Slow	14	9	[]	{}	t	t	f	f	f	f	f
809	610	0	axew	Axew	\N	dragon	\N	monster	dragon	mf	\N	4	green	Slow	10	5	[[611, 0]]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
810	611	0	fraxure	Fraxure	\N	dragon	\N	monster	dragon	mf	\N	4	green	Slow	10	5	[[612, 0]]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
811	612	0	haxorus	Haxorus	\N	dragon	\N	monster	dragon	mf	\N	4	yellow	Slow	10	5	[]	{"cut": [5, 6], "surf": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
812	613	0	cubchoo	Cubchoo	\N	ice	\N	field	\N	mf	\N	4	white	Medium Fast	10	5	[[614, 0]]	{"cut": [5, 6], "surf": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
813	614	0	beartic	Beartic	\N	ice	\N	field	\N	mf	\N	4	white	Medium Fast	5	5	[]	{"cut": [5, 6], "dive": [5, 6], "surf": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
814	615	0	cryogonal	Cryogonal	\N	ice	\N	mineral	\N	uk	\N	-1	blue	Medium Fast	1	5	[]	{}	f	f	f	f	f	f	f
815	616	0	shelmet	Shelmet	\N	bug	\N	bug	\N	mf	\N	4	red	Medium Fast	1	5	[[617, 0]]	{}	f	f	f	f	f	f	f
816	617	0	accelgor	Accelgor	\N	bug	\N	bug	\N	mf	\N	4	red	Medium Fast	14	5	[]	{}	f	f	f	f	f	f	f
817	618	0	stunfisk	Stunfisk	\N	ground	electric	water_1	amorphous	mf	\N	4	brown	Medium Fast	3	5	[]	{"surf": [5, 6]}	f	f	f	f	f	f	f
818	618	1	stunfisk-galar	Stunfisk	Galarian Form	ground	steel	water_1	amorphous	mf	\N	4	green	Medium Fast	3	8	[]	{}	f	f	f	f	f	f	f
819	619	0	mienfoo	Mienfoo	\N	fighting	\N	field	human_like	mf	\N	4	yellow	Medium Slow	10	5	[[620, 0]]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
820	620	0	mienshao	Mienshao	\N	fighting	\N	field	human_like	mf	\N	4	purple	Medium Slow	10	5	[]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
821	621	0	druddigon	Druddigon	\N	dragon	\N	monster	dragon	mf	\N	4	red	Medium Fast	10	5	[]	{"cut": [5, 6], "surf": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
822	622	0	golett	Golett	\N	ground	ghost	mineral	\N	uk	\N	-1	green	Medium Fast	11	5	[[623, 0]]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
823	623	0	golurk	Golurk	\N	ground	ghost	mineral	\N	uk	\N	-1	green	Medium Fast	11	5	[]	{"fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
824	623	1	golurk-mega	Golurk	Mega Golurk	ground	ghost	mineral	\N	uk	\N	-1	green	Medium Fast	11	9	[]	{}	t	t	f	f	f	f	f
825	624	0	pawniard	Pawniard	\N	dark	steel	human_like	\N	mf	\N	4	red	Medium Fast	11	5	[[625, 0]]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
826	625	0	bisharp	Bisharp	\N	dark	steel	human_like	\N	mf	\N	4	red	Medium Fast	11	5	[[980, 0]]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
827	626	0	bouffalant	Bouffalant	\N	normal	\N	field	\N	mf	\N	4	brown	Medium Fast	5	5	[]	{"cut": [5, 6], "surf": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
828	627	0	rufflet	Rufflet	\N	normal	flying	flying	\N	mo	\N	0	white	Slow	12	5	[[628, 0], [628, 1]]	{"cut": [5, 6], "fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
829	628	0	braviary	Braviary	\N	normal	flying	flying	\N	mo	\N	0	red	Slow	12	5	[]	{"cut": [5, 6], "fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
830	628	1	braviary-hisui	Braviary	Hisuian Form	psychic	flying	flying	\N	mo	\N	0	white	Slow	12	8	[]	{}	f	f	f	f	f	f	f
831	629	0	vullaby	Vullaby	\N	dark	flying	flying	\N	fo	\N	8	brown	Slow	12	5	[[630, 0]]	{"cut": [5, 6], "fly": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
832	630	0	mandibuzz	Mandibuzz	\N	dark	flying	flying	\N	fo	\N	8	brown	Slow	12	5	[]	{"cut": [5, 6], "fly": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
833	631	0	heatmor	Heatmor	\N	fire	\N	field	\N	mf	\N	4	red	Medium Fast	10	5	[]	{"cut": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
834	632	0	durant	Durant	\N	bug	steel	bug	\N	mf	\N	4	gray	Medium Fast	4	5	[]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
835	633	0	deino	Deino	\N	dark	dragon	dragon	\N	mf	\N	4	blue	Slow	5	5	[[634, 0]]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
836	634	0	zweilous	Zweilous	\N	dark	dragon	dragon	\N	mf	\N	4	blue	Slow	5	5	[[635, 0]]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
837	635	0	hydreigon	Hydreigon	\N	dark	dragon	dragon	\N	mf	\N	4	blue	Slow	10	5	[]	{"fly": [5, 6], "surf": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	f	f
838	636	0	larvesta	Larvesta	\N	bug	fire	bug	\N	mf	\N	4	white	Slow	4	5	[[637, 0]]	{}	f	f	f	f	f	f	f
839	637	0	volcarona	Volcarona	\N	bug	fire	bug	\N	mf	\N	4	white	Slow	6	5	[]	{"fly": [5, 6]}	f	f	f	f	f	f	f
840	638	0	cobalion	Cobalion	\N	steel	fighting	undiscovered	\N	uk	\N	-1	blue	Slow	5	5	[]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	t	f
841	639	0	terrakion	Terrakion	\N	rock	fighting	undiscovered	\N	uk	\N	-1	gray	Slow	5	5	[]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	t	f
842	640	0	virizion	Virizion	\N	grass	fighting	undiscovered	\N	uk	\N	-1	green	Slow	5	5	[]	{"cut": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	t	f
843	641	0	tornadus	Tornadus	Incarnate Forme	flying	\N	undiscovered	\N	mo	\N	0	green	Slow	14	5	[]	{"fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	t	f
844	641	1	tornadus-therian	Tornadus	Therian Forme	flying	\N	undiscovered	\N	mo	\N	0	green	Slow	12	5	[]	{"fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	t	f
845	642	0	thundurus	Thundurus	Incarnate Forme	electric	flying	undiscovered	\N	mo	\N	0	blue	Slow	14	5	[]	{"fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	t	f
846	642	1	thundurus-therian	Thundurus	Therian Forme	electric	flying	undiscovered	\N	mo	\N	0	blue	Slow	10	5	[]	{"fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	t	f
847	643	0	reshiram	Reshiram	\N	dragon	fire	undiscovered	\N	uk	\N	-1	white	Slow	12	5	[]	{"cut": [5, 6], "fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	t	f	f	f
848	644	0	zekrom	Zekrom	\N	dragon	electric	undiscovered	\N	uk	\N	-1	black	Slow	10	5	[]	{"cut": [5, 6], "fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	t	f	f	f
849	645	0	landorus	Landorus	Incarnate Forme	ground	flying	undiscovered	\N	mo	\N	0	brown	Slow	14	5	[]	{"fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	t	f
850	645	1	landorus-therian	Landorus	Therian Forme	ground	flying	undiscovered	\N	mo	\N	0	brown	Slow	5	5	[]	{"fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	f	t	f
851	646	0	kyurem	Kyurem	\N	dragon	ice	undiscovered	\N	uk	\N	-1	gray	Slow	10	5	[]	{"cut": [5, 6], "fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	t	f	f	f
852	646	1	kyurem-white	Kyurem	White Kyurem	dragon	ice	undiscovered	\N	uk	\N	-1	gray	Slow	10	5	[]	{"cut": [5, 6], "fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	t	f	f	f
853	646	2	kyurem-black	Kyurem	Black Kyurem	dragon	ice	undiscovered	\N	uk	\N	-1	gray	Slow	10	5	[]	{"cut": [5, 6], "fly": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	t	f	f	f
854	647	0	keldeo	Keldeo	Ordinary Form	water	fighting	undiscovered	\N	uk	\N	-1	yellow	Slow	5	5	[]	{"cut": [5, 6], "surf": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	t	f	f
855	647	1	keldeo-resolute	Keldeo	Resolute Form	water	fighting	undiscovered	\N	uk	\N	-1	yellow	Slow	5	5	[]	{"surf": [5, 6], "strength": [5, 6], "rock_smash": [6]}	f	f	f	f	t	f	f
856	648	0	meloetta	Meloetta	Aria Forme	normal	psychic	undiscovered	\N	uk	\N	-1	white	Slow	11	5	[]	{"strength": [5, 6], "rock_smash": [6]}	f	f	f	f	t	f	f
857	648	1	meloetta-pirouette	Meloetta	Pirouette Forme	normal	fighting	undiscovered	\N	uk	\N	-1	white	Slow	11	5	[]	{}	f	t	f	f	t	f	f
858	649	0	genesect	Genesect	\N	bug	steel	undiscovered	\N	uk	\N	-1	purple	Slow	11	5	[]	{"fly": [5, 6]}	f	f	f	f	t	f	f
859	650	0	chespin	Chespin	\N	grass	\N	field	\N	mf	\N	1	green	Medium Slow	10	6	[[651, 0]]	{"cut": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
860	651	0	quilladin	Quilladin	\N	grass	\N	field	\N	mf	\N	1	green	Medium Slow	10	6	[[652, 0]]	{"cut": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
861	652	0	chesnaught	Chesnaught	\N	grass	fighting	field	\N	mf	\N	1	green	Medium Slow	10	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
862	652	1	chesnaught-mega	Chesnaught	Mega Chesnaught	grass	fighting	field	\N	mf	\N	1	white	Medium Slow	10	9	[]	{}	t	t	f	f	f	f	f
863	653	0	fennekin	Fennekin	\N	fire	\N	field	\N	mf	\N	1	red	Medium Slow	5	6	[[654, 0]]	{"cut": [6]}	f	f	f	f	f	f	f
864	654	0	braixen	Braixen	\N	fire	\N	field	\N	mf	\N	1	red	Medium Slow	10	6	[[655, 0]]	{"cut": [6]}	f	f	f	f	f	f	f
865	655	0	delphox	Delphox	\N	fire	psychic	field	\N	mf	\N	1	red	Medium Slow	10	6	[]	{"cut": [6]}	f	f	f	f	f	f	f
866	655	1	delphox-mega	Delphox	Mega Delphox	fire	psychic	field	\N	mf	\N	1	red	Medium Slow	10	9	[]	{}	t	t	f	f	f	f	f
867	656	0	froakie	Froakie	\N	water	\N	water_1	\N	mf	\N	1	blue	Medium Slow	5	6	[[657, 0]]	{"cut": [6], "dive": [6], "surf": [6], "strength": [6], "waterfall": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
868	657	0	frogadier	Frogadier	\N	water	\N	water_1	\N	mf	\N	1	blue	Medium Slow	11	6	[[658, 0]]	{"cut": [6], "dive": [6], "surf": [6], "strength": [6], "waterfall": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
869	658	0	greninja	Greninja	\N	water	dark	water_1	\N	mf	\N	1	blue	Medium Slow	11	6	[]	{"cut": [6], "dive": [6], "surf": [6], "strength": [6], "waterfall": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
870	658	2	greninja-ash	Greninja	Ash-Greninja	water	dark	undiscovered	\N	mo	\N	0	blue	Medium Slow	11	7	[]	{}	f	t	f	f	f	f	f
871	658	3	greninja-mega	Greninja	Mega Greninja	water	dark	water_1	\N	mf	\N	1	black	Medium Slow	11	9	[]	{}	t	t	f	f	f	f	f
872	659	0	bunnelby	Bunnelby	\N	normal	\N	field	\N	mf	\N	4	brown	Medium Fast	10	6	[[660, 0]]	{"cut": [6], "surf": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
873	660	0	diggersby	Diggersby	\N	normal	ground	field	\N	mf	\N	4	brown	Medium Fast	10	6	[]	{"cut": [6], "surf": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
874	661	0	fletchling	Fletchling	\N	normal	flying	flying	\N	mf	\N	4	red	Medium Slow	12	6	[[662, 0]]	{"fly": [6]}	f	f	f	f	f	f	f
875	662	0	fletchinder	Fletchinder	\N	fire	flying	flying	\N	mf	\N	4	red	Medium Slow	12	6	[[663, 0]]	{"fly": [6]}	f	f	f	f	f	f	f
876	663	0	talonflame	Talonflame	\N	fire	flying	flying	\N	mf	\N	4	red	Medium Slow	12	6	[]	{"fly": [6]}	f	f	f	f	f	f	f
877	664	6	scatterbug	Scatterbug	\N	bug	\N	bug	\N	mf	\N	4	black	Medium Fast	4	6	[[665, 6]]	{}	f	f	f	f	f	f	f
878	665	6	spewpa	Spewpa	\N	bug	\N	bug	\N	mf	\N	4	black	Medium Fast	9	6	[[666, 6]]	{}	f	f	f	f	f	f	f
879	666	0	vivillon-icy-snow	Vivillon	Icy Snow Pattern	bug	flying	bug	\N	mf	\N	4	white	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
880	666	1	vivillon-polar	Vivillon	Polar Pattern	bug	flying	bug	\N	mf	\N	4	blue	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
881	666	2	vivillon-tundra	Vivillon	Tundra Pattern	bug	flying	bug	\N	mf	\N	4	blue	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
882	666	3	vivillon-continental	Vivillon	Continental Pattern	bug	flying	bug	\N	mf	\N	4	yellow	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
883	666	4	vivillon-garden	Vivillon	Garden Pattern	bug	flying	bug	\N	mf	\N	4	green	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
884	666	5	vivillon-elegant	Vivillon	Elegant Pattern	bug	flying	bug	\N	mf	\N	4	purple	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
885	666	6	vivillon	Vivillon	Meadow Pattern	bug	flying	bug	\N	mf	\N	4	pink	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
886	666	7	vivillon-modern	Vivillon	Modern Pattern	bug	flying	bug	\N	mf	\N	4	red	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
887	666	8	vivillon-marine	Vivillon	Marine Pattern	bug	flying	bug	\N	mf	\N	4	blue	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
888	666	9	vivillon-archipelago	Vivillon	Archipelago Pattern	bug	flying	bug	\N	mf	\N	4	brown	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
889	666	10	vivillon-high-plains	Vivillon	High Plains Pattern	bug	flying	bug	\N	mf	\N	4	brown	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
890	666	11	vivillon-sandstorm	Vivillon	Sandstorm Pattern	bug	flying	bug	\N	mf	\N	4	brown	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
891	666	12	vivillon-river	Vivillon	River Pattern	bug	flying	bug	\N	mf	\N	4	brown	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
892	666	13	vivillon-monsoon	Vivillon	Monsoon Pattern	bug	flying	bug	\N	mf	\N	4	gray	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
893	666	14	vivillon-savanna	Vivillon	Savanna Pattern	bug	flying	bug	\N	mf	\N	4	green	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
894	666	15	vivillon-sun	Vivillon	Sun Pattern	bug	flying	bug	\N	mf	\N	4	red	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
895	666	16	vivillon-ocean	Vivillon	Ocean Pattern	bug	flying	bug	\N	mf	\N	4	red	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
896	666	17	vivillon-jungle	Vivillon	Jungle Pattern	bug	flying	bug	\N	mf	\N	4	green	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
897	666	18	vivillon-fancy	Vivillon	Fancy Pattern	bug	flying	bug	\N	mf	\N	4	pink	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
898	666	19	vivillon-poke-ball	Vivillon	Poké Ball Pattern	bug	flying	bug	\N	mf	\N	4	red	Medium Fast	6	6	[]	{}	f	f	f	f	f	f	f
899	667	0	litleo	Litleo	\N	fire	normal	field	\N	mf	\N	7	brown	Medium Slow	5	6	[[668, 0]]	{"strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
900	668	0	pyroar	Pyroar	\N	fire	normal	field	\N	fd	md	7	brown	Medium Slow	5	6	[]	{"strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
901	668	1	pyroar-mega	Pyroar	Mega Pyroar	fire	normal	field	\N	mf	\N	7	brown	Medium Slow	5	9	[]	{}	t	t	f	f	f	f	f
902	669	0	flabebe	Flabébé	Red Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[[670, 0]]	{}	f	f	f	f	f	f	f
903	669	1	flabebe-yellow	Flabébé	Yellow Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[[670, 1]]	{}	f	f	f	f	f	f	f
904	669	2	flabebe-orange	Flabébé	Orange Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[[670, 2]]	{}	f	f	f	f	f	f	f
905	669	3	flabebe-blue	Flabébé	Blue Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[[670, 3]]	{}	f	f	f	f	f	f	f
906	669	4	flabebe-white	Flabébé	White Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[[670, 4]]	{}	f	f	f	f	f	f	f
907	670	0	floette	Floette	Red Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[[671, 0]]	{}	f	f	f	f	f	f	f
908	670	1	floette-yellow	Floette	Yellow Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[[671, 1]]	{}	f	f	f	f	f	f	f
909	670	2	floette-orange	Floette	Orange Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[[671, 2]]	{}	f	f	f	f	f	f	f
910	670	3	floette-blue	Floette	Blue Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[[671, 3]]	{}	f	f	f	f	f	f	f
911	670	4	floette-white	Floette	White Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[[671, 4]]	{}	f	f	f	f	f	f	f
912	670	5	floette-eternal	Floette	Eternal Flower	fairy	\N	undiscovered	\N	fo	\N	8	white	Medium Fast	14	9	[]	{}	f	f	f	f	f	f	f
913	670	6	floette-mega	Floette	Mega Floette	fairy	\N	undiscovered	\N	fo	\N	8	white	Medium Fast	14	9	[]	{}	t	t	f	f	f	f	f
914	671	0	florges	Florges	Red Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[]	{}	f	f	f	f	f	f	f
915	671	1	florges-yellow	Florges	Yellow Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[]	{}	f	f	f	f	f	f	f
916	671	2	florges-orange	Florges	Orange Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[]	{}	f	f	f	f	f	f	f
917	671	3	florges-blue	Florges	Blue Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[]	{}	f	f	f	f	f	f	f
918	671	4	florges-white	Florges	White Flower	fairy	\N	fairy	\N	fo	\N	8	white	Medium Fast	14	6	[]	{}	f	f	f	f	f	f	f
919	672	0	skiddo	Skiddo	\N	grass	\N	field	\N	mf	\N	4	brown	Medium Fast	5	6	[[673, 0]]	{"surf": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
920	673	0	gogoat	Gogoat	\N	grass	\N	field	\N	mf	\N	4	brown	Medium Fast	5	6	[]	{"surf": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
921	674	0	pancham	Pancham	\N	fighting	\N	field	human_like	mf	\N	4	white	Medium Fast	10	6	[[675, 0]]	{"cut": [6], "surf": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
922	675	0	pangoro	Pangoro	\N	fighting	dark	field	human_like	mf	\N	4	white	Medium Fast	11	6	[]	{"cut": [6], "surf": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
923	676	0	furfrou	Furfrou	Natural Form	normal	\N	field	\N	mf	\N	4	white	Medium Fast	5	6	[]	{"surf": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
924	676	1	furfrou-heart	Furfrou	Heart Trim	normal	\N	field	\N	mf	\N	4	white	Medium Fast	5	6	[]	{"surf": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
925	676	2	furfrou-star	Furfrou	Star Trim	normal	\N	field	\N	mf	\N	4	white	Medium Fast	5	6	[]	{"surf": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
926	676	3	furfrou-diamond	Furfrou	Diamond Trim	normal	\N	field	\N	mf	\N	4	white	Medium Fast	5	6	[]	{"surf": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
927	676	4	furfrou-debutante	Furfrou	Debutante Trim	normal	\N	field	\N	mf	\N	4	white	Medium Fast	5	6	[]	{"surf": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
928	676	5	furfrou-matron	Furfrou	Matron Trim	normal	\N	field	\N	mf	\N	4	white	Medium Fast	5	6	[]	{"surf": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
929	676	6	furfrou-dandy	Furfrou	Dandy Trim	normal	\N	field	\N	mf	\N	4	white	Medium Fast	5	6	[]	{"surf": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
930	676	7	furfrou-la-reine	Furfrou	La Reine Trim	normal	\N	field	\N	mf	\N	4	white	Medium Fast	5	6	[]	{"surf": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
931	676	8	furfrou-kabuki	Furfrou	Kabuki Trim	normal	\N	field	\N	mf	\N	4	white	Medium Fast	5	6	[]	{"surf": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
932	676	9	furfrou-pharaoh	Furfrou	Pharaoh Trim	normal	\N	field	\N	mf	\N	4	white	Medium Fast	5	6	[]	{"surf": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
933	677	0	espurr	Espurr	\N	psychic	\N	field	\N	mf	\N	4	gray	Medium Fast	10	6	[[678, 0], [678, 1]]	{"cut": [6]}	f	f	f	f	f	f	f
934	678	0	meowstic	Meowstic	Male	psychic	\N	field	\N	mo	\N	0	blue	Medium Fast	10	6	[]	{"cut": [6]}	f	f	f	f	f	f	f
935	678	1	meowstic-female	Meowstic	Female	psychic	\N	field	\N	fo	\N	8	white	Medium Fast	10	6	[]	{"cut": [6]}	f	f	f	f	f	f	f
936	678	2	meowstic-mega	Meowstic	Mega Meowstic	psychic	\N	field	\N	mo	\N	0	white	Medium Fast	10	9	[]	{}	t	t	f	f	f	f	f
937	678	3	meowstic-female-mega	Meowstic	Mega Meowstic	psychic	\N	field	\N	fo	\N	0	white	Medium Fast	10	9	[]	{}	t	t	f	f	f	f	f
938	679	0	honedge	Honedge	\N	steel	ghost	mineral	\N	mf	\N	4	brown	Medium Fast	9	6	[[680, 0]]	{"cut": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
939	680	0	doublade	Doublade	\N	steel	ghost	mineral	\N	mf	\N	4	brown	Medium Fast	7	6	[[681, 1]]	{"cut": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
940	681	0	aegislash	Aegislash	Shield Forme	steel	ghost	mineral	\N	mf	\N	4	brown	Medium Fast	9	6	[]	{"cut": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
941	681	1	aegislash-blade	Aegislash	Blade Forme	steel	ghost	mineral	\N	mf	\N	4	brown	Medium Fast	9	6	[]	{}	f	t	f	f	f	f	f
942	682	0	spritzee	Spritzee	\N	fairy	\N	fairy	\N	mf	\N	4	pink	Medium Fast	14	6	[[683, 0]]	{}	f	f	f	f	f	f	f
943	683	0	aromatisse	Aromatisse	\N	fairy	\N	fairy	\N	mf	\N	4	pink	Medium Fast	11	6	[]	{}	f	f	f	f	f	f	f
944	684	0	swirlix	Swirlix	\N	fairy	\N	fairy	\N	mf	\N	4	white	Medium Fast	2	6	[[685, 0]]	{"surf": [6]}	f	f	f	f	f	f	f
945	685	0	slurpuff	Slurpuff	\N	fairy	\N	fairy	\N	mf	\N	4	white	Medium Fast	11	6	[]	{"surf": [6]}	f	f	f	f	f	f	f
946	686	0	inkay	Inkay	\N	dark	psychic	water_1	water_2	mf	\N	4	blue	Medium Fast	8	6	[[687, 0]]	{"cut": [6]}	f	f	f	f	f	f	f
947	687	0	malamar	Malamar	\N	dark	psychic	water_1	water_2	mf	\N	4	blue	Medium Fast	9	6	[]	{"cut": [6]}	f	f	f	f	f	f	f
948	687	1	malamar-mega	Malamar	Mega Malamar	dark	psychic	water_1	water_2	mf	\N	4	blue	Medium Fast	9	9	[]	{}	t	t	f	f	f	f	f
949	688	0	binacle	Binacle	\N	rock	water	water_3	\N	mf	\N	4	brown	Medium Fast	7	6	[[689, 0]]	{"cut": [6], "surf": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
950	689	0	barbaracle	Barbaracle	\N	rock	water	water_3	\N	mf	\N	4	brown	Medium Fast	7	6	[]	{"cut": [6], "surf": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
951	689	1	barbaracle-mega	Barbaracle	Mega Barbaracle	rock	fighting	water_3	\N	mf	\N	4	brown	Medium Fast	7	9	[]	{}	t	t	f	f	f	f	f
952	690	0	skrelp	Skrelp	\N	poison	water	water_1	dragon	mf	\N	4	brown	Medium Fast	9	6	[[691, 0]]	{"dive": [6], "surf": [6], "waterfall": [6]}	f	f	f	f	f	f	f
953	691	0	dragalge	Dragalge	\N	poison	dragon	water_1	dragon	mf	\N	4	brown	Medium Fast	9	6	[]	{"dive": [6], "surf": [6], "waterfall": [6]}	f	f	f	f	f	f	f
954	691	1	dragalge-mega	Dragalge	Mega Dragalge	poison	dragon	water_1	dragon	mf	\N	4	brown	Medium Fast	9	9	[]	{}	t	t	f	f	f	f	f
955	692	0	clauncher	Clauncher	\N	water	\N	water_1	water_3	mf	\N	4	blue	Slow	4	6	[[693, 0]]	{"cut": [6], "dive": [6], "surf": [6], "waterfall": [6]}	f	f	f	f	f	f	f
956	693	0	clawitzer	Clawitzer	\N	water	\N	water_1	water_3	mf	\N	4	blue	Slow	13	6	[]	{"cut": [6], "dive": [6], "surf": [6], "waterfall": [6]}	f	f	f	f	f	f	f
957	694	0	helioptile	Helioptile	\N	electric	normal	monster	dragon	mf	\N	4	yellow	Medium Fast	10	6	[[695, 0]]	{"cut": [6], "surf": [6]}	f	f	f	f	f	f	f
958	695	0	heliolisk	Heliolisk	\N	electric	normal	monster	dragon	mf	\N	4	yellow	Medium Fast	10	6	[]	{"cut": [6], "surf": [6]}	f	f	f	f	f	f	f
959	696	0	tyrunt	Tyrunt	\N	rock	dragon	monster	dragon	mf	\N	1	brown	Medium Fast	10	6	[[697, 0]]	{"strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
960	697	0	tyrantrum	Tyrantrum	\N	rock	dragon	monster	dragon	mf	\N	1	red	Medium Fast	10	6	[]	{"strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
961	698	0	amaura	Amaura	\N	rock	ice	monster	\N	mf	\N	1	blue	Medium Fast	5	6	[[699, 0]]	{"rock_smash": [6]}	f	f	f	f	f	f	f
962	699	0	aurorus	Aurorus	\N	rock	ice	monster	\N	mf	\N	1	blue	Medium Fast	5	6	[]	{"rock_smash": [6]}	f	f	f	f	f	f	f
963	700	0	sylveon	Sylveon	\N	fairy	\N	field	\N	mf	\N	1	pink	Medium Fast	5	6	[]	{"cut": [6]}	f	f	f	f	f	f	f
964	701	0	hawlucha	Hawlucha	\N	fighting	flying	human_like	\N	mf	\N	4	green	Medium Fast	11	6	[]	{"cut": [6], "fly": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
965	701	1	hawlucha-mega	Hawlucha	Mega Hawlucha	fighting	flying	human_like	\N	mf	\N	4	yellow	Medium Fast	11	9	[]	{}	t	t	f	f	f	f	f
966	702	0	dedenne	Dedenne	\N	electric	fairy	field	fairy	mf	\N	4	yellow	Medium Fast	10	6	[]	{"cut": [6]}	f	f	f	f	f	f	f
967	703	0	carbink	Carbink	\N	rock	fairy	fairy	mineral	uk	\N	-1	gray	Slow	1	6	[]	{}	f	f	f	f	f	f	f
968	704	0	goomy	Goomy	\N	dragon	\N	dragon	\N	mf	\N	4	purple	Slow	13	6	[[705, 0], [705, 1]]	{}	f	f	f	f	f	f	f
969	705	0	sliggoo	Sliggoo	\N	dragon	\N	dragon	\N	mf	\N	4	purple	Slow	13	6	[[706, 0]]	{}	f	f	f	f	f	f	f
970	705	1	sliggoo-hisui	Sliggoo	Hisuian Form	steel	dragon	dragon	\N	mf	\N	4	purple	Slow	13	8	[[706, 1]]	{}	f	f	f	f	f	f	f
971	706	0	goodra	Goodra	\N	dragon	\N	dragon	\N	mf	\N	4	purple	Slow	10	6	[]	{"strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
972	706	1	goodra-hisui	Goodra	Hisuian Form	steel	dragon	dragon	\N	mf	\N	4	purple	Slow	10	8	[]	{}	f	f	f	f	f	f	f
973	707	0	klefki	Klefki	\N	steel	fairy	mineral	\N	mf	\N	4	gray	Fast	1	6	[]	{"cut": [6]}	f	f	f	f	f	f	f
974	708	0	phantump	Phantump	\N	ghost	grass	grass	amorphous	mf	\N	4	brown	Medium Fast	14	6	[[709, 0]]	{"cut": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
975	709	0	trevenant	Trevenant	\N	ghost	grass	grass	amorphous	mf	\N	4	brown	Medium Fast	8	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
976	710	0	pumpkaboo	Pumpkaboo	Medium Variety	ghost	grass	amorphous	\N	mf	\N	4	brown	Medium Fast	1	6	[[711, 0]]	{"rock_smash": [6]}	f	f	f	f	f	f	f
977	710	1	pumpkaboo-small	Pumpkaboo	Small Variety	ghost	grass	amorphous	\N	mf	\N	4	brown	Medium Fast	1	6	[[711, 1]]	{"rock_smash": [6]}	f	f	f	f	f	f	f
978	710	2	pumpkaboo-large	Pumpkaboo	Large Variety	ghost	grass	amorphous	\N	mf	\N	4	brown	Medium Fast	1	6	[[711, 2]]	{"rock_smash": [6]}	f	f	f	f	f	f	f
979	710	3	pumpkaboo-super	Pumpkaboo	Jumbo Variety	ghost	grass	amorphous	\N	mf	\N	4	brown	Medium Fast	1	6	[[711, 3]]	{"rock_smash": [6]}	f	f	f	f	f	f	f
980	711	0	gourgeist	Gourgeist	Medium Variety	ghost	grass	amorphous	\N	mf	\N	4	brown	Medium Fast	9	6	[]	{"rock_smash": [6]}	f	f	f	f	f	f	f
981	711	1	gourgeist-small	Gourgeist	Small Variety	ghost	grass	amorphous	\N	mf	\N	4	brown	Medium Fast	9	6	[]	{"rock_smash": [6]}	f	f	f	f	f	f	f
982	711	2	gourgeist-large	Gourgeist	Large Variety	ghost	grass	amorphous	\N	mf	\N	4	brown	Medium Fast	9	6	[]	{"rock_smash": [6]}	f	f	f	f	f	f	f
983	711	3	gourgeist-super	Gourgeist	Jumbo Variety	ghost	grass	amorphous	\N	mf	\N	4	brown	Medium Fast	9	6	[]	{"rock_smash": [6]}	f	f	f	f	f	f	f
984	712	0	bergmite	Bergmite	\N	ice	\N	monster	\N	mf	\N	4	blue	Medium Fast	5	6	[[713, 0], [713, 1]]	{"surf": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
985	713	0	avalugg	Avalugg	\N	ice	\N	monster	\N	mf	\N	4	blue	Medium Fast	5	6	[]	{"surf": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	f	f	f
986	713	1	avalugg-hisui	Avalugg	Hisuian Form	ice	rock	monster	\N	mf	\N	4	blue	Medium Fast	5	8	[]	{}	f	f	f	f	f	f	f
987	714	0	noibat	Noibat	\N	flying	dragon	flying	\N	mf	\N	4	purple	Medium Fast	12	6	[[715, 0]]	{"cut": [6], "fly": [6]}	f	f	f	f	f	f	f
988	715	0	noivern	Noivern	\N	flying	dragon	flying	\N	mf	\N	4	purple	Medium Fast	12	6	[]	{"cut": [6], "fly": [6]}	f	f	f	f	f	f	f
989	716	0	xerneas-neutral	Xerneas	Neutral Mode	fairy	\N	undiscovered	\N	uk	\N	-1	blue	Slow	5	6	[]	{"cut": [6]}	f	t	f	t	f	f	f
990	716	1	xerneas	Xerneas	Active Mode	fairy	\N	undiscovered	\N	uk	\N	-1	blue	Slow	5	6	[]	{"cut": [6]}	f	f	f	t	f	f	f
991	717	0	yveltal	Yveltal	\N	dark	flying	undiscovered	\N	uk	\N	-1	red	Slow	12	6	[]	{"cut": [6], "fly": [6]}	f	f	f	t	f	f	f
992	718	0	zygarde	Zygarde	50% Forme	dragon	ground	undiscovered	\N	uk	\N	-1	green	Slow	13	6	[]	{"strength": [6], "rock_smash": [6]}	f	f	f	t	f	f	f
993	718	2	zygarde-10	Zygarde	10% Forme	dragon	ground	undiscovered	\N	uk	\N	-1	black	Slow	5	7	[]	{}	f	f	f	t	f	f	f
994	718	4	zygarde-complete	Zygarde	Complete Forme	dragon	ground	undiscovered	\N	uk	\N	-1	black	Slow	10	7	[]	{}	f	t	f	t	f	f	f
995	718	5	zygarde-mega	Zygarde	Mega Zygarde	dragon	ground	undiscovered	\N	uk	\N	-1	green	Slow	10	9	[]	{}	t	t	f	t	f	f	f
996	719	0	diancie	Diancie	\N	rock	fairy	undiscovered	\N	uk	\N	-1	pink	Slow	14	6	[]	{}	f	f	f	f	t	f	f
997	719	1	diancie-mega	Diancie	Mega Diancie	rock	fairy	undiscovered	\N	uk	\N	-1	pink	Slow	14	6	[]	{}	t	t	f	f	t	f	f
998	720	0	hoopa	Hoopa	Hoopa Confined	psychic	ghost	undiscovered	\N	uk	\N	-1	purple	Slow	14	6	[]	{}	f	f	f	f	t	f	f
999	720	1	hoopa-unbound	Hoopa	Hoopa Unbound	psychic	dark	undiscovered	\N	uk	\N	-1	purple	Slow	10	6	[]	{}	f	f	f	f	t	f	f
1000	721	0	volcanion	Volcanion	\N	fire	water	undiscovered	\N	uk	\N	-1	brown	Slow	5	6	[]	{"cut": [6], "strength": [6], "rock_smash": [6]}	f	f	f	f	t	f	f
1001	722	0	rowlet	Rowlet	\N	grass	flying	flying	\N	mf	\N	1	brown	Medium Slow	12	7	[[723, 0]]	{}	f	f	f	f	f	f	f
1002	723	0	dartrix	Dartrix	\N	grass	flying	flying	\N	mf	\N	1	brown	Medium Slow	12	7	[[724, 0], [724, 1]]	{}	f	f	f	f	f	f	f
1003	724	0	decidueye	Decidueye	\N	grass	ghost	flying	\N	mf	\N	1	brown	Medium Slow	12	7	[]	{}	f	f	f	f	f	f	f
1004	724	1	decidueye-hisui	Decidueye	Hisuian Form	grass	fighting	flying	\N	mf	\N	1	brown	Medium Slow	12	8	[]	{}	f	f	f	f	f	f	f
1005	725	0	litten	Litten	\N	fire	\N	field	\N	mf	\N	1	red	Medium Slow	5	7	[[726, 0]]	{}	f	f	f	f	f	f	f
1006	726	0	torracat	Torracat	\N	fire	\N	field	\N	mf	\N	1	red	Medium Slow	5	7	[[727, 0]]	{}	f	f	f	f	f	f	f
1007	727	0	incineroar	Incineroar	\N	fire	dark	field	\N	mf	\N	1	red	Medium Slow	10	7	[]	{}	f	f	f	f	f	f	f
1008	728	0	popplio	Popplio	\N	water	\N	water_1	field	mf	\N	1	blue	Medium Slow	3	7	[[729, 0]]	{}	f	f	f	f	f	f	f
1009	729	0	brionne	Brionne	\N	water	\N	water_1	field	mf	\N	1	blue	Medium Slow	3	7	[[730, 0]]	{}	f	f	f	f	f	f	f
1010	730	0	primarina	Primarina	\N	water	fairy	water_1	field	mf	\N	1	blue	Medium Slow	3	7	[]	{}	f	f	f	f	f	f	f
1011	731	0	pikipek	Pikipek	\N	normal	flying	flying	\N	mf	\N	4	black	Medium Fast	12	7	[[732, 0]]	{}	f	f	f	f	f	f	f
1012	732	0	trumbeak	Trumbeak	\N	normal	flying	flying	\N	mf	\N	4	black	Medium Fast	12	7	[[733, 0]]	{}	f	f	f	f	f	f	f
1013	733	0	toucannon	Toucannon	\N	normal	flying	flying	\N	mf	\N	4	black	Medium Fast	12	7	[]	{}	f	f	f	f	f	f	f
1014	734	0	yungoos	Yungoos	\N	normal	\N	field	\N	mf	\N	4	brown	Medium Fast	5	7	[[735, 0]]	{}	f	f	f	f	f	f	f
1015	735	0	gumshoos	Gumshoos	\N	normal	\N	field	\N	mf	\N	4	brown	Medium Fast	5	7	[]	{}	f	f	f	f	f	f	f
1016	736	0	grubbin	Grubbin	\N	bug	\N	bug	\N	mf	\N	4	gray	Medium Fast	4	7	[[737, 0]]	{}	f	f	f	f	f	f	f
1017	737	0	charjabug	Charjabug	\N	bug	electric	bug	\N	mf	\N	4	green	Medium Fast	13	7	[[738, 0]]	{}	f	f	f	f	f	f	f
1018	738	0	vikavolt	Vikavolt	\N	bug	electric	bug	\N	mf	\N	4	blue	Medium Fast	4	7	[]	{}	f	f	f	f	f	f	f
1019	739	0	crabrawler	Crabrawler	\N	fighting	\N	water_3	\N	mf	\N	4	purple	Medium Fast	4	7	[[740, 0]]	{}	f	f	f	f	f	f	f
1020	740	0	crabominable	Crabominable	\N	fighting	ice	water_3	\N	mf	\N	4	white	Medium Fast	4	7	[]	{}	f	f	f	f	f	f	f
1021	740	1	crabominable-mega	Crabominable	Mega Crabominable	fighting	ice	water_3	\N	mf	\N	4	white	Medium Fast	4	9	[]	{}	t	t	f	f	f	f	f
1022	741	0	oricorio	Oricorio	Baile Style	fire	flying	flying	\N	mf	\N	6	red	Medium Fast	12	7	[]	{}	f	f	f	f	f	f	f
1023	741	1	oricorio-pom-pom	Oricorio	Pom-Pom Style	electric	flying	flying	\N	mf	\N	6	yellow	Medium Fast	12	7	[]	{}	f	f	f	f	f	f	f
1024	741	2	oricorio-pau	Oricorio	Pau'u Style	psychic	flying	flying	\N	mf	\N	6	pink	Medium Fast	12	7	[]	{}	f	f	f	f	f	f	f
1025	741	3	oricorio-sensu	Oricorio	Sensu Style	ghost	flying	flying	\N	mf	\N	6	purple	Medium Fast	12	7	[]	{}	f	f	f	f	f	f	f
1026	742	0	cutiefly	Cutiefly	\N	bug	fairy	bug	fairy	mf	\N	4	yellow	Medium Fast	4	7	[[743, 0]]	{}	f	f	f	f	f	f	f
1027	743	0	ribombee	Ribombee	\N	bug	fairy	bug	fairy	mf	\N	4	yellow	Medium Fast	6	7	[]	{}	f	f	f	f	f	f	f
1028	744	0	rockruff	Rockruff	\N	rock	\N	field	\N	mf	\N	4	brown	Medium Fast	5	7	[[745, 0], [745, 1]]	{}	f	f	f	f	f	f	f
1029	745	0	lycanroc	Lycanroc	Midday Form	rock	\N	field	\N	mf	\N	4	brown	Medium Fast	5	7	[]	{}	f	f	f	f	f	f	f
1030	745	1	lycanroc-midnight	Lycanroc	Midnight Form	rock	\N	field	\N	mf	\N	4	red	Medium Fast	10	7	[]	{}	f	f	f	f	f	f	f
1031	745	2	lycanroc-dusk	Lycanroc	Dusk Form	rock	\N	field	\N	mf	\N	4	brown	Medium Fast	5	7	[]	{}	f	f	f	f	f	f	f
1032	746	0	wishiwashi	Wishiwashi	Solo Form	water	\N	water_2	\N	mf	\N	4	blue	Fast	3	7	[]	{}	f	t	f	f	f	f	f
1033	746	1	wishiwashi-school	Wishiwashi	School Form	water	\N	water_2	\N	mf	\N	4	blue	Fast	7	7	[]	{}	f	f	f	f	f	f	f
1034	747	0	mareanie	Mareanie	\N	poison	water	water_1	\N	mf	\N	4	blue	Medium Fast	9	7	[[748, 0]]	{}	f	f	f	f	f	f	f
1035	748	0	toxapex	Toxapex	\N	poison	water	water_1	\N	mf	\N	4	blue	Medium Fast	8	7	[]	{}	f	f	f	f	f	f	f
1036	749	0	mudbray	Mudbray	\N	ground	\N	field	\N	mf	\N	4	brown	Medium Fast	5	7	[[750, 0]]	{}	f	f	f	f	f	f	f
1037	750	0	mudsdale	Mudsdale	\N	ground	\N	field	\N	mf	\N	4	brown	Medium Fast	5	7	[]	{}	f	f	f	f	f	f	f
1038	751	0	dewpider	Dewpider	\N	water	bug	water_1	bug	mf	\N	4	green	Medium Fast	2	7	[[752, 0]]	{}	f	f	f	f	f	f	f
1039	752	0	araquanid	Araquanid	\N	water	bug	water_1	bug	mf	\N	4	green	Medium Fast	4	7	[]	{}	f	f	f	f	f	f	f
1040	753	0	fomantis	Fomantis	\N	grass	\N	grass	\N	mf	\N	4	pink	Medium Fast	10	7	[[754, 0]]	{}	f	f	f	f	f	f	f
1041	754	0	lurantis	Lurantis	\N	grass	\N	grass	\N	mf	\N	4	pink	Medium Fast	11	7	[]	{}	f	f	f	f	f	f	f
1042	755	0	morelull	Morelull	\N	grass	fairy	grass	\N	mf	\N	4	purple	Medium Fast	9	7	[[756, 0]]	{}	f	f	f	f	f	f	f
1043	756	0	shiinotic	Shiinotic	\N	grass	fairy	grass	\N	mf	\N	4	purple	Medium Fast	11	7	[]	{}	f	f	f	f	f	f	f
1044	757	0	salandit	Salandit	\N	poison	fire	monster	dragon	mf	\N	1	black	Medium Fast	5	7	[[758, 0]]	{}	f	f	f	f	f	f	f
1045	758	0	salazzle	Salazzle	\N	poison	fire	monster	dragon	fo	\N	8	black	Medium Fast	5	7	[]	{}	f	f	f	f	f	f	f
1046	759	0	stufful	Stufful	\N	normal	fighting	field	\N	mf	\N	4	pink	Medium Fast	5	7	[[760, 0]]	{}	f	f	f	f	f	f	f
1047	760	0	bewear	Bewear	\N	normal	fighting	field	\N	mf	\N	4	pink	Medium Fast	10	7	[]	{}	f	f	f	f	f	f	f
1048	761	0	bounsweet	Bounsweet	\N	grass	\N	grass	\N	fo	\N	8	purple	Medium Slow	2	7	[[762, 0]]	{}	f	f	f	f	f	f	f
1049	762	0	steenee	Steenee	\N	grass	\N	grass	\N	fo	\N	8	purple	Medium Slow	11	7	[[763, 0]]	{}	f	f	f	f	f	f	f
1050	763	0	tsareena	Tsareena	\N	grass	\N	grass	\N	fo	\N	8	purple	Medium Slow	11	7	[]	{}	f	f	f	f	f	f	f
1051	764	0	comfey	Comfey	\N	fairy	\N	grass	\N	mf	\N	6	green	Fast	1	7	[]	{}	f	f	f	f	f	f	f
1052	765	0	oranguru	Oranguru	\N	normal	psychic	field	\N	mf	\N	4	white	Slow	11	7	[]	{}	f	f	f	f	f	f	f
1053	766	0	passimian	Passimian	\N	fighting	\N	field	\N	mf	\N	4	white	Slow	10	7	[]	{}	f	f	f	f	f	f	f
1054	767	0	wimpod	Wimpod	\N	bug	water	bug	water_3	mf	\N	4	gray	Medium Fast	8	7	[[768, 0]]	{}	f	f	f	f	f	f	f
1055	768	0	golisopod	Golisopod	\N	bug	water	bug	water_3	mf	\N	4	gray	Medium Fast	11	7	[]	{}	f	f	f	f	f	f	f
1056	768	1	golisopod-mega	Golisopod	Mega Golisopod	bug	steel	bug	water_3	mf	\N	4	gray	Medium Fast	8	9	[]	{}	t	t	f	f	f	f	f
1057	769	0	sandygast	Sandygast	\N	ghost	ground	amorphous	\N	mf	\N	4	brown	Medium Fast	13	7	[[770, 0]]	{}	f	f	f	f	f	f	f
1058	770	0	palossand	Palossand	\N	ghost	ground	amorphous	\N	mf	\N	4	brown	Medium Fast	13	7	[]	{}	f	f	f	f	f	f	f
1059	771	0	pyukumuku	Pyukumuku	\N	water	\N	water_1	\N	mf	\N	4	black	Fast	13	7	[]	{}	f	f	f	f	f	f	f
1060	772	0	type-null	Type: Null	\N	normal	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[[773, 0]]	{}	f	f	f	f	f	t	f
1061	773	0	silvally	Silvally	Type: Normal	normal	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1062	773	1	silvally-fighting	Silvally	Type: Fighting	fighting	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1063	773	2	silvally-flying	Silvally	Type: Flying	flying	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1064	773	3	silvally-poison	Silvally	Type: Poison	poison	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1065	773	4	silvally-ground	Silvally	Type: Ground	ground	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1066	773	5	silvally-rock	Silvally	Type: Rock	rock	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1067	773	6	silvally-bug	Silvally	Type: Bug	bug	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1068	773	7	silvally-ghost	Silvally	Type: Ghost	ghost	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1069	773	8	silvally-steel	Silvally	Type: Steel	steel	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1070	773	9	silvally-fire	Silvally	Type: Fire	fire	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1071	773	10	silvally-water	Silvally	Type: Water	water	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1072	773	11	silvally-grass	Silvally	Type: Grass	grass	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1073	773	12	silvally-electric	Silvally	Type: Electric	electric	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1074	773	13	silvally-psychic	Silvally	Type: Psychic	psychic	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1075	773	14	silvally-ice	Silvally	Type: Ice	ice	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1076	773	15	silvally-dragon	Silvally	Type: Dragon	dragon	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1077	773	16	silvally-dark	Silvally	Type: Dark	dark	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1078	773	17	silvally-fairy	Silvally	Type: Fairy	fairy	\N	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	t	f
1079	774	0	minior-meteor	Minior	Meteor Form	rock	flying	mineral	\N	uk	\N	-1	brown	Medium Slow	1	7	[]	{}	f	f	f	f	f	f	f
1080	774	7	minior	Minior	Red Core	rock	flying	mineral	\N	uk	\N	-1	red	Medium Slow	1	7	[]	{}	f	t	f	f	f	f	f
1081	774	8	minior-orange	Minior	Orange Core	rock	flying	mineral	\N	uk	\N	-1	red	Medium Slow	1	7	[]	{}	f	t	f	f	f	f	f
1082	774	9	minior-yellow	Minior	Yellow Core	rock	flying	mineral	\N	uk	\N	-1	yellow	Medium Slow	1	7	[]	{}	f	t	f	f	f	f	f
1083	774	10	minior-green	Minior	Green Core	rock	flying	mineral	\N	uk	\N	-1	green	Medium Slow	1	7	[]	{}	f	t	f	f	f	f	f
1084	774	11	minior-blue	Minior	Blue Core	rock	flying	mineral	\N	uk	\N	-1	blue	Medium Slow	1	7	[]	{}	f	t	f	f	f	f	f
1085	774	12	minior-indigo	Minior	Indigo Core	rock	flying	mineral	\N	uk	\N	-1	blue	Medium Slow	1	7	[]	{}	f	t	f	f	f	f	f
1086	774	13	minior-violet	Minior	Violet Core	rock	flying	mineral	\N	uk	\N	-1	purple	Medium Slow	1	7	[]	{}	f	t	f	f	f	f	f
1087	775	0	komala	Komala	\N	normal	\N	field	\N	mf	\N	4	blue	Slow	11	7	[]	{}	f	f	f	f	f	f	f
1088	776	0	turtonator	Turtonator	\N	fire	dragon	monster	dragon	mf	\N	4	red	Medium Fast	10	7	[]	{}	f	f	f	f	f	f	f
1089	777	0	togedemaru	Togedemaru	\N	electric	steel	field	fairy	mf	\N	4	gray	Medium Fast	10	7	[]	{}	f	f	f	f	f	f	f
1090	778	0	mimikyu	Mimikyu	Disguised Form	ghost	fairy	amorphous	\N	mf	\N	4	yellow	Medium Fast	13	7	[]	{}	f	f	f	f	f	f	f
1091	779	0	bruxish	Bruxish	\N	water	psychic	water_2	\N	mf	\N	4	pink	Medium Fast	3	7	[]	{}	f	f	f	f	f	f	f
1092	780	0	drampa	Drampa	\N	normal	dragon	monster	dragon	mf	\N	4	white	Medium Fast	13	7	[]	{}	f	f	f	f	f	f	f
1093	780	1	drampa-mega	Drampa	Mega Drampa	normal	dragon	monster	dragon	mf	\N	4	black	Medium Fast	13	9	[]	{}	t	t	f	f	f	f	f
1094	781	0	dhelmise	Dhelmise	\N	ghost	grass	mineral	\N	uk	\N	-1	green	Medium Fast	9	7	[]	{}	f	f	f	f	f	f	f
1095	782	0	jangmo-o	Jangmo-o	\N	dragon	\N	dragon	\N	mf	\N	4	gray	Slow	5	7	[[783, 0]]	{}	f	f	f	f	f	f	f
1096	783	0	hakamo-o	Hakamo-o	\N	dragon	fighting	dragon	\N	mf	\N	4	gray	Slow	10	7	[[784, 0]]	{}	f	f	f	f	f	f	f
1097	784	0	kommo-o	Kommo-o	\N	dragon	fighting	dragon	\N	mf	\N	4	gray	Slow	10	7	[]	{}	f	f	f	f	f	f	f
1098	785	0	tapu-koko	Tapu Koko	\N	electric	fairy	undiscovered	\N	uk	\N	-1	yellow	Slow	14	7	[]	{}	f	f	f	f	f	t	f
1099	786	0	tapu-lele	Tapu Lele	\N	psychic	fairy	undiscovered	\N	uk	\N	-1	pink	Slow	14	7	[]	{}	f	f	f	f	f	t	f
1100	787	0	tapu-bulu	Tapu Bulu	\N	grass	fairy	undiscovered	\N	uk	\N	-1	red	Slow	14	7	[]	{}	f	f	f	f	f	t	f
1101	788	0	tapu-fini	Tapu Fini	\N	water	fairy	undiscovered	\N	uk	\N	-1	purple	Slow	14	7	[]	{}	f	f	f	f	f	t	f
1102	789	0	cosmog	Cosmog	\N	psychic	\N	undiscovered	\N	uk	\N	-1	blue	Slow	1	7	[[790, 0]]	{}	f	f	f	t	f	f	f
1103	790	0	cosmoem	Cosmoem	\N	psychic	\N	undiscovered	\N	uk	\N	-1	blue	Slow	1	7	[[791, 0], [792, 0]]	{}	f	f	f	t	f	f	f
1104	791	0	solgaleo	Solgaleo	\N	psychic	steel	undiscovered	\N	uk	\N	-1	white	Slow	5	7	[]	{}	f	f	f	t	f	f	f
1105	792	0	lunala	Lunala	\N	psychic	ghost	undiscovered	\N	uk	\N	-1	purple	Slow	12	7	[]	{}	f	f	f	t	f	f	f
1106	793	0	nihilego	Nihilego	\N	rock	poison	undiscovered	\N	uk	\N	-1	white	Slow	8	7	[]	{}	f	f	f	f	f	f	f
1107	794	0	buzzwole	Buzzwole	\N	bug	fighting	undiscovered	\N	uk	\N	-1	red	Slow	8	7	[]	{}	f	f	f	f	f	f	f
1108	795	0	pheromosa	Pheromosa	\N	bug	fighting	undiscovered	\N	uk	\N	-1	white	Slow	11	7	[]	{}	f	f	f	f	f	f	f
1109	796	0	xurkitree	Xurkitree	\N	electric	\N	undiscovered	\N	uk	\N	-1	black	Slow	10	7	[]	{}	f	f	f	f	f	f	f
1110	797	0	celesteela	Celesteela	\N	steel	flying	undiscovered	\N	uk	\N	-1	green	Slow	11	7	[]	{}	f	f	f	f	f	f	f
1111	798	0	kartana	Kartana	\N	grass	steel	undiscovered	\N	uk	\N	-1	white	Slow	11	7	[]	{}	f	f	f	f	f	f	f
1112	799	0	guzzlord	Guzzlord	\N	dark	dragon	undiscovered	\N	uk	\N	-1	black	Slow	10	7	[]	{}	f	f	f	f	f	f	f
1113	800	0	necrozma	Necrozma	\N	psychic	\N	undiscovered	\N	uk	\N	-1	black	Slow	14	7	[]	{}	f	f	f	t	f	f	f
1114	800	1	necrozma-dusk	Necrozma	Dusk Mane	psychic	steel	undiscovered	\N	uk	\N	-1	yellow	Slow	5	7	[]	{}	f	f	f	t	f	f	f
1115	800	2	necrozma-dawn	Necrozma	Dawn Wings	psychic	ghost	undiscovered	\N	uk	\N	-1	blue	Slow	12	7	[]	{}	f	f	f	t	f	f	f
1116	800	3	necrozma-ultra	Necrozma	Ultra Necrozma	psychic	dragon	undiscovered	\N	uk	\N	-1	yellow	Slow	6	7	[]	{}	f	t	f	t	f	f	f
1117	801	0	magearna	Magearna	\N	steel	fairy	undiscovered	\N	uk	\N	-1	gray	Slow	11	7	[]	{}	f	f	f	f	t	f	f
1118	801	1	magearna-original	Magearna	Original Color	steel	fairy	undiscovered	\N	uk	\N	-1	red	Slow	11	7	[]	{}	f	f	f	f	t	f	f
1119	801	2	magearna-mega	Magearna	Mega Magearna	steel	fairy	undiscovered	\N	uk	\N	-1	red	Slow	11	9	[]	{}	t	t	f	f	t	f	f
1120	801	3	magearna-original-mega	Magearna	Mega Magearna	steel	fairy	undiscovered	\N	uk	\N	-1	red	Slow	11	9	[]	{}	t	t	f	f	t	f	f
1121	802	0	marshadow	Marshadow	\N	fighting	ghost	undiscovered	\N	uk	\N	-1	gray	Slow	11	7	[]	{}	f	f	f	f	t	f	f
1122	803	0	poipole	Poipole	\N	poison	\N	undiscovered	\N	uk	\N	-1	purple	Slow	10	7	[[804, 0]]	{}	f	f	f	f	f	f	f
1123	804	0	naganadel	Naganadel	\N	poison	dragon	undiscovered	\N	uk	\N	-1	purple	Slow	12	7	[]	{}	f	f	f	f	f	f	f
1124	805	0	stakataka	Stakataka	\N	rock	steel	undiscovered	\N	uk	\N	-1	gray	Slow	5	7	[]	{}	f	f	f	f	f	f	f
1125	806	0	blacephalon	Blacephalon	\N	fire	ghost	undiscovered	\N	uk	\N	-1	white	Slow	11	7	[]	{}	f	f	f	f	f	f	f
1126	807	0	zeraora	Zeraora	\N	electric	\N	undiscovered	\N	uk	\N	-1	yellow	Slow	11	7	[]	{}	f	f	f	f	t	f	f
1127	807	1	zeraora-mega	Zeraora	Mega Zeraora	electric	\N	undiscovered	\N	uk	\N	-1	black	Slow	11	9	[]	{}	t	t	f	f	t	f	f
1128	808	0	meltan	Meltan	\N	steel	\N	undiscovered	\N	uk	\N	-1	gray	Slow	1	7	[[809, 0]]	{}	f	f	f	f	t	f	f
1129	809	0	melmetal	Melmetal	\N	steel	\N	undiscovered	\N	uk	\N	-1	gray	Slow	11	7	[]	{}	f	f	t	f	t	f	f
1130	810	0	grookey	Grookey	\N	grass	\N	field	grass	mf	\N	1	green	Medium Slow	10	8	[[811, 0]]	{}	f	f	f	f	f	f	f
1131	811	0	thwackey	Thwackey	\N	grass	\N	field	grass	mf	\N	1	green	Medium Slow	10	8	[[812, 0]]	{}	f	f	f	f	f	f	f
1132	812	0	rillaboom	Rillaboom	\N	grass	\N	field	grass	mf	\N	1	green	Medium Slow	11	8	[]	{}	f	f	t	f	f	f	f
1133	813	0	scorbunny	Scorbunny	\N	fire	\N	field	human_like	mf	\N	1	white	Medium Slow	10	8	[[814, 0]]	{}	f	f	f	f	f	f	f
1134	814	0	raboot	Raboot	\N	fire	\N	field	human_like	mf	\N	1	gray	Medium Slow	10	8	[[815, 0]]	{}	f	f	f	f	f	f	f
1135	815	0	cinderace	Cinderace	\N	fire	\N	field	human_like	mf	\N	1	white	Medium Slow	10	8	[]	{}	f	f	t	f	f	f	f
1136	816	0	sobble	Sobble	\N	water	\N	water_1	field	mf	\N	1	blue	Medium Slow	5	8	[[817, 0]]	{}	f	f	f	f	f	f	f
1137	817	0	drizzile	Drizzile	\N	water	\N	water_1	field	mf	\N	1	blue	Medium Slow	10	8	[[818, 0]]	{}	f	f	f	f	f	f	f
1138	818	0	inteleon	Inteleon	\N	water	\N	water_1	field	mf	\N	1	blue	Medium Slow	10	8	[]	{}	f	f	t	f	f	f	f
1139	819	0	skwovet	Skwovet	\N	normal	\N	field	\N	mf	\N	4	brown	Medium Fast	10	8	[[820, 0]]	{}	f	f	f	f	f	f	f
1140	820	0	greedent	Greedent	\N	normal	\N	field	\N	mf	\N	4	brown	Medium Fast	10	8	[]	{}	f	f	f	f	f	f	f
1141	821	0	rookidee	Rookidee	\N	flying	\N	flying	\N	mf	\N	4	blue	Medium Slow	12	8	[[822, 0]]	{}	f	f	f	f	f	f	f
1142	822	0	corvisquire	Corvisquire	\N	flying	\N	flying	\N	mf	\N	4	blue	Medium Slow	12	8	[[823, 0]]	{}	f	f	f	f	f	f	f
1143	823	0	corviknight	Corviknight	\N	flying	steel	flying	\N	mf	\N	4	purple	Medium Slow	12	8	[]	{}	f	f	t	f	f	f	f
1144	824	0	blipbug	Blipbug	\N	bug	\N	bug	\N	mf	\N	4	blue	Medium Fast	4	8	[[825, 0]]	{}	f	f	f	f	f	f	f
1145	825	0	dottler	Dottler	\N	bug	psychic	bug	\N	mf	\N	4	yellow	Medium Fast	4	8	[[826, 0]]	{}	f	f	f	f	f	f	f
1146	826	0	orbeetle	Orbeetle	\N	bug	psychic	bug	\N	mf	\N	4	red	Medium Fast	12	8	[]	{}	f	f	t	f	f	f	f
1147	827	0	nickit	Nickit	\N	dark	\N	field	\N	mf	\N	4	brown	Fast	5	8	[[828, 0]]	{}	f	f	f	f	f	f	f
1148	828	0	thievul	Thievul	\N	dark	\N	field	\N	mf	\N	4	brown	Fast	5	8	[]	{}	f	f	f	f	f	f	f
1149	829	0	gossifleur	Gossifleur	\N	grass	\N	grass	\N	mf	\N	4	green	Medium Fast	9	8	[[830, 0]]	{}	f	f	f	f	f	f	f
1150	830	0	eldegoss	Eldegoss	\N	grass	\N	grass	\N	mf	\N	4	green	Medium Fast	9	8	[]	{}	f	f	f	f	f	f	f
1151	831	0	wooloo	Wooloo	\N	normal	\N	field	\N	mf	\N	4	white	Medium Fast	5	8	[[832, 0]]	{}	f	f	f	f	f	f	f
1152	832	0	dubwool	Dubwool	\N	normal	\N	field	\N	mf	\N	4	white	Medium Fast	5	8	[]	{}	f	f	f	f	f	f	f
1153	833	0	chewtle	Chewtle	\N	water	\N	monster	water_1	mf	\N	4	green	Medium Fast	5	8	[[834, 0]]	{}	f	f	f	f	f	f	f
1154	834	0	drednaw	Drednaw	\N	water	rock	monster	water_1	mf	\N	4	green	Medium Fast	5	8	[]	{}	f	f	t	f	f	f	f
1155	835	0	yamper	Yamper	\N	electric	\N	field	\N	mf	\N	4	yellow	Fast	5	8	[[836, 0]]	{}	f	f	f	f	f	f	f
1156	836	0	boltund	Boltund	\N	electric	\N	field	\N	mf	\N	4	yellow	Fast	5	8	[]	{}	f	f	f	f	f	f	f
1157	837	0	rolycoly	Rolycoly	\N	rock	\N	mineral	\N	mf	\N	4	black	Medium Slow	1	8	[[838, 0]]	{}	f	f	f	f	f	f	f
1158	838	0	carkol	Carkol	\N	rock	fire	mineral	\N	mf	\N	4	black	Medium Slow	2	8	[[839, 0]]	{}	f	f	f	f	f	f	f
1159	839	0	coalossal	Coalossal	\N	rock	fire	mineral	\N	mf	\N	4	black	Medium Slow	11	8	[]	{}	f	f	t	f	f	f	f
1160	840	0	applin	Applin	\N	grass	dragon	grass	dragon	mf	\N	4	green	Erratic	13	8	[[841, 0], [842, 0], [1011, 0]]	{}	f	f	f	f	f	f	f
1161	841	0	flapple	Flapple	\N	grass	dragon	grass	dragon	mf	\N	4	green	Erratic	12	8	[]	{}	f	f	t	f	f	f	f
1162	842	0	appletun	Appletun	\N	grass	dragon	grass	dragon	mf	\N	4	green	Erratic	5	8	[]	{}	f	f	t	f	f	f	f
1163	843	0	silicobra	Silicobra	\N	ground	\N	field	dragon	mf	\N	4	green	Medium Fast	13	8	[[844, 0]]	{}	f	f	f	f	f	f	f
1164	844	0	sandaconda	Sandaconda	\N	ground	\N	field	dragon	mf	\N	4	green	Medium Fast	13	8	[]	{}	f	f	t	f	f	f	f
1165	845	0	cramorant	Cramorant	\N	flying	water	water_1	flying	mf	\N	4	blue	Medium Fast	12	8	[]	{}	f	f	f	f	f	f	f
1166	846	0	arrokuda	Arrokuda	\N	water	\N	water_2	\N	mf	\N	4	brown	Slow	3	8	[[847, 0]]	{}	f	f	f	f	f	f	f
1167	847	0	barraskewda	Barraskewda	\N	water	\N	water_2	\N	mf	\N	4	brown	Slow	3	8	[]	{}	f	f	f	f	f	f	f
1168	848	0	toxel	Toxel	\N	electric	poison	undiscovered	\N	mf	\N	4	purple	Medium Slow	10	8	[[849, 0], [849, 1]]	{}	f	f	f	f	f	f	f
1169	849	0	toxtricity	Toxtricity	Amped Form	electric	poison	human_like	\N	mf	\N	4	purple	Medium Slow	10	8	[]	{}	f	f	t	f	f	f	f
1170	849	1	toxtricity-low-key	Toxtricity	Low Key Form	electric	poison	human_like	\N	mf	\N	4	purple	Medium Slow	10	8	[]	{}	f	f	t	f	f	f	f
1171	850	0	sizzlipede	Sizzlipede	\N	fire	bug	bug	\N	mf	\N	4	red	Medium Fast	8	8	[[851, 0]]	{}	f	f	f	f	f	f	f
1172	851	0	centiskorch	Centiskorch	\N	fire	bug	bug	\N	mf	\N	4	red	Medium Fast	8	8	[]	{}	f	f	t	f	f	f	f
1173	852	0	clobbopus	Clobbopus	\N	fighting	\N	water_1	human_like	mf	\N	4	brown	Medium Slow	8	8	[[853, 0]]	{}	f	f	f	f	f	f	f
1174	853	0	grapploct	Grapploct	\N	fighting	\N	water_1	human_like	mf	\N	4	blue	Medium Slow	8	8	[]	{}	f	f	f	f	f	f	f
1175	854	0	sinistea	Sinistea	\N	ghost	\N	mineral	amorphous	uk	\N	-1	purple	Medium Fast	1	8	[[855, 0]]	{}	f	f	f	f	f	f	f
1176	855	0	polteageist	Polteageist	\N	ghost	\N	mineral	amorphous	uk	\N	-1	purple	Medium Fast	1	8	[]	{}	f	f	f	f	f	f	f
1177	856	0	hatenna	Hatenna	\N	psychic	\N	fairy	\N	fo	\N	8	pink	Slow	2	8	[[857, 0]]	{}	f	f	f	f	f	f	f
1178	857	0	hattrem	Hattrem	\N	psychic	\N	fairy	\N	fo	\N	8	pink	Slow	11	8	[[858, 0]]	{}	f	f	f	f	f	f	f
1179	858	0	hatterene	Hatterene	\N	psychic	fairy	fairy	\N	fo	\N	8	pink	Slow	9	8	[]	{}	f	f	t	f	f	f	f
1180	859	0	impidimp	Impidimp	\N	dark	fairy	fairy	human_like	mo	\N	0	pink	Medium Fast	11	8	[[860, 0]]	{}	f	f	f	f	f	f	f
1181	860	0	morgrem	Morgrem	\N	dark	fairy	fairy	human_like	mo	\N	0	pink	Medium Fast	11	8	[[861, 0]]	{}	f	f	f	f	f	f	f
1182	861	0	grimmsnarl	Grimmsnarl	\N	dark	fairy	fairy	human_like	mo	\N	0	purple	Medium Fast	11	8	[]	{}	f	f	t	f	f	f	f
1183	862	0	obstagoon	Obstagoon	\N	dark	normal	field	\N	mf	\N	4	gray	Medium Fast	10	8	[]	{}	f	f	f	f	f	f	f
1184	863	0	perrserker	Perrserker	\N	steel	\N	field	\N	mf	\N	4	brown	Medium Fast	10	8	[]	{}	f	f	f	f	f	f	f
1185	864	0	cursola	Cursola	\N	ghost	\N	water_1	water_3	mf	\N	6	white	Fast	14	8	[]	{}	f	f	f	f	f	f	f
1186	865	0	sirfetchd	Sirfetch'd	\N	fighting	\N	flying	field	mf	\N	4	white	Medium Fast	12	8	[]	{}	f	f	f	f	f	f	f
1187	866	0	mr-rime	Mr. Rime	\N	ice	psychic	human_like	\N	mf	\N	4	purple	Medium Fast	11	8	[]	{}	f	f	f	f	f	f	f
1188	867	0	runerigus	Runerigus	\N	ground	ghost	mineral	amorphous	mf	\N	4	gray	Medium Fast	9	8	[]	{}	f	f	f	f	f	f	f
1189	868	0	milcery	Milcery	\N	fairy	\N	fairy	amorphous	fo	\N	8	white	Medium Fast	1	8	[[869, 0], [869, 1], [869, 2], [869, 3], [869, 4], [869, 5], [869, 6], [869, 7], [869, 8]]	{}	f	f	f	f	f	f	f
1190	869	0	alcremie	Alcremie	Vanilla Cream	fairy	\N	fairy	amorphous	fo	\N	8	white	Medium Fast	9	8	[]	{}	f	f	t	f	f	f	f
1191	869	1	alcremie-ruby-cream	Alcremie	Ruby Cream	fairy	\N	fairy	amorphous	fo	\N	8	pink	Medium Fast	9	8	[]	{}	f	f	t	f	f	f	f
1192	869	2	alcremie-matcha-cream	Alcremie	Matcha Cream	fairy	\N	fairy	amorphous	fo	\N	8	green	Medium Fast	9	8	[]	{}	f	f	t	f	f	f	f
1193	869	3	alcremie-mint-cream	Alcremie	Mint Cream	fairy	\N	fairy	amorphous	fo	\N	8	blue	Medium Fast	9	8	[]	{}	f	f	t	f	f	f	f
1194	869	4	alcremie-lemon-cream	Alcremie	Lemon Cream	fairy	\N	fairy	amorphous	fo	\N	8	yellow	Medium Fast	9	8	[]	{}	f	f	t	f	f	f	f
1195	869	5	alcremie-salted-cream	Alcremie	Salted Cream	fairy	\N	fairy	amorphous	fo	\N	8	white	Medium Fast	9	8	[]	{}	f	f	t	f	f	f	f
1196	869	6	alcremie-ruby-swirl	Alcremie	Ruby Swirl	fairy	\N	fairy	amorphous	fo	\N	8	yellow	Medium Fast	9	8	[]	{}	f	f	t	f	f	f	f
1197	869	7	alcremie-caramel-swirl	Alcremie	Caramel Swirl	fairy	\N	fairy	amorphous	fo	\N	8	brown	Medium Fast	9	8	[]	{}	f	f	t	f	f	f	f
1198	869	8	alcremie-rainbow-swirl	Alcremie	Rainbow Swirl	fairy	\N	fairy	amorphous	fo	\N	8	yellow	Medium Fast	9	8	[]	{}	f	f	t	f	f	f	f
1199	870	0	falinks	Falinks	\N	fighting	\N	fairy	mineral	uk	\N	-1	yellow	Medium Fast	7	8	[]	{}	f	f	f	f	f	f	f
1200	870	1	falinks-mega	Falinks	Mega Falinks	fighting	\N	fairy	mineral	uk	\N	-1	yellow	Medium Fast	7	9	[]	{}	t	t	f	f	f	f	f
1201	871	0	pincurchin	Pincurchin	\N	electric	\N	water_1	amorphous	mf	\N	4	purple	Medium Fast	8	8	[]	{}	f	f	f	f	f	f	f
1202	872	0	snom	Snom	\N	ice	bug	bug	\N	mf	\N	4	white	Medium Fast	13	8	[[873, 0]]	{}	f	f	f	f	f	f	f
1203	873	0	frosmoth	Frosmoth	\N	ice	bug	bug	\N	mf	\N	4	white	Medium Fast	6	8	[]	{}	f	f	f	f	f	f	f
1204	874	0	stonjourner	Stonjourner	\N	rock	\N	mineral	\N	mf	\N	4	gray	Slow	2	8	[]	{}	f	f	f	f	f	f	f
1205	875	0	eiscue	Eiscue	Ice Face	ice	\N	water_1	field	mf	\N	4	blue	Slow	10	8	[]	{}	f	f	f	f	f	f	f
1206	875	1	eiscue-noice	Eiscue	Noice Face	ice	\N	water_1	field	mf	\N	4	blue	Slow	10	8	[]	{}	f	t	f	f	f	f	f
1207	876	0	indeedee	Indeedee	Male	psychic	normal	fairy	\N	mo	\N	0	purple	Fast	10	8	[]	{}	f	f	f	f	f	f	f
1208	876	1	indeedee-female	Indeedee	Female	psychic	normal	fairy	\N	fo	\N	8	purple	Fast	10	8	[]	{}	f	f	f	f	f	f	f
1209	877	0	morpeko	Morpeko	Full Belly Mode	electric	dark	field	fairy	mf	\N	4	yellow	Medium Fast	11	8	[]	{}	f	f	f	f	f	f	f
1210	877	1	morpeko-hangry	Morpeko	Hangry Mode	electric	dark	field	fairy	mf	\N	4	purple	Medium Fast	11	8	[]	{}	f	t	f	f	f	f	f
1211	878	0	cufant	Cufant	\N	steel	\N	field	mineral	mf	\N	4	yellow	Medium Fast	5	8	[[879, 0]]	{}	f	f	f	f	f	f	f
1212	879	0	copperajah	Copperajah	\N	steel	\N	field	mineral	mf	\N	4	green	Medium Fast	5	8	[]	{}	f	f	t	f	f	f	f
1213	880	0	dracozolt	Dracozolt	\N	electric	dragon	undiscovered	\N	uk	\N	-1	green	Slow	10	8	[]	{}	f	f	f	f	f	f	f
1214	881	0	arctozolt	Arctozolt	\N	electric	ice	undiscovered	\N	uk	\N	-1	blue	Slow	10	8	[]	{}	f	f	f	f	f	f	f
1215	882	0	dracovish	Dracovish	\N	water	dragon	undiscovered	\N	uk	\N	-1	green	Slow	2	8	[]	{}	f	f	f	f	f	f	f
1216	883	0	arctovish	Arctovish	\N	water	ice	undiscovered	\N	uk	\N	-1	blue	Slow	3	8	[]	{}	f	f	f	f	f	f	f
1217	884	0	duraludon	Duraludon	\N	steel	dragon	mineral	dragon	mf	\N	4	white	Medium Fast	10	8	[[1018, 0]]	{}	f	f	t	f	f	f	f
1218	885	0	dreepy	Dreepy	\N	dragon	ghost	amorphous	dragon	mf	\N	4	green	Slow	13	8	[[886, 0]]	{}	f	f	f	f	f	f	f
1219	886	0	drakloak	Drakloak	\N	dragon	ghost	amorphous	dragon	mf	\N	4	green	Slow	14	8	[[887, 0]]	{}	f	f	f	f	f	f	f
1220	887	0	dragapult	Dragapult	\N	dragon	ghost	amorphous	dragon	mf	\N	4	green	Slow	10	8	[]	{}	f	f	f	f	f	f	f
1221	888	0	zacian	Zacian	Hero of Many Battles	fairy	\N	undiscovered	\N	uk	\N	-1	blue	Slow	5	8	[]	{}	f	f	f	t	f	f	f
1222	888	1	zacian-crowned	Zacian	Crowned Sword	fairy	steel	undiscovered	\N	uk	\N	-1	blue	Slow	5	8	[]	{}	f	f	f	t	f	f	f
1223	889	0	zamazenta	Zamazenta	Hero of Many Battles	fighting	\N	undiscovered	\N	uk	\N	-1	red	Slow	5	8	[]	{}	f	f	f	t	f	f	f
1224	889	1	zamazenta-crowned	Zamazenta	Crowned Shield	fighting	steel	undiscovered	\N	uk	\N	-1	red	Slow	5	8	[]	{}	f	f	f	t	f	f	f
1225	890	0	eternatus	Eternatus	\N	poison	dragon	undiscovered	\N	uk	\N	-1	purple	Slow	12	8	[]	{}	f	f	f	t	f	f	f
1226	890	1	eternatus-eternamax	Eternatus	Eternamax	poison	dragon	undiscovered	\N	uk	\N	-1	purple	Slow	13	8	[]	{}	f	t	f	t	f	f	f
1227	891	0	kubfu	Kubfu	\N	fighting	\N	undiscovered	\N	mf	\N	1	gray	Slow	10	8	[[892, 0], [892, 1]]	{}	f	f	f	f	f	t	f
1228	892	0	urshifu	Urshifu	Single Strike Style	fighting	dark	undiscovered	\N	mf	\N	1	gray	Slow	11	8	[]	{}	f	f	t	f	f	t	f
1229	892	1	urshifu-rapid-strike	Urshifu	Rapid Strike Style	fighting	water	undiscovered	\N	mf	\N	1	gray	Slow	11	8	[]	{}	f	f	t	f	f	t	f
1230	893	0	zarude	Zarude	\N	dark	grass	undiscovered	\N	uk	\N	-1	black	Slow	10	8	[]	{}	f	f	f	f	t	f	f
1231	894	0	regieleki	Regieleki	\N	electric	\N	undiscovered	\N	uk	\N	-1	yellow	Slow	11	8	[]	{}	f	f	f	f	f	t	f
1232	895	0	regidrago	Regidrago	\N	dragon	\N	undiscovered	\N	uk	\N	-1	green	Slow	11	8	[]	{}	f	f	f	f	f	t	f
1233	896	0	glastrier	Glastrier	\N	ice	\N	undiscovered	\N	uk	\N	-1	white	Slow	5	8	[]	{}	f	f	f	f	f	t	f
1234	897	0	spectrier	Spectrier	\N	ghost	\N	undiscovered	\N	uk	\N	-1	black	Slow	5	8	[]	{}	f	f	f	f	f	t	f
1235	898	0	calyrex	Calyrex	\N	psychic	grass	undiscovered	\N	uk	\N	-1	green	Slow	11	8	[]	{}	f	f	f	t	f	f	f
1236	898	1	calyrex-ice	Calyrex	Ice Rider	psychic	ice	undiscovered	\N	uk	\N	-1	white	Slow	5	8	[]	{}	f	f	f	t	f	f	f
1237	898	2	calyrex-shadow	Calyrex	Shadow Rider	psychic	ghost	undiscovered	\N	uk	\N	-1	black	Slow	5	8	[]	{}	f	f	f	t	f	f	f
1238	899	0	wyrdeer	Wyrdeer	\N	normal	psychic	field	\N	mf	\N	4	gray	Slow	5	8	[]	{}	f	f	f	f	f	f	f
1239	900	0	kleavor	Kleavor	\N	bug	rock	bug	\N	mf	\N	4	brown	Medium Fast	6	8	[]	{}	f	f	f	f	f	f	f
1240	901	0	ursaluna	Ursaluna	\N	ground	normal	field	\N	mf	\N	4	brown	Medium Fast	5	8	[]	{}	f	f	f	f	f	f	f
1241	901	1	ursaluna-bloodmoon	Ursaluna	Bloodmoon	ground	normal	field	\N	mo	\N	0	brown	Medium Fast	10	8	[]	{}	f	f	f	f	f	f	f
1242	902	0	basculegion	Basculegion	Male	water	ghost	water_2	\N	md	\N	0	green	Medium Fast	3	8	[]	{}	f	f	f	f	f	f	f
1243	902	1	basculegion-female	Basculegion	Female	water	ghost	water_2	\N	fd	\N	8	green	Medium Fast	3	8	[]	{}	f	f	f	f	f	f	f
1244	903	0	sneasler	Sneasler	\N	fighting	poison	field	\N	mf	\N	4	blue	Medium Slow	10	8	[]	{}	f	f	f	f	f	f	f
1245	904	0	overqwil	Overqwil	\N	dark	poison	water_2	\N	mf	\N	4	black	Medium Fast	3	8	[]	{}	f	f	f	f	f	f	f
1246	905	0	enamorus	Enamorus	Incarnate Forme	fairy	flying	undiscovered	\N	fd	\N	8	pink	Slow	14	8	[]	{}	f	f	f	f	f	t	f
1247	905	1	enamorus-therian	Enamorus	Therian Forme	fairy	flying	undiscovered	\N	fd	\N	8	pink	Slow	5	8	[]	{}	f	f	f	f	f	t	f
1248	906	0	sprigatito	Sprigatito	\N	grass	\N	field	grass	mf	\N	1	green	Medium Slow	5	9	[[907, 0]]	{}	f	f	f	f	f	f	f
1249	907	0	floragato	Floragato	\N	grass	\N	field	grass	mf	\N	1	green	Medium Slow	10	9	[[908, 0]]	{}	f	f	f	f	f	f	f
1250	908	0	meowscarada	Meowscarada	\N	grass	dark	field	grass	mf	\N	1	green	Medium Slow	10	9	[]	{}	f	f	f	f	f	f	f
1251	909	0	fuecoco	Fuecoco	\N	fire	\N	field	\N	mf	\N	1	red	Medium Slow	10	9	[[910, 0]]	{}	f	f	f	f	f	f	f
1252	910	0	crocalor	Crocalor	\N	fire	\N	field	\N	mf	\N	1	red	Medium Slow	10	9	[[911, 0]]	{}	f	f	f	f	f	f	f
1253	911	0	skeledirge	Skeledirge	\N	fire	ghost	field	\N	mf	\N	1	red	Medium Slow	5	9	[]	{}	f	f	f	f	f	f	f
1254	912	0	quaxly	Quaxly	\N	water	\N	flying	water_1	mf	\N	1	blue	Medium Slow	10	9	[[913, 0]]	{}	f	f	f	f	f	f	f
1255	913	0	quaxwell	Quaxwell	\N	water	\N	flying	water_1	mf	\N	1	blue	Medium Slow	10	9	[[914, 0]]	{}	f	f	f	f	f	f	f
1256	914	0	quaquaval	Quaquaval	\N	water	fighting	flying	water_1	mf	\N	1	blue	Medium Slow	10	9	[]	{}	f	f	f	f	f	f	f
1257	915	0	lechonk	Lechonk	\N	normal	\N	field	\N	mf	\N	4	gray	Medium Fast	5	9	[[916, 0], [916, 1]]	{}	f	f	f	f	f	f	f
1258	916	0	oinkologne	Oinkologne	Male	normal	\N	field	\N	md	\N	0	gray	Medium Fast	5	9	[]	{}	f	f	f	f	f	f	f
1259	916	1	oinkologne-female	Oinkologne	Female	normal	\N	field	\N	fd	\N	0	brown	Medium Fast	5	9	[]	{}	f	f	f	f	f	f	f
1260	917	0	tarountula	Tarountula	\N	bug	\N	bug	\N	mf	\N	4	white	Erratic	4	9	[[918, 0]]	{}	f	f	f	f	f	f	f
1261	918	0	spidops	Spidops	\N	bug	\N	bug	\N	mf	\N	4	green	Erratic	4	9	[]	{}	f	f	f	f	f	f	f
1262	919	0	nymble	Nymble	\N	bug	\N	bug	\N	mf	\N	4	gray	Medium Fast	4	9	[[920, 0]]	{}	f	f	f	f	f	f	f
1263	920	0	lokix	Lokix	\N	bug	dark	bug	\N	mf	\N	4	gray	Medium Fast	11	9	[]	{}	f	f	f	f	f	f	f
1264	921	0	pawmi	Pawmi	\N	electric	\N	field	\N	mf	\N	4	yellow	Medium Fast	10	9	[[922, 0]]	{}	f	f	f	f	f	f	f
1265	922	0	pawmo	Pawmo	\N	electric	fighting	field	\N	mf	\N	4	yellow	Medium Fast	10	9	[[923, 0]]	{}	f	f	f	f	f	f	f
1266	923	0	pawmot	Pawmot	\N	electric	fighting	field	\N	mf	\N	4	yellow	Medium Fast	10	9	[]	{}	f	f	f	f	f	f	f
1267	924	0	tandemaus	Tandemaus	\N	normal	\N	field	fairy	uk	\N	-1	white	Fast	7	9	[[925, 0], [925, 1]]	{}	f	f	f	f	f	f	f
1268	925	0	maushold	Maushold	Family of Three	normal	\N	field	fairy	uk	\N	-1	white	Fast	7	9	[]	{}	f	f	f	f	f	f	f
1269	925	1	maushold-four	Maushold	Family of Four	normal	\N	field	fairy	uk	\N	-1	white	Fast	7	9	[]	{}	f	f	f	f	f	f	f
1270	926	0	fidough	Fidough	\N	fairy	\N	field	mineral	mf	\N	4	yellow	Medium Slow	5	9	[[927, 0]]	{}	f	f	f	f	f	f	f
1271	927	0	dachsbun	Dachsbun	\N	fairy	\N	field	mineral	mf	\N	4	brown	Medium Slow	5	9	[]	{}	f	f	f	f	f	f	f
1272	928	0	smoliv	Smoliv	\N	grass	normal	grass	\N	mf	\N	4	green	Medium Slow	2	9	[[929, 0]]	{}	f	f	f	f	f	f	f
1273	929	0	dolliv	Dolliv	\N	grass	normal	grass	\N	mf	\N	4	green	Medium Slow	11	9	[[930, 0]]	{}	f	f	f	f	f	f	f
1274	930	0	arboliva	Arboliva	\N	grass	normal	grass	\N	mf	\N	4	green	Medium Slow	11	9	[]	{}	f	f	f	f	f	f	f
1275	931	0	squawkabilly	Squawkabilly	Green Plumage	normal	flying	flying	\N	mf	\N	4	green	Erratic	12	9	[]	{}	f	f	f	f	f	f	f
1276	931	1	squawkabilly-blue	Squawkabilly	Blue Plumage	normal	flying	flying	\N	mf	\N	4	blue	Erratic	12	9	[]	{}	f	f	f	f	f	f	f
1277	931	2	squawkabilly-yellow	Squawkabilly	Yellow Plumage	normal	flying	flying	\N	mf	\N	4	yellow	Erratic	12	9	[]	{}	f	f	f	f	f	f	f
1278	931	3	squawkabilly-white	Squawkabilly	White Plumage	normal	flying	flying	\N	mf	\N	4	white	Erratic	12	9	[]	{}	f	f	f	f	f	f	f
1279	932	0	nacli	Nacli	\N	rock	\N	mineral	\N	mf	\N	4	brown	Medium Slow	1	9	[[933, 0]]	{}	f	f	f	f	f	f	f
1280	933	0	naclstack	Naclstack	\N	rock	\N	mineral	\N	mf	\N	4	brown	Medium Slow	5	9	[[934, 0]]	{}	f	f	f	f	f	f	f
1281	934	0	garganacl	Garganacl	\N	rock	\N	mineral	\N	mf	\N	4	brown	Medium Slow	11	9	[]	{}	f	f	f	f	f	f	f
1282	935	0	charcadet	Charcadet	\N	fire	\N	human_like	\N	mf	\N	4	red	Slow	11	9	[[936, 0], [937, 0]]	{}	f	f	f	f	f	f	f
1283	936	0	armarouge	Armarouge	\N	fire	psychic	human_like	\N	mf	\N	4	red	Slow	11	9	[]	{}	f	f	f	f	f	f	f
1284	937	0	ceruledge	Ceruledge	\N	fire	ghost	human_like	\N	mf	\N	4	purple	Slow	11	9	[]	{}	f	f	f	f	f	f	f
1285	938	0	tadbulb	Tadbulb	\N	electric	\N	water_1	\N	mf	\N	4	yellow	Medium Fast	1	9	[[939, 0]]	{}	f	f	f	f	f	f	f
1286	939	0	bellibolt	Bellibolt	\N	electric	\N	water_1	\N	mf	\N	4	green	Medium Fast	11	9	[]	{}	f	f	f	f	f	f	f
1287	940	0	wattrel	Wattrel	\N	electric	flying	water_1	flying	mf	\N	4	black	Medium Slow	12	9	[[941, 0]]	{}	f	f	f	f	f	f	f
1288	941	0	kilowattrel	Kilowattrel	\N	electric	flying	water_1	flying	mf	\N	4	yellow	Medium Slow	12	9	[]	{}	f	f	f	f	f	f	f
1289	942	0	maschiff	Maschiff	\N	dark	\N	field	\N	mf	\N	4	brown	Medium Slow	5	9	[[943, 0]]	{}	f	f	f	f	f	f	f
1290	943	0	mabosstiff	Mabosstiff	\N	dark	\N	field	\N	mf	\N	4	gray	Medium Slow	5	9	[]	{}	f	f	f	f	f	f	f
1291	944	0	shroodle	Shroodle	\N	poison	normal	field	\N	mf	\N	4	gray	Medium Slow	5	9	[[945, 0]]	{}	f	f	f	f	f	f	f
1292	945	0	grafaiai	Grafaiai	\N	poison	normal	field	\N	mf	\N	4	gray	Medium Slow	10	9	[]	{}	f	f	f	f	f	f	f
1293	946	0	bramblin	Bramblin	\N	grass	ghost	grass	\N	mf	\N	4	brown	Medium Fast	1	9	[[947, 0]]	{}	f	f	f	f	f	f	f
1294	947	0	brambleghast	Brambleghast	\N	grass	ghost	grass	\N	mf	\N	4	brown	Medium Fast	1	9	[]	{}	f	f	f	f	f	f	f
1295	948	0	toedscool	Toedscool	\N	ground	grass	grass	\N	mf	\N	4	yellow	Medium Slow	2	9	[[949, 0]]	{}	f	f	f	f	f	f	f
1296	949	0	toedscruel	Toedscruel	\N	ground	grass	grass	\N	mf	\N	4	black	Medium Slow	8	9	[]	{}	f	f	f	f	f	f	f
1297	950	0	klawf	Klawf	\N	rock	\N	water_3	\N	mf	\N	4	red	Medium Fast	4	9	[]	{}	f	f	f	f	f	f	f
1298	951	0	capsakid	Capsakid	\N	grass	\N	grass	\N	mf	\N	4	green	Medium Fast	10	9	[[952, 0]]	{}	f	f	f	f	f	f	f
1299	952	0	scovillain	Scovillain	\N	grass	fire	grass	\N	mf	\N	4	green	Medium Fast	10	9	[]	{}	f	f	f	f	f	f	f
1300	952	1	scovillain-mega	Scovillain	Mega Scovillain	grass	fire	grass	\N	mf	\N	4	green	Medium Fast	10	9	[]	{}	t	t	f	f	f	f	f
1301	953	0	rellor	Rellor	\N	bug	\N	bug	\N	mf	\N	4	brown	Fast	4	9	[[954, 0]]	{}	f	f	f	f	f	f	f
1302	954	0	rabsca	Rabsca	\N	bug	psychic	bug	\N	mf	\N	4	green	Fast	4	9	[]	{}	f	f	f	f	f	f	f
1303	955	0	flittle	Flittle	\N	psychic	\N	flying	\N	mf	\N	4	yellow	Medium Slow	2	9	[[956, 0]]	{}	f	f	f	f	f	f	f
1304	956	0	espathra	Espathra	\N	psychic	\N	flying	\N	mf	\N	4	yellow	Medium Slow	10	9	[]	{}	f	f	f	f	f	f	f
1305	957	0	tinkatink	Tinkatink	\N	fairy	steel	fairy	\N	fd	\N	0	pink	Medium Slow	11	9	[[958, 0]]	{}	f	f	f	f	f	f	f
1306	958	0	tinkatuff	Tinkatuff	\N	fairy	steel	fairy	\N	fd	\N	0	pink	Medium Slow	11	9	[[959, 0]]	{}	f	f	f	f	f	f	f
1307	959	0	tinkaton	Tinkaton	\N	fairy	steel	fairy	\N	fd	\N	0	pink	Medium Slow	11	9	[]	{}	f	f	f	f	f	f	f
1308	960	0	wiglett	Wiglett	\N	water	\N	water_3	\N	mf	\N	4	white	Medium Fast	9	9	[[961, 0]]	{}	f	f	f	f	f	f	f
1309	961	0	wugtrio	Wugtrio	\N	water	\N	water_3	\N	mf	\N	4	red	Medium Fast	9	9	[]	{}	f	f	f	f	f	f	f
1310	962	0	bombirdier	Bombirdier	\N	flying	dark	flying	\N	mf	\N	4	white	Slow	12	9	[]	{}	f	f	f	f	f	f	f
1311	963	0	finizen	Finizen	\N	water	\N	field	water_2	mf	\N	4	blue	Slow	3	9	[[964, 0]]	{}	f	f	f	f	f	f	f
1312	964	0	palafin	Palafin	Zero Form	water	\N	field	water_2	mf	\N	4	blue	Slow	3	9	[]	{}	f	f	f	f	f	f	f
1313	964	1	palafin-hero	Palafin	Hero Form	water	\N	field	water_2	mf	\N	4	blue	Slow	11	9	[]	{}	f	t	f	f	f	f	f
1314	965	0	varoom	Varoom	\N	steel	poison	mineral	\N	mf	\N	4	gray	Medium Fast	2	9	[[966, 0]]	{}	f	f	f	f	f	f	f
1315	966	0	revavroom	Revavroom	\N	steel	poison	mineral	\N	mf	\N	4	gray	Medium Fast	2	9	[]	{}	f	f	f	f	f	f	f
1316	967	0	cyclizar	Cyclizar	\N	dragon	normal	field	\N	mf	\N	4	green	Medium Slow	5	9	[]	{}	f	f	f	f	f	f	f
1317	968	0	orthworm	Orthworm	\N	steel	\N	field	\N	mf	\N	4	pink	Slow	13	9	[]	{}	f	f	f	f	f	f	f
1318	969	0	glimmet	Glimmet	\N	rock	poison	mineral	\N	mf	\N	4	blue	Medium Slow	1	9	[[970, 0]]	{}	f	f	f	f	f	f	f
1319	970	0	glimmora	Glimmora	\N	rock	poison	mineral	\N	mf	\N	4	blue	Medium Slow	1	9	[]	{}	f	f	f	f	f	f	f
1320	970	1	glimmora-mega	Glimmora	Mega Glimmora	rock	poison	mineral	\N	mf	\N	4	blue	Medium Slow	1	9	[]	{}	t	t	f	f	f	f	f
1321	971	0	greavard	Greavard	\N	ghost	\N	field	\N	mf	\N	4	white	Medium Slow	5	9	[[972, 0]]	{}	f	f	f	f	f	f	f
1322	972	0	houndstone	Houndstone	\N	ghost	\N	field	\N	mf	\N	4	white	Medium Slow	5	9	[]	{}	f	f	f	f	f	f	f
1323	973	0	flamigo	Flamigo	\N	flying	fighting	flying	\N	mf	\N	4	pink	Medium Slow	12	9	[]	{}	f	f	f	f	f	f	f
1324	974	0	cetoddle	Cetoddle	\N	ice	\N	field	\N	mf	\N	4	white	Medium Slow	10	9	[[975, 0]]	{}	f	f	f	f	f	f	f
1325	975	0	cetitan	Cetitan	\N	ice	\N	field	\N	mf	\N	4	white	Medium Slow	10	9	[]	{}	f	f	f	f	f	f	f
1326	976	0	veluza	Veluza	\N	water	psychic	water_2	\N	mf	\N	4	gray	Fast	3	9	[]	{}	f	f	f	f	f	f	f
1327	977	0	dondozo	Dondozo	\N	water	\N	water_2	\N	mf	\N	4	blue	Slow	3	9	[]	{}	f	f	f	f	f	f	f
1328	978	0	tatsugiri	Tatsugiri	Curly Form	dragon	water	water_2	\N	mf	\N	4	red	Medium Slow	3	9	[]	{}	f	f	f	f	f	f	f
1329	978	1	tatsugiri-droopy	Tatsugiri	Droopy Form	dragon	water	water_2	\N	mf	\N	4	pink	Medium Slow	3	9	[]	{}	f	f	f	f	f	f	f
1330	978	2	tatsugiri-stretchy	Tatsugiri	Stretchy Form	dragon	water	water_2	\N	mf	\N	4	yellow	Medium Slow	3	9	[]	{}	f	f	f	f	f	f	f
1331	978	3	tatsugiri-mega	Tatsugiri	Mega Tatsugiri	dragon	water	water_2	\N	mf	\N	4	red	Medium Slow	7	9	[]	{}	t	t	f	f	f	f	f
1332	978	4	tatsugiri-droopy-mega	Tatsugiri	Mega Tatsugiri	dragon	water	water_2	\N	mf	\N	4	pink	Medium Slow	7	9	[]	{}	t	t	f	f	f	f	f
1333	978	5	tatsugiri-stretchy-mega	Tatsugiri	Mega Tatsugiri	dragon	water	water_2	\N	mf	\N	4	yellow	Medium Slow	7	9	[]	{}	t	t	f	f	f	f	f
1334	979	0	annihilape	Annihilape	\N	fighting	ghost	field	\N	mf	\N	4	gray	Medium Fast	11	9	[]	{}	f	f	f	f	f	f	f
1335	980	0	clodsire	Clodsire	\N	poison	ground	water_1	field	mf	\N	4	brown	Medium Fast	5	9	[]	{}	f	f	f	f	f	f	f
1336	981	0	farigiraf	Farigiraf	\N	normal	psychic	field	\N	mf	\N	4	brown	Medium Fast	5	9	[]	{}	f	f	f	f	f	f	f
1337	982	0	dudunsparce	Dudunsparce	Two-Segment Form	normal	\N	field	\N	mf	\N	4	yellow	Medium Fast	13	9	[]	{}	f	f	f	f	f	f	f
1338	982	1	dudunsparce-three-segment	Dudunsparce	Three-Segment Form	normal	\N	field	\N	mf	\N	4	yellow	Medium Fast	13	9	[]	{}	f	f	f	f	f	f	f
1339	983	0	kingambit	Kingambit	\N	dark	steel	human_like	\N	mf	\N	4	black	Medium Fast	11	9	[]	{}	f	f	f	f	f	f	f
1340	984	0	great-tusk	Great Tusk	\N	ground	fighting	undiscovered	\N	uk	\N	-1	purple	Slow	5	9	[]	{}	f	f	f	f	f	f	t
1341	985	0	scream-tail	Scream Tail	\N	fairy	psychic	undiscovered	\N	uk	\N	-1	pink	Slow	10	9	[]	{}	f	f	f	f	f	f	t
1342	986	0	brute-bonnet	Brute Bonnet	\N	grass	dark	undiscovered	\N	uk	\N	-1	white	Slow	5	9	[]	{}	f	f	f	f	f	f	t
1343	987	0	flutter-mane	Flutter Mane	\N	ghost	fairy	undiscovered	\N	uk	\N	-1	gray	Slow	12	9	[]	{}	f	f	f	f	f	f	t
1344	988	0	slither-wing	Slither Wing	\N	bug	fighting	undiscovered	\N	uk	\N	-1	white	Slow	5	9	[]	{}	f	f	f	f	f	f	t
1345	989	0	sandy-shocks	Sandy Shocks	\N	electric	ground	undiscovered	\N	uk	\N	-1	gray	Slow	5	9	[]	{}	f	f	f	f	f	f	t
1346	990	0	iron-treads	Iron Treads	\N	ground	steel	undiscovered	\N	uk	\N	-1	gray	Slow	5	9	[]	{}	f	f	f	f	f	f	t
1347	991	0	iron-bundle	Iron Bundle	\N	ice	water	undiscovered	\N	uk	\N	-1	red	Slow	10	9	[]	{}	f	f	f	f	f	f	t
1348	992	0	iron-hands	Iron Hands	\N	fighting	electric	undiscovered	\N	uk	\N	-1	gray	Slow	11	9	[]	{}	f	f	f	f	f	f	t
1349	993	0	iron-jugulis	Iron Jugulis	\N	dark	flying	undiscovered	\N	uk	\N	-1	blue	Slow	10	9	[]	{}	f	f	f	f	f	f	t
1350	994	0	iron-moth	Iron Moth	\N	fire	poison	undiscovered	\N	uk	\N	-1	white	Slow	6	9	[]	{}	f	f	f	f	f	f	t
1351	995	0	iron-thorns	Iron Thorns	\N	rock	electric	undiscovered	\N	uk	\N	-1	green	Slow	10	9	[]	{}	f	f	f	f	f	f	t
1352	996	0	frigibax	Frigibax	\N	dragon	ice	dragon	mineral	mf	\N	4	gray	Slow	10	9	[[997, 0]]	{}	f	f	f	f	f	f	f
1353	997	0	arctibax	Arctibax	\N	dragon	ice	dragon	mineral	mf	\N	4	blue	Slow	10	9	[[998, 0]]	{}	f	f	f	f	f	f	f
1354	998	0	baxcalibur	Baxcalibur	\N	dragon	ice	dragon	mineral	mf	\N	4	blue	Slow	10	9	[]	{}	f	f	f	f	f	f	f
1355	998	1	baxcalibur-mega	Baxcalibur	Mega Baxcalibur	dragon	ice	dragon	mineral	mf	\N	4	blue	Slow	10	9	[]	{}	t	t	f	f	f	f	f
1356	999	0	gimmighoul	Gimmighoul	Chest Form	ghost	\N	undiscovered	\N	uk	\N	-1	red	Slow	9	9	[[1000, 0]]	{}	f	f	f	f	f	f	f
1357	999	1	gimmighoul-roaming	Gimmighoul	Roaming Form	ghost	\N	undiscovered	\N	uk	\N	-1	gray	Slow	11	9	[[1000, 0]]	{}	f	f	f	f	f	f	f
1358	1000	0	gholdengo	Gholdengo	\N	steel	ghost	undiscovered	\N	uk	\N	-1	yellow	Slow	11	9	[]	{}	f	f	f	f	f	f	f
1359	1001	0	wo-chien	Wo-Chien	\N	dark	grass	undiscovered	\N	uk	\N	-1	brown	Slow	13	9	[]	{}	f	f	f	f	f	t	f
1360	1002	0	chien-pao	Chien-Pao	\N	dark	ice	undiscovered	\N	uk	\N	-1	white	Slow	5	9	[]	{}	f	f	f	f	f	t	f
1361	1003	0	ting-lu	Ting-Lu	\N	dark	ground	undiscovered	\N	uk	\N	-1	brown	Slow	5	9	[]	{}	f	f	f	f	f	t	f
1362	1004	0	chi-yu	Chi-Yu	\N	dark	fire	undiscovered	\N	uk	\N	-1	red	Slow	3	9	[]	{}	f	f	f	f	f	t	f
1363	1005	0	roaring-moon	Roaring Moon	\N	dragon	dark	undiscovered	\N	uk	\N	-1	blue	Slow	5	9	[]	{}	f	f	f	f	f	f	t
1364	1006	0	iron-valiant	Iron Valiant	\N	fairy	fighting	undiscovered	\N	uk	\N	-1	white	Slow	11	9	[]	{}	f	f	f	f	f	f	t
1365	1007	0	koraidon	Koraidon	Apex Build	fighting	dragon	undiscovered	\N	uk	\N	-1	red	Slow	10	9	[]	{}	f	f	f	t	f	f	t
1366	1008	0	miraidon	Miraidon	Ultimate Mode	electric	dragon	undiscovered	\N	uk	\N	-1	purple	Slow	5	9	[]	{}	f	f	f	t	f	f	t
1367	1009	0	walking-wake	Walking Wake	\N	water	dragon	undiscovered	\N	uk	\N	-1	blue	Slow	10	9	[]	{}	f	f	f	f	f	f	t
1368	1010	0	iron-leaves	Iron Leaves	\N	grass	psychic	undiscovered	\N	uk	\N	-1	green	Slow	5	9	[]	{}	f	f	f	f	f	f	t
1369	1011	0	dipplin	Dipplin	\N	grass	dragon	grass	dragon	mf	\N	4	green	Erratic	7	9	[[1019, 0]]	{}	f	f	f	f	f	f	f
1370	1012	0	poltchageist	Poltchageist	\N	grass	ghost	mineral	amorphous	uk	\N	-1	green	Medium Fast	1	9	[[1013, 0]]	{}	f	f	f	f	f	f	f
1371	1013	0	sinistcha	Sinistcha	\N	grass	ghost	mineral	amorphous	uk	\N	-1	green	Medium Fast	1	9	[]	{}	f	f	f	f	f	f	f
1372	1014	0	okidogi	Okidogi	\N	poison	fighting	undiscovered	\N	mo	\N	0	black	Slow	10	9	[]	{}	f	f	f	f	f	t	f
1373	1015	0	munkidori	Munkidori	\N	poison	psychic	undiscovered	\N	mo	\N	0	black	Slow	11	9	[]	{}	f	f	f	f	f	t	f
1374	1016	0	fezandipiti	Fezandipiti	\N	poison	fairy	undiscovered	\N	mo	\N	0	black	Slow	12	9	[]	{}	f	f	f	f	f	t	f
1375	1017	0	ogerpon	Ogerpon	Teal Mask	grass	\N	undiscovered	\N	fo	\N	-1	green	Slow	11	9	[]	{}	f	f	f	f	f	t	f
1376	1017	1	ogerpon-wellspring	Ogerpon	Wellspring Mask	grass	water	undiscovered	\N	fo	\N	-1	blue	Slow	11	9	[]	{}	f	f	f	f	f	t	f
1377	1017	2	ogerpon-hearthflame	Ogerpon	Hearthflame Mask	grass	fire	undiscovered	\N	fo	\N	-1	red	Slow	11	9	[]	{}	f	f	f	f	f	t	f
1378	1017	3	ogerpon-cornerstone	Ogerpon	Cornerstone Mask	grass	rock	undiscovered	\N	fo	\N	-1	gray	Slow	11	9	[]	{}	f	f	f	f	f	t	f
1379	1018	0	archaludon	Archaludon	\N	steel	dragon	mineral	dragon	mf	\N	4	white	Medium Fast	10	9	[]	{}	f	f	f	f	f	f	f
1380	1019	0	hydrapple	Hydrapple	\N	grass	dragon	grass	dragon	mf	\N	4	green	Erratic	7	9	[]	{}	f	f	f	f	f	f	f
1381	1020	0	gouging-fire	Gouging Fire	\N	fire	dragon	undiscovered	\N	uk	\N	-1	brown	Slow	5	9	[]	{}	f	f	f	f	f	f	t
1382	1021	0	raging-bolt	Raging Bolt	\N	electric	dragon	undiscovered	\N	uk	\N	-1	yellow	Slow	5	9	[]	{}	f	f	f	f	f	f	t
1383	1022	0	iron-boulder	Iron Boulder	\N	rock	psychic	undiscovered	\N	uk	\N	-1	gray	Slow	5	9	[]	{}	f	f	f	f	f	f	t
1384	1023	0	iron-crown	Iron Crown	\N	steel	psychic	undiscovered	\N	uk	\N	-1	blue	Slow	5	9	[]	{}	f	f	f	f	f	f	t
1385	1024	0	terapagos	Terapagos	Normal Form	normal	\N	undiscovered	\N	mf	\N	4	blue	Slow	5	9	[]	{}	f	f	f	t	f	f	f
1386	1024	1	terapagos-terastal	Terapagos	Terastal Form	normal	\N	undiscovered	\N	mf	\N	4	blue	Slow	1	9	[]	{}	f	f	f	t	f	f	f
1387	1024	2	terapagos-stellar	Terapagos	Stellar Form	normal	\N	undiscovered	\N	mf	\N	4	blue	Slow	1	9	[]	{}	f	t	f	t	f	f	f
1388	1025	0	pecharunt	Pecharunt	\N	poison	ghost	undiscovered	\N	uk	\N	-1	purple	Slow	1	9	[]	{}	f	f	f	f	t	f	f
\.


--
-- Name: pokemon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pokemon_id_seq', 1388, true);


--
-- Name: pokemon pokemon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_pkey PRIMARY KEY (id);


--
-- Name: pokemon pokemon_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_slug_key UNIQUE (slug);


--
-- Name: pokemon uq_base_form; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT uq_base_form UNIQUE (base_id, form_id);


--
-- Name: idx_pokemon_base_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pokemon_base_id ON public.pokemon USING btree (base_id);


--
-- Name: idx_pokemon_egg_group_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pokemon_egg_group_1 ON public.pokemon USING btree (egg_group_1);


--
-- Name: idx_pokemon_flags; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pokemon_flags ON public.pokemon USING btree (is_legendary, is_mythical, is_paradox, is_mega);


--
-- Name: idx_pokemon_generation; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pokemon_generation ON public.pokemon USING btree (generation);


--
-- Name: idx_pokemon_hidden_moves_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pokemon_hidden_moves_gin ON public.pokemon USING gin (hidden_moves);


--
-- Name: idx_pokemon_type1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pokemon_type1 ON public.pokemon USING btree (type1);


--
-- Name: idx_pokemon_type2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pokemon_type2 ON public.pokemon USING btree (type2);


--
-- PostgreSQL database dump complete
--

\unrestrict afVXjPvriuVYR74EuETNcdh257kbU6uobEJu46N57e3sJGEdUROhpAVuSNV8bnE

