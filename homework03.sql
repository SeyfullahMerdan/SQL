
create table kitaplar (
kitapno int,
kitapadi varchar(30),
yazarno int,
turno int,
sayfasayisi int
);

create table ogrenci (
ogrno int,
ograd varchar(40),
ogrsoyad varchar(40),
cinsiyet char(5),
sinif varchar (5)
);

create table islemler (
turno int,
turadi varchar(25)
);



INSERT INTO ogrenci VALUES (1,'ahmet','cansever','e','10a');
INSERT INTO ogrenci VALUES (2,'niyazi','sevinc','e','11b');
INSERT INTO ogrenci VALUES (3,'ismail ','sevinc','e','10b');
INSERT INTO ogrenci VALUES (4,'kenan','emin','e','9a');
INSERT INTO ogrenci VALUES (5,'sema','bakir','k','9b');
INSERT INTO ogrenci VALUES (6,'beyda','kara','k','9c');
INSERT INTO ogrenci VALUES (7,'betül','coskun','k','11a');
INSERT INTO ogrenci VALUES (8,'sema','rüzgar','k','9c');
INSERT INTO ogrenci VALUES (9,'fadime','dönmez','k','9a');
INSERT INTO ogrenci VALUES (10,'riza','koc','e','10b');
INSERT INTO ogrenci VALUES (11,'beyza','kabak','k','10b');
INSERT INTO ogrenci VALUES (12,'deniz','akcakaya','e','11a');
INSERT INTO ogrenci VALUES (13,'kemal','karapinar','e','11a');
INSERT INTO ogrenci VALUES (14,'derya','yilbur','k','10c');
INSERT INTO ogrenci VALUES (15,'filiz','akat','k','10a');
INSERT INTO ogrenci VALUES (16,'niyazi','dönmez','e','11a');
INSERT INTO ogrenci VALUES (17,'sema','sekmen','k','10b');

INSERT INTO kitaplar VALUES (1,'Abdülhamid Düşerken',26,3,368);
INSERT INTO kitaplar VALUES (2,'Serenat',6,1,220);
INSERT INTO kitaplar VALUES (3,'Anayurttan Anadoluya',18,6,311);
INSERT INTO kitaplar VALUES (4,'İnce Memed',22,4,135);
INSERT INTO kitaplar VALUES (5,'Simyacı',10,3,179);
INSERT INTO kitaplar VALUES (6,'Adım Kırmızı',25,1,242);
INSERT INTO kitaplar VALUES (7,'Suç ve Ceza',22,3,346);
INSERT INTO kitaplar VALUES (8,'Kürk Mantolu Madonna',28,6,389);
INSERT INTO kitaplar VALUES (9,'Kuyucaklı Yusuf',6,4,259);
INSERT INTO kitaplar VALUES (10,'Satranç',27,2,391);
INSERT INTO kitaplar VALUES (11,'Ermiş',19,6,89);
INSERT INTO kitaplar VALUES (12,'Mülksüzler',6,4,265);
INSERT INTO kitaplar VALUES (13,'Huzur',20,6,160);
INSERT INTO kitaplar VALUES (14,'Hayvan Çiftliği',27,5,383);
INSERT INTO kitaplar VALUES (15,'Dönüşüm',5,6,188);

INSERT INTO islemler VALUES (1,'Dram');
INSERT INTO islemler VALUES (2,'Komedi');
INSERT INTO islemler VALUES (3,'Roman');
INSERT INTO islemler VALUES (4,'Hikaye');
INSERT INTO islemler VALUES (5,'Arastirma');
INSERT INTO islemler VALUES (6,'Fikra');
INSERT INTO islemler VALUES (7,'Deneme');


select * from ogrenci;
select * from kitaplar;
select * from islemler;

/*==================================================
  ==================================================*/

-- Örnek 1: Hangi isimden kaç tane olduğunu bulun.

select ograd, count(ograd) as isim_adedi
from ogrenci
group by ograd
order by ograd;

-- Örnek 2: Sınıflardaki öğrenci sayısını bulun.

select count(ograd), sinif
from ogrenci
group by sinif
order by sinif;


-- Örnek 3: Her sınıftaki erkek ve kız öğrenci sayısını bulun.(cinsiyet ve sinifa göre grupla)

select sinif,cinsiyet, count(cinsiyet)
from ogrenci
group by sinif,cinsiyet
order by sinif;

-- Örnek 4: Her türden kaç tane kitap olduğunu listeleyiniz.

select (select turadi from islemler where kitaplar.turno=islemler.turno) as turadi, turno , count(turno)
from kitaplar
group by turno
order by turno;


-- Örnek 5: Her türdeki en fazla sayfa sayısı olan kitapları listeleyiniz.

select (select turadi from islemler where kitaplar.turno=islemler.turno) turadi, max(sayfasayisi) maxsayfasayılıkitap
from kitaplar
group by turno;


-- Örnek 6: Her türdeki en az sayfa sayısı olan kitapları listeleyiniz.

select (select turadi from islemler where kitaplar.turno=islemler.turno) turadi, min(sayfasayisi) minsayfasayili
from kitaplar 
group by turno;


-- Örnek 7***: Her türden kaç tane kitap olduğunu listeleyiniz.(Tür isimleri de olsun) (edited) 

select turadi, (select count(turno) from kitaplar where islemler.turno=kitaplar.turno) as adet_sayisi 
from islemler
group by turadi;

