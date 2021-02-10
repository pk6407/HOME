1. cs_member 테이블 생성
```sql
CREATE TABLE cs_member(
    member_index NUMBER PRIMARY KEY,
    member_id VARCHAR2(20) UNIQUE NOT NULL,
    member_pwd VARCHAR2(80) NOT NULL,
    member_name VARCHAR2(20) NOT NULL,
    member_email VARCHAR2(500) UNIQUE NOT NULL,
    member_phone VARCHAR2(100) UNIQUE NOT NULL,
    member_zipcode VARCHAR2(5),
    member_address VARCHAR2(1000),
    member_admin NUMBER DEFAULT 0 NOT NULL
);
```

2. seq_member_index 생성
```sql
CREATE SEQUENCE seq_member_index
    START WITH 1 
    INCREMENT BY 1;
```

3. cs_category 테이블 생성
NO -> Index로 변경하기
```sql
CREATE TABLE CS_CATEGORY (
    category_index NUMBER PRIMARY KEY, --PK
    category_name VARCHAR(20) UNIQUE NOT NULL
);
```

4. seq_category_index 시퀀스 생성
시퀀스 이름 양식도 통일 필요
```sql
CREATE SEQUENCE seq_category_index
START WITH 1
INCREMENT BY 1;
```
5. cs_hashtags 테이블 생성
최종 테이블 이름에는 맨 마지막 s 빼기
```sql
CREATE TABLE CS_HASHTAG (
    hashtag_index NUMBER PRIMARY KEY, --시퀀스 / NOT NULL
    category_index NUMBER, --CS_CATEGORY테이블 CATEGORY_NO FK 
    hashtag_name VARCHAR(20) UNIQUE NOT NULL,--UNIQUE/NOT NULL
    FOREIGN KEY(category_index) REFERENCES cs_category(category_index)
);
```
6. seq_hashtag_index 시퀀스 생성
```sql
CREATE SEQUENCE seq_hashtag_index
START WITH 1
INCREMENT BY 1;
```

7. cs_product 테이블 생성
```sql
CREATE TABLE cs_product(
    product_index NUMBER PRIMARY KEY,
    product_name VARCHAR2(100) UNIQUE NOT NULL,
    product_price VARCHAR2(50) NOT NULL,
    product_count NUMBER NOT NULL,
    product_image VARCHAR2(400) UNIQUE NOT NULL,
    product_info VARCHAR2(400) NOT NULL,
    product_text VARCHAR2(1000) NOT NULL,
    category_index NUMBER,
    hashtag_index NUMBER,
    FOREIGN KEY(category_index) REFERENCES cs_category(category_index),
    FOREIGN KEY(hashtag_index) REFERENCES cs_hashtag(hashtag_index)
);
```

8. seq_product_index 시퀀스 생성
다 1부터 시작하면 헷갈리니까 101부터 시작하는건 어떨까?
```sql
CREATE SEQUENCE seq_product_index
START WITH 101
INCREMENT BY 1;
```
데이터 삽입
```sql
INSERT INTO cs_category VALUES(seq_category_index.nextval, '원두');
INSERT INTO cs_category VALUES(seq_category_index.nextval, '스틱커피');
INSERT INTO cs_category VALUES(seq_category_index.nextval, '캡슐커피');

INSERT INTO cs_hashtag VALUES(seq_hashtag_index.nextval, 1, '#풍부한산미');
INSERT INTO cs_hashtag VALUES(seq_hashtag_index.nextval, 1, '#묵직한바디감');
INSERT INTO cs_hashtag VALUES(seq_hashtag_index.nextval, 1, '#중남미원두');
INSERT INTO cs_hashtag VALUES(seq_hashtag_index.nextval, 1, '#아프리카원두');
INSERT INTO cs_hashtag VALUES(seq_hashtag_index.nextval, 2, '#쉽고간편한');
INSERT INTO cs_hashtag VALUES(seq_hashtag_index.nextval, 3, '#룽고');

INSERT INTO cs_product VALUES(seq_product_index.nextval, '모리타', '16,000원', 100, 'morita.jpg', '모리타어쩌구', '모리타저쩌구', 1, 1);
INSERT INTO cs_product VALUES(seq_product_index.nextval, '엘 라우렐', '16,000원', 100, 'laurel.jpg', '라우렐어쩌구', '라우렐저쩌구', 1, 1);
INSERT INTO cs_product VALUES(seq_product_index.nextval, '부산제', '14,000원', 100, 'busanje.jpg', '부산제어쩌구', '부산제저쩌구', 1, 1);
```
9. 테이블 조인 확인하기
```sql
/* 상품정보, 카테고리정보, 해시태그정보 확인 */
SELECT p.*, h.hashtag_name FROM cs_product p JOIN cs_hashtag h ON p.hashtag_index = h.hashtag_index ORDER BY p.product_index ASC;
/* 상품정보, 카테고리정보 확인 */
SELECT p.*, c.category_name FROM cs_product p JOIN cs_category c ON p.category_index = c.category_index ORDER BY p.product_index ASC;
```

10. 3개 테이블 조인(상품, 카테고리, 해시태그)
```sql
SELECT p.*, c.category_name, h.hashtag_name 
FROM cs_product p, cs_category c, cs_hashtag h 
WHERE p.category_index=c.category_index AND p.hashtag_index=h.hashtag_index;
```