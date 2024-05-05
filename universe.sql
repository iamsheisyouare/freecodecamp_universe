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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_kpk numeric(7,2) NOT NULL,
    description text,
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    radius_in_billions_km integer NOT NULL,
    is_radial boolean DEFAULT true
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
    name character varying(30) NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    description text,
    radius_in_billion_km integer,
    star_id integer
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
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    is_alive boolean DEFAULT true,
    galaxy_id integer
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Messier', 26.06, 'The object is included in the atlas of pecular galaxies called Arp 26. Sometimes the name "Pinwheel" is found — the result of an erroneous translation from the English Pinwheel', 'Ursa Major');
INSERT INTO public.galaxy VALUES (2, 'LMC', 5.40, 'one of the closest galaxies to ours is the closest of the easily detectable ones: although, for example, the dwarf galaxy in Sagittarius is located 24 kiloparsecs from our Galaxy, it practically does not stand out against the background of the stars of the Milky Way', 'Golden Fish');
INSERT INTO public.galaxy VALUES (3, 'The Triangle Galaxy', 9.40, 'one of the closest galaxies to the Milky Way, 850 kiloparsecs away from it. It is located in the Local Group and occupies the third place in it in size, mass and luminosity after the Andromeda Galaxy and the Milky Way', 'Triangle');
INSERT INTO public.galaxy VALUES (4, 'The Andromeda Nebula', 23.50, 'The distance from our Galaxy to it is about 800 kiloparsecs, which makes it the nearest of the large galaxies, as well as the largest galaxy of the Local Group. Its mass is approximately equal to the mass of the Milky Way or even less.', 'Andromeda');
INSERT INTO public.galaxy VALUES (5, 'Milky Way', 16.00, 'Compared to other spiral galaxies, the Milky Way has a fairly large mass and high luminosity. The solar system is located at a distance of 7.5—8.5 kiloparsecs from the center of the Galaxy and moves around it at a speed of 220 km/s', 'Local group');
INSERT INTO public.galaxy VALUES (6, 'Galaxy Sombrero', 8.20, 'As recent studies of this object using the Spitzer Space Telescope have shown, M 104 is two galaxies: a flat spiral galaxy is located inside an elliptical one, which makes it difficult to classify it as a single object.', 'Maid');


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 1);
INSERT INTO public.galaxy_types VALUES (2, 'Satellite', 2);
INSERT INTO public.galaxy_types VALUES (3, 'Complex', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (36, 'Moon', 1, 1737, true);
INSERT INTO public.moon VALUES (37, 'Phobos', 2, 22, true);
INSERT INTO public.moon VALUES (38, 'Deimos', 2, 13, true);
INSERT INTO public.moon VALUES (39, 'Charlie', 5, 10, true);
INSERT INTO public.moon VALUES (40, 'Delta', 5, 8, true);
INSERT INTO public.moon VALUES (41, 'Echo', 6, 12, true);
INSERT INTO public.moon VALUES (42, 'Foxtrot', 6, 11, true);
INSERT INTO public.moon VALUES (43, 'Harry', 7, 10, true);
INSERT INTO public.moon VALUES (44, 'Ron', 7, 9, true);
INSERT INTO public.moon VALUES (45, 'Sonya', 8, 11, true);
INSERT INTO public.moon VALUES (46, 'Alex', 8, 10, true);
INSERT INTO public.moon VALUES (47, 'Optimus Prime', 9, 9, true);
INSERT INTO public.moon VALUES (48, 'Bumblebee', 9, 8, true);
INSERT INTO public.moon VALUES (49, 'Starscream', 10, 12, true);
INSERT INTO public.moon VALUES (50, 'Soundwave', 10, 11, true);
INSERT INTO public.moon VALUES (51, 'Moon', 11, 10, true);
INSERT INTO public.moon VALUES (52, 'Apollo', 11, 9, true);
INSERT INTO public.moon VALUES (53, 'Luna', 12, 11, true);
INSERT INTO public.moon VALUES (54, 'Sol', 12, 10, true);
INSERT INTO public.moon VALUES (55, 'Princess Peach', 12, 10, true);
INSERT INTO public.moon VALUES (56, 'Mario', 2, 8, true);
INSERT INTO public.moon VALUES (57, 'Luigi', 5, 9, true);
INSERT INTO public.moon VALUES (58, 'Toad', 4, 7, true);
INSERT INTO public.moon VALUES (59, 'Yoshi', 10, 11, true);
INSERT INTO public.moon VALUES (60, 'Wario', 10, 9, true);
INSERT INTO public.moon VALUES (61, 'Bowser', 9, 8, true);
INSERT INTO public.moon VALUES (62, 'Daisy', 9, 7, true);
INSERT INTO public.moon VALUES (63, 'Koopa Troopa', 11, 10, false);
INSERT INTO public.moon VALUES (64, 'Goomba', 4, 8, true);
INSERT INTO public.moon VALUES (65, 'Bowser Jr.', 3, 9, true);
INSERT INTO public.moon VALUES (66, 'Toadette', 8, 7, true);
INSERT INTO public.moon VALUES (67, 'Peach', 8, 11, true);
INSERT INTO public.moon VALUES (68, 'Dry Bones', 7, 9, true);
INSERT INTO public.moon VALUES (69, 'Waluigi', 7, 8, true);
INSERT INTO public.moon VALUES (70, 'Roy Koopa', 6, 7, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Earth, our home planet', 6371, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 'The red planet', 3390, 1);
INSERT INTO public.planet VALUES (3, 'Mercury', false, 'Closest to the Sun', 2439, 1);
INSERT INTO public.planet VALUES (4, 'Venus', false, 'Hottest planet in the solar system', 6051, 1);
INSERT INTO public.planet VALUES (5, 'MC15321', false, NULL, 14681, 2);
INSERT INTO public.planet VALUES (6, 'Mighty Bush', false, NULL, 58927, 3);
INSERT INTO public.planet VALUES (7, 'Harry Potter', true, 'Planet of magic', 369494, 4);
INSERT INTO public.planet VALUES (8, 'Playstation', false, 'Nobody to play', 695575, 4);
INSERT INTO public.planet VALUES (9, 'Cybertron', true, 'Home of Transformers', 89746, 5);
INSERT INTO public.planet VALUES (10, 'Third Planet', false, NULL, 8947, 6);
INSERT INTO public.planet VALUES (11, 'The planet of the apes', true, 'There are living apes', 6371, 5);
INSERT INTO public.planet VALUES (12, 'Celestial', false, 'The last of celestial', 898, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4603, true, 5);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4500, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 25100, true, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 6000, true, 3);
INSERT INTO public.star VALUES (5, 'Vega', 2500, true, 6);
INSERT INTO public.star VALUES (6, 'Antares', 2500, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 70, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_types galaxy_types_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

