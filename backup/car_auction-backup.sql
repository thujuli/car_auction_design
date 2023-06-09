PGDMP         ;                {            car_auction    15.2    15.2 (    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    19272    car_auction    DATABASE     w   CREATE DATABASE car_auction WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE car_auction;
                postgres    false            �            1259    19738    ads    TABLE       CREATE TABLE public.ads (
    ad_id integer NOT NULL,
    seller_id integer NOT NULL,
    product_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    date_post date NOT NULL,
    is_bid boolean DEFAULT true NOT NULL
);
    DROP TABLE public.ads;
       public         heap    postgres    false            �            1259    19737    ads_ad_id_seq    SEQUENCE     �   ALTER TABLE public.ads ALTER COLUMN ad_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.ads_ad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    19757    bids    TABLE     �  CREATE TABLE public.bids (
    bid_id integer NOT NULL,
    ad_id integer NOT NULL,
    customer_id integer NOT NULL,
    date_bid date NOT NULL,
    price_bid numeric NOT NULL,
    status_bid character varying(20) DEFAULT 'Sent'::character varying NOT NULL,
    CONSTRAINT bids_price_bid_check CHECK ((price_bid > (0)::numeric)),
    CONSTRAINT bids_status_bid_check CHECK (((status_bid)::text = ANY ((ARRAY['Sent'::character varying, 'Cancelled'::character varying])::text[])))
);
    DROP TABLE public.bids;
       public         heap    postgres    false            �            1259    19756    bids_bid_id_seq    SEQUENCE     �   ALTER TABLE public.bids ALTER COLUMN bid_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bids_bid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    19691    cities    TABLE     �   CREATE TABLE public.cities (
    city_id integer NOT NULL,
    name character varying(255) NOT NULL,
    longitute numeric NOT NULL,
    latitude numeric NOT NULL
);
    DROP TABLE public.cities;
       public         heap    postgres    false            �            1259    19723 	   customers    TABLE     �   CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    city_id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    phone character varying(20) NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    19722    customers_customer_id_seq    SEQUENCE     �   ALTER TABLE public.customers ALTER COLUMN customer_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    19699    products    TABLE     C  CREATE TABLE public.products (
    product_id integer NOT NULL,
    brand character varying(100) NOT NULL,
    model character varying(100) NOT NULL,
    body_type character varying(100) NOT NULL,
    year smallint NOT NULL,
    price numeric NOT NULL,
    CONSTRAINT products_price_check CHECK ((price > (0)::numeric))
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    19698    products_product_id_seq    SEQUENCE     �   ALTER TABLE public.products ALTER COLUMN product_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    19708    sellers    TABLE     �   CREATE TABLE public.sellers (
    seller_id integer NOT NULL,
    city_id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    phone character varying(20) NOT NULL
);
    DROP TABLE public.sellers;
       public         heap    postgres    false            �            1259    19707    sellers_seller_id_seq    SEQUENCE     �   ALTER TABLE public.sellers ALTER COLUMN seller_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.sellers_seller_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            /          0    19738    ads 
   TABLE DATA           b   COPY public.ads (ad_id, seller_id, product_id, title, description, date_post, is_bid) FROM stdin;
    public          postgres    false    222   K0       1          0    19757    bids 
   TABLE DATA           [   COPY public.bids (bid_id, ad_id, customer_id, date_bid, price_bid, status_bid) FROM stdin;
    public          postgres    false    224   �G       '          0    19691    cities 
   TABLE DATA           D   COPY public.cities (city_id, name, longitute, latitude) FROM stdin;
    public          postgres    false    214   �K       -          0    19723 	   customers 
   TABLE DATA           W   COPY public.customers (customer_id, city_id, first_name, last_name, phone) FROM stdin;
    public          postgres    false    220   M       )          0    19699    products 
   TABLE DATA           T   COPY public.products (product_id, brand, model, body_type, year, price) FROM stdin;
    public          postgres    false    216   \U       +          0    19708    sellers 
   TABLE DATA           S   COPY public.sellers (seller_id, city_id, first_name, last_name, phone) FROM stdin;
    public          postgres    false    218   lW       8           0    0    ads_ad_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.ads_ad_id_seq', 1, false);
          public          postgres    false    221            9           0    0    bids_bid_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.bids_bid_id_seq', 1, false);
          public          postgres    false    223            :           0    0    customers_customer_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, false);
          public          postgres    false    219            ;           0    0    products_product_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_product_id_seq', 1, false);
          public          postgres    false    215            <           0    0    sellers_seller_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.sellers_seller_id_seq', 1, false);
          public          postgres    false    217            �           2606    19745    ads ads_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (ad_id);
 6   ALTER TABLE ONLY public.ads DROP CONSTRAINT ads_pkey;
       public            postgres    false    222            �           2606    19766    bids bids_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_pkey PRIMARY KEY (bid_id);
 8   ALTER TABLE ONLY public.bids DROP CONSTRAINT bids_pkey;
       public            postgres    false    224            �           2606    19697    cities cities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    214            �           2606    19729    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    220            �           2606    19706    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    216            �           2606    19714    sellers sellers_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (seller_id);
 >   ALTER TABLE ONLY public.sellers DROP CONSTRAINT sellers_pkey;
       public            postgres    false    218            �           2606    19731    customers uq_customers_phone 
   CONSTRAINT     X   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT uq_customers_phone UNIQUE (phone);
 F   ALTER TABLE ONLY public.customers DROP CONSTRAINT uq_customers_phone;
       public            postgres    false    220            �           2606    19716    sellers uq_sellers_phone 
   CONSTRAINT     T   ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT uq_sellers_phone UNIQUE (phone);
 B   ALTER TABLE ONLY public.sellers DROP CONSTRAINT uq_sellers_phone;
       public            postgres    false    218            �           2606    19746    ads fk_ads_products    FK CONSTRAINT     �   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT fk_ads_products FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 =   ALTER TABLE ONLY public.ads DROP CONSTRAINT fk_ads_products;
       public          postgres    false    4230    216    222            �           2606    19751    ads fk_ads_sellers    FK CONSTRAINT     |   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT fk_ads_sellers FOREIGN KEY (seller_id) REFERENCES public.sellers(seller_id);
 <   ALTER TABLE ONLY public.ads DROP CONSTRAINT fk_ads_sellers;
       public          postgres    false    4232    222    218            �           2606    19767    bids fk_bids_ads    FK CONSTRAINT     n   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT fk_bids_ads FOREIGN KEY (ad_id) REFERENCES public.ads(ad_id);
 :   ALTER TABLE ONLY public.bids DROP CONSTRAINT fk_bids_ads;
       public          postgres    false    222    224    4240            �           2606    19772    bids fk_bids_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT fk_bids_customers FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 @   ALTER TABLE ONLY public.bids DROP CONSTRAINT fk_bids_customers;
       public          postgres    false    224    4236    220            �           2606    19732    customers fk_customers_cities    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_customers_cities FOREIGN KEY (city_id) REFERENCES public.cities(city_id);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT fk_customers_cities;
       public          postgres    false    4228    220    214            �           2606    19717    sellers fk_sellers_cities    FK CONSTRAINT     ~   ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT fk_sellers_cities FOREIGN KEY (city_id) REFERENCES public.cities(city_id);
 C   ALTER TABLE ONLY public.sellers DROP CONSTRAINT fk_sellers_cities;
       public          postgres    false    218    4228    214            /      x��\�r�X]�_��K"�\z�tu�:�v��dCKt���IWf�~�.%9�8�,��^ ��Y�̦����P��M}����j�W}7����:�ٛ���χ�p쫾����˫]�����q�l��C^7C�������_�m�z86�?����x8���>u�f�T}��]������=�ǷuW�|���m�7��ڷ|h��"��T�����M�n��6+&E�j2}UL�����xyG_�^�ᰅM^��?l6U�����~v;XM�K���u��ݦ����&ov;����k�jSÒ�(j�6�l�����OC�w5����}�z�Y�6ߛ�������W�m��t:��������L����U1˞n�l���"������×�ٛ������������6�#h���|s8�]�O;0R[��	�������6���ԧڳ9���SW��-|��+�}�����s�:�x[�U�>�Cx!lM7˖�����N�����v��k���������Q���⑷�]��	� �e#�g�&K��<+��JO����G8���������|����a>�=�W\���n�6���ۗ��k���X�S+���e���ܣ�6����������XC��`��i7`&�����'����4��l�"pW۪�|���
?CG6���z1c<`
��a��9]��.��*�M��U��E~�7���1�>�)���c�����~4{B�'8:t7����f��\�W�|�W�����e��X�}���^N,��ߓws�q�O�_U'Z����p�M�B�ǖ���7���ߙ1\ˠ�����������k���?á�#��O`�x�XK������6�3���h���u��fe�˯�� �$�������e�3���m6�y���Y��=�L'�r�M�K����C [�#��n�����Z
���%w`��qa�ȅS����p�6���'8Yі�p��-^粉)nb6;��֑�kqKh:A��,'(��@dr���l�������r+��\1��f��ۖ�qHP�v9�G[F����z���K6�|�|#��n�k��kk�a���|�f��0��?�����P�������'S<�Acy�3w��aw�
���#`ЙV(�o@���n��x������u�;j�J�/b  BT��{r]�Fb�P`Z ML��f���l�{�g��~�DD��L��)�3�YO\L<���lk��đ���p��!ʜ�9tp���9��͐�������]t��b:G���taa�F��[���a���cd[D�[10S�N��&X[�,.'�g��ti�?��*!qg���X��)�Gc�	.�+[����.��!i�ָ4X�G:��"����urZ�-�9����g��q상ׂ/7[8��SLpP$ jϝ�%���x����ћ �c�أMR�@6��
)��T�|<R��'o��أ?��Cδ��C�Td���n�+"Y�d�X�ћ�P��v�mXf<�BaW���AG+�@���e��wz�x����2g��ƢG�֛��<.�`J~g<!o�F�H�♐��0����PQM���A��3b�8.#��̀~F'�	N,'�;zH�^�ގ���j�p�`�((Q�W�Yt'>2�$0�@s�*r�#��	��Q��ƿp$8bܜ	ŷ68�K�<��W���"�Q�.Y�K�w�Y�<�M�$�Na�-o�����5a!��J��_��-)�`��A%��(�ؒ��9>N9
#��#�"l�����|����H��~C��|�L���[�$��c{I2�|<ǭ̀�s:� /���lK�z%��'d�Xav$�Q5���h&V�+Pk�`�犅�}gY/����6��z��-!����;G�5�e���[h�a����; "l9�Q��H���s*��Ї��k���A��gk��`A@�  X_�گ��E�-�y��Η���u��:��c	�9N �3��HЂ��z�� �fԛ�x�F�Y�è�d���\^A���[B�3�}b�0��k�/_���B�S!W!nØJ�R'ݺ&����58� ���!�3=�ۤ�S]g�2+'�g>MI��:�%�s#�2-^HA����$�*J���R�qP��Շ�Hb���V+�b/�#L�
?q��.~u��%����~U��@	�u�vV������i�O^�Dn��}H�d5E+��Y����L��0�_�@\�q�ƅ�� �ޯ&���]s3�7�<��L��-a2��Z�G������j�t1g N�	2���i�&%��4-��������H�N"[��]���%N���0��#�`����/����NC������QQ(g�jv���tч���#��D�}FNɽ�֯$<�9���!�4V�r�$zP�
w�Q�	��{��T
|'�'
��`2�����>�D��5� �'�<Hs/y��ƨ��׫��J���\b�$N�G����(%|5-��T�ەXgpʈ�	�vp�W���A�Jjek��[��3��q�8 ��Q�JS�ը��8�D�2%�=�V�X�Jݸ��S�/�Ź���gZ�rW�7GP�H��:��5�PFoS��F�)�:�R?`�h�6��>r
9�3��f�P�`<�d�^��Xq������
��5�����r���p3�n=���I�J����x(V/���(ܾ㦎IԚ��H�R���(O� )��)ʃ�4���t9��.�����FH�?鐍�p9���dc}����sZ���r�#�H\ �a��Bv��韮�� �%�
"�%Y�Y��fVf������G�o�)�,�H�mR�6D0oR+����Y�:��t���?$:��$V�ޘ��(mY�n(�/��$jQIWh��͎�!
Agh�"��Q�e:���T9�: ���Eȕ��������]0ભ������_�I��O�=��Z+�-���%�f�{UL� ~�]PoR@$��c=~�Ԧ1I9Ȃr�j� ��3Ȓe6[��兊��e~�4�ac۴���(�h�,D4�9J���U��$ر��h�l\5\�-�Y`�iyxV0@^sw� 7�is�ja#�:xj����q%R�}=H(H͍$�H�`�6klL�Ϡ�C��kb$	]A�h�Lƥ,pI0!��@����|�칸�!��u�ʐj�w�)\"�����A�5��3�/�w�mD߀[(�8 ��2��gAV0�R��3�gR|,���:�8�����ñ���/q���|��c���zo��$l�ZՔ)<=z�����H��D՘F�0���w:'�.�di�Q}R�����w��)�z�A��B � !X��h�%CA[�$ ���5��de]枉H�N
)r�E�ϲ�2L7%�Tki߈h4��2"�����
�jU�t�d\�q3�qQN���Ӈ���~���Kx�Y98tN�r_���?H#ӺӲ%�-��Ьn7`����	��
�r���J���9������{&�ćU|���%R�W�D���Xϗ��<j��*�]�,2~R��;,2H!�	L<Ax���ܝ����s(� ��ט!N��v���@@  �S/�P��K��>��_��Z�bٴQ�$��b�N��fD.�$�t�zC9�<L�s!nįK�hW���x m#r����̘:�.��E�
��C����ND�Se1�օ8�E���
R����[��t���Ċ07ד*�d�驥g�0�������2*`���ȗ��Ι���m$PRQ!,k%;F�p����oI���4��yn4ʷ(2�v��K	G�0cQ]
տ$tO���$�)�q�z���yIT�Q�A���e#�B��/Tʙ,���g��Xb�-��CC5��ƞ�F����@8���u�!�D�h�,t����&���>ǉ�!jd�
d��u�h�xe�hK`�A[�����w�<�#�TU�����U	?�0?"8����In�3��܍'?��Rj$�	��OR��0[p�:E�= 8  �m���9�s�����RH�e)���<��kT����.f�H�q�Sݳ��iA�C,΀M-������K&4R&Xdp@�N�ϊe9�����m�Q;Ğ^�Sv͡�3M�wnDv��.0�E���C�\P�ř��1�O����4~�^_T*)�6�����k"<�ZuV��~�c'I�5J����DJ�������X��P�Ǎ����|�k�lG���op�~���K�����"�R��I(��Ƴ�r������c�뢉Y�����t�<V`D��~m��W����O��S�K�a��Y967����B�}�2
�OK�l�H=�JY:�[�ieZӡ�r�]�O-nX��5�tޢ���>.��H2�q.������s$"�W�����P.�N��xs0Sw����6��-�W$2��r;��M5`F����O���¹ͰqT^��0�&ul��_| �s{ud�\Z�H��q� EJ���ދr��bM"'�yI�d4ǂ�}G�<�uTZ"��Ƥ�q�5dCAv��Ƞ��(�c�*.�q�c!��)}r!m|-�������R�5�o-�����H��s���#3��.��rC�e".J��b�o�r�ʨ4͖K,��)Xl����`��͓-"�)PA~ƴ�\�������X�������ج��/'d�dWA�~��4"όAg G����:[��r���{hHf听�y�1�'׉��-�I�M|�6M5���#- W�l5Ŏ�y{^���hB-G�Rm?��L��x�|�4$��Q�r)�<���3%��� l������+P-��"J���]�h������eJ1a"
�U�K��B�9y ��C�r��$J��o�jӱ�By�z,�%�!�w�YK���щԔ�A?�y�e���组K�@p�{q���������J����Ę����aLc�A�t�J�&���l3��'	�t���	JWNÁB�����8lxC�R��������dpJ���gPʉ1H�,zJ�\_f#=�ō8��К��U�R�D���	�bz���w��xð#-Ϧ{�AHʠ'�9޽��Xr���i�!�5$W�E�d">y���D.��W�A��i�ife�۞;�9=��2{�`"�r��}&���z�}�����t[1K�Pv&0[]��r\\L�!d���,IXGvՀ��B��L
�D$FQ/�߹���m"����z��f�u�����c)tm,(�f�j��úa���.��:��	VV�_�'$����\���I8��`4��S5v�(V�[���z��N�O2���9��/7�}���8��$M��uF�3~n]�SU���T���F�2�ewG���oh�ԝΎ��j:�G��֤5�L���}����P�4Ӈ�I����J�t�̉��zF�{��L���Q���I����MjŅ����G���)E�g���	y���<�u9�	��:<����t^����U�gF�vs�]�s�%l�"듅C1��m�� 
f���s�VT��p��O��l��UH�N��f�T}}���b<n�?6MHZ#,��S���g��lw[;,�W�g�*�a|pE��@��.Z��G�n�/TLW}��R܄��X汼�G: �p�)]����ZD��d�� ��-z�c:{9�~�3c6��(��̏߭�O��I���/u�h���ה|k�nq���AI2	@2��H<���Sb��� �����P�y3��7����8:V�S�\
D��06�\ ү�A���i��kmG��/�a�� ѽo�777��=I�      1   �  x�uW���9��w�A�/U�Ҧ	�R��#�϶H�c[,45r�4S-4��3�'W*��뇾����ׯ__�=25���a��?�?������B����(U�n�*e��W�g*Tr�ڕ��ķ��NE����x�ϺG�����ԟYN��pK_9�
��&"��<��H9)�j9��a%3+��wf�'������6pQD�>�ҍ�W�J�i�}��F��E<��G��u=����І����Φ�;�LΚ�h��z�!��q����l��O����$�ċm���B�Ʋӈ5�su?��$y�Fb�#�	�f,�j��%E��B\���fZ���(.i^j9�6�M�ir� �{�\���8�l�(Q�'(�Fў/�Ia��Tt7��7�T��Vj�+���aOB����,��cC6���ā*�����W	S�'��L����%/VVJ�)N{��V3u����d[U$�6
kP�>8���4u�Q��r?)� �j���l[K<�Ə�D�)�R�^G�����7$���O�%�0��e�ѳ�-<|ښ���AvB�I�1�MM�FZ��#����d���h��n"�1��6�z�l:�4��{�
x� �8��_���a��[_���i�� P�U�BB��9.�?q.����F���>��4fX*�2v]���*�l�kC=z:����R�}�Z�t��
ц�͡���  �L�َ�M=1�K�>��=�c���W�t��?��(2U@�ln��*a�_�2���1Tbޗ�I����!�S�e�N�j����`�ՎcQPG�$5uq����UuK��e�$��T6�9�I��.���p���h�k����qe`4�xf� T�sg�<`΋�sܸ]��m�x��5�v(�=<����;xsm�ľGoW����P���>'�{���΁X�7�p�t4������+U��-������ň�1v���9Qt�捅��(F����&�Ͱ�4?�y< ����      '   `  x�U��j�@��)�:���f���%PH{X؋��`����y�Jv�/!�˯4&(н~O��u�Ϸ��S�"��*$��rj
>�IG]0B&^p)0;�g�1�&�Di���t�y�Iǔ�d�q�������_��%g��ƕ[ ����I�C�Rb�P[� 0

'rUW��G��Wu�����
ej5P������NwYZA��I�}������� ��ͥ%Y� t�|��R0�更(��,Nn���~���p����V,^�yT��?���{[���fm7Xj%r{�Н~��{�XN�L�����(��C_.j�f���1�b��>�/���ᬋ�QX�GsD��Z�C?�@��      -   K  x�eWKO�H>���A�^��q$�%!/�	�e/=�Y���F~���+w���8�D����{�e�W��tj���M����7"��ښȽ����k/��i�R������92��ڈXG�ӕ6�JӐ���8�}�F8{V��.2Si�Cu՜v���;��K��j���If�9�Z(t3�]�0�g�:�=J!s���V?��nҮMcT�ҝըͣ��y
S����Ҵ���?��#"UP�E*���6���'����%�"��#}`������6HzW��4�B��5L���f���f?�i}����<��L����&���锪Mj��Jm�
�ko��<��������n}��lB0\�h��y��ix���)�Km��N�5f#MØ�4��k�#�]2:qVK+�@嘴��o��!MT{���7BE�F��:v9�U���M�e]��K�Uu0�}N����-0�úe��Xa0���y���A�q���R82�Z
N��D,B��ڈ��'�¨Ii��D%���.�g���T�4�(	T+YI�&1�c?��Ů�ߣ���xe�Rf�sK�y	����c��)��o����w���,�A�T_��DtG0���]�E Bq�ö�/��Շ�@��4��?�]�|�s�1T�\�*��^�UF�C���|���tl�y��rҢ�(��
yћ	��Σ��5�K�4S1o�}�@k��/�Z d�Z������K�=����Gc�PL���G`>U_����V���t�~ϴʑ��X�Lc��ـ� %�� NgE�����
#�k�6Y���Cߡ$�ڂ&Ӫ��n4���X�m�ٗt�Z�"�<K�'J� �%^3]r��S�a��~���~1<W$�>o�Ľ� �Q^x�vL�\��q�5��]Z	�Ȭ����Җ�\����\ Y4�+(3"��{ f���P(b�ϴ�*h͌�4���7��y\Os~
M��\��*��"@SR����i$UP�Iu��� �½�D)� �E1	�2�G�ݒn�K>X +�z�fl��%o����za��xʻ]3�?��aP�j,P5>/�`��><�Y��¤V�O��hm1.@_��!(�o��	Q��3��$50Fm��������1��I$��\T7[����g��C��Ve�]�#���<�ߘ��@I�m��e#Wi�W�E"���-f�p��Bj���47Q��4}@e�� x W=CAb-С�̺���ۏ����<�Q }a���X~4ݸ�!�=溌�+��J�lȒ}��C��.�>�I�ĳ����ƢKY_!��ȉ���5���	FO�$S%x�ȉU�AY'�p�%���64�����q=J�%+��̩\����|q�iI�k�0��b+?�_���xl9s�T���l���G��e���㾨�%G�42WL%����V�1�S[Gg�����A�wdk�ҫ�h�	@��͜�C�̿��_!�������e���M��r�
a1C�'�	����#tTj��krpU�8b�c�\�=���x�������}JǱmV��J�t�pJ0_��S��L��+W�@La�H���#��ԼV[]��qm�d�d�Н����ɬՆ�naNim~�-(v;�A�9���`�*2��-�$��| � �f�_�ˣT�c%Q�C���gtw�Ȋ�퍮x�c�;L1f��l���}���\(!�Y���HD>�.��۟i@D�Ϲ�@�2�+�<� (��>u���kDce�PIT*����	����2�B#��Y��:?��|�V^��L c�+�Z>Fdyu�	@'D������� Љ ,���D.��[��q9f>���y�~���qIGO�9�vWN����F�X�(}�0�T��õ���ќ���C�X��P,�<<x>U��ge3]�`:
Ǣ,��)�7��|����>9k��P,�&�^>Iȩp�⊍�%�M�)�!Zc��
����?i^Q����	wFġmu�3^<��b�������r >^���zIf|FZ�/�>p�ؼ^%���Dlq����c|�N��xp,#��q���Jt�G9�%�F��G���)�~��Hm,T���d������      )      x����j�@��GO�Hٝ��N 
%N�r�q�#,�O�~�N흍��Z�B��7�9sfW�}���5�����v���o�BZ�Έ��2�%㪌k���8
�D�ʔ�#H�	��z��m:��L�"�!��"LC��;�h$�Ɯ�XIQl�y�e��w��e�J��8{X�(�Yvؖ�n���!xβ�b�5X���k�nv���z��e�^q�UAF�V��)1,W�Q�	�9�K�
ʞ��źn60��x:z2�ڡNb�iH>���"N�-O���`�/�?�U��O��Ӿ���Q�v��m�&�*��m���K�՗j���L`Z�]�z����{<�ܤ�'�� @�u�rg�;�lh���V� +
�3l[�����3m���p1Jg�_���{;�	�Y@���b@�
>m�ng4�?�yw�*�]c=[���M&�@���H�g?ZH�-���@�;�0�vouzMn��z��B�,���,r�Q��mF� �g�ʈ� ˟��oUU�BTj�      +   G  x�UW�n9=7���	=��q�[�q�`��Б"ђZF/c(_?��lY>Y0
$��[�E%�3ՇM���q��V��p�}����ל�\u�.���8���v_J����$J�a������r�8T_�:�R��Z�h�ӕSNTW�b����p踝��u�=�_�h*%����D�W�Wq;���z�.�����Y�5�Y��X]��վÃ�w���
���3��\�6U�"�!�:�,Z׺V��PT�bw��D -b��s�j�h�W��J��]��-�����Br/j�BmLL���Q���6R��Η:AW��+`#D�<n����>4�o���	Y)���e� �����&T�x>�rl�{��7���ƣq&4�+����_�����/J]�
c���	C��D���N��}�fڑN��sɄ�^���-8>p���L���q��^�
�������ʿ�A�v���a�4�C��LS��F'B���H�=P�� JP�i�(k%�<�}�8��}7��h� ��L
:H�����,��⨴��jaRR��:{J��Vw�ۯ���64RbĂn-#�B��A�\�n*�Q�4�kǤ�,�F�I�C�AH��pŤɷ^�mZ�i1�AS�#,X%mn�2��T��F���u�I�W�t��8����Ł���$ƁAWqfW��1m2��xj�JȬ��9hc}[�f���[�x�E�� AB�n��U�m��0��(��s|u��9��s^2%�u����0��O�����xǔ�d��T1K}��Л0lv�әɘ<�[�N� <�vx��O��o��Gܝ�oᆸ�1cࢊ]}�4����'Y�!�+�Tq�Oi�"���v��s�7	��bSg�O� >a^��QY�qa�/̶{�� �k���b�g܏�K$OG�8LCR��+��>��6�+m�q��.�����Bk(w>є��w\e�y��L����]���!.��- .⴫�Pʹ������ ��Gi�~c|� C����=���E|7���N2ʠ B�h�����!��@ssA�	A���.��"vpR�vڧ��`H�N!���~�A�_�
qr�90�F��s�������bt �����M_kr�[�����YHOsPȈ\?�4�]�0W�# '�+fd��mܥ��	[܏Gsq���x��tq�;o�3M���ŴM	���إ��D��I�)��Y�gB��m��Z�>Dㄒ�����HRxH�~�m!�)�x��u.3�&�pÐf�����#�L�m���;�W�I�΄�Y�O@��_.��Tm������ϸM��۴�i(Pg�.�S+2��� �G��i4�-+˙-�����i���XUC؞�y&�����,vAC����  '�:�~QN�gړ`����T<����o�x�H!���#�/�j�x`�f�~��d&��	Mr9$��\��M<ķ��p�6�� ��2�; ҝ� �������f�OC�r�&�1R�+�����p�p���B�c�+y~{J鲊7��i,X�� ow�?����s���h�
�דAߍ�!{��4(Y[�@���/J�[^o�k<�-�Q���Wi��C��5l�:g�+n�5�-(�6�h��扄El:7�*�n���X�v\;jDp����Q�۪ϛ!b<@�ꥭ����[����8a�8~Fx*v�J����������^�G|O}K���?U������a��սYT�&|_��|	��l�n=�X8Ҝ"Vk���UVƓ�2��۔N̛��@�}������L�̗	}��!��_�/'I'�B�3��/e���xJ�~C�񙃁*�}v��{Ĝ��%=C��EK0>
�(�ۼ�Ъ{�B���X^CY�n�Oʨi�(L+����6,��O�8;U�Z@7������ϗLI`��c#�<���q�|���}S:�MS�J����4_#����X#�)5&��G`!����a�_嵲��\z��쉊�l���n�iCd�3|޹وs6�M�� ��1Z�3U��[�is~�i⽂h��B6�O�6ty�O�@;q��p!|/�|��K���S��z���9h���\���     