--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: actions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.actions (
    actions_id integer NOT NULL,
    name character varying(30) NOT NULL,
    possible boolean
);


ALTER TABLE public.actions OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    distance_from_earth_in_light_years numeric NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    constellation character varying(30) NOT NULL
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
    name character varying(30),
    planet_id integer NOT NULL,
    has_life boolean,
    is_spherical boolean
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
    name character varying(30),
    color text,
    has_life boolean,
    has_moons boolean NOT NULL,
    moon_count integer
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
    name character varying(30),
    has_life boolean NOT NULL,
    is_spherical boolean,
    distance_from_earth_in_au integer NOT NULL
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
-- Data for Name: actions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.actions VALUES (1, 'rotate', true);
INSERT INTO public.actions VALUES (2, 'revolve', true);
INSERT INTO public.actions VALUES (3, 'dash', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 'Barred Spiral', 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2500000, 'Ring', 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'M-87', 53000000, 'Active', 'Virgo');
INSERT INTO public.galaxy VALUES (4, 'M-82', 12000000, 'Starburst', 'Ursa Major');
INSERT INTO public.galaxy VALUES (5, 'Alcyoneus', 3500000000, 'Radio', 'Lynx');
INSERT INTO public.galaxy VALUES (6, 'Canis Major Dwarf Galaxy', 25000, 'Interacting', 'Canis Major');
INSERT INTO public.galaxy VALUES (7, 'Hoags Object', 600000000, 'Ring', 'Serpens Caput');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3, false, true);
INSERT INTO public.moon VALUES (2, 'Ganymede', 5, false, true);
INSERT INTO public.moon VALUES (3, 'Io', 5, false, true);
INSERT INTO public.moon VALUES (4, 'Europa', 5, false, true);
INSERT INTO public.moon VALUES (5, 'Himalia', 5, false, true);
INSERT INTO public.moon VALUES (6, 'Thebe', 5, false, true);
INSERT INTO public.moon VALUES (7, 'Titan', 6, false, true);
INSERT INTO public.moon VALUES (8, 'Hyperion', 6, false, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, false, true);
INSERT INTO public.moon VALUES (10, 'Phoebe', 6, false, true);
INSERT INTO public.moon VALUES (11, 'Miranda', 7, false, true);
INSERT INTO public.moon VALUES (12, 'Titania', 7, false, true);
INSERT INTO public.moon VALUES (13, 'Ariel', 7, false, true);
INSERT INTO public.moon VALUES (14, 'Puck', 7, false, true);
INSERT INTO public.moon VALUES (15, 'Juliet', 7, false, true);
INSERT INTO public.moon VALUES (16, 'Belinda', 7, false, true);
INSERT INTO public.moon VALUES (17, 'Cupid', 7, false, true);
INSERT INTO public.moon VALUES (18, 'Phobos', 4, false, true);
INSERT INTO public.moon VALUES (19, 'Deimos', 4, false, true);
INSERT INTO public.moon VALUES (20, 'Thalassa', 8, false, true);
INSERT INTO public.moon VALUES (21, 'Triton', 8, false, true);
INSERT INTO public.moon VALUES (22, 'Neso', 8, false, true);
INSERT INTO public.moon VALUES (23, 'Hippocamp', 8, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Slate Grey', false, false, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 'Pearly White', false, false, 0);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'Yellow', false, false, 0);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1 e', 'Blue Grey', false, false, 0);
INSERT INTO public.planet VALUES (12, 'GJ 436 B', 'Red Green', false, false, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 'Blue Green', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Dusky Red', false, true, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Butterscotch', false, true, 80);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Butterscotch', false, true, 83);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Cyan', false, true, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Blue', false, true, 14);
INSERT INTO public.planet VALUES (9, 'Kepler-16B', 'Yellow', false, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', false, true, 40632392);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', false, true, 268521);
INSERT INTO public.star VALUES (4, 'Sirius', false, true, 543873);
INSERT INTO public.star VALUES (5, 'HD 140283', false, true, 12000000);
INSERT INTO public.star VALUES (6, '14 Herculis', false, true, 3699603);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: actions actions_action_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.actions
    ADD CONSTRAINT actions_action_id_key UNIQUE (actions_id);


--
-- Name: actions actions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (actions_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

