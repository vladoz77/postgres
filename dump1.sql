--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE database;
DROP DATABASE my_test;




--
-- Drop roles
--

DROP ROLE postgres;
DROP ROLE vlad;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:UgQrUZVv5P8eaYqT6z0XZg==$76NuDFNa4hUK3Kz5xn643WHGdqB/2LZ78969xIHSBFg=:N65EODONGv0liHeTkXRHdJuVB6YPRsAOxV5dOaO3oC8=';
CREATE ROLE vlad;
ALTER ROLE vlad WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-2.pgdg110+2)
-- Dumped by pg_dump version 14.5 (Debian 14.5-2.pgdg110+2)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "database" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-2.pgdg110+2)
-- Dumped by pg_dump version 14.5 (Debian 14.5-2.pgdg110+2)

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
-- Name: database; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE database WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE database OWNER TO postgres;

\connect database

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
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    contents character varying(240),
    user_id integer,
    photo_id integer
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: coments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coments_id_seq OWNER TO postgres;

--
-- Name: coments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coments_id_seq OWNED BY public.comments.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photos (
    id integer NOT NULL,
    url character varying(200),
    user_id integer
);


ALTER TABLE public.photos OWNER TO postgres;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO postgres;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.coments_id_seq'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, contents, user_id, photo_id) FROM stdin;
101	Quo velit iusto ducimus quos a incidunt nesciunt facilis.	2	4
102	Non est totam.	5	5
103	Fuga et iste beatae.	3	3
104	Molestias tempore est.	1	5
105	Est voluptatum voluptatem voluptatem est ullam quod quia in.	1	5
106	Aut et similique porro ullam.	1	3
107	Fugiat cupiditate consequatur sit magni at non ad omnis.	1	2
108	Accusantium illo maiores et sed maiores quod natus.	2	5
109	Perferendis cumque eligendi.	1	2
110	Nihil quo voluptatem placeat.	5	5
111	Rerum dolor sunt sint.	5	2
112	Id corrupti tenetur similique reprehenderit qui sint qui nulla tenetur.	2	1
113	Maiores quo quia.	1	5
114	Culpa perferendis qui perferendis eligendi officia neque ex.	1	4
115	Reprehenderit voluptates rerum qui veritatis ut.	1	1
116	Aut ipsum porro deserunt maiores sit.	5	3
117	Aut qui eum eos soluta pariatur.	1	1
118	Praesentium tempora rerum necessitatibus aut.	4	3
119	Magni error voluptas veniam ipsum enim.	4	2
120	Et maiores libero quod aliquam sit voluptas.	2	3
121	Eius ab occaecati quae eos aut enim rem.	5	4
122	Et sit occaecati.	4	3
123	Illum omnis et excepturi totam eum omnis.	1	5
124	Nemo nihil rerum alias vel.	5	1
125	Voluptas ab eius.	5	1
126	Dolor soluta quisquam voluptatibus delectus.	3	5
127	Consequatur neque beatae.	4	5
128	Aliquid vel voluptatem.	4	5
129	Maiores nulla ea non autem.	4	5
130	Enim doloremque delectus.	1	4
131	Facere vel assumenda.	2	5
132	Fugiat dignissimos dolorum iusto fugit voluptas et.	2	1
133	Sed cumque in et.	1	3
134	Doloribus temporibus hic eveniet temporibus corrupti et voluptatem et sint.	5	4
135	Quia dolorem officia explicabo quae.	3	1
136	Ullam ad laborum totam veniam.	1	2
137	Et rerum voluptas et corporis rem in hic.	2	3
138	Tempora quas facere.	3	1
139	Rem autem corporis earum necessitatibus dolores explicabo iste quo.	5	5
140	Animi aperiam repellendus in aut eum consequatur quos.	1	2
141	Enim esse magni.	4	3
142	Saepe cumque qui pariatur.	4	4
143	Sit dolorem ipsam nisi.	4	1
144	Dolorem veniam nisi quidem.	2	5
145	Porro illum perferendis nemo libero voluptatibus vel.	3	3
146	Dicta enim rerum culpa a quo molestiae nam repudiandae at.	2	4
147	Consequatur magnam autem voluptas deserunt.	5	1
148	Incidunt cum delectus sunt tenetur et.	4	3
149	Non vel eveniet sed molestiae tempora.	2	1
150	Ad placeat repellat et veniam ea asperiores.	5	1
151	Eum aut magni sint.	3	1
152	Aperiam voluptates quis velit explicabo ipsam vero eum.	1	3
153	Error nesciunt blanditiis quae quis et tempora velit repellat sint.	2	4
154	Blanditiis saepe dolorem enim eos sed ea.	1	2
155	Ab veritatis est.	2	2
156	Vitae voluptatem voluptates vel nam.	3	1
157	Neque aspernatur est non ad vitae nisi ut nobis enim.	4	3
158	Debitis ut amet.	4	2
159	Pariatur beatae nihil cum molestiae provident vel.	4	4
160	Aperiam sunt aliquam illum impedit.	1	4
161	Aut laudantium necessitatibus harum eaque.	5	3
162	Debitis voluptatum nesciunt quisquam voluptatibus fugiat nostrum sed dolore quasi.	3	2
163	Praesentium velit voluptatem distinctio ut voluptatum at aut.	2	2
164	Voluptates nihil voluptatum quia maiores dolorum molestias occaecati.	1	4
165	Quisquam modi labore.	3	2
166	Fugit quia perferendis magni doloremque dicta officia dignissimos ut necessitatibus.	1	4
167	Tempora ipsam aut placeat ducimus ut exercitationem quis provident.	5	3
168	Expedita ducimus cum quibusdam.	5	1
169	In voluptates doloribus aut ut libero possimus adipisci iste.	3	2
170	Sit qui est sed accusantium quidem id voluptatum id.	1	5
171	Libero eius quo consequatur laudantium reiciendis reiciendis aliquid nemo.	1	2
172	Officia qui reprehenderit ut accusamus qui voluptatum at.	2	2
173	Ad similique quo.	4	1
174	Commodi culpa aut nobis qui illum deserunt reiciendis.	2	3
175	Tenetur quam aut rerum doloribus est ipsa autem.	4	2
176	Est accusamus aut nisi sit aut id non natus assumenda.	2	4
177	Et sit et vel quos recusandae quo qui.	1	3
178	Velit nihil voluptatem et sed.	4	4
179	Sunt vitae expedita fugiat occaecati.	1	3
180	Consequatur quod et ipsam in dolorem.	4	2
181	Magnam voluptatum molestias vitae voluptatibus beatae nostrum sunt.	3	5
182	Alias praesentium ut voluptatem alias praesentium tempora voluptas debitis.	2	5
183	Ipsam cumque aut consectetur mollitia vel quod voluptates provident suscipit.	3	5
184	Ad dignissimos quia aut commodi vel ut nisi.	3	3
185	Fugit ut architecto doloremque neque quis.	4	5
186	Repudiandae et voluptas aut in excepturi.	5	3
187	Aperiam voluptatem animi.	5	1
188	Et mollitia vel soluta fugiat.	4	1
189	Ut nemo voluptas voluptatem voluptas.	5	2
190	At aut quidem voluptatibus rem.	5	1
191	Temporibus voluptates iure fuga alias minus eius.	2	3
192	Non autem laboriosam consectetur officiis aut excepturi nobis commodi.	4	3
193	Esse voluptatem sed deserunt ipsum eaque maxime rerum qui.	5	5
194	Debitis ipsam ut pariatur molestiae ut qui aut reiciendis.	4	4
195	Illo atque nihil et quod consequatur neque pariatur delectus.	3	3
196	Qui et hic accusantium odio quis necessitatibus et magni.	4	2
197	Debitis repellendus inventore omnis est facere aliquam.	3	3
198	Occaecati eos possimus deleniti itaque aliquam accusamus.	3	4
199	Molestiae officia architecto eius nesciunt.	5	4
200	Minima dolorem reiciendis excepturi culpa sapiente eos deserunt ut.	3	3
\.


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photos (id, url, user_id) FROM stdin;
1	https://santina.net	3
2	https://alayna.net	5
3	https://kailyn.name	3
4	http://chet.net	5
5	http://jerrold.org	2
6	https://meredith.net	4
7	http://isaias.net	4
8	http://dayne.com	4
9	http://colten.net	2
10	https://adelbert.biz	5
11	https://deon.biz	2
12	https://marina.com	5
13	https://linda.info	2
14	https://tyrique.info	4
15	http://buddy.info	5
16	https://elinore.name	2
17	http://sasha.com	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username) FROM stdin;
2	Micah.Cremin
3	Alfredo66
4	Gerard_Mitchell42
5	Frederique_Donnelly
1	Antonio_Alvares
\.


--
-- Name: coments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coments_id_seq', 200, true);


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photos_id_seq', 17, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: comments coments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT coments_pkey PRIMARY KEY (id);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: comments coments_photo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT coments_photo_id_fkey FOREIGN KEY (photo_id) REFERENCES public.photos(id) ON DELETE CASCADE;


--
-- Name: comments coments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT coments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: photos photos_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: DATABASE database; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE database TO vlad;


--
-- PostgreSQL database dump complete
--

--
-- Database "my_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-2.pgdg110+2)
-- Dumped by pg_dump version 14.5 (Debian 14.5-2.pgdg110+2)

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
-- Name: my_test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE my_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE my_test OWNER TO postgres;

\connect my_test

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
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-2.pgdg110+2)
-- Dumped by pg_dump version 14.5 (Debian 14.5-2.pgdg110+2)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

