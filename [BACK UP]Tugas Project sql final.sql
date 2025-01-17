PGDMP  2            	        |            tugas finall    16.3    16.3 -               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17901    tugas finall    DATABASE     �   CREATE DATABASE "tugas finall" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE "tugas finall";
                postgres    false            �            1259    18080    ads    TABLE     �   CREATE TABLE public.ads (
    ad_id integer NOT NULL,
    product_id integer,
    title character varying(100) NOT NULL,
    description text NOT NULL,
    date_post date NOT NULL
);
    DROP TABLE public.ads;
       public         heap    postgres    false            �            1259    18079    ads_ad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ads_ad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.ads_ad_id_seq;
       public          postgres    false    222                       0    0    ads_ad_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.ads_ad_id_seq OWNED BY public.ads.ad_id;
          public          postgres    false    221            �            1259    18094    bids    TABLE     �   CREATE TABLE public.bids (
    bid_id integer NOT NULL,
    product_id integer,
    buyer_id integer,
    date_bid date NOT NULL,
    bid_price integer NOT NULL,
    bid_status character varying(50) NOT NULL
);
    DROP TABLE public.bids;
       public         heap    postgres    false            �            1259    18093    bids_bid_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bids_bid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.bids_bid_id_seq;
       public          postgres    false    224                       0    0    bids_bid_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.bids_bid_id_seq OWNED BY public.bids.bid_id;
          public          postgres    false    223            �            1259    18063    cars    TABLE     )  CREATE TABLE public.cars (
    product_id integer NOT NULL,
    brand character varying(100) NOT NULL,
    model character varying(100) NOT NULL,
    body_type character varying(50) NOT NULL,
    year integer NOT NULL,
    price numeric(12,2) NOT NULL,
    user_id integer,
    kota_id integer
);
    DROP TABLE public.cars;
       public         heap    postgres    false            �            1259    18062    cars_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cars_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.cars_product_id_seq;
       public          postgres    false    220                       0    0    cars_product_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.cars_product_id_seq OWNED BY public.cars.product_id;
          public          postgres    false    219            �            1259    17996    cities    TABLE     �   CREATE TABLE public.cities (
    kota_id integer NOT NULL,
    nama_kota character varying(100) NOT NULL,
    location point NOT NULL
);
    DROP TABLE public.cities;
       public         heap    postgres    false            �            1259    17995    cities_kota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cities_kota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.cities_kota_id_seq;
       public          postgres    false    216                       0    0    cities_kota_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.cities_kota_id_seq OWNED BY public.cities.kota_id;
          public          postgres    false    215            �            1259    18003    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(100) NOT NULL,
    phone character varying(100) NOT NULL,
    kota_id integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    18002    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    218                       0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    217            g           2604    18083 	   ads ad_id    DEFAULT     f   ALTER TABLE ONLY public.ads ALTER COLUMN ad_id SET DEFAULT nextval('public.ads_ad_id_seq'::regclass);
 8   ALTER TABLE public.ads ALTER COLUMN ad_id DROP DEFAULT;
       public          postgres    false    222    221    222            h           2604    18097    bids bid_id    DEFAULT     j   ALTER TABLE ONLY public.bids ALTER COLUMN bid_id SET DEFAULT nextval('public.bids_bid_id_seq'::regclass);
 :   ALTER TABLE public.bids ALTER COLUMN bid_id DROP DEFAULT;
       public          postgres    false    223    224    224            f           2604    18066    cars product_id    DEFAULT     r   ALTER TABLE ONLY public.cars ALTER COLUMN product_id SET DEFAULT nextval('public.cars_product_id_seq'::regclass);
 >   ALTER TABLE public.cars ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    220    219    220            d           2604    17999    cities kota_id    DEFAULT     p   ALTER TABLE ONLY public.cities ALTER COLUMN kota_id SET DEFAULT nextval('public.cities_kota_id_seq'::regclass);
 =   ALTER TABLE public.cities ALTER COLUMN kota_id DROP DEFAULT;
       public          postgres    false    216    215    216            e           2604    18006    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    218    217    218                      0    18080    ads 
   TABLE DATA           O   COPY public.ads (ad_id, product_id, title, description, date_post) FROM stdin;
    public          postgres    false    222   �1                 0    18094    bids 
   TABLE DATA           ]   COPY public.bids (bid_id, product_id, buyer_id, date_bid, bid_price, bid_status) FROM stdin;
    public          postgres    false    224   "?                 0    18063    cars 
   TABLE DATA           b   COPY public.cars (product_id, brand, model, body_type, year, price, user_id, kota_id) FROM stdin;
    public          postgres    false    220   /D       	          0    17996    cities 
   TABLE DATA           >   COPY public.cities (kota_id, nama_kota, location) FROM stdin;
    public          postgres    false    216   �F                 0    18003    users 
   TABLE DATA           >   COPY public.users (user_id, name, phone, kota_id) FROM stdin;
    public          postgres    false    218   oH                  0    0    ads_ad_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.ads_ad_id_seq', 1, false);
          public          postgres    false    221                       0    0    bids_bid_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.bids_bid_id_seq', 1, false);
          public          postgres    false    223                       0    0    cars_product_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.cars_product_id_seq', 1, false);
          public          postgres    false    219                        0    0    cities_kota_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cities_kota_id_seq', 1, false);
          public          postgres    false    215            !           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);
          public          postgres    false    217            p           2606    18087    ads ads_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (ad_id);
 6   ALTER TABLE ONLY public.ads DROP CONSTRAINT ads_pkey;
       public            postgres    false    222            r           2606    18099    bids bids_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_pkey PRIMARY KEY (bid_id);
 8   ALTER TABLE ONLY public.bids DROP CONSTRAINT bids_pkey;
       public            postgres    false    224            n           2606    18068    cars cars_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (product_id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_pkey;
       public            postgres    false    220            j           2606    18001    cities cities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (kota_id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    216            l           2606    18008    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218            v           2606    18088    ads ads_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.cars(product_id);
 A   ALTER TABLE ONLY public.ads DROP CONSTRAINT ads_product_id_fkey;
       public          postgres    false    220    4718    222            w           2606    18105    bids bids_buyer_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_buyer_id_fkey FOREIGN KEY (buyer_id) REFERENCES public.users(user_id);
 A   ALTER TABLE ONLY public.bids DROP CONSTRAINT bids_buyer_id_fkey;
       public          postgres    false    218    224    4716            x           2606    18100    bids bids_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.cars(product_id);
 C   ALTER TABLE ONLY public.bids DROP CONSTRAINT bids_product_id_fkey;
       public          postgres    false    224    220    4718            t           2606    18074    cars cars_kota_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_kota_id_fkey FOREIGN KEY (kota_id) REFERENCES public.cities(kota_id);
 @   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_kota_id_fkey;
       public          postgres    false    216    220    4714            u           2606    18069    cars cars_user_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 @   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_user_id_fkey;
       public          postgres    false    218    4716    220            s           2606    18009    users users_kota_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_kota_id_fkey FOREIGN KEY (kota_id) REFERENCES public.cities(kota_id);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_kota_id_fkey;
       public          postgres    false    218    4714    216               -  x��Z�n�H}n~E����$���8�qn�xw������TD�H��n}!-{ r1%�.�N��v�r�����F�_�3'��b����WO;S����j�L�7V�mgOC��}[�'{е����p��w�3�:�s0��'�*g�=<�jO���;�}��ֵ띙����{��ڞN�I7m��-ܜ�bQ,gy>�ˬP�k�^$�^}p�;m�����H~�>�8�Ͷ��z��N>�8sж������'���j���oã$?��ױv����Y+v/.fE�-��5������#fj�sp{�X|l�½�A����j�nB��6{m{��T�d���^�{���=����R����#$w�o��C\@��R���Z,S?W��|_w�	��A2!b�@����v�?��V�>��;�y`M�M�x:@�!�����!��{2�v�B,�� 2��d���]���%?(|��o��M��f�����]��Y��Vj�Z����w�q������a�(8�z?T�ӮB�>��	�����p�"0{wt]�0�<�ܵ|���r�� �����TV�H0��5n6��jD���W�Z�'�]>�6��vT�Ǔ}�!���<6� O7�O���d�O y�o�#��Q&��C.8�\xy�l�6�����gȼ���kyt���е��S� tM���SE�Q��Dt@�c@���9�pB�89W���=灕�b3˷م�xŧ�\/;YC���`=�αe�TD ��I�6Pc1@��UTd��@����[�=oXQ�g}�����&�'\�s}T[���rd��1�$O��� R��6��#Ұ|�d����}����9���@�8J&�{�����o�<{�v|2����������:��c�⿹j���Q��w����=�W����X�17�o�P`B��	�&�b�D�-�,�U>��W������6����_�N���WČk�L7R�J�^C�b>xJD14DP6��������3_#�8�������-ֳ�2��O%��R	τ&CON�Fǯ"��R���v<Iˊ��v����MO)�d�pjb�i���\!���<˗*�j���F�<��2�
�z�C���Ӧݹ.Qf� fګF�MTՇ����,/U>��ҵX� &B~���$NF����n��Ig�s���	���A�>��C7)VY�R����0�WdT#�HHb ߪ��q��`�Xl��G`���\>0,X�PG��O$�be�`x��h�쵂�qO���q��~�S>FݘH_�d$��DJP���B���&��􉀌� ��[!�3L{Ğ���cbz��o����l|������uwS����T���B5	ҋ��I8�g��*�tp9�d@������r�U,��oA#���������h|>�?-���Pp���*q���]�2GЭT!B��5�"�ڿ���<�"�=�2J�0�kC7U7�Av�uq��[����P�L�7�'Uv�H�v���{Bڀ&��6�T�OPYS�����{�'D�F�p������JtOH 
1b� R��d�w!�bØp�Qv�����\/���]Y�?����g�v=IXi���`S��1�R�����$_0��Cy��Mg��.���-�Au��7�L�	I� ? Vi��+2��w �B7�������V�"+�
���%C�1k��E�4�Cʨ	��X$P1I��8q,�!=�~򣿾������ArHD��z��y���d	.�8�z��E���F�]rB���}/�W� �?�,lF]6a��J���ؿ���9�EU1��Gi��pѐW�A���ј�,��H�ذ�������X��\��/.�_�_�,L���w8n��cs�%���b0������.X�x*x��۬ب�\��FA]�Q)�J��K�����;F�E`LvXq �V�} ���ƅy�A�Õ O$D��ɐ��7A�Ib<ˉd]cw-.Tq���Tl�k��[i��|���T1p�P#����1��2��$f�\�#��V�zg0�$�n�%&ۯ�i�qK��=o��Ie��� Mv�1�#Vx#o+�l��<���d�}Ԋ�4����A
�S�����c��Hl�_R'�� 'qձ\d�\���E}������tg|I]��d=+���E� �:{�c �;NF�wr���7�eGɐ�6�d���~<�<4^Tp;�0��'T�g�B�u���H9�Rh>,��U�g}��8a0�Hu;�<"�y��Gҝ#�[�d\�
6�:!�j8:|Ao�(
��\*��1ӣÀ��\���Pe`�o}�CH�9�ǳS�1@���kD6y]�L��lY*��Y�*|9x+BK���U�"���:��&3"����|\@'�P&�bXD+�9C���߅wL\h���b4�r��z�3>�Vn#9�є�0��� ��O�v<>��-���-���Z��:v�mv?Ҽ�MY;�	Z�Cx�~�EX��$.����/@_ w���[A����ǚ &�(����J�:8ř9�+�rӒ�-.y�
w������9+��I{y2Q����T�ɸPp�1v��(;A�|M�F�!½PXv�|�c�x�c����'I���R���̊2[n\�¼&�/�}�I�I�e��|�'�C��^���G3���?��m�2F�������>1���U�]1�~���e2����<����a�O�,��:���DZ���1d�����H[�*+sU�{��{��=i	�xtng̊~�J㦮�8��v���r%h?b��ad�g�K�xFG]���xrS�,λ��U�i����a���@�����9��C��B��0�%�e���9mz�O��ҥ*��-]��"D��际D��&
�B�E}ϣ/I��)�|L����\ʫ�V(n��,UY�m�{�=���2�;ɴ���Ϡ�3��8Uɒř8�-ʬ\�ruގT�];�c��4L��W���Cb2�g�����ǙS��z�����������]jX7���ʳr����tZ��>��Q��87L&].���,�+z�(hB,��Q2
A��h��z��<�P+�+l�aE���lW���ȁ+�Q��Aq��+e;��Yy��z͜5�ÿB(g(㖍�OO(5��%������C�1*`�0�s��7OYz3���f}8,�2DX�ũ�d��z�I^4x������HĽ���zNK�W���? t�Nd/��R��A�8��l���x�Pp����>��Q���a��[;��!o��ʦE��BB�<�9�+=����2��ث_�F����Y���_9P         �  x�]W;�,7��wC��"C��p�콅a��.�����f;�*V9��Y�����C�(��{���￿�����y٧�Fn}���������4�z���Q�Dw>��A�鄊�&[�~�����,7s�8R}��E����iAg��0:wu�jf*g*�R�t֒
_mn�u�A}�A�O>{�ջOy>0�G��Q����.%QS:�q��O�%Z��"2�>G	���L��� �=jE@߮��P�Y�Pb��ΕH Y�t�%�v&�/d��3�5o(�r�|Lh'�y�Jd\Q�&��n��(Ӯ�}���~�҅�����񪾱�h��Y9�	�n�� �g�gc`3rF��S��+�x�'Y��=�>z�$'MO���=�  �C���oJ�,-�m&7d@�C��������� *Q�~�Z���Q�
���b�b���� �Ӭ��4E*割��'sb���V��� F�TN��@��5mВH�� e����#l�Q���]���x@�d@�~c��y= �h?���)�2#�,V��<�t�*���VGˤ/ u�Ͷ(3-.�(0���\փ����p���@��id���jA\T�ۤ�Kd����:��b�=�4X�O�39�s�V�9�>_%sg4��/^kD�Q��o�%dX!T�9�r���8`�^c��{S�Ccj�2�U��07�E!����-0���k.m#��+���W#+�|/$(&Ub���q�<�S�J=���f�T��k�^��e?��@P5��߰fED�_gd��cFi�u޶�l��+|5NVۃ�=i1Fq��V{�%ӤЖ(M��[n3��zZ�8��H�W�5b��5���D�q�5���v���b/
1op��,��������%�Q�g�:{.�ƒ�ΩF�����R��+dtb�7oH�f9�:v1�-Gi>�*�O�y���eB��l��@�䚥R�l.��< q(����/����cY�x��:������aE�3]�������|��T�Q�Ǎ�����M>�U��f�-]r��o�]�Z�I~�-ݴ�����tUښ<��W�����!��:������}�g��<}��%&�s]��R2r�z��/L�#1C�������&��ׯʍ�,��@��lp>�G�[�Q/p�R��N�~�����@�[�Ͼ�s#N�-�9�fI��Ckc�#w�H'�7W�}�m���RO&>O�<;Ռ�+#5b�N�ck�̊��i�=�j��?~����Տ$�         �  x����NA��g�"/P4����J�R�������BV "��<}�;Cֻ,��"A�~��36��6/�]*�?�ݪ˴����njp
����Lke���:� �"멡:h8�XJ�*�Za{�Eࡱ��� ��i&݄<_��1� d�WA��8r���	U��wg�&�@�#Zk��T�t�"?	4��H���H���J��SQ�D���F�Fg�����L�I��J�ij&���}��}0��&��1���N�}�m��?�/��,$`����$���.G�o�)�U�0;ȥY�x�K<�H�v��֝JӴq$0C_����V-^�AQ�R�]!�	DQ3��\�V�e1��v�+4h�$��	�����=��&ܡ��\�~��ڤ�}k�˛փ���DI��G��/Kvt.L����[���sA�<۵h������@��B�X@P������_���-D2�n��4:�E�V��f3X�j=_�ܧ�p�C���2��V@t>�T�%/�]��t=�̌�qN��I# �<������(T�T���p
���/��G�A1��˿	�D\���۩E$�����78.Ww���l���:�7A�`!�\c*��J`V��ڹX��A����^�_�m�X|y޵�����ጹ�w�Qa�:��2�(�k�	ʺ�q�R8�lp/�յ�X�o���i���=      	   e  x�Uұj�@�y��-��I:���Щ%PH;��$���=��+�N YL�;��_&�p��������p����YIE� J(�b��A�[��k�GH��sN��9���y:1N��(N��-^o�k�b���~�o|4�C�%%�y���8_¬����\�@��	 ��p$wer��=�K,D\fJT��t)��ow�2��5#�Sc )��,^n_j��z	RN�d�A��+�2�]7S��ج�c���h~��o��iw����L\��v�\�.���z�^�����ZVk
s)D��5��W��ݨ��P�l`�ƭ�kؕp:��?�v�g��d<_?��m{�ɖ ,8����ڪ��b�����~         	  x�]WMs�<�~E!�E����zm��^�HH���hf�׿����� lĶj��2��%��yH�c:lr?.��e�q����5�V4�ɴ�r��yNm���6=�zLHi^��"WV:�g�}j��q�/�?�0P�g���0�r�w�O뼩Ԩ#W1
f郖���Z~�6�8ҡFD����e��0s��.����]�W"j�B4"XE��̳����u�Ǯ�J��!b#����f��Y�S���Cڣ�W"(`w^���E�X�r�L|1�8\Q��.6Q*���Q)�|�O�"�>��W�6
�8@2]CJ�v�/?�|�/����YOz�����^F*�H=�=t|��F�R�U4��H��������V��IL��!m�}b�ũ���R�?�L��;���9��wi����C�˻���R�Fq��� 1��øJ���^?�-�d�hl��`F\�߬�����3��*�7i�OK~��A��1m�z&6^�F{�'^��ޥ~3�m>�ߏ�����T�,اob��2�Ot.�	����4q��<���#��j��Y�;>�/m8��,�u~j�´�[�ͪ]�i�N$��r�b���MFM~5�m&YQ�˛J+�A kc�P��(s~��4��c����%�)��Q	Y{��"��'�A|:x��ō�؜�1D_�;vMX����9Y�,a���Co �"m�pu�AlU�*`�
\�>�{̭��HHyǭU�f�"���p]2�cN����'o=�ꅡ<���%D$�B򠼚��iF;:�z����J��
,`!��:%Q��P���ptnr��mZ�̥�����$5���=�wU�ڰw���?��#	�)z���z9c�{�ڮ	h1����.��+�`D�r��竧��&�Y��M6.�*7��u�%~�c�V��-����W+�v �S)O�:F��ӥ#�_o��= ��38W�2Ld���w
��Y������N���؎;�Ѻ��k�
{&&���/Ԇ�cT�5X�`��^��s:�Z:� �'���Ͼ���+PKf��!�*��0ư;b���6��K6й��m,�J=����1bX��c����\tzx�ݤ�ڞ#Y;�[�0�x�9��cG�ȇ�rpTђ�
v�#��؉W�B~�	���W}�}Ю���h"{3�_��F^3��ir��%��IR�ž�&_�-�ΐ�c9��V�˞��~۪��C� �t�8�`/R����.�5�F���7��V�rRp�V�� Ơ��8�\ְE��Y�v+R_��
�b�M�ԬE�%���4��Q�4FFW��+�}I���P�[]���;�%j����(�l�i��BӆP� ������WKR��.D��.`�[/���3�L�D72pw�qۨL
�\��9r$�eCNq��Ot�rX|N��F�Hy�`��XL�´���q�I�s����C���p��U�Y�7���H���
߶G��I�J , ������2�T��A�C�q^pg���l����P��<=����VFDp����	`�r��L���~����Fx5:�����m;ں�zl!��Iv�� ��T57"��m��J��K�-(!�B��vb0���'����P��q�)���@����0�rŨ`z´���K�CAaK	�w��E�%\�;�v~6�w�"B_��Qᗽ;h*�%@W2��ؘS�{5`�$*�H$��2��}ڕ����`rp�Fk�y�۲"�g��Pɯ5����d��6���NY3��Xb���{П$��Pt�Sd	�<J@l�X6���r��ԗVI�N֭{{6Xp�*����!��Atr�(�^��r� O�?�O�l����������m]����#l��z\�7��Gz;�@D`OF"Eb��]�/9��M:=��O��S>2�1�S=�]�����i��]�q4�?tV%���p�c�c�W�
/�Ma��/	YD��8 0�HǲgKqI;O���*l�}�n�Z�Q�/�5�J�!�	� �����Ǔ�0B�	���ӑ��g
��ڔk��_V���������F8�NL���ImH04��,EQN!�~\��%̾�"RƊ���}�����B��]�!8�R����ɴ �*@��7Z�+�d,މQ�zД pc�'������j�N�'iIL:�u=�d���|d���Ee(�����g��4e�\㡢.�����O��q�]Nԣ|L�&#H�&L��
��������0>�%#���D����q(���>&��6��΀o����\S��#��B�g>����+     