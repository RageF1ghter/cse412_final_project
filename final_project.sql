PGDMP                         z            libraryManager    12.12    12.6 #    u           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            v           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            w           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            x           1262    32879    libraryManager    DATABASE     n   CREATE DATABASE "libraryManager" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
     DROP DATABASE "libraryManager";
                postgres    false            ?            1259    32885    admin    TABLE     ?   CREATE TABLE public.admin (
    admin_id integer NOT NULL,
    name character varying(50),
    address character varying(50),
    email character varying(50),
    phone character varying(20)
);
    DROP TABLE public.admin;
       public         heap    postgres    false            ?            1259    32900    admin_login    TABLE     ?   CREATE TABLE public.admin_login (
    username character varying(30) NOT NULL,
    password character varying(30) NOT NULL,
    admin_id integer NOT NULL
);
    DROP TABLE public.admin_login;
       public         heap    postgres    false            ?            1259    32910    books    TABLE     ?   CREATE TABLE public.books (
    isbn character varying(13) NOT NULL,
    title character varying(50),
    author character varying(50),
    publisher character varying(50),
    genre character varying(50)
);
    DROP TABLE public.books;
       public         heap    postgres    false            ?            1259    32925    borrowed    TABLE     ?   CREATE TABLE public.borrowed (
    issue_date date NOT NULL,
    due_date date,
    copy_number integer NOT NULL,
    isbn character varying(13) NOT NULL,
    member_id integer NOT NULL
);
    DROP TABLE public.borrowed;
       public         heap    postgres    false            ?            1259    32915    copy    TABLE     ?   CREATE TABLE public.copy (
    copy_number integer NOT NULL,
    availability boolean,
    isbn character varying(13) NOT NULL
);
    DROP TABLE public.copy;
       public         heap    postgres    false            ?            1259    32880    member    TABLE     ?   CREATE TABLE public.member (
    member_id integer NOT NULL,
    name character varying(50),
    address character varying(50),
    email character varying(50),
    phone character varying(20)
);
    DROP TABLE public.member;
       public         heap    postgres    false            ?            1259    32890    member_login    TABLE     ?   CREATE TABLE public.member_login (
    username character varying(30) NOT NULL,
    password character varying(30) NOT NULL,
    member_id integer NOT NULL
);
     DROP TABLE public.member_login;
       public         heap    postgres    false            ?            1259    32940    returned    TABLE     ?   CREATE TABLE public.returned (
    return_date date NOT NULL,
    copy_number integer NOT NULL,
    isbn character varying(13) NOT NULL,
    member_id integer NOT NULL
);
    DROP TABLE public.returned;
       public         heap    postgres    false            l          0    32885    admin 
   TABLE DATA           F   COPY public.admin (admin_id, name, address, email, phone) FROM stdin;
    public          postgres    false    203   ?)       n          0    32900    admin_login 
   TABLE DATA           C   COPY public.admin_login (username, password, admin_id) FROM stdin;
    public          postgres    false    205   ?,       o          0    32910    books 
   TABLE DATA           F   COPY public.books (isbn, title, author, publisher, genre) FROM stdin;
    public          postgres    false    206   J-       q          0    32925    borrowed 
   TABLE DATA           V   COPY public.borrowed (issue_date, due_date, copy_number, isbn, member_id) FROM stdin;
    public          postgres    false    208   ?/       p          0    32915    copy 
   TABLE DATA           ?   COPY public.copy (copy_number, availability, isbn) FROM stdin;
    public          postgres    false    207   ?0       k          0    32880    member 
   TABLE DATA           H   COPY public.member (member_id, name, address, email, phone) FROM stdin;
    public          postgres    false    202   ?1       m          0    32890    member_login 
   TABLE DATA           E   COPY public.member_login (username, password, member_id) FROM stdin;
    public          postgres    false    204   *3       r          0    32940    returned 
   TABLE DATA           M   COPY public.returned (return_date, copy_number, isbn, member_id) FROM stdin;
    public          postgres    false    209   ?3       ?           2606    32904    admin_login admin_login_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.admin_login
    ADD CONSTRAINT admin_login_pkey PRIMARY KEY (admin_id, username, password);
 F   ALTER TABLE ONLY public.admin_login DROP CONSTRAINT admin_login_pkey;
       public            postgres    false    205    205    205            ?           2606    32889    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (admin_id);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    203            ?           2606    32914    books books_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (isbn);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    206            ?           2606    32929    borrowed borrowed_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.borrowed
    ADD CONSTRAINT borrowed_pkey PRIMARY KEY (member_id, isbn, copy_number, issue_date);
 @   ALTER TABLE ONLY public.borrowed DROP CONSTRAINT borrowed_pkey;
       public            postgres    false    208    208    208    208            ?           2606    32919    copy copy_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.copy
    ADD CONSTRAINT copy_pkey PRIMARY KEY (copy_number, isbn);
 8   ALTER TABLE ONLY public.copy DROP CONSTRAINT copy_pkey;
       public            postgres    false    207    207            ?           2606    32894    member_login member_login_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.member_login
    ADD CONSTRAINT member_login_pkey PRIMARY KEY (member_id, username, password);
 H   ALTER TABLE ONLY public.member_login DROP CONSTRAINT member_login_pkey;
       public            postgres    false    204    204    204            ?           2606    32884    member member_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (member_id);
 <   ALTER TABLE ONLY public.member DROP CONSTRAINT member_pkey;
       public            postgres    false    202            ?           2606    32944    returned returned_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.returned
    ADD CONSTRAINT returned_pkey PRIMARY KEY (member_id, isbn, copy_number, return_date);
 @   ALTER TABLE ONLY public.returned DROP CONSTRAINT returned_pkey;
       public            postgres    false    209    209    209    209            ?           2606    32905 %   admin_login admin_login_admin_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.admin_login
    ADD CONSTRAINT admin_login_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admin(admin_id);
 O   ALTER TABLE ONLY public.admin_login DROP CONSTRAINT admin_login_admin_id_fkey;
       public          postgres    false    205    203    3033            ?           2606    32935 '   borrowed borrowed_copy_number_isbn_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.borrowed
    ADD CONSTRAINT borrowed_copy_number_isbn_fkey FOREIGN KEY (copy_number, isbn) REFERENCES public.copy(copy_number, isbn);
 Q   ALTER TABLE ONLY public.borrowed DROP CONSTRAINT borrowed_copy_number_isbn_fkey;
       public          postgres    false    207    3041    208    208    207            ?           2606    32930     borrowed borrowed_member_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.borrowed
    ADD CONSTRAINT borrowed_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.member(member_id);
 J   ALTER TABLE ONLY public.borrowed DROP CONSTRAINT borrowed_member_id_fkey;
       public          postgres    false    208    3031    202            ?           2606    32920    copy copy_isbn_fkey    FK CONSTRAINT     q   ALTER TABLE ONLY public.copy
    ADD CONSTRAINT copy_isbn_fkey FOREIGN KEY (isbn) REFERENCES public.books(isbn);
 =   ALTER TABLE ONLY public.copy DROP CONSTRAINT copy_isbn_fkey;
       public          postgres    false    3039    206    207            ?           2606    32895 (   member_login member_login_member_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.member_login
    ADD CONSTRAINT member_login_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.member(member_id);
 R   ALTER TABLE ONLY public.member_login DROP CONSTRAINT member_login_member_id_fkey;
       public          postgres    false    204    3031    202            ?           2606    32950 '   returned returned_copy_number_isbn_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.returned
    ADD CONSTRAINT returned_copy_number_isbn_fkey FOREIGN KEY (copy_number, isbn) REFERENCES public.copy(copy_number, isbn);
 Q   ALTER TABLE ONLY public.returned DROP CONSTRAINT returned_copy_number_isbn_fkey;
       public          postgres    false    207    207    3041    209    209            ?           2606    32945     returned returned_member_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.returned
    ADD CONSTRAINT returned_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.member(member_id);
 J   ALTER TABLE ONLY public.returned DROP CONSTRAINT returned_member_id_fkey;
       public          postgres    false    3031    209    202            l   ?  x???]o? ???W??ķ??:?j?R?T?6???4&???????磍,?????x?<? ?X????5??Qt???kв???3?P۸?3t?iI(??1?u]翬B???3?K???z۠ǰ??Bk??[?v?.했fm?8EU<?.h9Ӊ?c?%?܅?u???4?j??uX?B(????[?_l?Ogd??:?/?H?h??d
?l?????_U???uw	??A7??ĲTh4w?w???P?=?/?B̹??0x???hn?2?
??Jt?냄?_???'[??,AS?V??X2?%8q	??<?;?'??!?2?1vv?V?!=q˓[??jpk?>??K???9???d?̻??H$??uL?	O?K.??sR?L?*?E??f\???^??N#??Y?>????+	v??f2_\H?r? %`a?4_OU??????g'???M3?q?T)?nU??S焢???8,W?????wǒ??:?'?ǂk??,M=X????&??$?O%?y?kޠJ&?????P???f	????A?Cl?=??~?&??k?C~??&9?y2*????݅???P???9<?"?	
l?X1?3!0?%?T??!:?0???7??k+L?]?~#?iJo?%?o?%?㟣r?ß_ ?????      n   ?   x?E??
?0??띇)?gߥ7ACc\M?X?>}{????????hRbb8/?J*!c??풊*뼏Ί\TS??atʳ?Dg??
y?R??S?^?Q????7=?8??E??i?~wa?w??:?m???5#F??J?q}ktg??????'KM\C???!n?| ??aZ      o   k  x??S[o?0~6??O{[??`xlڒ?k?*??>???i?p??6???߁,??]?I??????(x&i??a??d?-A)sp??S?L=???ޒ??j???:???+5X:7?s??7?O0?N`????X?? i<???V??|?w&E?Ys??lZX?.?w?@?]??{ZJ??+TCnt{???j??}??k?!???Y??IN?7J??,?,y?????J8'kG???>?dy??i??????S?H?yRd????????MnM??ڣ?
??<?~?r?0Σ0Ag?
|K>K?Twt݊????;??;t???G.+??A?E?rN??mNƗJ?;#-?j?$~G *R?'K?&???[p#Բ?;X;??zJ?Òr????;YY??gW~C??,E}??^
_?:?=t l??T?Bb?g.?????֜0?6#B?????i?Z?Q???"?l???GN?? F?S??,??Ǭ8?뽩??Z?o?k???!??
?!??ʟz?,?0dExl/??NG\??|;ڏMط??R????6'D\?K?;@??})k/?BƢ??<????@&Vt	3????f??"??yZ?{'?D(?FV?
???q?&Q?7?W???Y?!=c?      q   ?   x???An? ?5??gl0??/z?s??!?чV?????!P?(???#r?Ջh*Z?Z???(?=?G?????? G|?q?~?%Nu-??????Vh???s}?.M??N??P??X?UrV??U?H?6Zy](E؉???L?m??4?'?=~?>L?Is?^?~\????=Z?q?޸}<?k?SĿ???????T????????ec???lu`???k?|5Y?j?j??c۶/N??-      p   ?   x?m??1c??????]???u?`??D??K??????@??D?э?'?E?%H??NP?\?????0?y???L?,?p??*?)?????)xM<?Q0?k?V?%?*???d%/9z?Af???*???8?\???}$דNҷfq?s??ш?ǋ??/Я???V!K??/8Ly=[k_?`g      k   ?  x????n?0???|? ?)[?oI????R`?]??U?R )]??????CwXr ???Y?B^?~0?)??ΰz?<Q?3Xy???tPe??^?r????Y?2?sQ??#????t????dYJ??~? o.?3??z
???PM?SWH?T%?`????޽RHn?`???vZ=|????Q?e??߮Z?J.
?V?	6??d?Ԅ????3??'?3?v??9M?,?py:o??rZ?"՝g?K??????;w?????O?M4??????;???J??*.?଎??????D???=}6?8?P?B ??BY?kz?????):????f?y?O?ȹbw???8?fu??????ͳ?ך?70????Y??,Y?????m{5?biI?iz?Rڞp?ǜs?,_??      m   n   x?5?90C??sg?]h(?Q??h*???g??????&hǙŌ,bA	V????Ђ]???!??'fp?+?t;????<Mm?q?To?/Uț?KE?V????af?,?I?      r   ?   x?u?K? ?1???%?d'??:U+T;垗 ??Wp??$??	?
o?T?
f/?qI6???HQA{2ܴ?ԡz%ޓ3?/?L?*???f?!?$?AKFR?wB4??D?5????????*S??HE???J?&=??[?5ź?Gc??_?????_t?1?I?s?+Ɍ??Y^??e?}?;??('?ZM??w^8????=?q۶?	?{?     