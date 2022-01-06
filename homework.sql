
create table Hastaneler (
ID int PRIMARY KEY,
ISIM varchar(40),
SEHİR varchar(25),
OZEL char (2) 
);

select*from hastaneler;

INSERT INTO hastaneler VALUES ('101' , 'ACIBADEM HASTANESİ' , 'İSTANBUL', 'Y');
INSERT INTO hastaneler VALUES ('102' , 'HASZEKİ HASTANESİ' , 'İSTANBUL', 'N');
INSERT INTO hastaneler VALUES ('103' , 'MEDİKAL HASTANESİ' , 'İZMİR', 'Y');
INSERT INTO hastaneler VALUES ('104' , 'MEMORYEL HASTANESİ' , 'ANKARA', 'Y');
insert into hastaneler values( '104' , 'Merkz Hastanesi', 'konya' , 'n'); -- duplicatee izin vermedi çünkğ primary key


create table hastalar (
KIMLIK_NO double PRIMARY KEY,
ISIM varchar(40),
TESHIS varchar(40) 
);

INSERT INTO hastalar VALUES ( '12345678901' , 'Ali Can' , 'Gizli Seker');
INSERT INTO hastalar VALUES ( '45678901121' , 'Ayşe Yılmaz' , 'Hipertansiyon');
INSERT INTO hastalar VALUES ( '78901123451' , 'Steve Job' , 'Pankreatit');
INSERT INTO hastalar VALUES ( '12344321251' , 'Tom Hanks' , 'COVİD19');


create table bolumler (
BOLUM_ID char(4) PRIMARY KEY,
BOLUM_ADI varchar(30)
);

INSERT INTO bolumler VALUES ( 'DHL' , 'DAHİLİYE' );
INSERT INTO bolumler VALUES ( 'KBB' , 'KULAK-BURUN-BOĞAZ' );
INSERT INTO bolumler VALUES ( 'NRJ' , 'NOROLOJİ' );
INSERT INTO bolumler VALUES ( 'GAST' , 'GASTROLOJİ' );
INSERT INTO bolumler VALUES ( 'KARD' , 'KARDİOLOJİ' );
INSERT INTO bolumler VALUES ( 'PSK' , 'PSİKİYATRİ' );
INSERT INTO bolumler VALUES ( 'GOZ' , 'GOZ HASTALIKLARI' );
select*from bolumler;


create table hasta_kayitlar(
KİMLİK_NO double PRIMARY KEY,
HASTA_İSİM varchar(30),
HASTANE_ADI varchar(30),
BOLUM_ADI varchar(20),
TESHİS varchar(10)
);

INSERT INTO hasta_kayitlar VALUES ( '1111' , 'NONAME' , null , null , null );
INSERT INTO hasta_kayitlar VALUES ( '2222' , 'NONAME' , null , null , null );
INSERT INTO hasta_kayitlar VALUES ( '3333' , 'NONAME' , null , null , null );

select * from hasta_kayitlar;


update hasta_kayitlar
set HASTA_İSİM='Salvadore Dali' , HASTANE_ADI='John Hopkins',
	BOLUM_ADI= 'Noroloji' , TESHİS='Parkinson', KİMLİK_No= '99991111222'
where KİMLİK_NO='3333' ;
 
update hasta_kayitlar
set HASTA_İSİM=(select ISIM from hastalar where ISIM='Ali Can')
where KİMLİK_NO='1111';

update hasta_kayitlar
set HASTANE_ADI=(select ISIM from hastaneler where ID='104')
where KİMLİK_NO='1111';

update hasta_kayitlar
set BOLUM_ADI=(select BOLUM_ADI from bolumler where BOLUM_ID='DHL')
where KİMLİK_NO='1111';
select * from hasta_kayitlar;

update hasta_kayitlar
set TESHİS=(select TESHİS from hastalar where ISIM='Ali Can')
where KİMLİK_NO='1111';

alter table hasta_kayitlar  -- teshiş kısmını 10 ile sınırlandırmışım bu yüzden modify ettim 
modify TESHİS varchar(30);  -- teşhiş sutununun uzunlugunu degiştirdim, 30 harfe çıkardım. Şimdi yukarıdaki işlemi yapabilrim.alter

update hasta_kayitlar
set KİMLİK_NO = (select KIMLIK_NO from hastalar where ISIM='Ali Can')
where KİMLİK_NO='1111';

update hasta_kayitlar
set HASTA_ISIM=(select ISIM from hastalar where ISIM='Ayşe Yılmaz')
where KİMLİK_NO='2222';
select*from hasta_kayitlar;

update hasta_kayitlar
set HASTANE_ADI=(select ISIM from hastaneler where ID='103')
where KİMLİK_NO='2222';

update hasta_kayitlar
set BOLUM_ADI=(select BOLUM_ADI from bolumler where BOLUM_ID= 'KBB')
where KİMLİK_NO='2222';

update hasta_kayitlar
set TESHİS=(select TESHİS from hastalar where ISIM= 'Tom Hanks')
where KİMLİK_NO='2222';
select*from hasta_kayitlar;

update hasta_kayitlar
set KİMLİK_NO=(select KIMLIK_NO from hastalar where ISIM= 'Steve JOB')
where KİMLİK_NO='2222';

