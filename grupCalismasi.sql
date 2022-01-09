
create table takim (
id int PRIMARY KEY,
ad varchar(40),
soyad varchar(40),
cinsiyet char(3)
);

create table bilgi (
id int,
sehir varchar(30),
puan double,
CONSTRAINT id_tb FOREIGN KEY(id) REFERENCES takim(id) -- on delete cascade );
);

INSERT INTO takim VALUES ( 123 , 'ali' , 'aslan' , 'e' );
INSERT INTO takim VALUES ( 456 , 'mehmet' , 'can' , 'e' );
INSERT INTO takim VALUES ( 789 , 'filiz' , 'güral' , 'k' );
INSERT INTO takim VALUES ( 345 , 'sena' , 'kuzgun' , 'k' );

INSERT INTO bilgi VALUES ( 123 , 'mersin' , 95.5 );
INSERT INTO bilgi VALUES ( 456 , 'izmir' ,  75.5 );
INSERT INTO bilgi VALUES ( 789 , 'istanbul' , 65.5);
INSERT INTO bilgi VALUES ( 345 , 'ankara' , 80.5);

select * from takim;
select * from bilgi;

select * from takim  -- bana getir, seç
where regexp_like ( ad , 'A' );   -- bana bu şartlara uyanları getir.

select * from bilgi
where regexp_like (sehir,'i|a'); 

select * from bilgi
where regexp_like (sehir, '^m');  -- başlangıçta

select * from takim
where regexp_like (ad, 'i$');  -- sonda

select * from takim 
where ad like ( '%a' ); -- a ile başlayan

select * from takim 
where soyad not like ( '%e%' ); -- içinde bir yerde e bulunan

select * from takim 
where ad like ( '_____' ); -- tam 5 karakter olanı getir.

select * from takim
where regexp_like (soyad, '[A-Z][A-Z][A-Z][A-Z]' );  -- en az 4 karakter olanı

INSERT INTO takim VALUES ( 987, 'veli', 'umut' , 'e'); 

/*===========================================================================
                         $  ve ^   işareti REGEXP  de
                  _   ve %  işareti ise LIKE da kullanıyoruz !!!!**********
============================================================================*/


select * from takim
where id>'123'; 

select ad,soyad from takim      -- adını ve soyadını sorgula bana getir
where id in ('123', '456' ,'789') ; -- id sini yazdıklarımı sadece

select * from takim
where id between '120' and '350'; 


select * from bilgi
where id=456 or sehir='mersin';

select * from bilgi
where id=456 or id=789;

/*==================================
  ==================================*/
  
  
  select * from takim, bilgi;  -- bu şekilde de iki tabloyu getirdi
  
  -- ========================================================================
  
  create table sinif (
id int PRIMARY KEY,
ad varchar(40),
soyad varchar(40)
);

create table info (
id int,
puan double
);

INSERT INTO sinif VALUES ( 123 , 'ali' , 'aslan'  );
INSERT INTO sinif VALUES ( 456 , 'mehmet' , 'can' );

INSERT INTO info VALUES ( 123 ,  95.5 );
INSERT INTO info VALUES ( 456 ,  75.5 );
  
select * from sinif, info;
  
  -- ==============================================================================
  
  drop table takim;
  drop table bilgi;
  
  delete from takim where id=123;   -- parentten silemedim
  delete from bilgi where sehir='istanbul';
  delete from takim where ad='ali';    -- parentten silemedim
  
  select * from takim, bilgi where takim.id=bilgi.id;
  select * from takim;
  select * from bilgi;
  
  delete from takim where id=789;
  /*  Baglı tablolarda önce child silecegiz. Sonra parent silinebilir
      Aksi takdirde parenti silemem.
      on delete cascade yaptıgımda bu durum degişi. Parenttan da direk silebilirim(parenttan silinen childdan da silinir).
  */ 
  
  