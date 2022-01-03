/*====================== SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern ile sorgulama işlemi için REGEXP_LIKE kullanılabilir.  
     -- 'c' => case-sentisitive demektir 
     -- 'i' => incase-sentisitive demektir ve default incase-sensitive aktiftir..
    Syntax:
    --------
    REGEXP_LIKE (      sutun_adı,   ‘pattern[]‘ , ‘c’          ) 
            
/* ========================================================================== */
    
    CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 7);
    
    DROP TABLE kelimeler;
    
    
/* -----------------------------------------------------------------------------
  ORNEK22: İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat
  ederek listeleyiniz 
 -----------------------------------------------------------------------------*/ 
    -- VEYA işlemi için | karakteri kullanılır.
    
    Select * from kelimeler
    where REGEXP_LIKE(kelime,'at|ot','c');
    
   
/* -----------------------------------------------------------------------------
  ORNEK23: İçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 

      Select * from kelimeler
    where REGEXP_LIKE(kelime,'at|ot');
   
      
 /* -----------------------------------------------------------------------------
  ORNEK24: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Başlangıcı göstermek için ^ karakteri kullanılır.
    
	Select * from kelimeler
    where REGEXP_LIKE(kelime,'^ho|^hi');  
    
    Select * from kelimeler
    where REGEXP_LIKE (kelime, '^A|^i' );
    
    
    
/* -----------------------------------------------------------------------------
  ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz. (i yazmaya gerek yok)
 -----------------------------------------------------------------------------*/   
     -- Bitişi göstermek için $ karakteri kullanılır.
         
    Select * from kelimeler
    where REGEXP_LIKE(kelime,'t$|m$');  
    
    
/* -----------------------------------------------------------------------------
  ORNEK26: h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli 
  olanlari) listeleyeniz
 -----------------------------------------------------------------------------*/ 
 
	Select * from kelimeler
   -- where kelime like 'h_t';  -- bu şekilde h ve t'den byk kçk olan hepsini getirir..!
	where REGEXP_LIKE(kelime,'h[a-zA-Z0-9]t','c');
    
    Select*from kelimeler
    where kelime like 'h_t';       -- case sensetive olmadan farklı bir yolla...
    
    -- [a-zA-Z0-9]  a'dan z'ye veya A'dan Z'ye bütün harfler veya 0-9 arası rakamlar olabilir.  [bf] deseydim b ve f olanları getirirdi.
    -- köşeli parantez ---> [] <---  bir harf anlamına-yerine gelir.
    
/* -----------------------------------------------------------------------------
  ORNEK27: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayalım.
 -----------------------------------------------------------------------------*/ 
   Select * from kelimeler
	where REGEXP_LIKE(kelime,'h[ai]t');   -- köşeli parantez tek harf için o veya bu anlamına da gelir !!!***
                                           --   []  --->>  İKİ GÖREV: ***!!! TEK HARF ve VEYALANDIRMA ANLAMLARINDA !!!**
    select * from kelimeler
    where REGEXP_LIKE (kelime,'ha|it');  -- bu şekilde yaptıgımda 3 harfliler haricinde şarta uyan 4 ve 5 harfli kelimeleri de getrdi !!!!
   
   
/* -----------------------------------------------------------------------------
  ORNEK28: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
 -----------------------------------------------------------------------------*/     
   
   select*from kelimeler
   where REGEXP_LIKE(kelime, '[mie]');    -- m|i|e; şeklinde de yazabiliriz.
   
   select * from kelimeler
   where REGEXP_LIKE(kelime, 'm|i|e');
   -- Her iki yolla da yapılabilir , hangisi işimize gelcekse onunla yapılabilir..

 
/* -----------------------------------------------------------------------------
  ORNEK29: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 
                                       -- iki tür yazımı vardır, ikisi de olur.
    select*from kelimeler
   --  where REGEXP_LIKE(kelime, '^a|^s');    | or ile...   
	where REGEXP_LIKE(kelime, '^[as]');        -- köşeli parantez ile
    
  /*  
    select * from kelimeler
    where REGEXP_LIKE ( kelime, '^[a]' | '^[s]' );  -- BU YOL İLE ÇALIŞMADI !!! yanlış çalıştı***
    select * from kelimeler
    where REGEXP_LIKE ( kelime, '[^a|^s]' );     -- BU YOL da ÇALIŞMADI !!! yanlış çalıştı***
*/

-- a ve s ile biten kelimeler deseydi...
 select * from kelimeler
 where REGEXP_LIKE ( kelime, '[as]$' );


/* -----------------------------------------------------------------------------
  ORNEK30: içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini 
  listeleyiniz.
-----------------------------------------------------------------------------*/ 

  select*from kelimeler
	where REGEXP_LIKE(kelime, '[o]{2}');  -- [o][o] şeklinde de yapılabilir.


/*===========================================================================

                         $  ve ^   işareti REGEXP  de

                  _   ve %  işareti ise LIKE da kullanıyoruz !!!!**********

============================================================================*/



       --   2. Gün KONU SONU  -- ***********

