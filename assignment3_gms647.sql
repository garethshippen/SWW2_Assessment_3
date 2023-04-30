--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: base; Type: TABLE; Schema: public; Owner: fsad
--

CREATE TABLE public.base (
    base_id integer NOT NULL,
    player_id integer NOT NULL,
    level integer
);


ALTER TABLE public.base OWNER TO fsad;

--
-- Name: basebuilding; Type: TABLE; Schema: public; Owner: fsad
--

CREATE TABLE public.basebuilding (
    building_id integer NOT NULL,
    base_id integer NOT NULL
);


ALTER TABLE public.basebuilding OWNER TO fsad;

--
-- Name: building; Type: TABLE; Schema: public; Owner: fsad
--

CREATE TABLE public.building (
    building_id integer NOT NULL,
    building_name character varying(50),
    building_description text,
    resource_generated integer
);


ALTER TABLE public.building OWNER TO fsad;

--
-- Name: aishakhan_buildings; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.aishakhan_buildings AS
 SELECT building.building_name
   FROM ((public.base
     JOIN public.basebuilding USING (base_id))
     JOIN public.building USING (building_id))
  WHERE (base.player_id = 6);


ALTER TABLE public.aishakhan_buildings OWNER TO fsad;

--
-- Name: player; Type: TABLE; Schema: public; Owner: fsad
--

CREATE TABLE public.player (
    player_id integer NOT NULL,
    player_name character varying(100),
    player_password character varying(50)
);


ALTER TABLE public.player OWNER TO fsad;

--
-- Name: playercurrency; Type: TABLE; Schema: public; Owner: fsad
--

CREATE TABLE public.playercurrency (
    player_id integer NOT NULL,
    currency_id integer NOT NULL,
    amount integer
);


ALTER TABLE public.playercurrency OWNER TO fsad;

--
-- Name: aishakhan_currencies; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.aishakhan_currencies AS
 SELECT ( SELECT player.player_name
           FROM public.player
          WHERE (player.player_id = 6)) AS "Name",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 6) AND (playercurrency.currency_id = 1))) AS "Gold Amount",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 6) AND (playercurrency.currency_id = 2))) AS "Ethereal Silver Amount",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 6) AND (playercurrency.currency_id = 3))) AS "Diamonds Amount";


ALTER TABLE public.aishakhan_currencies OWNER TO fsad;

--
-- Name: playerresource; Type: TABLE; Schema: public; Owner: fsad
--

CREATE TABLE public.playerresource (
    player_id integer NOT NULL,
    resource_id integer NOT NULL,
    amount integer
);


ALTER TABLE public.playerresource OWNER TO fsad;

--
-- Name: aishakhan_resources; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.aishakhan_resources AS
 SELECT ( SELECT player.player_name
           FROM public.player
          WHERE (player.player_id = 6)) AS "Name",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 6) AND (playerresource.resource_id = 1))) AS "Food Amount",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 6) AND (playerresource.resource_id = 2))) AS "Wood Amount",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 6) AND (playerresource.resource_id = 3))) AS "Stone Amount";


ALTER TABLE public.aishakhan_resources OWNER TO fsad;

--
-- Name: buildingcost; Type: TABLE; Schema: public; Owner: fsad
--

CREATE TABLE public.buildingcost (
    building_id integer NOT NULL,
    resource_id integer NOT NULL,
    amount integer,
    build_time interval
);


ALTER TABLE public.buildingcost OWNER TO fsad;

--
-- Name: constructionqueue; Type: TABLE; Schema: public; Owner: fsad
--

CREATE TABLE public.constructionqueue (
    construction_id integer NOT NULL,
    building_id integer,
    base_id integer,
    start_date date
);


ALTER TABLE public.constructionqueue OWNER TO fsad;

--
-- Name: currency; Type: TABLE; Schema: public; Owner: fsad
--

CREATE TABLE public.currency (
    currency_id integer NOT NULL,
    currency_name character varying(50),
    premium boolean
);


ALTER TABLE public.currency OWNER TO fsad;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: fsad
--

CREATE TABLE public.resource (
    resource_id integer NOT NULL,
    resource_name character varying(50)
);


ALTER TABLE public.resource OWNER TO fsad;

--
-- Name: farm_info; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.farm_info AS
 SELECT ( SELECT building.building_name
           FROM public.building
          WHERE (building.building_id = 1)) AS "Name",
    ( SELECT building.building_description
           FROM public.building
          WHERE (building.building_id = 1)) AS "Description",
    ( SELECT resource.resource_name
           FROM public.resource
          WHERE (resource.resource_id = ( SELECT building.resource_generated
                   FROM public.building
                  WHERE (building.building_id = 1)))) AS "Resources Generated",
    ( SELECT buildingcost.amount
           FROM public.buildingcost
          WHERE (buildingcost.building_id = 1)) AS "Required Gold",
    ( SELECT buildingcost.build_time
           FROM public.buildingcost
          WHERE (buildingcost.building_id = 1)) AS "Build Time";


ALTER TABLE public.farm_info OWNER TO fsad;

--
-- Name: fatimaahmed_buildings; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.fatimaahmed_buildings AS
 SELECT building.building_name
   FROM ((public.base
     JOIN public.basebuilding USING (base_id))
     JOIN public.building USING (building_id))
  WHERE (base.player_id = 4);


ALTER TABLE public.fatimaahmed_buildings OWNER TO fsad;

--
-- Name: fatimaahmed_currencies; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.fatimaahmed_currencies AS
 SELECT ( SELECT player.player_name
           FROM public.player
          WHERE (player.player_id = 4)) AS "Name",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 4) AND (playercurrency.currency_id = 1))) AS "Gold Amount",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 4) AND (playercurrency.currency_id = 2))) AS "Ethereal Silver Amount",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 4) AND (playercurrency.currency_id = 3))) AS "Diamonds Amount";


ALTER TABLE public.fatimaahmed_currencies OWNER TO fsad;

--
-- Name: fatimaahmed_resources; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.fatimaahmed_resources AS
 SELECT ( SELECT player.player_name
           FROM public.player
          WHERE (player.player_id = 4)) AS "Name",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 4) AND (playerresource.resource_id = 1))) AS "Food Amount",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 4) AND (playerresource.resource_id = 2))) AS "Wood Amount",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 4) AND (playerresource.resource_id = 3))) AS "Stone Amount";


ALTER TABLE public.fatimaahmed_resources OWNER TO fsad;

--
-- Name: gold_mine_info; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.gold_mine_info AS
 SELECT ( SELECT building.building_name
           FROM public.building
          WHERE (building.building_id = 4)) AS "Name",
    ( SELECT building.building_description
           FROM public.building
          WHERE (building.building_id = 4)) AS "Description",
    ( SELECT resource.resource_name
           FROM public.resource
          WHERE (resource.resource_id = ( SELECT building.resource_generated
                   FROM public.building
                  WHERE (building.building_id = 4)))) AS "Resources Generated",
    ( SELECT buildingcost.amount
           FROM public.buildingcost
          WHERE (buildingcost.building_id = 4)) AS "Required Gold",
    ( SELECT buildingcost.build_time
           FROM public.buildingcost
          WHERE (buildingcost.building_id = 4)) AS "Build Time";


ALTER TABLE public.gold_mine_info OWNER TO fsad;

--
-- Name: harrysmith_buildings; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.harrysmith_buildings AS
 SELECT building.building_name
   FROM ((public.base
     JOIN public.basebuilding USING (base_id))
     JOIN public.building USING (building_id))
  WHERE (base.player_id = 1);


ALTER TABLE public.harrysmith_buildings OWNER TO fsad;

--
-- Name: harrysmith_currencies; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.harrysmith_currencies AS
 SELECT ( SELECT player.player_name
           FROM public.player
          WHERE (player.player_id = 1)) AS "Name",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 1) AND (playercurrency.currency_id = 1))) AS "Gold Amount",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 1) AND (playercurrency.currency_id = 2))) AS "Ethereal Silver Amount",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 1) AND (playercurrency.currency_id = 3))) AS "Diamonds Amount";


ALTER TABLE public.harrysmith_currencies OWNER TO fsad;

--
-- Name: harrysmith_resources; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.harrysmith_resources AS
 SELECT ( SELECT player.player_name
           FROM public.player
          WHERE (player.player_id = 1)) AS "Name",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 1) AND (playerresource.resource_id = 1))) AS "Food Amount",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 1) AND (playerresource.resource_id = 2))) AS "Wood Amount",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 1) AND (playerresource.resource_id = 3))) AS "Stone Amount";


ALTER TABLE public.harrysmith_resources OWNER TO fsad;

--
-- Name: lumber_mill_info; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.lumber_mill_info AS
 SELECT ( SELECT building.building_name
           FROM public.building
          WHERE (building.building_id = 2)) AS "Name",
    ( SELECT building.building_description
           FROM public.building
          WHERE (building.building_id = 2)) AS "Description",
    ( SELECT resource.resource_name
           FROM public.resource
          WHERE (resource.resource_id = ( SELECT building.resource_generated
                   FROM public.building
                  WHERE (building.building_id = 2)))) AS "Resources Generated",
    ( SELECT buildingcost.amount
           FROM public.buildingcost
          WHERE (buildingcost.building_id = 2)) AS "Required Gold",
    ( SELECT buildingcost.build_time
           FROM public.buildingcost
          WHERE (buildingcost.building_id = 2)) AS "Build Time";


ALTER TABLE public.lumber_mill_info OWNER TO fsad;

--
-- Name: marketplace_info; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.marketplace_info AS
 SELECT ( SELECT building.building_name
           FROM public.building
          WHERE (building.building_id = 5)) AS "Name",
    ( SELECT building.building_description
           FROM public.building
          WHERE (building.building_id = 5)) AS "Description",
    ( SELECT resource.resource_name
           FROM public.resource
          WHERE (resource.resource_id = ( SELECT building.resource_generated
                   FROM public.building
                  WHERE (building.building_id = 5)))) AS "Resources Generated",
    ( SELECT buildingcost.amount
           FROM public.buildingcost
          WHERE (buildingcost.building_id = 5)) AS "Required Gold",
    ( SELECT buildingcost.build_time
           FROM public.buildingcost
          WHERE (buildingcost.building_id = 5)) AS "Build Time";


ALTER TABLE public.marketplace_info OWNER TO fsad;

--
-- Name: mohammedali_buildings; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.mohammedali_buildings AS
 SELECT building.building_name
   FROM ((public.base
     JOIN public.basebuilding USING (base_id))
     JOIN public.building USING (building_id))
  WHERE (base.player_id = 5);


ALTER TABLE public.mohammedali_buildings OWNER TO fsad;

--
-- Name: mohammedali_currencies; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.mohammedali_currencies AS
 SELECT ( SELECT player.player_name
           FROM public.player
          WHERE (player.player_id = 5)) AS "Name",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 5) AND (playercurrency.currency_id = 1))) AS "Gold Amount",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 5) AND (playercurrency.currency_id = 2))) AS "Ethereal Silver Amount",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 5) AND (playercurrency.currency_id = 3))) AS "Diamonds Amount";


ALTER TABLE public.mohammedali_currencies OWNER TO fsad;

--
-- Name: mohammedali_resources; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.mohammedali_resources AS
 SELECT ( SELECT player.player_name
           FROM public.player
          WHERE (player.player_id = 5)) AS "Name",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 5) AND (playerresource.resource_id = 1))) AS "Food Amount",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 5) AND (playerresource.resource_id = 2))) AS "Wood Amount",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 5) AND (playerresource.resource_id = 3))) AS "Stone Amount";


ALTER TABLE public.mohammedali_resources OWNER TO fsad;

--
-- Name: olivertaylor_buildings; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.olivertaylor_buildings AS
 SELECT building.building_name
   FROM ((public.base
     JOIN public.basebuilding USING (base_id))
     JOIN public.building USING (building_id))
  WHERE (base.player_id = 3);


ALTER TABLE public.olivertaylor_buildings OWNER TO fsad;

--
-- Name: olivertaylor_currencies; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.olivertaylor_currencies AS
 SELECT ( SELECT player.player_name
           FROM public.player
          WHERE (player.player_id = 3)) AS "Name",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 3) AND (playercurrency.currency_id = 1))) AS "Gold Amount",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 3) AND (playercurrency.currency_id = 2))) AS "Ethereal Silver Amount",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 3) AND (playercurrency.currency_id = 3))) AS "Diamonds Amount";


ALTER TABLE public.olivertaylor_currencies OWNER TO fsad;

--
-- Name: olivertaylor_resources; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.olivertaylor_resources AS
 SELECT ( SELECT player.player_name
           FROM public.player
          WHERE (player.player_id = 3)) AS "Name",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 3) AND (playerresource.resource_id = 1))) AS "Food Amount",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 3) AND (playerresource.resource_id = 2))) AS "Wood Amount",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 3) AND (playerresource.resource_id = 3))) AS "Stone Amount";


ALTER TABLE public.olivertaylor_resources OWNER TO fsad;

--
-- Name: sophiebrown_buildings; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.sophiebrown_buildings AS
 SELECT building.building_name
   FROM ((public.base
     JOIN public.basebuilding USING (base_id))
     JOIN public.building USING (building_id))
  WHERE (base.player_id = 2);


ALTER TABLE public.sophiebrown_buildings OWNER TO fsad;

--
-- Name: sophiebrown_currencies; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.sophiebrown_currencies AS
 SELECT ( SELECT player.player_name
           FROM public.player
          WHERE (player.player_id = 2)) AS "Name",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 2) AND (playercurrency.currency_id = 1))) AS "Gold Amount",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 2) AND (playercurrency.currency_id = 2))) AS "Ethereal Silver Amount",
    ( SELECT playercurrency.amount
           FROM public.playercurrency
          WHERE ((playercurrency.player_id = 2) AND (playercurrency.currency_id = 3))) AS "Diamonds Amount";


ALTER TABLE public.sophiebrown_currencies OWNER TO fsad;

--
-- Name: sophiebrown_resources; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.sophiebrown_resources AS
 SELECT ( SELECT player.player_name
           FROM public.player
          WHERE (player.player_id = 2)) AS "Name",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 2) AND (playerresource.resource_id = 1))) AS "Food Amount",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 2) AND (playerresource.resource_id = 2))) AS "Wood Amount",
    ( SELECT playerresource.amount
           FROM public.playerresource
          WHERE ((playerresource.player_id = 2) AND (playerresource.resource_id = 3))) AS "Stone Amount";


ALTER TABLE public.sophiebrown_resources OWNER TO fsad;

--
-- Name: stone_quarry_info; Type: VIEW; Schema: public; Owner: fsad
--

CREATE VIEW public.stone_quarry_info AS
 SELECT ( SELECT building.building_name
           FROM public.building
          WHERE (building.building_id = 3)) AS "Name",
    ( SELECT building.building_description
           FROM public.building
          WHERE (building.building_id = 3)) AS "Description",
    ( SELECT resource.resource_name
           FROM public.resource
          WHERE (resource.resource_id = ( SELECT building.resource_generated
                   FROM public.building
                  WHERE (building.building_id = 3)))) AS "Resources Generated",
    ( SELECT buildingcost.amount
           FROM public.buildingcost
          WHERE (buildingcost.building_id = 3)) AS "Required Gold",
    ( SELECT buildingcost.build_time
           FROM public.buildingcost
          WHERE (buildingcost.building_id = 3)) AS "Build Time";


ALTER TABLE public.stone_quarry_info OWNER TO fsad;

--
-- Data for Name: base; Type: TABLE DATA; Schema: public; Owner: fsad
--

COPY public.base (base_id, player_id, level) FROM stdin;
1	1	2
2	2	1
3	3	3
4	4	1
5	5	2
6	6	1
\.


--
-- Data for Name: basebuilding; Type: TABLE DATA; Schema: public; Owner: fsad
--

COPY public.basebuilding (building_id, base_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
1	2
2	2
3	2
1	3
2	3
3	3
4	3
5	3
1	4
2	4
3	4
1	5
2	5
1	6
2	6
3	6
4	6
\.


--
-- Data for Name: building; Type: TABLE DATA; Schema: public; Owner: fsad
--

COPY public.building (building_id, building_name, building_description, resource_generated) FROM stdin;
1	Farm	Produces food for the kingdom	1
2	Lumber Mill	Produces wood for the kingdom	2
3	Stone Quarry	Produces stone for the kingdom	3
4	Gold Mine	Produces gold for the kingdom	4
5	Marketplace	Allows for the exchange of resources between kingdoms	4
\.


--
-- Data for Name: buildingcost; Type: TABLE DATA; Schema: public; Owner: fsad
--

COPY public.buildingcost (building_id, resource_id, amount, build_time) FROM stdin;
1	4	100	3 days
2	4	75	2 days
3	4	150	5 days
4	4	200	7 days
5	4	350	14 days
\.


--
-- Data for Name: constructionqueue; Type: TABLE DATA; Schema: public; Owner: fsad
--

COPY public.constructionqueue (construction_id, building_id, base_id, start_date) FROM stdin;
1	4	2	2023-04-09
2	5	2	2023-04-08
3	3	5	2023-04-06
4	4	5	2023-04-07
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: fsad
--

COPY public.currency (currency_id, currency_name, premium) FROM stdin;
1	Gold	f
2	Ethereal Silver	f
3	Diamonds	t
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: fsad
--

COPY public.player (player_id, player_name, player_password) FROM stdin;
1	HarrySmith	password1
2	SophieBrown	password2
3	OliverTaylor	password3
4	FatimaAhmed	password4
5	MohammedAli	password5
6	AishaKhan	password6
\.


--
-- Data for Name: playercurrency; Type: TABLE DATA; Schema: public; Owner: fsad
--

COPY public.playercurrency (player_id, currency_id, amount) FROM stdin;
1	1	100
1	2	50
1	3	10
2	1	200
2	2	100
2	3	20
3	1	50
3	2	20
3	3	5
4	1	150
4	2	75
5	1	75
5	2	30
5	3	8
6	1	300
6	2	150
6	3	50
\.


--
-- Data for Name: playerresource; Type: TABLE DATA; Schema: public; Owner: fsad
--

COPY public.playerresource (player_id, resource_id, amount) FROM stdin;
1	1	5000
1	2	2500
1	3	1000
1	4	100
2	1	4500
2	2	2000
2	3	500
2	4	50
3	1	6000
3	2	3000
3	3	1500
3	4	200
4	1	4000
4	2	1500
4	3	2000
4	4	300
5	1	5500
5	2	3500
5	3	800
5	4	150
6	1	7000
6	2	4000
6	3	2000
6	4	500
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: fsad
--

COPY public.resource (resource_id, resource_name) FROM stdin;
1	Food
2	Wood
3	Stone
4	Gold
\.


--
-- Name: base base_pkey; Type: CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_pkey PRIMARY KEY (base_id);


--
-- Name: basebuilding basebuilding_pkey; Type: CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.basebuilding
    ADD CONSTRAINT basebuilding_pkey PRIMARY KEY (building_id, base_id);


--
-- Name: building building_pkey; Type: CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_pkey PRIMARY KEY (building_id);


--
-- Name: buildingcost buildingcost_pkey; Type: CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.buildingcost
    ADD CONSTRAINT buildingcost_pkey PRIMARY KEY (building_id, resource_id);


--
-- Name: constructionqueue constructionqueue_pkey; Type: CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.constructionqueue
    ADD CONSTRAINT constructionqueue_pkey PRIMARY KEY (construction_id);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (currency_id);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (player_id);


--
-- Name: playercurrency playercurrency_pkey; Type: CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.playercurrency
    ADD CONSTRAINT playercurrency_pkey PRIMARY KEY (player_id, currency_id);


--
-- Name: playerresource playerresource_pkey; Type: CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.playerresource
    ADD CONSTRAINT playerresource_pkey PRIMARY KEY (player_id, resource_id);


--
-- Name: resource resource_pkey; Type: CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (resource_id);


--
-- Name: base base_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(player_id);


--
-- Name: basebuilding basebuilding_base_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.basebuilding
    ADD CONSTRAINT basebuilding_base_id_fkey FOREIGN KEY (base_id) REFERENCES public.base(base_id);


--
-- Name: basebuilding basebuilding_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.basebuilding
    ADD CONSTRAINT basebuilding_building_id_fkey FOREIGN KEY (building_id) REFERENCES public.building(building_id);


--
-- Name: building building_resource_generated_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_resource_generated_fkey FOREIGN KEY (resource_generated) REFERENCES public.resource(resource_id);


--
-- Name: buildingcost buildingcost_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.buildingcost
    ADD CONSTRAINT buildingcost_building_id_fkey FOREIGN KEY (building_id) REFERENCES public.building(building_id);


--
-- Name: buildingcost buildingcost_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.buildingcost
    ADD CONSTRAINT buildingcost_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES public.resource(resource_id);


--
-- Name: constructionqueue constructionqueue_base_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.constructionqueue
    ADD CONSTRAINT constructionqueue_base_id_fkey FOREIGN KEY (base_id) REFERENCES public.base(base_id);


--
-- Name: constructionqueue constructionqueue_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.constructionqueue
    ADD CONSTRAINT constructionqueue_building_id_fkey FOREIGN KEY (building_id) REFERENCES public.building(building_id);


--
-- Name: playercurrency playercurrency_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.playercurrency
    ADD CONSTRAINT playercurrency_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.currency(currency_id);


--
-- Name: playercurrency playercurrency_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.playercurrency
    ADD CONSTRAINT playercurrency_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(player_id);


--
-- Name: playerresource playerresource_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.playerresource
    ADD CONSTRAINT playerresource_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(player_id);


--
-- Name: playerresource playerresource_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fsad
--

ALTER TABLE ONLY public.playerresource
    ADD CONSTRAINT playerresource_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES public.resource(resource_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO fsad;


--
-- PostgreSQL database dump complete
--

