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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    g_types text,
    s_types character varying(64),
    p_types character varying(64),
    m_types character varying(64),
    has_life boolean,
    name character varying(64) NOT NULL,
    description_id integer NOT NULL
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_combo_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_combo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_combo_id_seq OWNER TO freecodecamp;

--
-- Name: description_combo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_combo_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(64) NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_type character varying(64),
    age numeric(10,4),
    is_visible boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(64) NOT NULL,
    age numeric(10,4),
    moon_type character varying(64),
    size integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(64) NOT NULL,
    age_in_billion numeric(10,4),
    planet_type character varying(64),
    has_life boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(64) NOT NULL,
    star_type character varying(64),
    galaxy_id integer NOT NULL,
    size_in_solar_radius integer,
    age_in_billions numeric(10,1)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_combo_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES ('Barred Spiral', 'Yellow Dwarf', 'Gas Giant', 'Icy Moon', false, 'Milky Way Galaxy', 1);
INSERT INTO public.description VALUES ('Dwarf Irregular Galaxy', 'Wolf-Rayet Star', 'Gas Giant', 'Icy Moon', false, 'Large Magellanic Cloud', 2);
INSERT INTO public.description VALUES ('Barred Spiral', 'Yellow Dwarf', 'Gas Giant', 'Irregular Moon', false, 'Milky Way Galaxy', 3);
INSERT INTO public.description VALUES ('Barred Spiral', 'Yellow Dwarf', 'Ice Giant', 'Icy Moon', false, 'Milky Way Galaxy', 4);
INSERT INTO public.description VALUES ('Spiral Galaxy', 'Giant', 'Super-Earth', NULL, false, 'Andromeda Galaxy', 5);
INSERT INTO public.description VALUES ('Dwarf Irregular Galaxy', 'Wolf-Rayet Star', 'Super-Earth', NULL, false, 'Large Magellanic Cloud', 6);
INSERT INTO public.description VALUES ('Barred Spiral', 'White Dwarf', 'Gas Giant', 'Volcanic Moon', false, 'Milky Way Galaxy', 7);
INSERT INTO public.description VALUES ('Barred Spiral', 'White Dwarf', 'Super-Earth', NULL, false, 'Milky Way Galaxy', 8);
INSERT INTO public.description VALUES ('Dwarf Irregular Galaxy', 'Wolf-Rayet Star', 'Gas Giant', NULL, false, 'Large Magellanic Cloud', 9);
INSERT INTO public.description VALUES ('Dwarf Irregular Galaxy', 'Wolf-Rayet Star', 'Gas Giant', 'Volcanic Moon', false, 'Large Magellanic Cloud', 10);
INSERT INTO public.description VALUES ('Dwarf Irregular Galaxy', 'Supernova', 'Super-Earth', NULL, false, 'Large Magellanic Cloud', 11);
INSERT INTO public.description VALUES ('Spiral Galaxy', 'Giant', 'Gas Giant', 'Irregular Moon', false, 'Andromeda Galaxy', 12);
INSERT INTO public.description VALUES ('Dwarf Irregular Galaxy', 'Wolf-Rayet Star', 'Gas Giant', 'Irregular Moon', false, 'Large Magellanic Cloud', 13);
INSERT INTO public.description VALUES ('Spiral Galaxy', 'Supernova', 'Super-Jupiter', NULL, false, 'Whirlpool Galaxy', 14);
INSERT INTO public.description VALUES ('Dwarf Irregular Galaxy', 'Supernova', 'Super-Jupiter', NULL, false, 'Large Magellanic Cloud', 15);
INSERT INTO public.description VALUES ('Barred Spiral', 'White Dwarf', 'Gas Giant', 'Icy Moon', false, 'Milky Way Galaxy', 16);
INSERT INTO public.description VALUES ('Barred Spiral', 'Yellow Dwarf', 'Terrestrial', 'Irregular Moon', false, 'Milky Way Galaxy', 17);
INSERT INTO public.description VALUES ('Barred Spiral', 'Yellow Dwarf', 'Gas Giant', 'Volcanic Moon', false, 'Milky Way Galaxy', 18);
INSERT INTO public.description VALUES ('Spiral Galaxy', 'Giant', 'Gas Giant', NULL, false, 'Andromeda Galaxy', 19);
INSERT INTO public.description VALUES ('Spiral Galaxy', 'Giant', 'Gas Giant', 'Icy Moon', false, 'Andromeda Galaxy', 20);
INSERT INTO public.description VALUES ('Spiral Galaxy', 'Supernova', 'Super-Earth', NULL, false, 'Whirlpool Galaxy', 21);
INSERT INTO public.description VALUES ('Barred Spiral', 'White Dwarf', 'Gas Giant', NULL, false, 'Milky Way Galaxy', 22);
INSERT INTO public.description VALUES ('Barred Spiral', 'White Dwarf', 'Gas Giant', 'Irregular Moon', false, 'Milky Way Galaxy', 23);
INSERT INTO public.description VALUES ('Barred Spiral', 'Yellow Dwarf', 'Gas Giant', NULL, false, 'Milky Way Galaxy', 24);
INSERT INTO public.description VALUES ('Spiral Galaxy', 'Giant', 'Gas Giant', 'Volcanic Moon', false, 'Andromeda Galaxy', 25);
INSERT INTO public.description VALUES ('Barred Spiral', 'Yellow Dwarf', 'Terrestrial', 'Natural Satellite', true, 'Milky Way Galaxy', 26);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way Galaxy', 1, 'Barred Spiral', 13.6000, true);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 2, 'Spiral Galaxy', 10.0000, true);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 3, 'Spiral Galaxy', 12.0000, false);
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy', 4, 'Spiral Galaxy', 0.4000, false);
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 5, 'Lenticular Galaxy', 9.2000, false);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 6, 'Dwarf Irregular Galaxy', 13.0000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4.5000, 'Natural Satellite', 3474, 11);
INSERT INTO public.moon VALUES (2, 'Phobos', 4.6000, 'Irregular Moon', 22, 12);
INSERT INTO public.moon VALUES (3, 'Deimos', 4.6000, 'Irregular Moon', 12, 12);
INSERT INTO public.moon VALUES (4, 'Io', 4.6000, 'Volcanic Moon', 3643, 13);
INSERT INTO public.moon VALUES (5, 'Europa', 4.6000, 'Icy Moon', 3121, 13);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4.6000, 'Icy Moon', 5268, 13);
INSERT INTO public.moon VALUES (7, 'Callisto', 4.6000, 'Icy Moon', 4820, 13);
INSERT INTO public.moon VALUES (8, 'Amalthea', 4.6000, 'Irregular Moon', 250, 13);
INSERT INTO public.moon VALUES (9, 'Himalia', 4.6000, 'Irregular Moon', 170, 13);
INSERT INTO public.moon VALUES (10, 'Elara', 4.6000, 'Irregular Moon', 86, 13);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 4.6000, 'Irregular Moon', 60, 13);
INSERT INTO public.moon VALUES (12, 'Titan', 4.5000, 'Icy Moon', 5152, 14);
INSERT INTO public.moon VALUES (13, 'Rhea', 4.5000, 'Icy Moon', 1528, 14);
INSERT INTO public.moon VALUES (14, 'Iapetus', 4.5000, 'Icy Moon', 1472, 14);
INSERT INTO public.moon VALUES (15, 'Dione', 4.5000, 'Icy Moon', 1124, 14);
INSERT INTO public.moon VALUES (16, 'Tethys', 4.5000, 'Icy Moon', 1072, 14);
INSERT INTO public.moon VALUES (17, 'Enceladus', 4.5000, 'Icy Moon', 504, 14);
INSERT INTO public.moon VALUES (18, 'Titania', 4.5000, 'Icy Moon', 1579, 15);
INSERT INTO public.moon VALUES (19, 'Oberon', 4.5000, 'Icy Moon', 1524, 15);
INSERT INTO public.moon VALUES (20, 'Umbriel', 4.5000, 'Icy Moon', 1169, 15);
INSERT INTO public.moon VALUES (21, 'Ariel', 4.5000, 'Icy Moon', 1159, 15);
INSERT INTO public.moon VALUES (22, 'Miranda', 4.5000, 'Icy Moon', 472, 15);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Gliese 581g', 1.3000, 'Super-Earth', false, 4);
INSERT INTO public.planet VALUES (2, 'HD 106906 b', 0.0130, 'Super-Jupiter', false, 4);
INSERT INTO public.planet VALUES (3, 'LHS 1140 b', 5.0000, 'Super-Earth', false, 6);
INSERT INTO public.planet VALUES (4, 'LHS 1140 c', 5.0000, 'Super-Earth', false, 6);
INSERT INTO public.planet VALUES (5, 'Procyon b', 1.5000, 'Gas Giant', false, 2);
INSERT INTO public.planet VALUES (6, 'HD 96167 b', 1.0000, 'Super-Earth', false, 2);
INSERT INTO public.planet VALUES (7, 'Gamma Andromedae b', 2.0000, 'Gas Giant', false, 3);
INSERT INTO public.planet VALUES (8, 'HD 22049 b', 5.0000, 'Super-Earth', false, 3);
INSERT INTO public.planet VALUES (9, 'LMC 4170 b', 4.0000, 'Gas Giant', false, 5);
INSERT INTO public.planet VALUES (10, 'LMC 5173 b', 3.0000, 'Super-Earth', false, 5);
INSERT INTO public.planet VALUES (11, 'Earth', 4.5000, 'Terrestrial', true, 1);
INSERT INTO public.planet VALUES (12, 'Mars', 4.6000, 'Terrestrial', false, 1);
INSERT INTO public.planet VALUES (13, 'Jupiter', 4.6000, 'Gas Giant', false, 1);
INSERT INTO public.planet VALUES (14, 'Saturn', 4.6000, 'Gas Giant', false, 1);
INSERT INTO public.planet VALUES (15, 'Uranus', 4.5000, 'Ice Giant', false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'SN 1994I', 'Supernova', 4, 15, NULL);
INSERT INTO public.star VALUES (6, 'SN 1987A', 'Supernova', 6, 40, NULL);
INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 1, 1, 4.6);
INSERT INTO public.star VALUES (2, 'Sirius', 'White Dwarf', 1, 2, 0.3);
INSERT INTO public.star VALUES (3, 'Gamma Andromedae', 'Giant', 2, 80, 0.2);
INSERT INTO public.star VALUES (5, 'R136a1', 'Wolf-Rayet Star', 6, 35, 0.1);


--
-- Name: description_combo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_combo_id_seq', 26, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


--
-- Name: galaxy galaxy_identify; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_identify UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_identify; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_identify UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_identify; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_identify UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_identify; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_identify UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: description unique_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT unique_description UNIQUE (description_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

