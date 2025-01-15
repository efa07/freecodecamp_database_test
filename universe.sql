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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    diameter_in_km integer NOT NULL,
    is_periodic boolean NOT NULL,
    last_perihelion_date date,
    star_id integer NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    galaxy_types character varying(255) NOT NULL,
    number_of_stars integer NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL,
    diameter_in_km integer NOT NULL,
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
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric NOT NULL,
    number_of_moons integer NOT NULL,
    diameter_in_km integer NOT NULL,
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
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL,
    temperature_in_kelvin integer NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 'Most famous periodic comet', 200, 11, true, '1986-02-09', 1);
INSERT INTO public.comet VALUES (2, 'Comet Hale-Bopp', 'One of the most widely observed comets', 4200, 40, false, '1997-04-01', 1);
INSERT INTO public.comet VALUES (3, 'Comet NEOWISE', 'Bright comet visible in 2020', 4500, 5, false, '2020-07-03', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, 0, 'Spiral', 100000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 10000, 2537, 'Spiral', 1000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in the Local Group', 5000, 3000, 'Spiral', 40000000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Famous for its supermassive black hole', 6000, 53000, 'Elliptical', 2000000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Resembles a sombrero hat', 9000, 29000, 'Spiral', 80000000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Known for its spiral structure', 4000, 23000, 'Spiral', 300000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s natural satellite', 4500, true, 3474, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger moon of Mars', 4500, false, 22, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller moon of Mars', 4500, false, 12, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanically active moon of Jupiter', 4500, true, 3643, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 'Moon with a subsurface ocean', 4500, true, 3121, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the Solar System', 4500, true, 5268, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered moon of Jupiter', 4500, true, 4821, 4);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn', 4500, true, 5149, 5);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Moon with geysers of water', 4500, true, 504, 5);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Moon with a large crater', 4500, true, 396, 5);
INSERT INTO public.moon VALUES (11, 'Triton', 'Largest moon of Neptune', 4500, true, 2706, 7);
INSERT INTO public.moon VALUES (12, 'Charon', 'Largest moon of Pluto', 4500, true, 1212, 8);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Second-largest moon of Saturn', 4500, true, 1527, 5);
INSERT INTO public.moon VALUES (14, 'Oberon', 'Outermost moon of Uranus', 4500, true, 1523, 8);
INSERT INTO public.moon VALUES (15, 'Titania', 'Largest moon of Uranus', 4500, true, 1576, 8);
INSERT INTO public.moon VALUES (16, 'Miranda', 'Moon with extreme surface features', 4500, true, 471, 8);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Brightest moon of Uranus', 4500, true, 1158, 8);
INSERT INTO public.moon VALUES (18, 'Dione', 'Moon with wispy terrain', 4500, true, 1123, 5);
INSERT INTO public.moon VALUES (19, 'Iapetus', 'Moon with a two-tone coloration', 4500, true, 1469, 5);
INSERT INTO public.moon VALUES (20, 'Hyperion', 'Moon with a sponge-like appearance', 4500, false, 270, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet', true, true, 0, 1, 12742, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The Red Planet', false, true, 225, 2, 6779, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Second planet from the Sun', false, true, 41, 0, 12104, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Largest planet in the Solar System', false, true, 628, 79, 139820, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Known for its rings', false, true, 1277, 83, 116460, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', 'Closest planet to the Sun', false, true, 77, 0, 4879, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Farthest planet from the Sun', false, true, 4350, 14, 49244, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Ice giant with a blue-green color', false, true, 2720, 27, 50724, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 'Earth-like exoplanet', false, true, 1400, 0, 18000, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'Closest known exoplanet', false, true, 4.24, 0, 14000, 6);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'First exoplanet detected by its transit', false, true, 150, 0, 140000, 3);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 'Potentially habitable exoplanet', false, true, 39, 0, 11000, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our home star', 4600, true, 5778, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'Closest star system to the Sun', 6000, true, 5790, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant in Orion', 8000, true, 3500, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'Brightest star in the night sky', 250, true, 9940, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'Bright star in the Lyra constellation', 455, true, 9602, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Closest known star to the Sun', 4800, true, 3042, 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


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
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

