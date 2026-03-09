--
-- PostgreSQL database dump
--

\restrict LnbMeDH9RGNulN6luX43s4afVyFIMCjsZjbwqSvrxcWexcqdXD77uhlGsu8bWX4

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.2

-- Started on 2026-03-09 23:01:54

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
-- TOC entry 224 (class 1259 OID 16444)
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors (
    actor_id integer NOT NULL,
    name character varying(100),
    birth_year integer
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16443)
-- Name: actors_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actors_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actors_actor_id_seq OWNER TO postgres;

--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 223
-- Name: actors_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actors_actor_id_seq OWNED BY public.actors.actor_id;


--
-- TOC entry 220 (class 1259 OID 16422)
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    director_id integer NOT NULL,
    name character varying(100) NOT NULL,
    birth_year integer,
    country character varying(50)
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16421)
-- Name: directors_director_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_director_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directors_director_id_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 219
-- Name: directors_director_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_director_id_seq OWNED BY public.directors.director_id;


--
-- TOC entry 225 (class 1259 OID 16451)
-- Name: movie_cast; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_cast (
    movie_id integer NOT NULL,
    actor_id integer NOT NULL,
    role_name character varying(100)
);


ALTER TABLE public.movie_cast OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16431)
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    movie_id integer NOT NULL,
    title character varying(200),
    release_year integer,
    runtime integer,
    budget bigint,
    box_office bigint,
    director_id integer
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16430)
-- Name: movies_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movies_movie_id_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 221
-- Name: movies_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.movie_id;


--
-- TOC entry 227 (class 1259 OID 16469)
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    rating_id integer NOT NULL,
    movie_id integer,
    imdb_rating numeric(3,1),
    rotten_tomatoes integer,
    metacritic integer
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16468)
-- Name: ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ratings_rating_id_seq OWNER TO postgres;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 226
-- Name: ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_rating_id_seq OWNED BY public.ratings.rating_id;


--
-- TOC entry 4776 (class 2604 OID 16447)
-- Name: actors actor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors ALTER COLUMN actor_id SET DEFAULT nextval('public.actors_actor_id_seq'::regclass);


--
-- TOC entry 4774 (class 2604 OID 16425)
-- Name: directors director_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN director_id SET DEFAULT nextval('public.directors_director_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 16434)
-- Name: movies movie_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN movie_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);


--
-- TOC entry 4777 (class 2604 OID 16472)
-- Name: ratings rating_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN rating_id SET DEFAULT nextval('public.ratings_rating_id_seq'::regclass);


--
-- TOC entry 4944 (class 0 OID 16444)
-- Dependencies: 224
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors (actor_id, name, birth_year) FROM stdin;
1	Leonardo DiCaprio	1974
2	Brad Pitt	1963
3	Edward Norton	1969
4	Joseph Gordon-Levitt	1981
\.


--
-- TOC entry 4940 (class 0 OID 16422)
-- Dependencies: 220
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (director_id, name, birth_year, country) FROM stdin;
1	Christopher Nolan	1970	UK
2	David Fincher	1962	USA
3	Quentin Tarantino	1963	USA
4	Martin Scorsese	1942	USA
5	Denis Villeneuve	1967	Canada
6	Steven Spielberg	1946	USA
7	James Cameron	1954	Canada
8	Ridley Scott	1937	UK
9	Stanley Kubrick	1928	USA
10	Francis Ford Coppola	1939	USA
\.


--
-- TOC entry 4945 (class 0 OID 16451)
-- Dependencies: 225
-- Data for Name: movie_cast; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_cast (movie_id, actor_id, role_name) FROM stdin;
1	1	Cobb
1	4	Arthur
2	2	Tyler Durden
2	3	Narrator
\.


--
-- TOC entry 4942 (class 0 OID 16431)
-- Dependencies: 222
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies (movie_id, title, release_year, runtime, budget, box_office, director_id) FROM stdin;
1	Inception	2010	148	160000000	836800000	1
2	Fight Club	1999	139	63000000	101200000	2
3	Pulp Fiction	1994	154	8000000	213900000	3
72	Inception	2010	148	160000000	836800000	1
73	The Dark Knight	2008	152	185000000	1004558444	1
74	Interstellar	2014	169	165000000	701800000	1
75	Tenet	2020	150	205000000	363700000	1
76	Fight Club	1999	139	63000000	101200000	2
77	Se7en	1995	127	33000000	327300000	2
78	Gone Girl	2014	149	61000000	369300000	2
79	The Social Network	2010	120	40000000	224900000	2
80	Pulp Fiction	1994	154	8000000	213900000	3
81	Kill Bill Vol 1	2003	111	30000000	180900000	3
82	Kill Bill Vol 2	2004	136	30000000	152200000	3
83	Django Unchained	2012	165	100000000	426100000	3
84	Taxi Driver	1976	114	1300000	28200000	4
85	Goodfellas	1990	146	25000000	46800000	4
86	Casino	1995	178	50000000	116100000	4
87	The Wolf of Wall Street	2013	180	100000000	406900000	4
88	Arrival	2016	116	47000000	203400000	5
89	Blade Runner 2049	2017	164	150000000	260500000	5
90	Dune	2021	155	165000000	402000000	5
91	Jurassic Park	1993	127	63000000	1043000000	6
92	Saving Private Ryan	1998	169	70000000	482300000	6
93	Schindlers List	1993	195	22000000	322200000	6
94	Titanic	1997	195	200000000	2201647264	7
95	Avatar	2009	162	237000000	2923706026	7
96	Avatar The Way of Water	2022	192	350000000	2320000000	7
97	Alien	1979	117	11000000	106300000	8
98	Gladiator	2000	155	103000000	460500000	8
99	The Martian	2015	144	108000000	630200000	8
100	2001 A Space Odyssey	1968	149	12000000	146000000	9
101	The Shining	1980	146	19000000	47900000	9
102	The Godfather	1972	175	6000000	250300000	10
103	The Godfather Part II	1974	202	13000000	93000000	10
104	Apocalypse Now	1979	147	31000000	150000000	10
105	The Prestige	2006	130	40000000	109700000	1
106	Shutter Island	2010	138	80000000	294800000	4
107	The Revenant	2015	156	135000000	533000000	4
108	Sicario	2015	121	30000000	84800000	5
\.


--
-- TOC entry 4947 (class 0 OID 16469)
-- Dependencies: 227
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (rating_id, movie_id, imdb_rating, rotten_tomatoes, metacritic) FROM stdin;
1	1	8.8	87	74
2	2	8.8	79	66
3	3	8.9	92	94
\.


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 223
-- Name: actors_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actors_actor_id_seq', 4, true);


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 219
-- Name: directors_director_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_director_id_seq', 10, true);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 221
-- Name: movies_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_movie_id_seq', 108, true);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 226
-- Name: ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_rating_id_seq', 3, true);


--
-- TOC entry 4783 (class 2606 OID 16450)
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (actor_id);


--
-- TOC entry 4779 (class 2606 OID 16429)
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (director_id);


--
-- TOC entry 4785 (class 2606 OID 16457)
-- Name: movie_cast movie_cast_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_cast
    ADD CONSTRAINT movie_cast_pkey PRIMARY KEY (movie_id, actor_id);


--
-- TOC entry 4781 (class 2606 OID 16437)
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);


--
-- TOC entry 4787 (class 2606 OID 16475)
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (rating_id);


--
-- TOC entry 4789 (class 2606 OID 16463)
-- Name: movie_cast movie_cast_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_cast
    ADD CONSTRAINT movie_cast_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actors(actor_id);


--
-- TOC entry 4790 (class 2606 OID 16458)
-- Name: movie_cast movie_cast_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_cast
    ADD CONSTRAINT movie_cast_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);


--
-- TOC entry 4788 (class 2606 OID 16438)
-- Name: movies movies_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.directors(director_id);


--
-- TOC entry 4791 (class 2606 OID 16476)
-- Name: ratings ratings_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);


-- Completed on 2026-03-09 23:01:55

--
-- PostgreSQL database dump complete
--

\unrestrict LnbMeDH9RGNulN6luX43s4afVyFIMCjsZjbwqSvrxcWexcqdXD77uhlGsu8bWX4

