
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

/* 주문 인덱스 시퀀스 */
CREATE SEQUENCE seq_order_index
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
NOCYCLE;

---------
/*cs_category*/
CREATE TABLE cs_category(
    category_index NUMBER PRIMARY KEY, --?떆???뒪 / PK
    category_name VARCHAR(20) UNIQUE NOT NULL
);

/*seq_category_index 시퀀스*/
INSERT INTO cs_category VALUES ('1','a');
SELECT
    *
FROM cs_category;

CREATE SEQUENCE seq_category_index
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
NOCYCLE;

/*cs_hashtag*/
CREATE TABLE CS_HASHTAG (
    hashtag_index NUMBER PRIMARY KEY, --?떆???뒪 / PK
    fk_category_index NUMBER, --CS_CATEGORY ?뀒?씠釉? CATEGORY_NO FK 
    hashtag_name VARCHAR(40) UNIQUE NOT NULL,--UNIQUE/NOT NULL
    FOREIGN KEY(fk_category_index) REFERENCES cs_category(category_index) ON DELETE CASCADE
);
INSERT INTO CS_HASHTAG(hashtag_index,fk_category_index,hashtag_name)VALUES ('1','1','a');
SELECT
    *
FROM cs_hashtag;
/*seq_hashtag_index*/
CREATE SEQUENCE seq_hashtag_index
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
NOCYCLE;



CREATE TABLE CS_QNA (
	QNA_INDEX NUMBER	PRIMARY KEY,
	fk_member_id  VARCHAR2(20)	NOT NULL,	
	QNA_TITLE  VARCHAR2(128)       NOT NULL,
	QNA_DATE	DATE    default sysdate	        	NOT NULL, 
	QNA_TEXT	    VARCHAR2(2000)	                NOT NULL,
	QNA_IMAGE	    VARCHAR2(128)	,
	QNA_CHECK NUMBER	 NOT NULL

);

ALTER TABLE CS_QNA
ADD CONSTRAINT fk_member_id FOREIGN KEY(fk_member_id) REFERENCES cs_member(member_id)
ON DELETE CASCADE;



CREATE SEQUENCE seq_qna_index
MINVALUE 1
MAXVALUE 999999
START WITH 1
INCREMENT BY 1
NOCYCLE;


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


/*상품 테이블*/  
CREATE TABLE cs_product(
    product_index NUMBER PRIMARY KEY,
    fk_hastag_index NUMBER not null,
    product_name VARCHAR2(100) not null,
    product_price NUMBER not null,
    product_count NUMBER not null,
    product_image VARCHAR2(400) not null,
    product_info VARCHAR2(400) not null,
    product_text VARCHAR2(2000) null

    );

ALTER TABLE cs_product MODIFY product_info varchar(700);
INSERT into cs_product (product_index,fk_hastag_index,product_name,product_price,product_count,product_image,product_info,product_text) 
VALUES ('2','2','모리타','16,000원','99999','Morita.png',
'16,000원
||파푸아뉴기니
||용량:200g
||배송비:무료
||배송 기간:이틀 예정
||[영업일 기준 2일 이내 발송]
||수량',
'파푸아뉴기니모리타
||Papua New Guinea Morita
||국가 : PAPUA NEW GUINEA
||지역 : AIYURA BALLEY EASTERN HIGHLANDS
||농장 : MORITA
||농장주 : MORITA SMALL HOLDERS
||재배 고도 : 1,850M
||품종 : K7 ARUSHA
||가공방식 : WASHED PROCESS);

SELECT
    *
FROM cs_product;

/*  확인하기 */
ALTER TABLE cs_product ADD CONSTRAINT fk_hastag_index FOREIGN KEY(fk_hastag_index) REFERENCES cs_hashtag(hashtag_index)
ON DELETE CASCADE;

insert

/*상품 식별자 시퀀스 */
CREATE SEQUENCE seq_product_index
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999999
    MINVALUE 1
    NOCYCLE;

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
 
