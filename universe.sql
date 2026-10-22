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
    name character varying(60) NOT NULL,
    galaxy_type text NOT NULL,
    age_in_millions_of_years numeric(12,2) NOT NULL,
    star_count integer NOT NULL,
    has_life boolean NOT NULL
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    is_spherical boolean NOT NULL,
    discovery_year integer NOT NULL,
    description text NOT NULL
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_type_id integer NOT NULL,
    orbital_period_days numeric(12,3) NOT NULL,
    diameter_km integer NOT NULL,
    has_rings boolean NOT NULL,
    description text NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    is_gaseous boolean NOT NULL,
    typical_density numeric(6,2) NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_class character varying(8) NOT NULL,
    mass_solar numeric(8,3) NOT NULL,
    has_planets boolean NOT NULL,
    discovery_note text NOT NULL
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral', 13600.00, 100000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred spiral', 10010.00, 1000000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000.00, 40000, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 13000.00, 30000, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Grand-design spiral', 13000.00, 100000, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Lenticular', 13000.00, 80000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3475, true, -4000, 'Earth’s natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false, 1877, 'The larger and closer moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false, 1877, 'The smaller outer moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, true, 1610, 'A volcanically active Jovian moon.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, true, 1610, 'An icy moon with a subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, true, 1610, 'The largest moon in the solar system.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, true, 1610, 'A heavily cratered outer moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, false, 1892, 'A small, irregular inner moon of Jupiter.');
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 139, false, 1904, 'The largest member of Jupiter’s Himalia group.');
INSERT INTO public.moon VALUES (10, 'Elara', 5, 79, false, 1905, 'An irregular prograde moon of Jupiter.');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 396, true, 1789, 'A small icy moon with a prominent crater.');
INSERT INTO public.moon VALUES (12, 'Enceladus', 6, 504, true, 1789, 'An icy moon that vents water-rich plumes.');
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1062, true, 1684, 'A mid-sized icy moon of Saturn.');
INSERT INTO public.moon VALUES (14, 'Dione', 6, 1123, true, 1684, 'An icy moon with bright fracture systems.');
INSERT INTO public.moon VALUES (15, 'Rhea', 6, 1527, true, 1672, 'The second-largest moon of Saturn.');
INSERT INTO public.moon VALUES (16, 'Titan', 6, 5150, true, 1655, 'A moon with lakes and rivers of liquid hydrocarbons.');
INSERT INTO public.moon VALUES (17, 'Iapetus', 6, 1469, true, 1671, 'A two-toned moon with a distinctive equatorial ridge.');
INSERT INTO public.moon VALUES (18, 'Miranda', 7, 472, true, 1948, 'A small moon with dramatic cliffs and varied terrain.');
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 1158, true, 1851, 'The brightest of Uranus’s large moons.');
INSERT INTO public.moon VALUES (20, 'Umbriel', 7, 1169, true, 1851, 'A dark, heavily cratered moon of Uranus.');
INSERT INTO public.moon VALUES (21, 'Titania', 7, 1578, true, 1787, 'The largest moon of Uranus.');
INSERT INTO public.moon VALUES (22, 'Oberon', 7, 1523, true, 1787, 'A distant, ancient moon of Uranus.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1, 87.969, 4879, false, 'The smallest planet and closest to the Sun.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, 224.701, 12104, false, 'A dense world with a hot carbon-dioxide atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 365.256, 12742, false, 'The only known world with abundant surface life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, 686.980, 6779, false, 'A cold desert world with ancient river valleys.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, 4332.589, 139820, true, 'The largest planet in the solar system.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, 10759.220, 116460, true, 'A gas giant known for its bright ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3, 30688.500, 50724, true, 'An ice giant that rotates on its side.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3, 60182.000, 49244, true, 'A distant ice giant with supersonic winds.');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 4, 11.186, 14000, false, 'A candidate temperate planet orbiting Proxima Centauri.');
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1 e', 3, 1, 6.100, 11600, false, 'A compact rocky world in the TRAPPIST-1 system.');
INSERT INTO public.planet VALUES (11, 'Kepler-186 f', 4, 1, 129.944, 14000, false, 'An Earth-sized planet in its star’s habitable zone.');
INSERT INTO public.planet VALUES (12, '55 Cancri e', 7, 4, 0.737, 19400, false, 'A very hot super-Earth with a close-in orbit.');


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'A rocky planet with a solid surface.', false, 5.00);
INSERT INTO public.planet_type VALUES (2, 'Gas giant', 'A massive planet composed primarily of hydrogen and helium.', true, 1.30);
INSERT INTO public.planet_type VALUES (3, 'Ice giant', 'A planet rich in volatile compounds such as water, ammonia, and methane.', true, 1.60);
INSERT INTO public.planet_type VALUES (4, 'Super-Earth', 'A planet more massive than Earth but lighter than the ice giants.', false, 4.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.000, true, 'The star at the center of our solar system.');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M5.5V', 0.122, true, 'The nearest known star to the Sun.');
INSERT INTO public.star VALUES (3, 'TRAPPIST-1', 1, 'M8V', 0.089, true, 'An ultracool dwarf with a compact planetary system.');
INSERT INTO public.star VALUES (4, 'Kepler-186', 1, 'M1V', 0.478, true, 'A red dwarf with a planet in its habitable zone.');
INSERT INTO public.star VALUES (5, 'Sirius A', 1, 'A1V', 2.063, false, 'The brightest star in Earth’s night sky.');
INSERT INTO public.star VALUES (6, 'Vega', 1, 'A0V', 2.135, false, 'A nearby star in the constellation Lyra.');
INSERT INTO public.star VALUES (7, 'Rigil Kentaurus', 1, 'G2V', 1.100, true, 'The primary star in the Alpha Centauri system.');
INSERT INTO public.star VALUES (8, 'Barnard’s Star', 1, 'M4V', 0.144, true, 'A red dwarf among the Sun’s closest neighbors.');


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

