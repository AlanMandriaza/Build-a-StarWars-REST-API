toc.dat                                                                                             0000600 0004000 0002000 00000025250 14413511472 0014445 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP            '    	            {            example %   12.12 (Ubuntu 12.12-0ubuntu0.20.04.1) %   12.12 (Ubuntu 12.12-0ubuntu0.20.04.1) )    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16384    example    DATABASE     y   CREATE DATABASE example WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE example;
                gitpod    false                     3079    16385    unaccent 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;
    DROP EXTENSION unaccent;
                   false         �           0    0    EXTENSION unaccent    COMMENT     P   COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';
                        false    2         �            1259    16397    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    gitpod    false         �            1259    16414 	   character    TABLE     �   CREATE TABLE public."character" (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(1000)
);
    DROP TABLE public."character";
       public         heap    gitpod    false         �            1259    16412    character_id_seq    SEQUENCE     �   CREATE SEQUENCE public.character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.character_id_seq;
       public          gitpod    false    207         �           0    0    character_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.character_id_seq OWNED BY public."character".id;
          public          gitpod    false    206         �            1259    16436    favorite    TABLE     �   CREATE TABLE public.favorite (
    id integer NOT NULL,
    user_id integer,
    planet_id integer,
    character_id integer
);
    DROP TABLE public.favorite;
       public         heap    gitpod    false         �            1259    16434    favorite_id_seq    SEQUENCE     �   CREATE SEQUENCE public.favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.favorite_id_seq;
       public          gitpod    false    211         �           0    0    favorite_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.favorite_id_seq OWNED BY public.favorite.id;
          public          gitpod    false    210         �            1259    16425    planet    TABLE     �   CREATE TABLE public.planet (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(1000)
);
    DROP TABLE public.planet;
       public         heap    gitpod    false         �            1259    16423    planet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.planet_id_seq;
       public          gitpod    false    209         �           0    0    planet_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.id;
          public          gitpod    false    208         �            1259    16404    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(120) NOT NULL,
    password character varying(80) NOT NULL,
    first_name character varying(120),
    last_name character varying(120)
);
    DROP TABLE public."user";
       public         heap    gitpod    false         �            1259    16402    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          gitpod    false    205         �           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          gitpod    false    204                    2604    16417    character id    DEFAULT     n   ALTER TABLE ONLY public."character" ALTER COLUMN id SET DEFAULT nextval('public.character_id_seq'::regclass);
 =   ALTER TABLE public."character" ALTER COLUMN id DROP DEFAULT;
       public          gitpod    false    207    206    207                    2604    16439    favorite id    DEFAULT     j   ALTER TABLE ONLY public.favorite ALTER COLUMN id SET DEFAULT nextval('public.favorite_id_seq'::regclass);
 :   ALTER TABLE public.favorite ALTER COLUMN id DROP DEFAULT;
       public          gitpod    false    210    211    211                    2604    16428 	   planet id    DEFAULT     f   ALTER TABLE ONLY public.planet ALTER COLUMN id SET DEFAULT nextval('public.planet_id_seq'::regclass);
 8   ALTER TABLE public.planet ALTER COLUMN id DROP DEFAULT;
       public          gitpod    false    208    209    209                    2604    16407    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          gitpod    false    204    205    205         �          0    16397    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          gitpod    false    203       2972.dat �          0    16414 	   character 
   TABLE DATA           <   COPY public."character" (id, name, description) FROM stdin;
    public          gitpod    false    207       2976.dat �          0    16436    favorite 
   TABLE DATA           H   COPY public.favorite (id, user_id, planet_id, character_id) FROM stdin;
    public          gitpod    false    211       2980.dat �          0    16425    planet 
   TABLE DATA           7   COPY public.planet (id, name, description) FROM stdin;
    public          gitpod    false    209       2978.dat �          0    16404    user 
   TABLE DATA           L   COPY public."user" (id, email, password, first_name, last_name) FROM stdin;
    public          gitpod    false    205       2974.dat �           0    0    character_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.character_id_seq', 10, true);
          public          gitpod    false    206         �           0    0    favorite_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.favorite_id_seq', 11, true);
          public          gitpod    false    210         �           0    0    planet_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.planet_id_seq', 25, true);
          public          gitpod    false    208         �           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 16, true);
          public          gitpod    false    204                    2606    16401 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            gitpod    false    203                    2606    16422    character character_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."character" DROP CONSTRAINT character_pkey;
       public            gitpod    false    207                    2606    16441    favorite favorite_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.favorite DROP CONSTRAINT favorite_pkey;
       public            gitpod    false    211                    2606    16433    planet planet_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
       public            gitpod    false    209                    2606    16411    user user_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_email_key;
       public            gitpod    false    205                    2606    16409    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            gitpod    false    205                    2606    16442 #   favorite favorite_character_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id);
 M   ALTER TABLE ONLY public.favorite DROP CONSTRAINT favorite_character_id_fkey;
       public          gitpod    false    2838    207    211                    2606    16447     favorite favorite_planet_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(id);
 J   ALTER TABLE ONLY public.favorite DROP CONSTRAINT favorite_planet_id_fkey;
       public          gitpod    false    2840    209    211                    2606    16452    favorite favorite_user_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 H   ALTER TABLE ONLY public.favorite DROP CONSTRAINT favorite_user_id_fkey;
       public          gitpod    false    211    2836    205                                                                                                                                                                                                                                                                                                                                                                2972.dat                                                                                            0000600 0004000 0002000 00000000022 14413511472 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        650f4be04be2
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2976.dat                                                                                            0000600 0004000 0002000 00000002133 14413511472 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Luke Skywalker	The son of the fallen Jedi Knight Anakin Skywalker and the Queen of Naboo, Padmé Amidala.
2	Han Solo	A smuggler and captain of the Millennium Falcon who becomes a hero of the Rebel Alliance.
3	Princess Leia Organa	The daughter of the fallen Jedi Knight Anakin Skywalker and the Queen of Naboo, Padmé Amidala, who becomes a leader in the Rebel Alliance.
4	Chewbacca	A Wookiee, a tall, hirsute biped and intelligent species from the planet Kashyyyk.
5	Obi-Wan Kenobi	A Jedi Knight and mentor to both Anakin Skywalker and his son, Luke.
6	Yoda	One of the most renowned and powerful Jedi Masters in galactic history.
7	Darth Vader	The Sith Lord who was once Anakin Skywalker, before he turned to the dark side of the Force.
8	Boba Fett	A bounty hunter who wears customized Mandalorian armor and is known for his ruthlessness and cunning.
9	R2-D2	An astromech droid who has been a constant companion to several generations of Skywalkers and their allies.
10	C-3PO	A protocol droid built by Anakin Skywalker who has been a constant companion to several generations of Skywalkers and their allies.
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                     2980.dat                                                                                            0000600 0004000 0002000 00000000155 14413511472 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	5	\N
2	2	5	\N
3	3	10	\N
4	4	7	\N
5	5	1	\N
6	6	8	\N
7	7	9	\N
8	8	8	\N
9	9	6	\N
10	1	2	\N
11	10	10	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                   2978.dat                                                                                            0000600 0004000 0002000 00000000672 14413511472 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	mercurio	El planeta más cercano al Sol.
2	Venus	El planeta más caliente de nuestro sistema solar.
3	Tierra	Nuestro hogar.
4	Marte	El planeta rojo.
5	Júpiter	El planeta más grande de nuestro sistema solar.
6	Saturno	El planeta con los anillos más llamativos.
7	Urano	El planeta inclinado.
8	Neptuno	El planeta más lejano del Sol.
9	Plutón	El planeta enano.
10	Eris	El planeta enano más masivo conocido en nuestro sistema solar.
\.


                                                                      2974.dat                                                                                            0000600 0004000 0002000 00000000716 14413511472 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	andrewjohnson@example.com	p@ssw0rd	Andrew	Johnson
2	emilywang@example.com	p@ssw0rd	Emily	Wang
3	alexanderlee@example.com	p@ssw0rd	Alexander	Lee
4	samjackson@example.com	p@ssw0rd	Sam	Jackson
5	lucycarter@example.com	p@ssw0rd	Lucy	Carter
6	johndoe@example.com	p@ssw0rd	John	Doe
7	janedoe@example.com	p@ssw0rd	Jane	Doe
8	bobsmith@example.com	p@ssw0rd	Bob	Smith
9	amandajohnson@example.com	p@ssw0rd	Amanda	Johnson
10	tomwilson@example.com	p@ssw0rd	Tom	Wilson
\.


                                                  restore.sql                                                                                         0000600 0004000 0002000 00000021237 14413511472 0015373 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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

DROP DATABASE example;
--
-- Name: example; Type: DATABASE; Schema: -; Owner: gitpod
--

CREATE DATABASE example WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE example OWNER TO gitpod;

\connect example

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

--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: gitpod
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO gitpod;

--
-- Name: character; Type: TABLE; Schema: public; Owner: gitpod
--

CREATE TABLE public."character" (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(1000)
);


ALTER TABLE public."character" OWNER TO gitpod;

--
-- Name: character_id_seq; Type: SEQUENCE; Schema: public; Owner: gitpod
--

CREATE SEQUENCE public.character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_id_seq OWNER TO gitpod;

--
-- Name: character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitpod
--

ALTER SEQUENCE public.character_id_seq OWNED BY public."character".id;


--
-- Name: favorite; Type: TABLE; Schema: public; Owner: gitpod
--

CREATE TABLE public.favorite (
    id integer NOT NULL,
    user_id integer,
    planet_id integer,
    character_id integer
);


ALTER TABLE public.favorite OWNER TO gitpod;

--
-- Name: favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: gitpod
--

CREATE SEQUENCE public.favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorite_id_seq OWNER TO gitpod;

--
-- Name: favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitpod
--

ALTER SEQUENCE public.favorite_id_seq OWNED BY public.favorite.id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: gitpod
--

CREATE TABLE public.planet (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(1000)
);


ALTER TABLE public.planet OWNER TO gitpod;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: gitpod
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO gitpod;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitpod
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: gitpod
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(120) NOT NULL,
    password character varying(80) NOT NULL,
    first_name character varying(120),
    last_name character varying(120)
);


ALTER TABLE public."user" OWNER TO gitpod;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitpod
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO gitpod;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitpod
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: character id; Type: DEFAULT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public."character" ALTER COLUMN id SET DEFAULT nextval('public.character_id_seq'::regclass);


--
-- Name: favorite id; Type: DEFAULT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.favorite ALTER COLUMN id SET DEFAULT nextval('public.favorite_id_seq'::regclass);


--
-- Name: planet id; Type: DEFAULT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.planet ALTER COLUMN id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: gitpod
--

COPY public.alembic_version (version_num) FROM stdin;
\.
COPY public.alembic_version (version_num) FROM '$$PATH$$/2972.dat';

--
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: gitpod
--

COPY public."character" (id, name, description) FROM stdin;
\.
COPY public."character" (id, name, description) FROM '$$PATH$$/2976.dat';

--
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: gitpod
--

COPY public.favorite (id, user_id, planet_id, character_id) FROM stdin;
\.
COPY public.favorite (id, user_id, planet_id, character_id) FROM '$$PATH$$/2980.dat';

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: gitpod
--

COPY public.planet (id, name, description) FROM stdin;
\.
COPY public.planet (id, name, description) FROM '$$PATH$$/2978.dat';

--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: gitpod
--

COPY public."user" (id, email, password, first_name, last_name) FROM stdin;
\.
COPY public."user" (id, email, password, first_name, last_name) FROM '$$PATH$$/2974.dat';

--
-- Name: character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitpod
--

SELECT pg_catalog.setval('public.character_id_seq', 10, true);


--
-- Name: favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitpod
--

SELECT pg_catalog.setval('public.favorite_id_seq', 11, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitpod
--

SELECT pg_catalog.setval('public.planet_id_seq', 25, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitpod
--

SELECT pg_catalog.setval('public.user_id_seq', 16, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: character character_pkey; Type: CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (id);


--
-- Name: favorite favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_pkey PRIMARY KEY (id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: favorite favorite_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id);


--
-- Name: favorite favorite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(id);


--
-- Name: favorite favorite_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 