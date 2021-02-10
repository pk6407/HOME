CREATE SEQUENCE seq_cart_index
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999999
    MINVALUE 1
    NOCYCLE;
-------------------------------------------
    
CREATE SEQUENCE seq_product_index 
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999999
    MINVALUE 1
    NOCYCLE;

-------------------------------------------
CREATE SEQUENCE seq_notice_index
MINVALUE 1
MAXVALUE 9999999
START WITH 1
INCREMENT BY 1
NOCYCLE;

-------------------------------------------

CREATE SEQUENCE seq_qna_index
MINVALUE 1
MAXVALUE 999999
START WITH 1
INCREMENT BY 1
NOCYCLE;

-------------------------------------------

CREATE SEQUENCE seq_hashtag_index
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
NOCYCLE;

-------------------------------------------

/*ī�װ� ������ */
CREATE SEQUENCE seq_category_index
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
NOCYCLE;
-------------------------------------------


CREATE SEQUENCE seq_order_index
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
NOCYCLE;
-------------------------------------------


/* �ֹ� �� ���̺� */
CREATE SEQUENCE seq_order_detail_index
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
NOCYCLE;

-------------------------------------------
/*ȸ�� ���̺� ���� */
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
SELECT * FROM cs_member;
INSERT INTO cs_member(member_id   , member_pwd ,member_name ,member_email,member_phone,member_zipcode,
member_address,member_admin)
VALUES('jeremy', '123' , '������' ,  'jeremy96kr@naver.com' , '01067768730' , '1234','�츮��','1');
INSERT INTO cs_member(member_id   , member_pwd ,member_name ,member_email,member_phone,member_zipcode,
member_address,member_admin,member_joined_date)
VALUES('jeremy1','jeremy!2345','������','jeremy96kr@naver.com','01067768730','1234','�츮��','1',to_date(sysdate,'yyyy-mm-dd')); 
SELECT * FROM cs_member;
commit;
-------------------------------------------
DROP TABLE CS_ORDER CASCADE CONSTRAINTS;
/* �ֹ� ���̺� */
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



-------------------------------------------


/* CS_CATEGORY */
CREATE TABLE CS_CATEGORY (
    category_index NUMBER PRIMARY KEY, --������ / PK
    category_name VARCHAR(20) UNIQUE NOT NULL
);
-------------------------------------------
CREATE TABLE CS_HASHTAG (
    hashtag_index NUMBER PRIMARY KEY, --������ / PK
    fk_category_index NUMBER, --CS_CATEGORY ���̺� CATEGORY_NO FK 
    hashtag_name VARCHAR(40) UNIQUE NOT NULL,--UNIQUE/NOT NULL
    FOREIGN KEY(fk_category_index) REFERENCES cs_category(category_index) ON DELETE CASCADE
);

-------------------------------------------


CREATE TABLE CS_QNA (
	QNA_INDEX NUMBER	PRIMARY KEY,
	fk_member_id  VARCHAR2(20)	NOT NULL,	
	QNA_TITLE  VARCHAR2(128)       NOT NULL,
	QNA_DATE	DATE    default sysdate	        	NOT NULL, 
	QNA_TEXT	    VARCHAR2(2000)	                NOT NULL,
	QNA_IMAGE	    VARCHAR2(128)	,
	QNA_CHECK NUMBER DEFAULT 0	NOT NULL 
 
);
-------------------------------------------
ALTER TABLE CS_QNA
ADD CONSTRAINT fk_member_id FOREIGN KEY(fk_member_id) REFERENCES cs_member(member_id)
ON DELETE CASCADE;
-------------------------------------------
/*������ ���̺� */
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
-------------------------------------------
/* ��ǰ ���̺� */


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
-------------------------------------------
/* Ȯ���ϱ� */    
ALTER TABLE cs_product ADD CONSTRAINT fk_hastag_index FOREIGN KEY(fk_hastag_index) REFERENCES cs_hashtag(hashtag_index)
ON DELETE CASCADE;
ALTER TABLE cs_product ADD CONSTRAINT fk_category_index FOREIGN KEY(fk_category_index) REFERENCES cs_category(category_index)
ON DELETE CASCADE;
-------------------------------------------
/* ��ٱ��� ���̺� */
CREATE TABLE cs_cart(
cart_index NUMBER PRIMARY KEY,
fk_member_id VARCHAR2(20) not null,
fk_product_index NUMBER not null,
order_count NUMBER not null
);
-------------------------------------------
/*�������� */
ALTER TABLE cs_cart
ADD CONSTRAINT FK_cart_member_id FOREIGN KEY(fk_member_id) REFERENCES cs_member(member_id) 
ON DELETE CASCADE;
-------------------------------------------
ALTER TABLE cs_cart
ADD CONSTRAINT FK_cart_product_index FOREIGN KEY(fk_product_index) REFERENCES cs_product(product_index) ON DELETE CASCADE;
-------------------------------------------
/*�ֹ� �� ���̺� */
CREATE TABLE cs_order_detail(
    order_detail_index NUMBER PRIMARY KEY,
    fk_order_index NUMBER REFERENCES cs_order(order_index) ON DELETE CASCADE,
    fk_product_index NUMBER REFERENCES cs_product(product_index) ON DELETE CASCADE,
    order_product_count NUMBER NOT NULL
);
-------------------------------------------
/*ī�װ� ������ �ֱ� */
INSERT INTO cs_category VALUES(seq_category_index.NEXTVAL, '����');
INSERT INTO cs_category VALUES(seq_category_index.NEXTVAL, '��ƽĿ��');
INSERT INTO cs_category VALUES(seq_category_index.NEXTVAL, 'ĸ��Ŀ��');
SELECT *FROM CS_CATEGORY;

/*�ؽ��±� ������ �ֱ� */
INSERT INTO CS_HASHTAG(hashtag_index,fk_category_index,hashtag_name)VALUES (SEQ_HASHTAG_INDEX.nextval,'1','ǳ���ѻ��');
INSERT INTO CS_HASHTAG(hashtag_index,fk_category_index,hashtag_name)VALUES (SEQ_HASHTAG_INDEX.nextval,'1','�����ѹٵ�');
INSERT INTO CS_HASHTAG(hashtag_index,fk_category_index,hashtag_name)VALUES (SEQ_HASHTAG_INDEX.nextval,'1','�߳��̿���');
INSERT INTO CS_HASHTAG(hashtag_index,fk_category_index,hashtag_name)VALUES (SEQ_HASHTAG_INDEX.nextval,'1','������ī����');
/*�ؽ��±׸� �����Ͱ� ���� */
UPDATE CS_HASHTAG SET hashtag_name = '#ǳ���ѻ��' WHERE hashtag_index = 1;
UPDATE CS_HASHTAG SET hashtag_name = '#�����ѹٵ�' WHERE hashtag_index = 2;
UPDATE CS_HASHTAG SET hashtag_name = '#�߳��̿���' WHERE hashtag_index = 3;
UPDATE CS_HASHTAG SET hashtag_name = '#������ī����' WHERE hashtag_index = 4;

INSERT INTO CS_HASHTAG(hashtag_index,fk_category_index,hashtag_name)VALUES (SEQ_HASHTAG_INDEX.nextval,'2','#��������');
INSERT INTO CS_HASHTAG(hashtag_index,fk_category_index,hashtag_name)VALUES (SEQ_HASHTAG_INDEX.nextval,'3','#���');

SELECT * FROM CS_HASHTAG;

COMMIT;

/*��ǰ���̺� ������ �ֱ� */

INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'1','1' ,'��Ÿ', '16000', '100', 'Morita.png', '��Ǫ�ƴ���ϸ�Ÿ', 'ǳ���ѻ����Ǫ�ƴ���ϸ�Ÿ');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'1','1', '�� ��췼', '16000', '100', 'El_Laure.png', '�µζ� �� ��췼  ', 'ǳ���ѻ�̿µζ󽺿���췼');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'1','1', '�λ���', '14000', '100', 'Busanze.png', '���ϴ� �λ���  ', 'ǳ���ѻ�̸��ϴٺλ���');

INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'2','1', 'ī���� ����', '15000', '100', 'KasahunJebo.png', 'ī���� ����', '�����ѹٵ�ī��������');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'2','1', '�� ��췼 ��ȣ', '27000', '100', 'ElLaurelHijo.png', '�µζ� �� ��췼 ��ȣ', '�����ѹٵ𰨿µζ󽺿���췼��ȣ');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'2','1', '�����þ� ��ī����', '16000', '100', 'Esencia.png', '�ݷҺ�ƿ����þƵ�ī����', '�����ѹٵ��ݷҺ�ƿ����þƵ�ī����');

INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'3','1', '����ī�� ����Į��', '20000', '100', 'Marcala.png', 'Ŭ���Ŀ��������Һ���', '�߳��̿��οµζ󽺸���ī�󸶸�Į��');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'3','1', '���ϵ�', '8000', '100', 'Cerrado.png', '��������ϵ�', '�߳��̿��κ�������ϵ�');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'3','1', '��������', '9000', '100', 'Supremo.png', '�ݷҺ�Ƽ�������', '�ݷҺ�Ƽ��������ݷҺ�Ƽ�������');

INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'4','1', 'ź�ڴϾ�aa', '9000', '100', 'TanzaniaAA.png', 'Ŭ����ź�ڴϾ�', '������ī����ź�ڴϾ�AA');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'4','1', '�ôٸ�G4', '11000', '100', 'KenyaAA.png', '��Ƽ���Ǿƽôٸ�', '������ī���νôٸ�G4');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'4','1', '�ɳ�AA', '12000', '100', 'KenyaAA.png', 'Ŭ���Ŀ���������', '������ī�����ɳ�AA');


INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'5','2', '�ƽ� ��ī���', '18000', '100', 'maxim.jpg', 'ī���ī', '������ǰ �ƽ� ��ī��� ī���ī');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'5','2', 'ī�� ��ũ�ν�Ʈ', '21000', '100', 'kanu.jpg', '�Ƹ޸�ī��', '������ǰ ī�� ��ũ�ν�Ʈ');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'5','2', 'ī�� �Ƹ޸�ī��', '11000', '100', 'cafe_americano.png', '�Ƹ޸�ī��', 'ns��ī��Ƹ޸�ī��');

INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'6','3', '����Ƽ�� ���', '10000', '100', 'Fortissio_Lungo.png', 'Ŭ���� ����������', '����� ����Ƽ�� ���');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'6','3', '����� ���', '11000', '100', 'Volluto.png', 'Ŭ���� ����������', '����� ����� ���');
INSERT INTO CS_PRODUCT(PRODUCT_INDEX,FK_HASTAG_INDEX,FK_CATEGORY_INDEX,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_COUNT,PRODUCT_IMAGE,PRODUCT_INFO,PRODUCT_TEXT)
VALUES(seq_product_index.NEXTVAL,'6','3', '�������� ���', '11000', '100', 'Linizio_Lungo.png', 'Ŭ���� ����������', '����� ����� ���');
/*�����ͼ���*/
UPDATE CS_PRODUCT SET PRODUCT_IMAGE = 'SidamoG4.png' WHERE PRODUCT_NAME = '�ôٸ�G4';
UPDATE cs_product set Product_info = 'Ŭ���� ���������� ����|��Ÿ|16,000|��Ǫ�ƴ����|�뷮:200g' WHERE product_Name ='��Ÿ';
UPDATE cs_product set Product_text = 'Papua New Guinea Morita|���� : PAPUA NEW GUINEA|���� : AIYURA BALLEY,EASTERN HIGHLANDS|���� : MORITA|������ : MORITA SMALL HOLDERS|��� �� : 1,850M|ǰ�� : K7,ARUSHA|������� : WASHED PROCESS' WHERE product_Name ='��Ÿ';
UPDATE cs_product set Product_info = 'Ŭ���� ���������� ����|�� ��췼|16,000|�µζ�|�뷮:200g' WHERE product_Name ='�� ��췼';
UPDATE cs_product set Product_text = '�µζ� �� ��췼 El Laurel|���� : �µζ�|���� :  �� �Ķ��̼�, �ܸ� Danli, El Paraiso|���� : �� ��췼 El Laurel|������ :����ī ��̷��� Oscar Ramirez|��� �� : 1,400M|ǰ�� : �Ķ��̳׸� Parainema|������� : ���õ� Washed' WHERE product_Name ='�� ��췼';
UPDATE cs_product set Product_info = 'Ŭ���� ���������� ����|�λ���|14,000|���ϴ�|�뷮:200g' WHERE product_Name ='�λ���';
UPDATE cs_product set Product_text = 'Rwanda Busanze|���� : ���ϴ�|���� : NYARUGURU,BUSANZE|���� : BUSANZE|������ : SMALLFARMERS|��� �� : 2,500-2115M|ǰ�� : BOURBON|������� : WASHED PROCESS' WHERE product_Name ='�λ���';
UPDATE cs_product set Product_info = 'Ŭ���� ���������� ����|ī���� ����|15,000|��Ƽ���Ǿ�|�뷮:200g' WHERE product_Name ='ī���� ����';
UPDATE cs_product set Product_text = 'Ethiopia KasahunJebo|���� : ETHIOPIA|���� : WEGIDA,YIRGACHEFFEE|���� : KASAHUN JEBO|������ : KASAHUN JEBO|��� �� : 2,110M|ǰ�� : 74110,WELLISHO,OLDMOTHERTREE|������� : NATURAL' WHERE product_Name ='ī���� ����';
UPDATE cs_product set Product_info = 'Ŭ���� ���������� ����|�� ��췼 ��ȣ|27,000|�µζ�|�뷮:200g' WHERE product_Name ='�� ��췼 ��ȣ';
UPDATE cs_product set Product_text = 'Honduras ElLaurelHijo|���� : HONDRRAS|���� : DANLI,EL PARAISO|���� : EL LAUREL HIJO|������ : OSCAR RAMIREZ|��� �� : 1,450M|ǰ�� : PARAINEMA|������� : WASHED PROCESS' WHERE product_Name ='�� ��췼 ��ȣ';
UPDATE cs_product set Product_info = 'Ŭ���� ���������� ����|�����þ� ��ī����|16,000|�ݷҺ��|�뷮:200g' WHERE product_Name ='�����þ� ��ī����';
UPDATE cs_product set Product_text = 'Colombia EsenciaDecaffeination|���� : COLOMBIA|���� : HUILA|���� : ESENCIA|������ : SMALLFARMERS|��� �� : 1,600-1,800M|ǰ�� : CATURRA-COLOMBIA-CASTILLO|������� : DECAFFEINATION' WHERE product_Name ='�����þ� ��ī����';
UPDATE cs_product set Product_info = 'Ŭ���� ���������� ����|����ī�� ����Į��|20,000|�µζ�|�뷮:200g' WHERE product_Name ='����ī�� ����Į��';
UPDATE cs_product set Product_text = 'Honduras MarcaraMarkala|���� : �µζ�|���� : Marcala|���� : La Paz|������ : La Paz|��� �� : 1,560M|ǰ�� : Catuai,IH-90|������� : WASHED PROCESS' WHERE product_Name ='����ī�� ����Į��';
UPDATE cs_product set Product_info = 'Ŭ���� ���������� ����|���ϵ�|8,000|�����|�뷮:200g' WHERE product_Name ='���ϵ�';
UPDATE cs_product set Product_text = 'Brazil Sehado|���� : �����|���� : �����|���� : Carlos|������ : Carlos|��� �� : 3,000M|ǰ�� : Catuai|������� : WASHED PROCESS' WHERE product_Name ='���ϵ�';
UPDATE cs_product set Product_info = 'Ŭ���� ���������� ����|��������|9,000|�ݷҺ��|�뷮:200g' WHERE product_Name ='��������';
UPDATE cs_product set Product_text = 'Colombia Supremo|���� : �ݷҺ��|���� : �ݷҺ��|���� : LIA|������ : LIA|��� �� : 4,000M|ǰ�� : IH-90|������� : WASHED PROCESS' WHERE product_Name ='��������';
UPDATE cs_product set product_name = 'ź�ڴϾ�AA' WHERE product_name = 'ź�ڴϾ�aa';
UPDATE cs_product set Product_info = 'Ŭ���� ���������� ����|ź�ڴϾ�AA|9,000|ź�ڴϾ�|�뷮:200g' WHERE product_Name ='ź�ڴϾ�AA';
UPDATE cs_product set Product_text = 'Tanjania TanjaniaAA|���� : ź�ڴϾ�|���� : ź�ڴϾ�|���� : Amigo|������ : Amigo|��� �� : 500M|ǰ�� : IH-90|������� : WASHED PROCESS' WHERE product_Name ='ź�ڴϾ�AA';
UPDATE cs_product set Product_info = 'Ŭ���� ���������� ����|�ôٸ�G4|11,000|��Ƽ���Ǿ�|�뷮:200g' WHERE product_Name ='�ôٸ�G4';
UPDATE cs_product set Product_text = 'Ethiopia SidamoG4|���� : ��Ƽ���Ǿ�|���� : ��Ƽ���Ǿ�|���� : LIA|������ : LIA|��� �� : 1,000M|ǰ�� : IH-90|������� : WASHED PROCESS' WHERE product_Name ='�ôٸ�G4';
UPDATE cs_product set Product_info = 'Ŭ���� ���������� ����|�ɳ�AA|12,000|�ɳ�|�뷮:200g' WHERE product_Name ='�ɳ�AA';
UPDATE cs_product set Product_text = 'Kenya KenyaAA|���� : �ɳ�|���� : �ɳ�|���� : Elvardo|������ : Elvardo|��� �� : 900M|ǰ�� : IH-90|������� : WASHED PROCESS' WHERE product_Name ='�ɳ�AA';
UPDATE cs_product set Product_info = 'ī���ī|�ƽ� ��ī���|18,000|������ǰ|�뷮:500g(100����)' WHERE product_Name ='�ƽ� ��ī���';
UPDATE cs_product set Product_text = 'East-West Foods Maxim Moccagold|���� : �µζ�,�ݷҺ��|���� : �µζ�,�ݷҺ��|�ƽ� ��ī��� ���ϵ� Ŀ�ǿ���|�ƶ��ī ������ �����ϰ�,|�ż��� ��̸� �״�� ������ �� �ִ�|APEX(Advanced Prime Extraction) ������|�����Ͽ����ϴ�.' WHERE product_Name ='�ƽ� ��ī���';
UPDATE cs_product set Product_info = '�Ƹ޸�ī��|ī�� ��ũ�ν�Ʈ|21,000|������ǰ|�뷮:500g(100����)' WHERE product_Name ='ī�� ��ũ�ν�Ʈ';
UPDATE cs_product set Product_text = 'East-West Foods Kanu Darkroast|���� : �ݷҺ��,���׸���,�ڽ�Ÿ��ī|���� : �ݷҺ��,���׸���,�ڽ�Ÿ��ī|���������� ������� ������|���� ������ ��ǰ�� Ŀ�� �Ŀ��|�� �м��� ���� ������ �ż��� �Ʒθ��� ���|-196�� ����ũ�� �׶��ε� ���� ���|���� ���ݸ��� �� ����Ű�� ��' WHERE product_Name ='ī�� ��ũ�ν�Ʈ';
UPDATE cs_product set Product_info = '�Ƹ޸�ī��|ī�� �Ƹ޸�ī��|11,000|NS��|�뷮:500g(100����)' WHERE product_Name ='ī�� �Ƹ޸�ī��';
UPDATE cs_product set Product_text = 'NS Mall CafeAmericano|���� : �ݷҺ��,��Ƽ���Ǿ�|���� : �ݷҺ��,��Ƽ���Ǿ�|ǰ�� : Į�� ��������,����ü��|Į�� ���������� ���� ��̿� �����|���ϵ� Ŀ�� �� ����� ���� ���� ��� ���� Ŀ��|����ü���� ǳ���� �Ʒθ�,�ε巯�� �ٵ�|���õ� ���� �⶧���� Ŀ���� �ͺ��� �̶�� �Ҹ�' WHERE product_Name ='ī�� �Ƹ޸�ī��';
UPDATE cs_product set Product_info = 'Ŭ���� ����������|����Ƽ�� ���|10,000|�����|�뷮:500g(100����)' WHERE product_Name ='����Ƽ�� ���';
UPDATE cs_product set Product_text = 'Birchuo FourCityOLungo|���� : �µζ�,�����|���� : �µζ�,�����|������� : ���� ���� ���|������ ���|���� �ƾ���' WHERE product_Name ='����Ƽ�� ���';
UPDATE cs_product set Product_info = 'Ŭ���� ����������|����� ���|10,000|�����|�뷮:500g(100����)' WHERE product_Name ='����� ���';
UPDATE cs_product set Product_text = 'Birchuo VivaltoLungo|���� : ��Ƽ���Ǿ�,�ݷҺ��|���� : ��Ƽ���Ǿ�,�ݷҺ��|������� : ���� ���� ���|������ �ν�Ʈ��|���� ��� ���̷� ������ ������ ����' WHERE product_Name ='����� ���';
UPDATE cs_product set Product_info = 'Ŭ���� ����������|�������� ���|10,000|�����|�뷮:500g(100����)' WHERE product_Name ='�������� ���';
UPDATE cs_product set Product_text = 'Birchuo LineageoLungo|���� : �����,�ݷҺ��|���� : �����,�ݷҺ��|������� : ���� ���� ���|�ε巯�� ǳ�� �� �������� �ƾ� ���|������ �Ʒθ�' WHERE product_Name ='�������� ���';

/*�����ͻ���*/

SELECT * FROM CS_PRODUCT;
COMMIT;

/*���̺�����*/
 SELECT * FROM cs_product p INNER JOIN cs_hashtag h ON p.fk_hastag_index = h.hashtag_index INNER JOIN cs_category ca ON h.fk_category_index = ca.category_index;
 
SELECT * FROM cs_product p INNER JOIN cs_hashtag h ON p.fk_hastag_index = h.hashtag_index INNER JOIN cs_category ca ON h.fk_category_index = ca.category_index;

SELECT * FROM cs_product p INNER JOIN cs_hashtag h ON p.fk_hastag_index = h.hashtag_index INNER JOIN cs_category ca ON h.fk_category_index = ca.category_index WHERE ca.category_index = 1;

commit;

DROP TABLE FK_CATEGORY_INDEX CASCADE CONSTRAINTS;
DROP SEQUENCE seq_member_index;
DROP SEQUENCE seq_cart_index;
DROP SEQUENCE seq_product_index ;
DROP SEQUENCE seq_notice_index;
DROP SEQUENCE seq_qna_index;
DROP SEQUENCE seq_hashtag_index;
DROP SEQUENCE SEQ_CATEGORY_INDEX;
DROP SEQUENCE seq_ORDER_index;
DROP SEQUENCE seq_order_detail_index;
DROP TABLE CS_ORDER CASCADE CONSTRAINTS;
DROP TABLE CS_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE CS_HASHTAG;
DROP TABLE CS_QNA;
DROP TABLE cs_notice;
DROP TABLE CS_PRODUCT CASCADE CONSTRAINTS;
DROP TABLE cs_cart;
DROP TABLE cs_order_detail;
DELETE FROM "CS_PRODUCT" WHERE fk_category_index = '2';
DELETE FROM "CS_PRODUCT" WHERE fk_hastag_index = '1';
DELETE FROM "CS_PRODUCT" WHERE fk_hastag_index = '2';