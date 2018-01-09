--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: pages; Type: TABLE; Schema: public; Owner: makeshift
--

CREATE TABLE pages (
    id integer NOT NULL,
    slug character varying(30) NOT NULL,
    title character varying(50) NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE pages OWNER TO makeshift;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: makeshift
--

CREATE SEQUENCE pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pages_id_seq OWNER TO makeshift;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: makeshift
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: pgmigrations; Type: TABLE; Schema: public; Owner: makeshift
--

CREATE TABLE pgmigrations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    run_on timestamp without time zone NOT NULL
);


ALTER TABLE pgmigrations OWNER TO makeshift;

--
-- Name: pgmigrations_id_seq; Type: SEQUENCE; Schema: public; Owner: makeshift
--

CREATE SEQUENCE pgmigrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pgmigrations_id_seq OWNER TO makeshift;

--
-- Name: pgmigrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: makeshift
--

ALTER SEQUENCE pgmigrations_id_seq OWNED BY pgmigrations.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: makeshift
--

CREATE TABLE posts (
    id integer NOT NULL,
    slug character varying(30) NOT NULL,
    title character varying(50) NOT NULL,
    body text NOT NULL,
    tags text[],
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE posts OWNER TO makeshift;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: makeshift
--

CREATE SEQUENCE posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts_id_seq OWNER TO makeshift;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: makeshift
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: makeshift
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: pgmigrations id; Type: DEFAULT; Schema: public; Owner: makeshift
--

ALTER TABLE ONLY pgmigrations ALTER COLUMN id SET DEFAULT nextval('pgmigrations_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: makeshift
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: makeshift
--

COPY pages (id, slug, title, body, created_at, updated_at) FROM stdin;
2	contact	Contact	If you would like to contact me, use one of the social links above. Send me a message on twitter. If you are just interested in what I have done recently checkout one of my github accounts. Most of the work I do is for private github repo's, but I do quite a bit of work that I post to public repos as well. I have been pretty active on codewars lately and enjoy using it to keep my development approaches refined. Sometimes I use codebin but I use my local dev environment more frequently.\n\nDo you have a project or a question about tech? Seriously, send me a message on twitter. I love getting involved in new stuff. However my time is limited but I will let you know if I can help, and I will try to help in anyway I can.\n\n> I have many hobbies. 3d Printing, MicroControllers, Arduino/RaspberryPi, SmartHome development, programming, fishing and surfing among others.	2017-12-13 14:25:30.62652	2017-12-13 14:25:30.62652
1	home	Home	Hello and welcome to my website. I like to code, write about code and sometimes post it here for my own posterity. I also write about some of my hobbies and personal projects in the blog section. Mostly this webpage has been a playground for playing with different technologies like webpack, node and react. \n\n> I like to have fun, travel and push bits around. \n\nLiving in Florida is great! The sun, sand and seasons are condusive to what my family loves to do. We go to the beach, vacation in the keys and travel when we want something different. As my kids get older I get to experience things with them again. Things that I loved to do when I was growing up in Florida. \n\nI'm not the best writer, so this place is not really for human consumption. It is really just a place where I can post useful bits of information. Maybe it will solve an issue for a random googler, which is an added bonus.	2017-12-13 14:25:30.62652	2017-12-13 14:25:30.62652
3	resume	Resume	I have been a developer for a couple decades and I **still** enjoy it very much. My resume is available for [download](download/resume).\n\n> What I like about programming is that it is a puzzle that never ends.\n\nWhen I started developing the landscape was small and it was possible to know enough about all of the aspects to be a considered a [full stack developer](https://hackernoon.com/the-full-stack-fallacy-why-full-stack-engineers-dont-actually-exist-1b8837383144). Currently the landscape is much larger and it is much more difficult to know about all of the [emerging frameworks](https://medium.com/javascript-scene/why-im-thankful-for-js-fatigue-i-know-you-re-sick-of-those-words-but-this-is-different-296fae0c888f) and languages. Now I just consider myself a polyglot programmer who knows a little about a lot of things.\n\nI dabble in a lot of languages and frameworks because I think it is important to know what tools are available and what they are best used for. While it is possible to hammer a nail into a piece of wood with a screwdriver, it is better to use the right tool for the job.\n\n[Ruby/Rails](http://rubyonrails.org/) has been a great backend setup for me in the past, but I have moved on to different languages and frameworks to keep improving. I've recently had a lot of fun going back to [PHP/Laravel](https://laravel.com/). It is nice to see where [Taylor](https://github.com/taylorotwell) and others have taken it. I actually used Laravel before I used Rails and I feel more comfortable knowing most of the dependencies are maintained by the core developers. [Erlang/Elixir/Phoenix](http://phoenixframework.org/) is **super-awesome** as well. The functional programming it embodies really helped me improve developing in other languages. I also like the [origin story](https://en.wikipedia.org/wiki/Erlang_(programming_language)#History), but maybe it is because I have telecom experience.\n\nCurrently, I really like [React](https://reactjs.org/) and [Node](https://nodejs.org/en/) because it is nice to use full-stack JavaScript. Which is also why I like [Electron](https://electronjs.org/), it lets me develop for desktop applications. [Vue.js](https://vuejs.org/) is definitely at the top of my list of favorite front-end frameworks. I really like how concise it is, and because I've gotten burned by dependencies in the past I have a soft spot for frameworks that maintain their own core dependencies. While I love [Ember](https://www.emberjs.com/), it feels like I'm reliving working with [MooTools](https://mootools.net/). MooTools was a contemporary of [JQuery](https://jquery.com/) but it didn't gain traction and eventually became obsolete. Sorry [Tom](https://tomdale.net/) and [Yahuda](http://yehudakatz.com/).\n\nThe front-end build tool landscape is also growing. I have used or tried [Bower](https://bower.io/), [Grunt](https://gruntjs.com/), [Gulp](https://gulpjs.com/), [Broccoli](https://github.com/broccolijs/broccoli), [Webpack](https://webpack.js.org/), [Rollup](https://rollupjs.org/) and most recently [Parcel](https://parceljs.org/). I liked grunt and bower in the past. Used them for a number of projects. Going from no build tools to them was like going from [2D side scroll](https://en.wikipedia.org/wiki/Super_Mario_Bros._3) to [3D open world](https://en.wikipedia.org/wiki/Final_Fantasy_VII). Now with Webpack and Rollup, it feels like I'm building my own games. While there are pre-built options available (e.g. [ember-cli](https://ember-cli.com/), [create-react-app](https://github.com/facebookincubator/create-react-app) and [vue-cli](https://github.com/vuejs/vue-cli)) they come with a lot of magic and when things break under deadline the last thing I want to do is start deciphering those incantations only to end up with a bespoke solution that breaks on the next update. Parcel is nice and I plan on using it for a lot of my personal projects because it reduces the time to startup. I don't know if it will ever have the power of Webpack, though if it tries it will just collapse under its own configuration.\n\nDatabases have grown and the truths that were self-evident are no longer considered gospel. [MySQL](https://www.mysql.com/) outperforms [PostgeSQL](https://www.postgresql.org/) sometimes, PostgreSQL outperforms [MongoDB](https://www.mongodb.com/) sometimes. Storing serialized data can be the right choice. Enums are not always the answer and storing arrays in columns can be faster than indexed relationships. My mind has tiny explosions everytime I read some reality changing tweet or blog post by a core developer. Now there are cloud first databases that are built to scale like [FaunaDB](https://fauna.com/) and [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) which alter the way data can be maintained. The reality is that all architectural bottlenecks have been solved and we can't blame the tools. If the technology is failing us, we are probably using a screwdriver instead of a hammer.	2017-12-13 14:25:30.62652	2017-12-13 14:25:30.62652
\.


--
-- Data for Name: pgmigrations; Type: TABLE DATA; Schema: public; Owner: makeshift
--

COPY pgmigrations (id, name, run_on) FROM stdin;
6	1513185785632_pages	2017-12-13 13:53:06.961799
7	1513197800084_posts	2017-12-13 15:49:33.722327
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: makeshift
--

COPY posts (id, slug, title, body, tags, created_at, updated_at) FROM stdin;
1	test-slug	test title	test body	{foo,bar,bat,baz}	2017-12-13 15:55:02.167876	2017-12-13 15:55:02.167876
\.


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: makeshift
--

SELECT pg_catalog.setval('pages_id_seq', 1, false);


--
-- Name: pgmigrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: makeshift
--

SELECT pg_catalog.setval('pgmigrations_id_seq', 7, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: makeshift
--

SELECT pg_catalog.setval('posts_id_seq', 1, false);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: makeshift
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: makeshift
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: pages-slug-index; Type: INDEX; Schema: public; Owner: makeshift
--

CREATE UNIQUE INDEX "pages-slug-index" ON pages USING btree (slug);


--
-- Name: posts-slug-index; Type: INDEX; Schema: public; Owner: makeshift
--

CREATE UNIQUE INDEX "posts-slug-index" ON posts USING btree (slug);


--
-- PostgreSQL database dump complete
--

