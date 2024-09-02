--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE num_guess;
--
-- Name: num_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE num_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE num_guess OWNER TO freecodecamp;

\connect num_guess

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
    user_id integer NOT NULL,
    guess integer DEFAULT 0,
    number integer NOT NULL
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

INSERT INTO public.games VALUES (1, 1, 701, 700);
INSERT INTO public.games VALUES (2, 1, 10, 9);
INSERT INTO public.games VALUES (3, 2, 288, 287);
INSERT INTO public.games VALUES (4, 2, 61, 60);
INSERT INTO public.games VALUES (5, 1, 836, 833);
INSERT INTO public.games VALUES (6, 1, 277, 275);
INSERT INTO public.games VALUES (7, 1, 700, 699);
INSERT INTO public.games VALUES (8, 3, 57, 56);
INSERT INTO public.games VALUES (9, 3, 95, 94);
INSERT INTO public.games VALUES (10, 4, 790, 789);
INSERT INTO public.games VALUES (11, 4, 65, 64);
INSERT INTO public.games VALUES (12, 3, 324, 321);
INSERT INTO public.games VALUES (13, 3, 13, 11);
INSERT INTO public.games VALUES (14, 3, 613, 612);
INSERT INTO public.games VALUES (15, 5, 768, 767);
INSERT INTO public.games VALUES (16, 5, 318, 317);
INSERT INTO public.games VALUES (17, 6, 293, 292);
INSERT INTO public.games VALUES (18, 6, 2, 1);
INSERT INTO public.games VALUES (19, 5, 667, 664);
INSERT INTO public.games VALUES (20, 5, 421, 419);
INSERT INTO public.games VALUES (21, 5, 242, 241);
INSERT INTO public.games VALUES (22, 7, 653, 652);
INSERT INTO public.games VALUES (23, 7, 26, 25);
INSERT INTO public.games VALUES (24, 8, 90, 89);
INSERT INTO public.games VALUES (25, 8, 866, 865);
INSERT INTO public.games VALUES (26, 7, 583, 580);
INSERT INTO public.games VALUES (27, 7, 307, 305);
INSERT INTO public.games VALUES (28, 7, 512, 511);
INSERT INTO public.games VALUES (29, 9, 874, 873);
INSERT INTO public.games VALUES (30, 9, 672, 671);
INSERT INTO public.games VALUES (31, 10, 337, 336);
INSERT INTO public.games VALUES (32, 10, 362, 361);
INSERT INTO public.games VALUES (33, 9, 830, 827);
INSERT INTO public.games VALUES (34, 9, 535, 533);
INSERT INTO public.games VALUES (35, 9, 344, 343);
INSERT INTO public.games VALUES (36, 11, 968, 967);
INSERT INTO public.games VALUES (37, 11, 801, 800);
INSERT INTO public.games VALUES (38, 12, 226, 225);
INSERT INTO public.games VALUES (39, 12, 811, 810);
INSERT INTO public.games VALUES (40, 11, 286, 283);
INSERT INTO public.games VALUES (41, 11, 526, 524);
INSERT INTO public.games VALUES (42, 11, 874, 873);
INSERT INTO public.games VALUES (43, 13, 83, 82);
INSERT INTO public.games VALUES (44, 13, 270, 269);
INSERT INTO public.games VALUES (45, 14, 287, 286);
INSERT INTO public.games VALUES (46, 14, 772, 771);
INSERT INTO public.games VALUES (47, 13, 308, 305);
INSERT INTO public.games VALUES (48, 13, 161, 159);
INSERT INTO public.games VALUES (49, 13, 850, 849);
INSERT INTO public.games VALUES (50, 15, 253, 252);
INSERT INTO public.games VALUES (51, 15, 969, 968);
INSERT INTO public.games VALUES (52, 16, 197, 196);
INSERT INTO public.games VALUES (53, 16, 190, 189);
INSERT INTO public.games VALUES (54, 15, 802, 799);
INSERT INTO public.games VALUES (55, 15, 539, 537);
INSERT INTO public.games VALUES (56, 15, 835, 834);
INSERT INTO public.games VALUES (57, 17, 125, 124);
INSERT INTO public.games VALUES (58, 17, 102, 101);
INSERT INTO public.games VALUES (59, 18, 211, 210);
INSERT INTO public.games VALUES (60, 18, 686, 685);
INSERT INTO public.games VALUES (61, 17, 111, 108);
INSERT INTO public.games VALUES (62, 17, 506, 504);
INSERT INTO public.games VALUES (63, 17, 252, 251);
INSERT INTO public.games VALUES (64, 19, 459, 458);
INSERT INTO public.games VALUES (65, 19, 7, 6);
INSERT INTO public.games VALUES (66, 20, 160, 159);
INSERT INTO public.games VALUES (67, 20, 681, 680);
INSERT INTO public.games VALUES (68, 19, 61, 58);
INSERT INTO public.games VALUES (69, 19, 495, 493);
INSERT INTO public.games VALUES (70, 19, 207, 206);
INSERT INTO public.games VALUES (71, 21, 297, 296);
INSERT INTO public.games VALUES (72, 21, 342, 341);
INSERT INTO public.games VALUES (73, 22, 602, 601);
INSERT INTO public.games VALUES (74, 22, 981, 980);
INSERT INTO public.games VALUES (75, 21, 157, 154);
INSERT INTO public.games VALUES (76, 21, 923, 921);
INSERT INTO public.games VALUES (77, 21, 610, 609);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1725300891176');
INSERT INTO public.users VALUES (2, 'user_1725300891175');
INSERT INTO public.users VALUES (3, 'user_1725300923806');
INSERT INTO public.users VALUES (4, 'user_1725300923805');
INSERT INTO public.users VALUES (5, 'user_1725300975408');
INSERT INTO public.users VALUES (6, 'user_1725300975407');
INSERT INTO public.users VALUES (7, 'user_1725301110466');
INSERT INTO public.users VALUES (8, 'user_1725301110465');
INSERT INTO public.users VALUES (9, 'user_1725301165251');
INSERT INTO public.users VALUES (10, 'user_1725301165250');
INSERT INTO public.users VALUES (11, 'user_1725301538361');
INSERT INTO public.users VALUES (12, 'user_1725301538360');
INSERT INTO public.users VALUES (13, 'user_1725301578227');
INSERT INTO public.users VALUES (14, 'user_1725301578226');
INSERT INTO public.users VALUES (15, 'user_1725301655535');
INSERT INTO public.users VALUES (16, 'user_1725301655534');
INSERT INTO public.users VALUES (17, 'user_1725301672493');
INSERT INTO public.users VALUES (18, 'user_1725301672492');
INSERT INTO public.users VALUES (19, 'user_1725301800032');
INSERT INTO public.users VALUES (20, 'user_1725301800031');
INSERT INTO public.users VALUES (21, 'user_1725301818749');
INSERT INTO public.users VALUES (22, 'user_1725301818748');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 77, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: games game_user_id_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT game_user_id_unq UNIQUE (user_id, game_id);


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
-- Name: games games_user_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey1 FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

