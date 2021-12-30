-- yorum yapmak için kullanılır
/*============================
	   TABLO OLUŞTURMA (CRUD İŞLEMLERİNDEN -- CREATE)
==============================*/         -- use sys;bir tane daha data varsa bunu kullanıyoruz(4.-5.satır arası)ki nerede create edecegini bilsin.
CREATE TABLE student   -- bir kere kaydediyor,tablo bir kere oluşturulabiliyor, içine verileri sınırsızca girebiliriz.
(id varchar(4),
name varchar(25),
age int
);
/*====================================
      VERİ GİRİŞİ
===================================== */
INSERT INTO student VALUES( '1001' , 'MEHMET ALİ', 25);
INSERT INTO student VALUES('1002', 'AYSE YILMAZ', 34);
INSERT INTO student VALUES('1003', 'JOHN STAR', 56);
INSERT INTO student VALUES('1004', 'MARY BROWN', 17);
-- select * yaptıgımızda kodun hepsini çalıştır demek oluyorurunler
select * from student;   -- yazılı kodun hepsini seçersek yıldıza basıyoruz,ya da  ; yanında iken I'lı şimşege basıyoruz 

/*========================================
       PARÇALI VERİ GİRİŞİ
==========================================*/

insert into student (name, age) values ('Samet ay',24);

/*========================================
       TABLODAN VERİ SORGULAMA
==========================================*/

select * from student;  

/*========================================
       TABLO SİLME ( CRUD - Drop )
==========================================*/

drop table urunler;









