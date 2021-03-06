PGDMP     &    3            
    v            dashboarddb    9.5.14    9.6.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    253593    dashboarddb    DATABASE     }   CREATE DATABASE dashboarddb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE dashboarddb;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    12361    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            d           1247    289510    product_type    TYPE     P   CREATE TYPE product_type AS ENUM (
    'entry',
    'middle',
    'flagship'
);
    DROP TYPE public.product_type;
       public       postgres    false    6            �            1259    289291    city    TABLE     �   CREATE TABLE city (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    latitude numeric,
    longitude numeric,
    region_id integer NOT NULL
);
    DROP TABLE public.city;
       public         postgres    false    6            �            1259    289289    city_id_seq    SEQUENCE     m   CREATE SEQUENCE city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.city_id_seq;
       public       postgres    false    194    6            �           0    0    city_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE city_id_seq OWNED BY city.id;
            public       postgres    false    193            �            1259    289309    city_region_seq    SEQUENCE     q   CREATE SEQUENCE city_region_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.city_region_seq;
       public       postgres    false    6    194            �           0    0    city_region_seq    SEQUENCE OWNED BY     8   ALTER SEQUENCE city_region_seq OWNED BY city.region_id;
            public       postgres    false    195            �            1259    289354    customer    TABLE     {   CREATE TABLE customer (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    city_id integer NOT NULL
);
    DROP TABLE public.customer;
       public         postgres    false    6            �            1259    289352    customers_city_seq    SEQUENCE     t   CREATE SEQUENCE customers_city_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.customers_city_seq;
       public       postgres    false    6    201            �           0    0    customers_city_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE customers_city_seq OWNED BY customer.city_id;
            public       postgres    false    200            �            1259    289350    customers_id_seq    SEQUENCE     r   CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public       postgres    false    6    201            �           0    0    customers_id_seq    SEQUENCE OWNED BY     6   ALTER SEQUENCE customers_id_seq OWNED BY customer.id;
            public       postgres    false    199            �            1259    253658 	   employees    TABLE     �   CREATE TABLE employees (
    serial character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255),
    gender character varying(255) NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.employees;
       public         postgres    false    6            �            1259    272724    employees_id_seq    SEQUENCE     r   CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public       postgres    false    6    189            �           0    0    employees_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE employees_id_seq OWNED BY employees.id;
            public       postgres    false    190            �            1259    253624    groups    TABLE     �   CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100) NOT NULL,
    CONSTRAINT check_id CHECK ((id >= 0))
);
    DROP TABLE public.groups;
       public         postgres    false    6            �            1259    253622    groups_id_seq    SEQUENCE     o   CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public       postgres    false    6    184            �           0    0    groups_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE groups_id_seq OWNED BY groups.id;
            public       postgres    false    183            �            1259    253646    login_attempts    TABLE     �   CREATE TABLE login_attempts (
    id integer NOT NULL,
    ip_address character varying(45),
    login character varying(100) NOT NULL,
    "time" integer,
    CONSTRAINT check_id CHECK ((id >= 0))
);
 "   DROP TABLE public.login_attempts;
       public         postgres    false    6            �            1259    253644    login_attempts_id_seq    SEQUENCE     w   CREATE SEQUENCE login_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.login_attempts_id_seq;
       public       postgres    false    188    6            �           0    0    login_attempts_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE login_attempts_id_seq OWNED BY login_attempts.id;
            public       postgres    false    187            �            1259    289475    product    TABLE     �   CREATE TABLE product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    brand character varying(255) NOT NULL,
    type product_type
);
    DROP TABLE public.product;
       public         postgres    false    6    612            �            1259    289473    product_id_seq    SEQUENCE     p   CREATE SEQUENCE product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public       postgres    false    6    203            �           0    0    product_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE product_id_seq OWNED BY product.id;
            public       postgres    false    202            �            1259    289283    region    TABLE     [   CREATE TABLE region (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.region;
       public         postgres    false    6            �            1259    289281    region_id_seq    SEQUENCE     o   CREATE SEQUENCE region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.region_id_seq;
       public       postgres    false    192    6            �           0    0    region_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE region_id_seq OWNED BY region.id;
            public       postgres    false    191            �            1259    289337    sales    TABLE     z   CREATE TABLE sales (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    region_id integer NOT NULL
);
    DROP TABLE public.sales;
       public         postgres    false    6            �            1259    289333    sales_id_seq    SEQUENCE     n   CREATE SEQUENCE sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sales_id_seq;
       public       postgres    false    198    6            �           0    0    sales_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE sales_id_seq OWNED BY sales.id;
            public       postgres    false    196            �            1259    289335    sales_region_seq    SEQUENCE     r   CREATE SEQUENCE sales_region_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.sales_region_seq;
       public       postgres    false    198    6             	           0    0    sales_region_seq    SEQUENCE OWNED BY     :   ALTER SEQUENCE sales_region_seq OWNED BY sales.region_id;
            public       postgres    false    197            �            1259    289655    transaction    TABLE     9  CREATE TABLE transaction (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    customer_name character varying(255) NOT NULL,
    city_id integer NOT NULL,
    city_name character varying(255) NOT NULL,
    region_id integer NOT NULL,
    region_name character varying(255) NOT NULL,
    sales_id integer NOT NULL,
    sales_name character varying NOT NULL,
    product_id integer NOT NULL,
    product_name character varying(255) NOT NULL,
    product_brand character varying(255) NOT NULL,
    product_type product_type NOT NULL,
    date date NOT NULL
);
    DROP TABLE public.transaction;
       public         postgres    false    612    6            �            1259    289647    transaction_city_id_seq    SEQUENCE     y   CREATE SEQUENCE transaction_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.transaction_city_id_seq;
       public       postgres    false    6    210            	           0    0    transaction_city_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE transaction_city_id_seq OWNED BY transaction.city_id;
            public       postgres    false    206            �            1259    289645    transaction_customer_id_seq    SEQUENCE     }   CREATE SEQUENCE transaction_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.transaction_customer_id_seq;
       public       postgres    false    6    210            	           0    0    transaction_customer_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE transaction_customer_id_seq OWNED BY transaction.customer_id;
            public       postgres    false    205            �            1259    289643    transaction_id_seq    SEQUENCE     t   CREATE SEQUENCE transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.transaction_id_seq;
       public       postgres    false    6    210            	           0    0    transaction_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE transaction_id_seq OWNED BY transaction.id;
            public       postgres    false    204            �            1259    289653    transaction_product_id_seq    SEQUENCE     |   CREATE SEQUENCE transaction_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.transaction_product_id_seq;
       public       postgres    false    210    6            	           0    0    transaction_product_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE transaction_product_id_seq OWNED BY transaction.product_id;
            public       postgres    false    209            �            1259    289649    transaction_region_id_seq    SEQUENCE     {   CREATE SEQUENCE transaction_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.transaction_region_id_seq;
       public       postgres    false    6    210            	           0    0    transaction_region_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE transaction_region_id_seq OWNED BY transaction.region_id;
            public       postgres    false    207            �            1259    289651    transaction_sales_id_seq    SEQUENCE     z   CREATE SEQUENCE transaction_sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.transaction_sales_id_seq;
       public       postgres    false    6    210            	           0    0    transaction_sales_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE transaction_sales_id_seq OWNED BY transaction.sales_id;
            public       postgres    false    208            �            1259    253611    users    TABLE     �  CREATE TABLE users (
    id integer NOT NULL,
    ip_address character varying(45),
    username character varying(100),
    password character varying(255) NOT NULL,
    salt character varying(255),
    email character varying(254) NOT NULL,
    activation_code character varying(40),
    forgotten_password_code character varying(40),
    forgotten_password_time integer,
    remember_code character varying(40),
    created_on integer NOT NULL,
    last_login integer,
    active integer,
    first_name character varying(50),
    last_name character varying(50),
    company character varying(100),
    phone character varying(20),
    token character varying(255),
    CONSTRAINT check_active CHECK ((active >= 0)),
    CONSTRAINT check_id CHECK ((id >= 0))
);
    DROP TABLE public.users;
       public         postgres    false    6            �            1259    253633    users_groups    TABLE     2  CREATE TABLE users_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    CONSTRAINT users_groups_check_group_id CHECK ((group_id >= 0)),
    CONSTRAINT users_groups_check_id CHECK ((id >= 0)),
    CONSTRAINT users_groups_check_user_id CHECK ((user_id >= 0))
);
     DROP TABLE public.users_groups;
       public         postgres    false    6            �            1259    253631    users_groups_id_seq    SEQUENCE     u   CREATE SEQUENCE users_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.users_groups_id_seq;
       public       postgres    false    186    6            	           0    0    users_groups_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE users_groups_id_seq OWNED BY users_groups.id;
            public       postgres    false    185            �            1259    253609    users_id_seq    SEQUENCE     n   CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    6    182            	           0    0    users_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE users_id_seq OWNED BY users.id;
            public       postgres    false    181            "           2604    289294    city id    DEFAULT     T   ALTER TABLE ONLY city ALTER COLUMN id SET DEFAULT nextval('city_id_seq'::regclass);
 6   ALTER TABLE public.city ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    194    194            #           2604    289311    city region_id    DEFAULT     _   ALTER TABLE ONLY city ALTER COLUMN region_id SET DEFAULT nextval('city_region_seq'::regclass);
 =   ALTER TABLE public.city ALTER COLUMN region_id DROP DEFAULT;
       public       postgres    false    195    194            &           2604    289357    customer id    DEFAULT     ]   ALTER TABLE ONLY customer ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);
 :   ALTER TABLE public.customer ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    199    201            '           2604    289358    customer city_id    DEFAULT     d   ALTER TABLE ONLY customer ALTER COLUMN city_id SET DEFAULT nextval('customers_city_seq'::regclass);
 ?   ALTER TABLE public.customer ALTER COLUMN city_id DROP DEFAULT;
       public       postgres    false    201    200    201                        2604    272726    employees id    DEFAULT     ^   ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    190    189                       2604    253627 	   groups id    DEFAULT     X   ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    184    183    184                       2604    253649    login_attempts id    DEFAULT     h   ALTER TABLE ONLY login_attempts ALTER COLUMN id SET DEFAULT nextval('login_attempts_id_seq'::regclass);
 @   ALTER TABLE public.login_attempts ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    188    187    188            (           2604    289478 
   product id    DEFAULT     Z   ALTER TABLE ONLY product ALTER COLUMN id SET DEFAULT nextval('product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    203    203            !           2604    289286 	   region id    DEFAULT     X   ALTER TABLE ONLY region ALTER COLUMN id SET DEFAULT nextval('region_id_seq'::regclass);
 8   ALTER TABLE public.region ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    192    192            $           2604    289340    sales id    DEFAULT     V   ALTER TABLE ONLY sales ALTER COLUMN id SET DEFAULT nextval('sales_id_seq'::regclass);
 7   ALTER TABLE public.sales ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    196    198            %           2604    289341    sales region_id    DEFAULT     a   ALTER TABLE ONLY sales ALTER COLUMN region_id SET DEFAULT nextval('sales_region_seq'::regclass);
 >   ALTER TABLE public.sales ALTER COLUMN region_id DROP DEFAULT;
       public       postgres    false    198    197    198            )           2604    289658    transaction id    DEFAULT     b   ALTER TABLE ONLY transaction ALTER COLUMN id SET DEFAULT nextval('transaction_id_seq'::regclass);
 =   ALTER TABLE public.transaction ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    210    210            *           2604    289659    transaction customer_id    DEFAULT     t   ALTER TABLE ONLY transaction ALTER COLUMN customer_id SET DEFAULT nextval('transaction_customer_id_seq'::regclass);
 F   ALTER TABLE public.transaction ALTER COLUMN customer_id DROP DEFAULT;
       public       postgres    false    210    205    210            +           2604    289660    transaction city_id    DEFAULT     l   ALTER TABLE ONLY transaction ALTER COLUMN city_id SET DEFAULT nextval('transaction_city_id_seq'::regclass);
 B   ALTER TABLE public.transaction ALTER COLUMN city_id DROP DEFAULT;
       public       postgres    false    210    206    210            ,           2604    289661    transaction region_id    DEFAULT     p   ALTER TABLE ONLY transaction ALTER COLUMN region_id SET DEFAULT nextval('transaction_region_id_seq'::regclass);
 D   ALTER TABLE public.transaction ALTER COLUMN region_id DROP DEFAULT;
       public       postgres    false    207    210    210            -           2604    289662    transaction sales_id    DEFAULT     n   ALTER TABLE ONLY transaction ALTER COLUMN sales_id SET DEFAULT nextval('transaction_sales_id_seq'::regclass);
 C   ALTER TABLE public.transaction ALTER COLUMN sales_id DROP DEFAULT;
       public       postgres    false    208    210    210            .           2604    289663    transaction product_id    DEFAULT     r   ALTER TABLE ONLY transaction ALTER COLUMN product_id SET DEFAULT nextval('transaction_product_id_seq'::regclass);
 E   ALTER TABLE public.transaction ALTER COLUMN product_id DROP DEFAULT;
       public       postgres    false    209    210    210                       2604    253614    users id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    181    182    182                       2604    253636    users_groups id    DEFAULT     d   ALTER TABLE ONLY users_groups ALTER COLUMN id SET DEFAULT nextval('users_groups_id_seq'::regclass);
 >   ALTER TABLE public.users_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    186    186            �           2613    102165    102165    BLOB     '   SELECT pg_catalog.lo_create('102165');
 '   SELECT pg_catalog.lo_unlink('102165');
             postgres    false            �           2613    105550    105550    BLOB     '   SELECT pg_catalog.lo_create('105550');
 '   SELECT pg_catalog.lo_unlink('105550');
             postgres    false            �           2613    120127    120127    BLOB     '   SELECT pg_catalog.lo_create('120127');
 '   SELECT pg_catalog.lo_unlink('120127');
             postgres    false            �           2613    149826    149826    BLOB     '   SELECT pg_catalog.lo_create('149826');
 '   SELECT pg_catalog.lo_unlink('149826');
             postgres    false            �           2613    210446    210446    BLOB     '   SELECT pg_catalog.lo_create('210446');
 '   SELECT pg_catalog.lo_unlink('210446');
             postgres    false            �           2613    214067    214067    BLOB     '   SELECT pg_catalog.lo_create('214067');
 '   SELECT pg_catalog.lo_unlink('214067');
             postgres    false            �           2613    229043    229043    BLOB     '   SELECT pg_catalog.lo_create('229043');
 '   SELECT pg_catalog.lo_unlink('229043');
             postgres    false            �           2613    232032    232032    BLOB     '   SELECT pg_catalog.lo_create('232032');
 '   SELECT pg_catalog.lo_unlink('232032');
             postgres    false            �           2613    238780    238780    BLOB     '   SELECT pg_catalog.lo_create('238780');
 '   SELECT pg_catalog.lo_unlink('238780');
             postgres    false            �           2613    30543    30543    BLOB     &   SELECT pg_catalog.lo_create('30543');
 &   SELECT pg_catalog.lo_unlink('30543');
             postgres    false            �           2613    50277    50277    BLOB     &   SELECT pg_catalog.lo_create('50277');
 &   SELECT pg_catalog.lo_unlink('50277');
             postgres    false            �           2613    51660    51660    BLOB     &   SELECT pg_catalog.lo_create('51660');
 &   SELECT pg_catalog.lo_unlink('51660');
             postgres    false            �           2613    60759    60759    BLOB     &   SELECT pg_catalog.lo_create('60759');
 &   SELECT pg_catalog.lo_unlink('60759');
             postgres    false            �           2613    82679    82679    BLOB     &   SELECT pg_catalog.lo_create('82679');
 &   SELECT pg_catalog.lo_unlink('82679');
             postgres    false            �           2613    90559    90559    BLOB     &   SELECT pg_catalog.lo_create('90559');
 &   SELECT pg_catalog.lo_unlink('90559');
             postgres    false            �           2613    98928    98928    BLOB     &   SELECT pg_catalog.lo_create('98928');
 &   SELECT pg_catalog.lo_unlink('98928');
             postgres    false            �          0    289291    city 
   TABLE DATA               A   COPY city (id, name, latitude, longitude, region_id) FROM stdin;
    public       postgres    false    194   ��       		           0    0    city_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('city_id_seq', 1, false);
            public       postgres    false    193            
	           0    0    city_region_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('city_region_seq', 5, true);
            public       postgres    false    195            �          0    289354    customer 
   TABLE DATA               .   COPY customer (id, name, city_id) FROM stdin;
    public       postgres    false    201   |�       	           0    0    customers_city_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('customers_city_seq', 5, true);
            public       postgres    false    200            	           0    0    customers_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('customers_id_seq', 1, true);
            public       postgres    false    199            �          0    253658 	   employees 
   TABLE DATA               G   COPY employees (serial, first_name, last_name, gender, id) FROM stdin;
    public       postgres    false    189   �       	           0    0    employees_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('employees_id_seq', 33, true);
            public       postgres    false    190            �          0    253624    groups 
   TABLE DATA               0   COPY groups (id, name, description) FROM stdin;
    public       postgres    false    184   ��       	           0    0    groups_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('groups_id_seq', 1, false);
            public       postgres    false    183            �          0    253646    login_attempts 
   TABLE DATA               @   COPY login_attempts (id, ip_address, login, "time") FROM stdin;
    public       postgres    false    188   �       	           0    0    login_attempts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('login_attempts_id_seq', 49, true);
            public       postgres    false    187            �          0    289475    product 
   TABLE DATA               1   COPY product (id, name, brand, type) FROM stdin;
    public       postgres    false    203   �       	           0    0    product_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('product_id_seq', 1, false);
            public       postgres    false    202            �          0    289283    region 
   TABLE DATA               #   COPY region (id, name) FROM stdin;
    public       postgres    false    192   ��       	           0    0    region_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('region_id_seq', 2, true);
            public       postgres    false    191            �          0    289337    sales 
   TABLE DATA               -   COPY sales (id, name, region_id) FROM stdin;
    public       postgres    false    198   =�       	           0    0    sales_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('sales_id_seq', 4, true);
            public       postgres    false    196            	           0    0    sales_region_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('sales_region_seq', 2, true);
            public       postgres    false    197            �          0    289655    transaction 
   TABLE DATA               �   COPY transaction (id, customer_id, customer_name, city_id, city_name, region_id, region_name, sales_id, sales_name, product_id, product_name, product_brand, product_type, date) FROM stdin;
    public       postgres    false    210   ֕       	           0    0    transaction_city_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('transaction_city_id_seq', 1, false);
            public       postgres    false    206            	           0    0    transaction_customer_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('transaction_customer_id_seq', 1, false);
            public       postgres    false    205            	           0    0    transaction_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('transaction_id_seq', 1, false);
            public       postgres    false    204            	           0    0    transaction_product_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('transaction_product_id_seq', 1, false);
            public       postgres    false    209            	           0    0    transaction_region_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('transaction_region_id_seq', 1, false);
            public       postgres    false    207            	           0    0    transaction_sales_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('transaction_sales_id_seq', 1, false);
            public       postgres    false    208            �          0    253611    users 
   TABLE DATA               �   COPY users (id, ip_address, username, password, salt, email, activation_code, forgotten_password_code, forgotten_password_time, remember_code, created_on, last_login, active, first_name, last_name, company, phone, token) FROM stdin;
    public       postgres    false    182   ��       �          0    253633    users_groups 
   TABLE DATA               6   COPY users_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    186   5�       	           0    0    users_groups_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('users_groups_id_seq', 7, true);
            public       postgres    false    185            	           0    0    users_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('users_id_seq', 32, true);
            public       postgres    false    181            �          0    0    BLOBS    BLOBS                                false   q�       >           2606    289299    city city_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public         postgres    false    194    194            D           2606    289360    customer customers_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY customer
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.customer DROP CONSTRAINT customers_pkey;
       public         postgres    false    201    201            :           2606    272734    employees employees_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public         postgres    false    189    189            2           2606    253630    groups groups_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public         postgres    false    184    184            8           2606    253652 "   login_attempts login_attempts_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY login_attempts
    ADD CONSTRAINT login_attempts_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.login_attempts DROP CONSTRAINT login_attempts_pkey;
       public         postgres    false    188    188            G           2606    289483    product product_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public         postgres    false    203    203            <           2606    289288    region region_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.region DROP CONSTRAINT region_pkey;
       public         postgres    false    192    192            B           2606    289343    sales sales_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public         postgres    false    198    198            I           2606    289668    transaction transaction_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_pkey;
       public         postgres    false    210    210            4           2606    253643    users_groups uc_users_groups 
   CONSTRAINT     ]   ALTER TABLE ONLY users_groups
    ADD CONSTRAINT uc_users_groups UNIQUE (user_id, group_id);
 F   ALTER TABLE ONLY public.users_groups DROP CONSTRAINT uc_users_groups;
       public         postgres    false    186    186    186            6           2606    253641    users_groups users_groups_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY users_groups
    ADD CONSTRAINT users_groups_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.users_groups DROP CONSTRAINT users_groups_pkey;
       public         postgres    false    186    186            0           2606    253621    users users_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    182    182            E           1259    289366    fki_customer_id    INDEX     G   CREATE INDEX fki_customer_id ON public.customer USING btree (city_id);
 #   DROP INDEX public.fki_customer_id;
       public         postgres    false    201            ?           1259    289324    fki_region_id    INDEX     C   CREATE INDEX fki_region_id ON public.city USING btree (region_id);
 !   DROP INDEX public.fki_region_id;
       public         postgres    false    194            @           1259    289349    fki_sales_id    INDEX     C   CREATE INDEX fki_sales_id ON public.sales USING btree (region_id);
     DROP INDEX public.fki_sales_id;
       public         postgres    false    198            J           2606    289442    city city_region_id_fkey    FK CONSTRAINT     l   ALTER TABLE ONLY city
    ADD CONSTRAINT city_region_id_fkey FOREIGN KEY (region_id) REFERENCES region(id);
 B   ALTER TABLE ONLY public.city DROP CONSTRAINT city_region_id_fkey;
       public       postgres    false    2108    192    194            L           2606    289452    customer customers_city_id_fkey    FK CONSTRAINT     o   ALTER TABLE ONLY customer
    ADD CONSTRAINT customers_city_id_fkey FOREIGN KEY (city_id) REFERENCES city(id);
 I   ALTER TABLE ONLY public.customer DROP CONSTRAINT customers_city_id_fkey;
       public       postgres    false    2110    201    194            K           2606    289447    sales sales_region_id_fkey    FK CONSTRAINT     n   ALTER TABLE ONLY sales
    ADD CONSTRAINT sales_region_id_fkey FOREIGN KEY (region_id) REFERENCES region(id);
 D   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_region_id_fkey;
       public       postgres    false    192    2108    198            �   �   x�-�ˊ�0E���H�����!��m��2���(fv�{�1|~�>�o��2�*@���=NN[��~��KC�2�F�x��H�@����d��K?W�JnƌĜ�jC��ݖ�C��A��B,U���q¤�
��G�N�E�$�e��-;�W�H�Z���g]�~>�����c��T���_����Qa���H/�Ha��a�i��F�-���?9���0H`      �   �   x��A�0E�3��* r7?��	�hZ�)����?//o�*LB�
���V�D��b�A=;���C�g9hGC��@W��U���м�f���C��p�A�d$��h�Ȼ���N%����7O�p�j[�Ȯ#�w�E��M4����_��7l      �   �   x�=�1�0����~��(�t;��x�&�$П�(0����r�a�6�܃ c�9 ��Ϳ�
�G��ֆ*��=K����� +�*+4>�*a��
���Pý�c�3�n�}CS)�A��8��i��D���/�      �   ,   x�3�LL����t���%E�%�E\F�ŉ9�Ŝ� �+F���  �      �      x������ � �      �   �   x�]�A�0E��)rG�
��MFJ���c �ӫP�Wy��?9A�1`��й��Fe`��4� �N��:o���C;��8�U"h<Yi]T\l���$���p��%���9���0|T��(at�z���?[3�e��u�!�v7���{L��A)��cYi      �   u   x�U�K�0��)r��@܅�C�Ҕ$���'-;{4z��+����;Z|D$#69�y؅�*!6�P5~6�R%�QŮ��Rw����6�b���m��E]�?=]�y7�<      �   �   x��K�0CמS��~���q�V�D�����w������v��uՃ�A�uc����VL�v��Vu�q5 UND##N��1� ���3�p��'�z(<�)`����m)��4w�Uf�Kr�e��&����&"�6�      �   �  x���ݒ�0������N !�w�(&(���!Yx�=&i�����-����2ʈ��}�j�3#�l؝(�3_Y�b��W�M'�/V���9��"�8!�J�M�6+߲�m�orh\��'eu&'�iGgo뤿�����#B>��U�x���Wm�ˋ;S��"�c��f#���*�Xvо7���]��ur�M|բ��~���)v2<V��,���<���)@a5��iN� W?�_������8�{ ޢ��iw��9��,Ⱥ5��I� :���_^�?ЁZmf��^��o
Z$!��z=�)�E�6U*֐���X�HG
|i�V��(��p���������h�/^����,]R����h����5-�u�iI�S�En��|��\1F����y����w���2O��vl����M��/�����Q-,/��^���}���7��֭X,�N�����T��(����~�o6�/|�+T      �   h  x���;O�0���wt���b �(UU�UBv�@�&.I���c: h:DD�����w�-�2#�AҘ�o^���'#jFD�f�fUU�����v6�V��)5��q.n��t2gz�^>&��S�-r��rc�c�ﵟ*�RZQv���[<����,�������Q���3�"}� �B�u�x�}����;��� �I� Ǻp�0mz��H�`���E���I��LH�c�(�șv�ien|���^��:b/��&��\;,4s�$$�_��+�ղikӆ�_��v���j���܏X�����n�o&g�)JQ�v�i�>/!Vr�	%X�s#��C�ʣ̉SHk�Z�LY��_�`Y�      �   ,   x���	 0��l1�W3鿎,A�bJ�����e�;�>��      �   p�  v  x���{lSU�O��أ�Y�L6&̀3i�ْ1:@��u��Z����� CC]��&*b��!�!�k0�Ꮞ�!qH�����%<��w�rZz�4�������w�wۻmi�[F��h-��IP��Um%�6+Y@���f���ڌ���q�`ՌW�Z��Q�����8#���8+���ۊ֛Xt&�mZ\���.Vuj�#ɽ6�
����h��VV�t9X���<��U��0]B�s�V6lӯ�� �%��`�`�XY�2�
�ILO{��>%�]�#O�Q�-<3Ѫ@�Mc���JF�i�5�Of�8�Nk���۳+�D�,Q�p�x&u�ڧ�-nXz�Vm�}�A�h��[���˿��iݾ��]zo���ѻU�)u��_^�y�����o�6�y��ZrIK^2���'�א��}���u�:|��Eg=E:��u�W��ckI�O�����:�q����H�����w���Z��[�Z˩�W��f��{� �#?�Z����� �͌h��w���U}��=)yn1~��ӌ�ay�)yZ�M��g���r�?2'��c�/�z�Q�u�����Q%�?���x�+H�w"��Ğr��X�ʢd��Y;�v-@��~1,;C�(����DtCG�F{��)��.oX�B��ž�_�;;|�:�~Dt�:1����r�F���-�9�a)LZ��ng��%�{�."K���C�]g�I������҆47������^Ʌ�S�ΰ,v:�n#��M��$��ot�H0��$$�s����L�]�&A�/N	���i�;ڀ�]��tw;�d��+����n���	�8�;,I�[�|�A���>o��6��OD	�턣���[��I�556,�j�j�ћe��Ƥ�!h��|��jx���L��`�g������ju���'��\��2���t�=����#a�x)ǫ9>��s8^���Ǳ3���������=�ߛ���^���N�9���]��� �������M�r<��8^��C/��a����9^��3��b/��%�O��(����x9��p|��8^�q��)�ɀ�LC�$�]ε�D��.���j�*�	hU�P�ӠĨ�5��r�ꓨ���CTA�%���;�XJ� �Qc	)۩�5.S	R�	j,���A�X*J���Q�T�@�%�̡zj|��!�X
������Buj��ʝ'�ע6��S݊����娋���n@]B�O�B�����C]J��_�Ϫϱ��1�7b@kB4��h}.tmB͘�!�l2:� �I��H����k9��r�S�cB�p��"�"��ȓ_z�Ɵ���1~{�>�#=3���c0)"7�<��~�x>� �/�pV/ ��!7�������!L�����J�`=[ C�D̡��J+|��}�2ԶR�<l�/;q�]�(��Ap%���.
�p��I����?�i&k�9�l�ƾ���ȵ������}�[���ݜ��"����F��U�`$��Z 1��hC&�&�5:E���u�;C��ٸ.[��G�x�*��%���o(����S��3�)�-r:~�8���&�/�'����D�6&�bĤ�m�h╶4�|5m� �c� @��(�A�Y�3�#:��/K���      ��      x�          Ow   �  x��TAhQ�$c��I45�5&�մ�H<X<h�V��e��w�n��MR�m)"xPD� �d"^DDO^D����@UzQ� �T��'A�?;���~<f��7������'�:0��E��`��`ܸ´�m4��� �'�M�@>�����r�󜘗¼����ރ��������M��G!=�z����$�s��~��0�(EE���oF�E�E��؈�&���,H1@1��N�~�m�(��x-`�v���Q���~���y���q��|`��R�i���&�����P����ry7�׽P}uD_cgg3I����oV���C�z֬]"�f|�����o��/�xZ]����/}�_^����_��������i/]���m�1i�<{�1~��/q��-�� G����>ۘ_��[�6��S�G����џ��^�s�q�)���ށ�vs�m��G����s�g�O#�����D�]=A}�Rg�:�u��N�R'���#A=��t��s�+Xٯ�{��r���k��8֯a�[��b��߼oo���`�1���w���p�H $W(IE�!@����R丐&�rY�)M.�q�T��*�k�+D�YQU.�pr�L�n\+��)�9E"�٢�<���L���b�=CATՒ�o1�      W�      x�          �a     x�          �B     x�          e�      x�          �     x�          N�     x�          ?�     x�          BI     x�          6     x�          3D     x�          �~     x�          `�     x�          ��     x�              