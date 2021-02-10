
/* 회원 테이블 생성 */
CREATE TABLE cs_member(
    member_id VARCHAR2(20) PRIMARY KEY,
    member_pwd VARCHAR2(80) NOT NULL,
    member_name VARCHAR2(20) NOT NULL,
    member_email VARCHAR2(500) UNIQUE NOT NULL,
    member_phone VARCHAR2(100) UNIQUE NOT NULL,
    member_zipcode VARCHAR2(5),
    member_address VARCHAR2(1000),
    member_admin NUMBER DEFAULT 0 NOT NULL,
    member_joined_date DATE DEFAULT SYSDATE
);
SELECT * FROM board;
SELECT * FROM cs_member;

SELECT * FROM cs_notice;
SELECT * FROM cs_order;
SELECT * FROM cs_order_detail;
rollback;
INSERT INTO cs_order_detail VALUES(
    seq_order_detail_index.NEXTVAL,
    1,
    2,
    4
);
commit;
INSERT INTO cs_member VALUES(
    'admin', 'admin1234%%', '관리자', 'admin@coffeesazo.com', '01088987867', null, null, 1, default
);

UPDATE cs_member SET member_zipcode ='12345', member_address='대구 서구 당산로41동길 99-3' WHERE member_id='tngus7573';
commit;

SELECT * FROM cs_notice;

/* 주문 테이블 */
CREATE TABLE cs_order(
    order_index NUMBER PRIMARY KEY,
    fk_member_id VARCHAR2(20) NOT NULL
    REFERENCES cs_member(member_id) ON DELETE CASCADE,
    order_address VARCHAR2(1000) NOT NULL,
    order_payment VARCHAR2(20) NOT NULL,
    order_zipcode VARCHAR(5) NOT NULL,
    order_text VARCHAR2(1000),
    order_date DATE default SYSDATE,
    order_receiver VARCHAR2(128) NOT NULL,
    order_receiver_phone VARCHAR2(100) NOT NULL,
    order_total_price NUMBER NOT NULL
);


INSERT INTO cs_order VALUES(
    seq_order_index.nextval,
    'laurel',
    '서울시 용산구 한남동',
    '무통장입금',
    '23445',
    '문 앞에 놔주세요',
    DEFAULT,
    '이수현',
    '01098987867',
    50000
);

SELECT * FROM cs_order o, cs_order_detail od WHERE o.order_index = od.fk_order_index;
SELECT o.*, od.*, m.member_phone, m.member_name 
FROM cs_order o, cs_member m, cs_order_detail od WHERE o.fk_member_id = m.member_id;

SELECT od.*, p.product_name, p.product_price FROM cs_order_detail od, cs_product p WHERE od.fk_product_index = p.product_index;

INSERT INTO cs_order_detail VALUES(
    seq_order_detail_index.nextval,
    21,
    1,
    10
);

INSERT INTO cs_order_detail VALUES(
    seq_order_detail_index.nextval,
    21,
    2,
    3
);
commit;
SELECT * FROM cs_order_detail;

/* 주문 상세 테이블 */
CREATE TABLE cs_order_detail(
    order_detail_index NUMBER PRIMARY KEY,
    fk_order_index NUMBER REFERENCES cs_order(order_index) ON DELETE CASCADE,
    fk_product_index NUMBER REFERENCES cs_product(product_index) ON DELETE CASCADE,
    order_product_count NUMBER NOT NULL
);

/* 주문 상세 인덱스 시퀀스 */
CREATE SEQUENCE seq_order_detail_index
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
NOCYCLE;
​
/* 주문 인덱스 시퀀스 */
CREATE SEQUENCE seq_order_index
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
NOCYCLE;

INSERT INTO cs_product VALUES(
    seq_product_index.nextval,
    1,
    '모리타',
    16000,
    100,
    'Morita.png',
    '어쩌구저쩌구',
    '어쩌구저쩌구'
);

INSERT INTO cs_product VALUES(
    seq_product_index.nextval,
    1,
    '엘 라우렐',
    16000,
    100,
    'El_laurel.png',
    '어쩌구저쩌구',
    '어쩌구저쩌구'
);

SELECT * FROM cs_product;
/*상품 테이블*/   ​
CREATE TABLE cs_product(
    product_index NUMBER PRIMARY KEY,
    fk_hastag_index NUMBER not null,
    product_name VARCHAR2(100) not null,
    product_price NUMBER not null,
    product_count VARCHAR2(100) not null,
    product_image VARCHAR2(400) not null,
    product_info VARCHAR2(400) not null,
    product_text VARCHAR2(2000) null

);

DELETE FROM cs_product;

DROP SEQUENCE seq_product_index;
CREATE SEQUENCE seq_product_index
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
NOCYCLE;

/*product_count number로 변경*/
ALTER TABLE cs_product MODIFY product_count NUMBER;

/*cs_category*/
CREATE TABLE CS_CATEGORY (
    category_index NUMBER PRIMARY KEY, --시퀀스 / PK
    category_name VARCHAR(20) UNIQUE NOT NULL
);
INSERT INTO cs_category VALUES(
    seq_category_index.nextval,
    '원두'
);
INSERT INTO cs_category VALUES(
    seq_category_index.nextval,
    '스틱커피'
    
);
INSERT INTO cs_category VALUES(
    seq_category_index.nextval,
    '캡슐커피'
    
);

SELECT * FROM cs_category;
/*seq_category_index 시퀀스*/
​
CREATE SEQUENCE seq_category_index
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
NOCYCLE;
​
SELECT * FROM cs_hashtag;
INSERT INTO cs_hashtag VALUES(
    seq_hashtag_index.nextval, 1, '#풍부한산미'
);


INSERT INTO cs_hashtag VALUES(
    seq_hashtag_index.nextval, 1,'#묵직한바디감'
);

INSERT INTO cs_hashtag VALUES(
    seq_hashtag_index.nextval,1,'#중남미원두'
);

INSERT INTO cs_hashtag VALUES(
    seq_hashtag_index.nextval,1,'#아프리카원두'
);
INSERT INTO cs_hashtag VALUES(
    seq_hashtag_index.nextval,2,'#쉽고간편한'
);
INSERT INTO cs_hashtag VALUES(
    seq_hashtag_index.nextval,3,'#룽고'
);

/*cs_hashtag*/
CREATE TABLE CS_HASHTAG (
    hashtag_index NUMBER PRIMARY KEY, --시퀀스 / PK
    fk_category_index NUMBER, --CS_CATEGORY 테이블 CATEGORY_NO FK 
    hashtag_name VARCHAR(40) UNIQUE NOT NULL,--UNIQUE/NOT NULL
    FOREIGN KEY(fk_category_index) REFERENCES cs_category(category_index) ON DELETE CASCADE
);


​/*seq_hashtag_index*/
CREATE SEQUENCE seq_hashtag_index
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
NOCYCLE;

​
CREATE TABLE CS_QNA (
	QNA_INDEX NUMBER	PRIMARY KEY,
	fk_member_id  VARCHAR2(20)	NOT NULL,	
	QNA_TITLE  VARCHAR2(128)       NOT NULL,
	QNA_DATE	DATE    default sysdate	        	NOT NULL, 
	QNA_TEXT	    VARCHAR2(2000)	                NOT NULL,
	QNA_IMAGE	    VARCHAR2(128)	,
	QNA_CHECK NUMBER	 NOT NULL

);
​
ALTER TABLE CS_QNA
ADD CONSTRAINT fk_member_id FOREIGN KEY(fk_member_id) REFERENCES cs_member(member_id)
ON DELETE CASCADE;
​
CREATE SEQUENCE seq_qna_index
MINVALUE 1
MAXVALUE 999999
START WITH 1
INCREMENT BY 1
NOCYCLE;
​
​
SELECT * FROM CS_QNA ;


CREATE TABLE cs_notice(
    notice_index NUMBER PRIMARY KEY,
    fk_member_id VARCHAR2(20) NOT NULL, 
    notice_title VARCHAR2(128) NOT NULL,
    notice_date DATE default sysdate NOT NULL,
    notice_text VARCHAR2(400) NOT NULL,
    notice_file VARCHAR2(128),
    CONSTRAINT fk_notice_member_id FOREIGN KEY(fk_member_id) REFERENCES cs_member(member_id) 
    ON DELETE CASCADE
);

/* seq_notice_index */
CREATE SEQUENCE seq_notice_index
MINVALUE 1
MAXVALUE 9999999
START WITH 1
INCREMENT BY 1
NOCYCLE;


​​/* 확인하기 */
ALTER TABLE cs_product ADD CONSTRAINT fk_hastag_index FOREIGN KEY(fk_hastag_index) REFERENCES cs_hashtag(hashtag_index)
ON DELETE CASCADE;

/*상품 식별자 시퀀스 */
CREATE SEQUENCE seq_product_index 
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999999
    MINVALUE 1
    NOCYCLE;
​
/* 장바구니 테이블 */
CREATE TABLE cs_cart(
cart_index NUMBER PRIMARY KEY,
fk_member_id VARCHAR2(20) not null,
fk_product_index NUMBER not null,
order_count NUMBER not null
);

/*제약조건*/
ALTER TABLE cs_cart
ADD CONSTRAINT FK_cart_member_id FOREIGN KEY(fk_member_id) REFERENCES cs_member(member_id) 
ON DELETE CASCADE;

ALTER TABLE cs_cart
ADD CONSTRAINT FK_cart_product_index FOREIGN KEY(fk_product_index) REFERENCES cs_product(product_index) ON DELETE CASCADE;

/*장바구니 시퀀스*/
CREATE SEQUENCE seq_cart_index
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999999
    MINVALUE 1
    NOCYCLE;

INSERT INTO cs_cart VALUES(
    seq_cart_index.nextval,
    'jhlee0912',
    3,
    2
);

SELECT * FROM cs_cart;
SELECT * FROM cs_product;

INSERT INTO cs_notice(notice_index, fk_member_id, notice_title, notice_text, notice_file)
VALUES(seq_notice_index.nextval, 'admin', '크리스마스 EVENT','어렵다어려워', null);
INSERT INTO cs_notice(notice_index, fk_member_id, notice_title, notice_text, notice_file)
VALUES(seq_notice_index.nextval, 'admin', '크리스마스 EVENT2','어렵다어려워', null);
INSERT INTO cs_notice(notice_index, fk_member_id, notice_title, notice_text, notice_file)
VALUES(seq_notice_index.nextval, 'admin', '크리스마스 EVENT3','어렵다어려워', null);
INSERT INTO cs_notice(notice_index, fk_member_id, notice_title, notice_text, notice_file)
VALUES(seq_notice_index.nextval, 'admin', '크리스마스 EVENT4','어렵다어려워', null);
INSERT INTO cs_notice(notice_index, fk_member_id, notice_title, notice_text, notice_file)
VALUES(seq_notice_index.nextval, 'admin', '크리스마스 EVENT5','어렵다어려워', null);
INSERT INTO cs_notice(notice_index, fk_member_id, notice_title, notice_text, notice_file)
VALUES(seq_notice_index.nextval, 'admin', '크리스마스 EVENT6','어렵다어려워', null);
INSERT INTO cs_notice(notice_index, fk_member_id, notice_title, notice_text, notice_file)
VALUES(seq_notice_index.nextval, 'admin', '크리스마스 EVENT7','어렵다어려워', null);

INSERT INTO cs_notice VALUES(
    seq_notice_index.nextval,
    'admin',
    '상세 주소지 누락건에 대한 공지',
    default,
    '상세주소지를 제외한 기본 배송지만 기재되어 주소지 누락으로 다시 반송처리 되는 경우가 발생하고 있습니다! 꼭 상세주소지 (동호수)를 포함한 주소지를 기입해주세요!',
    null
);
INSERT INTO cs_notice VALUES(
    seq_notice_index.nextval,
    'admin',
    '코로나 19로 인한 배송 지연 안내',
    default,
    '코로나 19로 인한 배송 지연 안내입니다.',
    './view/img/delivery-delay.jpg'
);
commit;
SELECT * FROM cs_notice;
SELECT * FROM cs_cart;

INSERT INTO cs_cart VALUES(
    seq_cart_index.nextval, 'jhlee0912', 2, 5
);

INSERT INTO cs_order_detail VALUES(
    seq_order_detail_index.nextval, 1, 
    (SELECT fk_product_index FROM cs_cart), 
    (SELECT order_count FROM cs_cart)
);

DROP TABLE CS_PRODUCT CASCADE CONSTRAINTS;

CREATE TABLE cs_product(
    product_index NUMBER PRIMARY KEY,
    fk_hastag_index NUMBER not null,
    fk_category_index NUMBER not null,
    product_name VARCHAR2(100) not null,
    product_price NUMBER not null,
    product_count NUMBER not null,
    product_image VARCHAR2(400) not null,
    product_info VARCHAR2(600) not null,
    product_text VARCHAR2(2000) null
    );






SELECT * FROM cs_category;
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,1, 1 ,'모리타', 16000, 100, 'Morita.png', '파푸아뉴기니모리타', '풍부한산미파푸아뉴기니모리타');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,1, 1, '엘 라우렐', 16000, 100, 'El_Laure.png', '온두라스 엘 라우렐  ', '풍부한산미온두라스엘라우렐');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,1,1, '부산제', 14000, 100, 'Busanze.png', '르완다 부산제  ', '풍부한산미르완다부산제');

INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,2,1, '카사훈 제보', 15000, 100, 'KasahunJebo.png', '카사훈 제보', '묵직한바디감카사훈제보');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,2,1, '엘 라우렐 이호', 27000, 100, 'ElLaurelHijo.png', '온두라스 엘 라우렐 이호', '묵직한바디감온두라스엘라우렐이호');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,2,1, '에센시아 디카페인', 16000, 100, 'Esencia.png', '콜롬비아에센시아디카페인', '묵직한바디감콜롬비아에센시아디카페인');

INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,3,1, '마르카라 마르칼라', 20000, 100, 'Marcala.png', '클래식에스프레소블렌드', '중남미원두온두라스마르카라마르칼라');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,3,1, '세하도', 8000, 100, 'Cerrado.png', '브라질세하도', '중남미원두브라질세하도');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,3,1, '수프리모', 9000, 100, 'Supremo.png', '콜롬비아수프리모', '콜롬비아수프리모콜롬비아수프리모');

INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,4,1, '탄자니아AA', 9000, 100, 'TanzaniaAA.png', '클래식탄자니아', '아프리카원두탄자니아AA');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,4,1, '시다모G4', 11000, 100, 'KenyaAA.png', '에티오피아시다모', '아프리카원두시다모G4');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,4,1, '케냐AA', 12000, 100, 'KenyaAA.png', '클래식에스프레소', '아프리카원두케냐AA');


INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,5,2, '맥심 모카골드', 18000, 100, 'maxim.jpg', '카페모카', '동서식품 맥심 모카골드 카페모카');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,5,2, '카누 다크로스트', 21000, 100, 'kanu.jpg', '아메리카노', '동서식품 카누 다크로스트');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,5,2, '카페 아메리카노', 11000, 100, 'cafe_americano.png', '아메리카노', 'ns몰카페아메리카노');

INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,6,3, '포시티오 룽고', 10000, 100, 'Fortissio_Lungo.png', '클래식 에스프레소', '버츄오 포시티오 룽고');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,6,3, '비발토 룽고', 11000, 100, 'Volluto.png', '클래식 에스프레소', '버츄오 비발토 룽고');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,6,3, '리니지오 룽고', 11000, 100, 'Linizio_Lungo.png', '클래식 에스프레소', '버츄오 비발토 룽고');
/*데이터수정*/
SELECT * FROM cs_product;
UPDATE CS_PRODUCT SET PRODUCT_IMAGE = 'SidamoG4.png' WHERE PRODUCT_NAME = '시다모G4';
UPDATE cs_product set Product_info = '클래식 에스프레소 블렌드|모리타|16,000|파푸아뉴기니|용량:200g' WHERE product_Name ='모리타';
UPDATE cs_product set Product_text = '파푸아뉴기니 모리타|Papua New Guinea Morita|국가 : PAPUA NEW GUINEA|지역 : AIYURA BALLEY,EASTERN HIGHLANDS|농장 : MORITA|농장주 : MORITA SMALL HOLDERS|재배 고도 : 1,850M|품종 : K7,ARUSHA|가공방식 : WASHED PROCESS' WHERE product_Name ='모리타';
UPDATE cs_product set Product_info = '클래식 에스프레소 블렌드|엘 라우렐|16,000|온두라스|용량:200g' WHERE product_Name ='엘 라우렐';
UPDATE cs_product set Product_text = '엘 라우렐|온두라스 엘 라우렐 El Laurel|국가 : 온두라스|지역 :  엘 파라이소, 단리 Danli, El Paraiso|농장 : 엘 라우렐 El Laurel|농장주 :오스카 라미레즈 Oscar Ramirez|재배 고도 : 1,400M|품종 : 파라이네마 Parainema|가공방식 : 워시드 Washed' WHERE product_Name ='엘 라우렐';
UPDATE cs_product set Product_info = '클래식 에스프레소 블렌드|부산제|14,000|르완다|용량:200g' WHERE product_Name ='부산제';
UPDATE cs_product set Product_text = '르완다 부산제|Rwanda Busanze|국가 : 르완다|지역 : NYARUGURU,BUSANZE|농장 : BUSANZE|농장주 : SMALLFARMERS|재배 고도 : 2,500-2115M|품종 : BOURBON|가공방식 : WASHED PROCESS' WHERE product_Name ='부산제';
UPDATE cs_product set Product_info = '클래식 에스프레소 블렌드|카사훈 제보|15,000|에티오피아|용량:200g' WHERE product_Name ='카사훈 제보';
UPDATE cs_product set Product_text = '에티오피아 카사훈제보|Ethiopia KasahunJebo|국가 : ETHIOPIA|지역 : WEGIDA,YIRGACHEFFEE|농장 : KASAHUN JEBO|농장주 : KASAHUN JEBO|재배 고도 : 2,110M|품종 : 74110,WELLISHO,OLDMOTHERTREE|가공방식 : NATURAL' WHERE product_Name ='카사훈 제보';
UPDATE cs_product set Product_info = '클래식 에스프레소 블렌드|엘 라우렐 이호|27,000|온두라스|용량:200g' WHERE product_Name ='엘 라우렐 이호';
UPDATE cs_product set Product_text = '온두라스 엘라우렐이호|Honduras ElLaurelHijo|국가 : HONDRRAS|지역 : DANLI,EL PARAISO|농장 : EL LAUREL HIJO|농장주 : OSCAR RAMIREZ|재배 고도 : 1,450M|품종 : PARAINEMA|가공방식 : WASHED PROCESS' WHERE product_Name ='엘 라우렐 이호';
UPDATE cs_product set Product_info = '클래식 에스프레소 블렌드|에센시아 디카페인|16,000|콜롬비아|용량:200g' WHERE product_Name ='에센시아 디카페인';
UPDATE cs_product set Product_text = '콜롬비아 에센시아디카페인|Colombia EsenciaDecaffeination|국가 : COLOMBIA|지역 : HUILA|농장 : ESENCIA|농장주 : SMALLFARMERS|재배 고도 : 1,600-1,800M|품종 : CATURRA-COLOMBIA-CASTILLO|가공방식 : DECAFFEINATION' WHERE product_Name ='에센시아 디카페인';
UPDATE cs_product set Product_info = '클래식 에스프레소 블렌드|마르카라 마르칼라|20,000|온두라스|용량:200g' WHERE product_Name ='마르카라 마르칼라';
UPDATE cs_product set Product_text = '온두라스 마르카라마르칼라|Honduras MarcaraMarkala|국가 : 온두라스|지역 : Marcala|농장 : La Paz|농장주 : La Paz|재배 고도 : 1,560M|품종 : Catuai,IH-90|가공방식 : WASHED PROCESS' WHERE product_Name ='마르카라 마르칼라';
UPDATE cs_product set Product_info = '클래식 에스프레소 블렌드|세하도|8,000|브라질|용량:200g' WHERE product_Name ='세하도';
UPDATE cs_product set Product_text = '브라질 세하도|Brazil SehaIsland|국가 : 브라질|지역 : 브라질|농장 : Carlos|농장주 : Carlos|재배 고도 : 3,000M|품종 : Catuai|가공방식 : WASHED PROCESS' WHERE product_Name ='세하도';
UPDATE cs_product set Product_info = '클래식 에스프레소 블렌드|수프리모|9,000|콜롬비아|용량:200g' WHERE product_Name ='수프리모';
UPDATE cs_product set Product_text = '콜롬비아 수프리모|Colombia Supremo|국가 : 콜롬비아|지역 : 콜롬비아|농장 : LIA|농장주 : LIA|재배 고도 : 4,000M|품종 : IH-90|가공방식 : WASHED PROCESS' WHERE product_Name ='수프리모';
UPDATE cs_product set Product_info = '클래식 에스프레소 블렌드|탄자니아AA|9,000|탄자니아|용량:200g' WHERE product_Name ='탄자니아AA';
UPDATE cs_product set Product_text = '탄자니아 탄자니아AA|Tanjania TanjaniaAA|국가 : 탄자니아|지역 : 탄자니아|농장 : Amigo|농장주 : Amigo|재배 고도 : 500M|품종 : IH-90|가공방식 : WASHED PROCESS' WHERE product_Name ='탄자니아AA';
UPDATE cs_product set Product_info = '클래식 에스프레소 블렌드|시다모G4|11,000|에티오피아|용량:200g' WHERE product_Name ='시다모G4';
UPDATE cs_product set Product_text = '에티오피아 시다모G4|Ethiopia SidamoG4|국가 : 에티오피아|지역 : 에티오피아|농장 : LIA|농장주 : LIA|재배 고도 : 1,000M|품종 : IH-90|가공방식 : WASHED PROCESS' WHERE product_Name ='시다모G4';
UPDATE cs_product set Product_info = '클래식 에스프레소 블렌드|케냐AA|12,000|케냐|용량:200g' WHERE product_Name ='케냐AA';
UPDATE cs_product set Product_text = '케냐 케냐AA|Kenya KenyaAA|국가 : 케냐|지역 : 케냐|농장 : Elvardo|농장주 : Elvardo|재배 고도 : 900M|품종 : IH-90|가공방식 : WASHED PROCESS' WHERE product_Name ='케냐AA';
UPDATE cs_product set Product_info = '카페모카|맥심 모카골드|18,000|동서식품|용량:500g(100개입)' WHERE product_Name ='맥심 모카골드';
UPDATE cs_product set Product_text = '동서식품 맥심모카골드|East-West Foods Maxim Moccagold|국가 : 온두라스,콜롬비아|지역 : 온두라스,콜롬비아|맥심 모카골드 마일드 커피에는|아라비카 원두의 깨끗하고,|신선한 향미를 그대로 전달할 수 있는|APEX(Advanced Prime Extraction) 공법을|적용하였습니다.' WHERE product_Name ='맥심 모카골드';
UPDATE cs_product set Product_info = '아메리카노|카누 다크로스트|21,000|동서식품|용량:500g(100개입)' WHERE product_Name ='카누 다크로스트';
UPDATE cs_product set Product_text = '동서식품 카누다크로스트|East-West Foods Canoe dachroist|국가 : 콜롬비아,과테말라,코스타리카|지역 : 콜롬비아,과테말라,코스타리카|에스프레소 방식으로 저수율|저온 추출한 고품질 커피 파우더|갓 분쇄한 원두 고유의 신선한 아로마의 향미|-196도 마이크로 그라인딩 공법 사용|진한 초콜릿맛 과 스모키한 향' WHERE product_Name ='카누 다크로스트';
UPDATE cs_product set Product_info = '아메리카노|카페 아메리카노|11,000|NS몰|용량:500g(100개입)' WHERE product_Name ='카페 아메리카노';
UPDATE cs_product set Product_text = 'NS몰 카페아메리카노|NS Mall CafeAmericano|국가 : 콜롬비아,에티오피아|지역 : 콜롬비아,에티오피아|품종 : 칼라스 수프리모,예가체프|칼라스 수프리모의 깊은 향미와 깔끔함|마일드 커피 의 대명사로 명성이 높은 고급 원두 커피|예가체프의 풍부한 아로마,부드러운 바디감|세련된 맛과 향때문에 커피의 귀부인 이라고 불림' WHERE product_Name ='카페 아메리카노';
UPDATE cs_product set Product_info = '클래식 에스프레소|포시티오 룽고|10,000|버츄오|용량:500g(100개입)' WHERE product_Name ='포시티오 룽고';
UPDATE cs_product set Product_text = '버츄오 포시티오룽고|Birchuo FourCityOrungo|국가 : 온두라스,브라질|지역 : 온두라스,브라질|가공방식 : 습식 가공 방식|달콤한 곡물향|구운 맥아향' WHERE product_Name ='포시티오 룽고';
UPDATE cs_product set Product_info = '클래식 에스프레소|비발토 룽고|10,000|버츄오|용량:500g(100개입)' WHERE product_Name ='비발토 룽고';
UPDATE cs_product set Product_text = '버츄오 비발토룽고|Birchuo VivaltoLungo|국가 : 에티오피아,콜롬비아|지역 : 에티오피아,콜롬비아|가공방식 : 습식 가공 방식|그윽한 로스트향|구운 곡물향 사이로 스며드는 은은한 꽃향' WHERE product_Name ='비발토 룽고';
UPDATE cs_product set Product_info = '클래식 에스프레소|리니지오 룽고|10,000|버츄오|용량:500g(100개입)' WHERE product_Name ='리니지오 룽고';
UPDATE cs_product set Product_text = '버츄오 리니지오룽고|Birchuo LineageoRungo|국가 : 브라질,콜롬비아|지역 : 브라질,콜롬비아|가공방식 : 습식 가공 방식|부드러운 풍미 와 버번종의 맥아 곡물향|섬세한 아로마' WHERE product_Name ='리니지오 룽고';