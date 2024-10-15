PGDMP                  	    |            demik    16.2    16.2 �    y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            {           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            |           1262    254067    demik    DATABASE     y   CREATE DATABASE demik WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE demik;
                postgres    false            �           1247    254127    order_status    TYPE     q   CREATE TYPE public.order_status AS ENUM (
    'Создан',
    'В работе',
    'Доставлен'
);
    DROP TYPE public.order_status;
       public          postgres    false            �           1247    254152    staff_health    TYPE     T   CREATE TYPE public.staff_health AS ENUM (
    'Здоров',
    'Болеет'
);
    DROP TYPE public.staff_health;
       public          postgres    false            �            1259    254076    access    TABLE     a   CREATE TABLE public.access (
    id integer NOT NULL,
    name character varying(15) NOT NULL
);
    DROP TABLE public.access;
       public         heap    postgres    false            �            1259    254075    access_id_seq    SEQUENCE     �   CREATE SEQUENCE public.access_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.access_id_seq;
       public          postgres    false    218            }           0    0    access_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.access_id_seq OWNED BY public.access.id;
          public          postgres    false    217            �            1259    254083 	   equipment    TABLE     z   CREATE TABLE public.equipment (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);
    DROP TABLE public.equipment;
       public         heap    postgres    false            �            1259    254082    equipment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.equipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.equipment_id_seq;
       public          postgres    false    220            ~           0    0    equipment_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.equipment_id_seq OWNED BY public.equipment.id;
          public          postgres    false    219            �            1259    254176    material_type    TABLE     j   CREATE TABLE public.material_type (
    id integer NOT NULL,
    defect_rate double precision NOT NULL
);
 !   DROP TABLE public.material_type;
       public         heap    postgres    false            �            1259    254175    material_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.material_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.material_type_id_seq;
       public          postgres    false    234                       0    0    material_type_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.material_type_id_seq OWNED BY public.material_type.id;
          public          postgres    false    233            �            1259    254113 	   materials    TABLE     `  CREATE TABLE public.materials (
    id integer NOT NULL,
    name character varying(35) NOT NULL,
    pack_qty integer NOT NULL,
    unit character varying(15) NOT NULL,
    description text,
    image character varying(50),
    cost numeric(15,2) NOT NULL,
    min_qty integer NOT NULL,
    supplier_id bigint NOT NULL,
    type_id bigint NOT NULL
);
    DROP TABLE public.materials;
       public         heap    postgres    false            �            1259    254112    materials_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.materials_id_seq;
       public          postgres    false    228            �           0    0    materials_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.materials_id_seq OWNED BY public.materials.id;
          public          postgres    false    227            �            1259    254134    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    qty integer NOT NULL,
    status public.order_status DEFAULT 'Создан'::public.order_status NOT NULL,
    warehouse_id bigint NOT NULL,
    production_id bigint NOT NULL,
    partner_id bigint NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false    896    896            �            1259    254133    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    230            �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    229            �            1259    262281    partner_sales    TABLE     �   CREATE TABLE public.partner_sales (
    id integer NOT NULL,
    qty integer NOT NULL,
    amount numeric(15,2) NOT NULL,
    partner_id bigint NOT NULL,
    order_id bigint NOT NULL,
    shop_id bigint NOT NULL
);
 !   DROP TABLE public.partner_sales;
       public         heap    postgres    false            �            1259    262280    partner_sales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partner_sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.partner_sales_id_seq;
       public          postgres    false    250            �           0    0    partner_sales_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.partner_sales_id_seq OWNED BY public.partner_sales.id;
          public          postgres    false    249            �            1259    254099    partners    TABLE     m  CREATE TABLE public.partners (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(75) NOT NULL,
    inn integer NOT NULL,
    director_fio character varying(100) NOT NULL,
    phone character varying(11) NOT NULL,
    email character varying(30) NOT NULL,
    logo character varying(30),
    raiting integer NOT NULL
);
    DROP TABLE public.partners;
       public         heap    postgres    false            �            1259    254098    partners_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.partners_id_seq;
       public          postgres    false    224            �           0    0    partners_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.partners_id_seq OWNED BY public.partners.id;
          public          postgres    false    223            �            1259    254214    permissions    TABLE     �   CREATE TABLE public.permissions (
    id integer NOT NULL,
    equipment_id bigint NOT NULL,
    product_id bigint NOT NULL,
    staff_id bigint NOT NULL
);
    DROP TABLE public.permissions;
       public         heap    postgres    false            �            1259    254213    permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public          postgres    false    240            �           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          postgres    false    239            �            1259    254188    product_type    TABLE     �   CREATE TABLE public.product_type (
    id integer NOT NULL,
    name character varying(35) NOT NULL,
    coefficient double precision NOT NULL
);
     DROP TABLE public.product_type;
       public         heap    postgres    false            �            1259    254187    product_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_type_id_seq;
       public          postgres    false    236            �           0    0    product_type_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_type_id_seq OWNED BY public.product_type.id;
          public          postgres    false    235            �            1259    254236    productions    TABLE     �   CREATE TABLE public.productions (
    id integer NOT NULL,
    qty integer NOT NULL,
    production_date time without time zone DEFAULT now() NOT NULL,
    product_id bigint NOT NULL,
    staff_id bigint NOT NULL,
    warehouse_id bigint NOT NULL
);
    DROP TABLE public.productions;
       public         heap    postgres    false            �            1259    254195    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    image character varying(50),
    min_cost numeric(15,2) NOT NULL,
    article bigint NOT NULL,
    type_id bigint NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    254194    productions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.productions_id_seq;
       public          postgres    false    238            �           0    0    productions_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.productions_id_seq OWNED BY public.products.id;
          public          postgres    false    237            �            1259    254235    productions_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.productions_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.productions_id_seq1;
       public          postgres    false    242            �           0    0    productions_id_seq1    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.productions_id_seq1 OWNED BY public.productions.id;
          public          postgres    false    241            �            1259    254069    roles    TABLE     `   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(15) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    254068    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    216            �           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    215            �            1259    262260 	   shop_type    TABLE     z   CREATE TABLE public.shop_type (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);
    DROP TABLE public.shop_type;
       public         heap    postgres    false            �            1259    262259    shop_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shop_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.shop_type_id_seq;
       public          postgres    false    246            �           0    0    shop_type_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.shop_type_id_seq OWNED BY public.shop_type.id;
          public          postgres    false    245            �            1259    262269    shops    TABLE     �   CREATE TABLE public.shops (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(100) NOT NULL,
    shop_type_id bigint NOT NULL
);
    DROP TABLE public.shops;
       public         heap    postgres    false            �            1259    262268    shops_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.shops_id_seq;
       public          postgres    false    248            �           0    0    shops_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.shops_id_seq OWNED BY public.shops.id;
          public          postgres    false    247            �            1259    254158    staff    TABLE       CREATE TABLE public.staff (
    id integer NOT NULL,
    last_name character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    patronymic character varying(30),
    date_of_birth timestamp without time zone NOT NULL,
    passport character varying(12) NOT NULL,
    bank_account character varying(25) NOT NULL,
    family_status boolean NOT NULL,
    health public.staff_health DEFAULT 'Здоров'::public.staff_health NOT NULL,
    role_id bigint NOT NULL,
    access_id bigint NOT NULL
);
    DROP TABLE public.staff;
       public         heap    postgres    false    902    902            �            1259    254157    staff_id_seq    SEQUENCE     �   CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.staff_id_seq;
       public          postgres    false    232            �           0    0    staff_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;
          public          postgres    false    231            �            1259    254092 	   suppliers    TABLE     ~   CREATE TABLE public.suppliers (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    inn integer NOT NULL
);
    DROP TABLE public.suppliers;
       public         heap    postgres    false            �            1259    254091    suppliers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suppliers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.suppliers_id_seq;
       public          postgres    false    222            �           0    0    suppliers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;
          public          postgres    false    221            �            1259    254259    supplies    TABLE     �   CREATE TABLE public.supplies (
    id integer NOT NULL,
    qty integer NOT NULL,
    supply_date timestamp without time zone DEFAULT now() NOT NULL,
    supplier_id bigint NOT NULL,
    material_id bigint NOT NULL,
    warehouse_id bigint NOT NULL
);
    DROP TABLE public.supplies;
       public         heap    postgres    false            �            1259    254258    supplies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.supplies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.supplies_id_seq;
       public          postgres    false    244            �           0    0    supplies_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.supplies_id_seq OWNED BY public.supplies.id;
          public          postgres    false    243            �            1259    254106 	   warehouse    TABLE     �   CREATE TABLE public.warehouse (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(100) NOT NULL,
    capacity integer NOT NULL
);
    DROP TABLE public.warehouse;
       public         heap    postgres    false            �            1259    254105    warehouse_id_seq    SEQUENCE     �   CREATE SEQUENCE public.warehouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.warehouse_id_seq;
       public          postgres    false    226            �           0    0    warehouse_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.warehouse_id_seq OWNED BY public.warehouse.id;
          public          postgres    false    225            v           2604    254079 	   access id    DEFAULT     f   ALTER TABLE ONLY public.access ALTER COLUMN id SET DEFAULT nextval('public.access_id_seq'::regclass);
 8   ALTER TABLE public.access ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            w           2604    254086    equipment id    DEFAULT     l   ALTER TABLE ONLY public.equipment ALTER COLUMN id SET DEFAULT nextval('public.equipment_id_seq'::regclass);
 ;   ALTER TABLE public.equipment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    254179    material_type id    DEFAULT     t   ALTER TABLE ONLY public.material_type ALTER COLUMN id SET DEFAULT nextval('public.material_type_id_seq'::regclass);
 ?   ALTER TABLE public.material_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            {           2604    254116    materials id    DEFAULT     l   ALTER TABLE ONLY public.materials ALTER COLUMN id SET DEFAULT nextval('public.materials_id_seq'::regclass);
 ;   ALTER TABLE public.materials ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            |           2604    254137 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    262284    partner_sales id    DEFAULT     t   ALTER TABLE ONLY public.partner_sales ALTER COLUMN id SET DEFAULT nextval('public.partner_sales_id_seq'::regclass);
 ?   ALTER TABLE public.partner_sales ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    249    250            y           2604    254102    partners id    DEFAULT     j   ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);
 :   ALTER TABLE public.partners ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    254217    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    240    240            �           2604    254191    product_type id    DEFAULT     r   ALTER TABLE ONLY public.product_type ALTER COLUMN id SET DEFAULT nextval('public.product_type_id_seq'::regclass);
 >   ALTER TABLE public.product_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235    236            �           2604    254239    productions id    DEFAULT     q   ALTER TABLE ONLY public.productions ALTER COLUMN id SET DEFAULT nextval('public.productions_id_seq1'::regclass);
 =   ALTER TABLE public.productions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242            �           2604    254198    products id    DEFAULT     m   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.productions_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237    238            u           2604    254072    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    262263    shop_type id    DEFAULT     l   ALTER TABLE ONLY public.shop_type ALTER COLUMN id SET DEFAULT nextval('public.shop_type_id_seq'::regclass);
 ;   ALTER TABLE public.shop_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    246    246            �           2604    262272    shops id    DEFAULT     d   ALTER TABLE ONLY public.shops ALTER COLUMN id SET DEFAULT nextval('public.shops_id_seq'::regclass);
 7   ALTER TABLE public.shops ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    248    248            ~           2604    254161    staff id    DEFAULT     d   ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);
 7   ALTER TABLE public.staff ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            x           2604    254095    suppliers id    DEFAULT     l   ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);
 ;   ALTER TABLE public.suppliers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    254262    supplies id    DEFAULT     j   ALTER TABLE ONLY public.supplies ALTER COLUMN id SET DEFAULT nextval('public.supplies_id_seq'::regclass);
 :   ALTER TABLE public.supplies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243    244            z           2604    254109    warehouse id    DEFAULT     l   ALTER TABLE ONLY public.warehouse ALTER COLUMN id SET DEFAULT nextval('public.warehouse_id_seq'::regclass);
 ;   ALTER TABLE public.warehouse ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            V          0    254076    access 
   TABLE DATA           *   COPY public.access (id, name) FROM stdin;
    public          postgres    false    218   1�       X          0    254083 	   equipment 
   TABLE DATA           :   COPY public.equipment (id, name, description) FROM stdin;
    public          postgres    false    220   N�       f          0    254176    material_type 
   TABLE DATA           8   COPY public.material_type (id, defect_rate) FROM stdin;
    public          postgres    false    234   k�       `          0    254113 	   materials 
   TABLE DATA           v   COPY public.materials (id, name, pack_qty, unit, description, image, cost, min_qty, supplier_id, type_id) FROM stdin;
    public          postgres    false    228   ��       b          0    254134    orders 
   TABLE DATA           Z   COPY public.orders (id, qty, status, warehouse_id, production_id, partner_id) FROM stdin;
    public          postgres    false    230   ��       v          0    262281    partner_sales 
   TABLE DATA           W   COPY public.partner_sales (id, qty, amount, partner_id, order_id, shop_id) FROM stdin;
    public          postgres    false    250   ²       \          0    254099    partners 
   TABLE DATA           e   COPY public.partners (id, name, address, inn, director_fio, phone, email, logo, raiting) FROM stdin;
    public          postgres    false    224   ߲       l          0    254214    permissions 
   TABLE DATA           M   COPY public.permissions (id, equipment_id, product_id, staff_id) FROM stdin;
    public          postgres    false    240   ��       h          0    254188    product_type 
   TABLE DATA           =   COPY public.product_type (id, name, coefficient) FROM stdin;
    public          postgres    false    236   �       n          0    254236    productions 
   TABLE DATA           c   COPY public.productions (id, qty, production_date, product_id, staff_id, warehouse_id) FROM stdin;
    public          postgres    false    242   6�       j          0    254195    products 
   TABLE DATA           \   COPY public.products (id, name, description, image, min_cost, article, type_id) FROM stdin;
    public          postgres    false    238   S�       T          0    254069    roles 
   TABLE DATA           )   COPY public.roles (id, name) FROM stdin;
    public          postgres    false    216   p�       r          0    262260 	   shop_type 
   TABLE DATA           :   COPY public.shop_type (id, name, description) FROM stdin;
    public          postgres    false    246   ��       t          0    262269    shops 
   TABLE DATA           @   COPY public.shops (id, name, address, shop_type_id) FROM stdin;
    public          postgres    false    248   ��       d          0    254158    staff 
   TABLE DATA           �   COPY public.staff (id, last_name, first_name, patronymic, date_of_birth, passport, bank_account, family_status, health, role_id, access_id) FROM stdin;
    public          postgres    false    232   ǳ       Z          0    254092 	   suppliers 
   TABLE DATA           2   COPY public.suppliers (id, name, inn) FROM stdin;
    public          postgres    false    222   �       p          0    254259    supplies 
   TABLE DATA           `   COPY public.supplies (id, qty, supply_date, supplier_id, material_id, warehouse_id) FROM stdin;
    public          postgres    false    244   �       ^          0    254106 	   warehouse 
   TABLE DATA           @   COPY public.warehouse (id, name, address, capacity) FROM stdin;
    public          postgres    false    226   �       �           0    0    access_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.access_id_seq', 1, false);
          public          postgres    false    217            �           0    0    equipment_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.equipment_id_seq', 1, false);
          public          postgres    false    219            �           0    0    material_type_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.material_type_id_seq', 1, false);
          public          postgres    false    233            �           0    0    materials_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.materials_id_seq', 1, false);
          public          postgres    false    227            �           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
          public          postgres    false    229            �           0    0    partner_sales_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.partner_sales_id_seq', 1, false);
          public          postgres    false    249            �           0    0    partners_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.partners_id_seq', 1, false);
          public          postgres    false    223            �           0    0    permissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);
          public          postgres    false    239            �           0    0    product_type_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_type_id_seq', 1, false);
          public          postgres    false    235            �           0    0    productions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.productions_id_seq', 1, false);
          public          postgres    false    237            �           0    0    productions_id_seq1    SEQUENCE SET     B   SELECT pg_catalog.setval('public.productions_id_seq1', 1, false);
          public          postgres    false    241            �           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          postgres    false    215            �           0    0    shop_type_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.shop_type_id_seq', 1, false);
          public          postgres    false    245            �           0    0    shops_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.shops_id_seq', 1, false);
          public          postgres    false    247            �           0    0    staff_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.staff_id_seq', 1, false);
          public          postgres    false    231            �           0    0    suppliers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.suppliers_id_seq', 1, false);
          public          postgres    false    221            �           0    0    supplies_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.supplies_id_seq', 1, false);
          public          postgres    false    243            �           0    0    warehouse_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.warehouse_id_seq', 1, false);
          public          postgres    false    225            �           2606    254081    access access_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.access
    ADD CONSTRAINT access_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.access DROP CONSTRAINT access_pkey;
       public            postgres    false    218            �           2606    254090    equipment equipment_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.equipment DROP CONSTRAINT equipment_pkey;
       public            postgres    false    220            �           2606    254181     material_type material_type_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.material_type
    ADD CONSTRAINT material_type_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.material_type DROP CONSTRAINT material_type_pkey;
       public            postgres    false    234            �           2606    254120    materials materials_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_pkey;
       public            postgres    false    228            �           2606    254140    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    230            �           2606    262286     partner_sales partner_sales_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.partner_sales
    ADD CONSTRAINT partner_sales_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.partner_sales DROP CONSTRAINT partner_sales_pkey;
       public            postgres    false    250            �           2606    254104    partners partners_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.partners DROP CONSTRAINT partners_pkey;
       public            postgres    false    224            �           2606    254219    permissions permissions_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (equipment_id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    240            �           2606    254193    product_type product_type_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT product_type_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_type DROP CONSTRAINT product_type_pkey;
       public            postgres    false    236            �           2606    254202    products productions_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.products
    ADD CONSTRAINT productions_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.products DROP CONSTRAINT productions_pkey;
       public            postgres    false    238            �           2606    254242    productions productions_pkey1 
   CONSTRAINT     [   ALTER TABLE ONLY public.productions
    ADD CONSTRAINT productions_pkey1 PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.productions DROP CONSTRAINT productions_pkey1;
       public            postgres    false    242            �           2606    254074    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    216            �           2606    262267    shop_type shop_type_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.shop_type
    ADD CONSTRAINT shop_type_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.shop_type DROP CONSTRAINT shop_type_pkey;
       public            postgres    false    246            �           2606    262274    shops shops_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.shops DROP CONSTRAINT shops_pkey;
       public            postgres    false    248            �           2606    254164    staff staff_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_pkey;
       public            postgres    false    232            �           2606    254097    suppliers suppliers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT suppliers_pkey;
       public            postgres    false    222            �           2606    254265    supplies supplies_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplies_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.supplies DROP CONSTRAINT supplies_pkey;
       public            postgres    false    244            �           2606    254111    warehouse warehouse_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT warehouse_pkey;
       public            postgres    false    226            �           2606    254121 $   materials materials_supplier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id);
 N   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_supplier_id_fkey;
       public          postgres    false    222    228    4754            �           2606    254182     materials materials_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.material_type(id) NOT VALID;
 J   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_type_id_fkey;
       public          postgres    false    234    4766    228            �           2606    254146    orders orders_partner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES public.partners(id);
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_partner_id_fkey;
       public          postgres    false    4756    230    224            �           2606    254208     orders orders_production_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_production_id_fkey FOREIGN KEY (production_id) REFERENCES public.products(id) NOT VALID;
 J   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_production_id_fkey;
       public          postgres    false    4770    230    238            �           2606    254141    orders orders_warehouse_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id);
 I   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_warehouse_id_fkey;
       public          postgres    false    226    230    4758            �           2606    262292 )   partner_sales partner_sales_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_sales
    ADD CONSTRAINT partner_sales_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);
 S   ALTER TABLE ONLY public.partner_sales DROP CONSTRAINT partner_sales_order_id_fkey;
       public          postgres    false    4762    250    230            �           2606    262287 +   partner_sales partner_sales_partner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_sales
    ADD CONSTRAINT partner_sales_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES public.partners(id);
 U   ALTER TABLE ONLY public.partner_sales DROP CONSTRAINT partner_sales_partner_id_fkey;
       public          postgres    false    4756    250    224            �           2606    262297 (   partner_sales partner_sales_shop_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_sales
    ADD CONSTRAINT partner_sales_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shops(id);
 R   ALTER TABLE ONLY public.partner_sales DROP CONSTRAINT partner_sales_shop_id_fkey;
       public          postgres    false    250    4780    248            �           2606    254220 )   permissions permissions_equipment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES public.equipment(id);
 S   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_equipment_id_fkey;
       public          postgres    false    220    240    4752            �           2606    254225 '   permissions permissions_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);
 Q   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_product_id_fkey;
       public          postgres    false    238    240    4770            �           2606    254230 %   permissions permissions_staff_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(id);
 O   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_staff_id_fkey;
       public          postgres    false    232    4764    240            �           2606    254243 '   productions productions_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productions
    ADD CONSTRAINT productions_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);
 Q   ALTER TABLE ONLY public.productions DROP CONSTRAINT productions_product_id_fkey;
       public          postgres    false    4770    242    238            �           2606    254248 %   productions productions_staff_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productions
    ADD CONSTRAINT productions_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(id);
 O   ALTER TABLE ONLY public.productions DROP CONSTRAINT productions_staff_id_fkey;
       public          postgres    false    4764    232    242            �           2606    254203 !   products productions_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT productions_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.product_type(id);
 K   ALTER TABLE ONLY public.products DROP CONSTRAINT productions_type_id_fkey;
       public          postgres    false    236    238    4768            �           2606    254253 )   productions productions_warehouse_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productions
    ADD CONSTRAINT productions_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id);
 S   ALTER TABLE ONLY public.productions DROP CONSTRAINT productions_warehouse_id_fkey;
       public          postgres    false    242    226    4758            �           2606    262275    shops shops_shop_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_shop_type_id_fkey FOREIGN KEY (shop_type_id) REFERENCES public.shop_type(id);
 G   ALTER TABLE ONLY public.shops DROP CONSTRAINT shops_shop_type_id_fkey;
       public          postgres    false    4778    248    246            �           2606    254170    staff staff_access_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_access_id_fkey FOREIGN KEY (access_id) REFERENCES public.access(id);
 D   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_access_id_fkey;
       public          postgres    false    218    4750    232            �           2606    254165    staff staff_role_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);
 B   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_role_id_fkey;
       public          postgres    false    216    4748    232            �           2606    254271 "   supplies supplies_material_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplies_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(id);
 L   ALTER TABLE ONLY public.supplies DROP CONSTRAINT supplies_material_id_fkey;
       public          postgres    false    228    4760    244            �           2606    254266 "   supplies supplies_supplier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplies_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id);
 L   ALTER TABLE ONLY public.supplies DROP CONSTRAINT supplies_supplier_id_fkey;
       public          postgres    false    222    4754    244            �           2606    254276 #   supplies supplies_warehouse_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplies_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id);
 M   ALTER TABLE ONLY public.supplies DROP CONSTRAINT supplies_warehouse_id_fkey;
       public          postgres    false    226    244    4758            V      x������ � �      X      x������ � �      f      x������ � �      `      x������ � �      b      x������ � �      v      x������ � �      \      x������ � �      l      x������ � �      h      x������ � �      n      x������ � �      j      x������ � �      T      x������ � �      r      x������ � �      t      x������ � �      d      x������ � �      Z      x������ � �      p      x������ � �      ^      x������ � �     