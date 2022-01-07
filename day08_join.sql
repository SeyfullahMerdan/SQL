use sys;
/*============================== JOIN İSLEMLERİ ===============================
    
    Set Operatorleri (Union,Union All, {oracle->Intersect,Minus}) farklı tablolardaki sutunlari 
    birlestirmek kullanilir.    
    
    Join islemleri ise farklı Tablolari birlestirmek icin kullanilir. Diger 
    bir ifade ile farkli tablolardaki secilen sutunlar ile yeni bir tablo 
    olusturmak icin kullanilabilir.
    
    JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
    Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
    icin JOIN islemleri kullanilabilir.
    
    mySQL'de 3 Cesit Join islemi kullanilabilmektedir.   Oracle da 4 çeşit vardır.
    
    1) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir   / Oracle da da mevcut
    2) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
    3) RIGHT JOIN: Ikinci tabloda (sağ) olan tum sonuclari gosterir
       FULL JOIN=(left join + union all + right join) Tablodaki tum sonuclari gosterir  / Oracle da mevcuttur, MySqlde mevcut degil...
==============================================================================*/   
    CREATE TABLE sirketler 
    (
        sirket_id int, 
        sirket_isim VARCHAR(20)
    );
    
    INSERT INTO sirketler VALUES(100, 'Toyota');
    INSERT INTO sirketler VALUES(101, 'Honda');
    INSERT INTO sirketler VALUES(102, 'Ford');
    INSERT INTO sirketler VALUES(103, 'Hyundai');
    
    CREATE TABLE siparisler
    (
        siparis_id int,
        sirket_id int, 
        siparis_tarihi DATE
    );
    
    INSERT INTO siparisler VALUES(11, 101, '2020-04-17');
    INSERT INTO siparisler VALUES(22, 102, '2020-04-18');
    INSERT INTO siparisler VALUES(33, 103, '2020-04-19');
    INSERT INTO siparisler VALUES(44, 104, '2020-04-20');
    INSERT INTO siparisler VALUES(55, 105, '2020-04-21');
    
    /*=============================== INNER JOIN  ==================================
    
    Iki tablonun kesisim kumesi ile yeni bir tablo olusturmak icin kullanilir.
    
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    INNER JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
================================================================================  
    
  
/* -----------------------------------------------------------------------------
  ORNEK1: Iki Tabloda sirket_id'si ayni olanlarin sirket_ismi, siparis_id ve 
  siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/  
  
 SELECT s.sirket_isim, sp.siparis_id, sp.siparis_tarihi, sp.sirket_id
    FROM siparisler sp  -- tablo önceliği farketmez
    INNER JOIN sirketler s 
    on s.sirket_id = sp.sirket_id; -- where yerine on yazilacak
    
    -- INNER JOIN ile sadece iki tabloki ortak olan satirlar secilir.
    -- Diger bir ifadeyle iki tablodaki ortak olan sirket_id degerleri icin 
    -- ilgili sutunlar listenir.
    
    -- INNER anahtar kelimesi opsiyoneldir.
    
        
/*=============================== LEFT JOIN  ==================================
    
    LEFT JOIN, 1. tablodan (sol tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir. 
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir. 
        
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    LEFT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/  
            
/* -----------------------------------------------------------------------------
  ORNEK2: sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/  

select sir.sirket_isim, sip.siparis_id, sip.siparis_tarihi, sir.sirket_id
from sirketler sir
left join siparisler sip
on sir.sirket_id=sip.sirket_id;

select sir.sirket_isim, sip.siparis_id, sip.siparis_tarihi, sir.sirket_id
from siparisler sip
right join sirketler sir
on sir.sirket_id=sip.sirket_id;

-- Left Join'de ilk tablodaki (fromdan sonra gelen) tum satirlar gosterilir.
-- Ilk tablodaki satirlara 2.tablodan kosula uyan ortak satirlar 
-- gosterilir, ancak ortak olmayan kisimlar bos kalir


/*=============================== RIGHT JOIN  ==================================
    
    RIGHT JOIN, 2. tablodan (sag tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir. 
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir. 
        
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    RIGHT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/   
      
/* -----------------------------------------------------------------------------
  ORNEK3: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile 
  bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/   
     
select siparis_id, siparis_tarihi, sirket_isim
from sirketler
right join siparisler
on sirketler.sirket_id=siparisler.sirket_id;

select sirket_isim, siparis_id, siparis_tarihi
from siparisler
left join sirketler
on sirketler.sirket_id=siparisler.sirket_id;

    -- Right Join'de 2. tablodaki tum satirlar gosterilir.
    -- 2 tablodaki satirlara 1.tablodan kosula uyan ortak satirlar gosterilir
    -- ancak ortak olmayan kisimlar bos kalirir.
    
    
    
    /*=============================== full JOIN  ==================================
    full JOIN: (left join + union all + right join)
   full  JOIN, Her iki tablo icin secilen sutunlara ait olan tum satirlari 
    getirmek icin kullanilir. 
    
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    left JOIN tablo2
    ON tablo1.sutun = tablo2.sutun
    union all
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    right JOIN tablo2
    ON tablo1.sutun = tablo2.sutun
==============================================================================*/   
   
/* -----------------------------------------------------------------------------
  ORNEK4: sirketler ve siparisler adındaki tablolarda yer alan sirket_isim, 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/ 
-- full join ile çzüyorum. hepsini alacagım

select sir.sirket_isim, sip.siparis_id, sip.siparis_tarihi, sir.sirket_id
from sirketler sir
left join siparisler sip
on sir.sirket_id=sip.sirket_id
union
select sir.sirket_isim, sip.siparis_id, sip.siparis_tarihi, sip.sirket_id
from sirketler sir
right join siparisler sip
on sir.sirket_id=sip.sirket_id;


/*=============================================================

  *************************************************************

  =============================================================*/


	CREATE TABLE bolumler (
      bolum_id   int PRIMARY KEY,
      bolum_isim VARCHAR(14),
      konum      VARCHAR(13)
    );
    
    INSERT INTO bolumler VALUES (10,'MUHASEBE','IST');
    INSERT INTO bolumler VALUES (20,'MUDURLUK','ANKARA');
    INSERT INTO bolumler VALUES (30,'SATIS','IZMIR');
    INSERT INTO bolumler VALUES (40,'ISLETME','BURSA');
    INSERT INTO bolumler VALUES (50,'DEPO', 'YOZGAT');

    CREATE TABLE personel (
      personel_id   int PRIMARY KEY,
      personel_isim VARCHAR(10),
      meslek        VARCHAR(9),
      mudur_id      int,
      maas          int,
      bolum_id      int
    );
    drop table personel;
  
    INSERT INTO personel VALUES (7369,'AHMET','KATIP',1111,800,20);
    INSERT INTO personel VALUES (7499,'BAHATTIN','SATISE',1222,1600,30);
    INSERT INTO personel VALUES (7521,'NESE','SATISE',1222,1250,30);
    INSERT INTO personel VALUES (1111,'MUZAFFER','MUDUR',7839,2975,20);
    INSERT INTO personel VALUES (7654,'MUHAMMET','SATISE',1222,1250,30);
    INSERT INTO personel VALUES (1222,'EMINE','MUDUR',7839,2850,30);
    INSERT INTO personel VALUES (1333,'HARUN','MUDUR',7839, 2450,10);
    INSERT INTO personel VALUES (7788,'MESUT','ANALIST',1111,3000,20);
    INSERT INTO personel VALUES (7839,'SEHER','BASKAN',NULL,5000,10);
    INSERT INTO personel VALUES (7844,'DUYGU','SATISE',1222,1500,30);
    INSERT INTO personel VALUES (7876,'ALI','KATIP',1111,1100,20);
    INSERT INTO personel VALUES (7900,'MERVE','KATIP',1222,950,30);
    INSERT INTO personel VALUES (7902,'NAZLI','ANALIST',1111,3000,20);
    INSERT INTO personel VALUES (7934,'EBRU','KATIP',1333,1300,10);
    INSERT INTO personel VALUES (7956,'SIBEL','MIMAR',1333,3300,60);
    INSERT INTO personel VALUES (7933,'ZEKI','MUHENDIS',1333,4300,60);

   SELECT * FROM bolumler;
   SELECT * FROM personel;


/* -----------------------------------------------------------------------------
  ORNEK1: SATIS ve MUHASABE bolumlerinde calisan personelin isimlerini ve 
  bolumlerini, once bolum sonra isim sıralı olarak listeleyiniz
------------------------------------------------------------------------------*/ 


select personel_isim, bolum_isim     -- seç , bunları istiyorum
from bolumler b                       -- burdan gelcek. --
join personel p                           -- burası ile baglayacaksın, burdan da çekeceksin.
on p.bolum_id=b.bolum_id                 -- bölüm ıdlerden beni bagla diyorum. bağlama işini joinlerde on keywordu ile yapılır.
where bolum_isim in('satis', 'muhasebe')   -- sadece buradakileri al diyorum. koşul katıyorum
order by b.bolum_isim, p.personel_isim;


/* -----------------------------------------------------------------------------
  ORNEK2: SATIS,ISLETME ve DEPO bolumlerinde calisan personelin isimlerini,  
  bolumlerini  isim sıralı olarak listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  

select b.bolum_isim, p.personel_isim     -- bu isimleri görmek istiyorum
from bolumler b left join personel p      -- soldaki tablodan herkesi istiyorum
on p.bolum_id=b.bolum_id
where b.bolum_id in(30,40,50)                -- bu koşulu saglayan
order by p.personel_isim;                 -- ad sıralı personel ismine göre getirdi.



/* -----------------------------------------------------------------------------
  ORNEK3: Tüm bolumlerde calisan personelin isimlerini, bolum isimlerini ve 
  maaslarini bolum ters ve maas sirali listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  

select p.personel_isim, b.bolum_isim, p.maas
from bolumler b left join personel p
on p.bolum_id=b.bolum_id
order by b.bolum_isim desc, p.maas asc;          -- ters sıralı
                            -- order by p.maas ;  tekrar order kabul etmedi, ikisini bir arada yazacam o yüzden 


/* -----------------------------------------------------------------------------
  ORNEK4: SATIS ve MUDURLUK bolumlerinde calisan personelin maaslari 2000'den 
  buyuk olanlarinin isim,bolum ve maas bilgilerini bolume ve isme gore
  siralayarak listeleyiniz.
------------------------------------------------------------------------------*/   

select p.personel_isim, b.bolum_isim, p.maas    -- bunları bul getir bana, bunları seç ve yazdır
from bolumler b left join personel p              -- ikisini birleştir, ikisine de ihtiyacım var, sadece bir kğmeyi istemiyorum, iki kümeyede ihtiyacım var.
on p.bolum_id=b.bolum_id                      -- buradan tabloları baglayarak, işlem yapmaya çalış
where b.bolum_isim in('satis','mudurluk') and maas>2000        -- nereden? bu şartları saglayanlardan getir..
order by b.bolum_isim, p.personel_isim;         -- bolume ve personele göre naturalorder olarak sırala..



/* -----------------------------------------------------------------------------
  ORNEK5: MUDUR'u Harun veya Emine olan personelin bolumlerini,isimlerini,  
  maaslarini ve ayrica MUDUR isimlerini 
  (emine kimin müdürüyse onun satirinda yazsin) 
  maas siralı olarak (Çoktan aza) listeleyiniz.
------------------------------------------------------------------------------*/   

select b.bolum_isim, p.personel_isim, p.maas        -- getir bunları 
from bolumler b right join personel p         -- bazı personeller var ama bolumler tablosunda bolumu yok, bu yüzden right demem lazım 
                                    -- ki onları da görebileyim. 
on p.bolum_id=b.bolum_id
where p.mudur_id in(1222,1333)
order by p.maas desc;


select b.bolum_isim, p.personel_isim, p.maas, (select personel_isim from personel where p.mudur_id=personel_id) mudur 
                                                                                                        -- personel ismini getir personel tablosundan
                                                                                                               --   mudur_id = personel_id olanlardan     
from bolumler b right join personel p 
on p.bolum_id=b.bolum_id
where p.mudur_id in(1222,1333);


