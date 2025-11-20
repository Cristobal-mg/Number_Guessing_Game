--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 1000);
INSERT INTO public.games VALUES (2, 1, 817);
INSERT INTO public.games VALUES (3, 2, 284);
INSERT INTO public.games VALUES (4, 2, 434);
INSERT INTO public.games VALUES (5, 1, 474);
INSERT INTO public.games VALUES (6, 1, 897);
INSERT INTO public.games VALUES (7, 1, 918);
INSERT INTO public.games VALUES (8, 3, 667);
INSERT INTO public.games VALUES (9, 3, 357);
INSERT INTO public.games VALUES (10, 4, 300);
INSERT INTO public.games VALUES (11, 4, 463);
INSERT INTO public.games VALUES (12, 3, 525);
INSERT INTO public.games VALUES (13, 3, 932);
INSERT INTO public.games VALUES (14, 3, 550);
INSERT INTO public.games VALUES (15, 5, 10);
INSERT INTO public.games VALUES (16, 5, 188);
INSERT INTO public.games VALUES (17, 6, 24);
INSERT INTO public.games VALUES (18, 6, 725);
INSERT INTO public.games VALUES (19, 5, 803);
INSERT INTO public.games VALUES (20, 5, 53);
INSERT INTO public.games VALUES (21, 5, 78);
INSERT INTO public.games VALUES (22, 7, 16);
INSERT INTO public.games VALUES (23, 8, 116);
INSERT INTO public.games VALUES (24, 8, 875);
INSERT INTO public.games VALUES (25, 9, 741);
INSERT INTO public.games VALUES (26, 9, 28);
INSERT INTO public.games VALUES (27, 8, 799);
INSERT INTO public.games VALUES (28, 8, 618);
INSERT INTO public.games VALUES (29, 8, 786);
INSERT INTO public.games VALUES (30, 10, 17);
INSERT INTO public.games VALUES (31, 11, 306);
INSERT INTO public.games VALUES (32, 11, 222);
INSERT INTO public.games VALUES (33, 12, 439);
INSERT INTO public.games VALUES (34, 12, 802);
INSERT INTO public.games VALUES (35, 11, 884);
INSERT INTO public.games VALUES (36, 11, 26);
INSERT INTO public.games VALUES (37, 11, 960);
INSERT INTO public.games VALUES (38, 13, 12);
INSERT INTO public.games VALUES (39, 14, 992);
INSERT INTO public.games VALUES (40, 14, 209);
INSERT INTO public.games VALUES (41, 15, 594);
INSERT INTO public.games VALUES (42, 15, 906);
INSERT INTO public.games VALUES (43, 14, 787);
INSERT INTO public.games VALUES (44, 14, 384);
INSERT INTO public.games VALUES (45, 14, 156);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1763605337049');
INSERT INTO public.users VALUES (2, 'user_1763605337048');
INSERT INTO public.users VALUES (3, 'user_1763605764897');
INSERT INTO public.users VALUES (4, 'user_1763605764896');
INSERT INTO public.users VALUES (5, 'user_1763605790266');
INSERT INTO public.users VALUES (6, 'user_1763605790265');
INSERT INTO public.users VALUES (7, 'Cristobal');
INSERT INTO public.users VALUES (8, 'user_1763605913002');
INSERT INTO public.users VALUES (9, 'user_1763605913001');
INSERT INTO public.users VALUES (10, 'noah');
INSERT INTO public.users VALUES (11, 'user_1763606016371');
INSERT INTO public.users VALUES (12, 'user_1763606016370');
INSERT INTO public.users VALUES (13, 'felipe');
INSERT INTO public.users VALUES (14, 'user_1763606122925');
INSERT INTO public.users VALUES (15, 'user_1763606122924');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 45, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 15, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

