CREATE TABLE Company (
	Company_index	NUMBER		NOT NULL,
	Company_name	VARCHAR2(30)		NOT NULL
);
SELECT *FROM Company;

INSERT INTO Company(Company_index,Company_name) VALUES (1,'Kh회사');
INSERT INTO Company(Company_index,Company_name) VALUES (2,'Kh회사');
INSERT INTO Company(Company_index,Company_name) VALUES (3,'Kh강철주식회사');
INSERT INTO Company(Company_index,Company_name) VALUES (4,'시몬스주식회사');
INSERT INTO Company(Company_index,Company_name) VALUES (5,'서류철주식회사');
INSERT INTO Company(Company_index,Company_name) VALUES (6,'장난감주식회사');

CREATE TABLE Product (
	Product_index	NUMBER		NOT NULL,
	Product_name	VARCHAR2(30)		NOT NULL,
	Product_number	NUMBER		NOT NULL,
	Product_price	NUMBER		NOT NULL
);

INSERT INTO product(product_index,product_name,product_number,product_price) VALUES (1,'종이',1,1000);
INSERT INTO product(product_index,product_name,product_number,product_price) VALUES (2,'플라스틱',1,5000);
INSERT INTO product(product_index,product_name,product_number,product_price) VALUES (3,'강철',1,50000);
INSERT INTO product(product_index,product_name,product_number,product_price) VALUES (4,'침대',1,500000);
INSERT INTO product(product_index,product_name,product_number,product_price) VALUES (5,'서류철',1,5000);
INSERT INTO product(product_index,product_name,product_number,product_price) VALUES (6,'콩순이네놀이방',1,25000);

SELECT * FROM Product;

CREATE TABLE Warehousing (
	Product_index	NUMBER		NOT NULL,
	Company_index	NUMBER		NOT NULL,
	Warehousing_number	NUMBER		NOT NULL,
    Warehousing_price NUMBER Not NULL,
    time DATE 
);
ALTER TABLE Warehousing RENAME COLUMN Warehousing_time TO time;

INSERT INTO warehousing values (1,1,500,500000,SYSDATE);
INSERT INTO warehousing values (2,2,100,500000,SYSDATE);
INSERT INTO warehousing values (3,3,5000,250000000,SYSDATE);

SELECT * FROM warehousing;


CREATE TABLE Release (
	Product_index	NUMBER		NOT NULL,
	Company_index	NUMBER		NOT NULL,
	refurbish_number	NUMBER		NULL,
	disuse_number	NUMBER		NULL,
	Release_number	NUMBER		NOT NULL,
    Release_price NUMBER NOT NULL,
    time DATE
);

INSERT INTO Release VALUES (4,4,2,0,50,250000000000,SYSDATE);
INSERT INTO Release VALUES (5,5,0,0,50,250000,SYSDATE);
INSERT INTO Release VALUES (6,6,0,0,100,2500000,SYSDATE);

ALTER TABLE Release RENAME COLUMN Release_time TO time;

SELECT * FROM Release;
 
CREATE TABLE Stock (
	Product_index	NUMBER		NOT NULL,
	Stock_number	NUMBER		NULL,
    Stock_price NUMBER  NOT NULL,
    time DATE
);

ALTER TABLE Stock ADD(Stock_price NUMBER);
INSERT INTO Stock VALUES (4,10,5000000,SYSDATE);
INSERT INTO Stock VALUES (1,300,300000,SYSDATE);
INSERT INTO Stock VALUES (6,6000,150000000,SYSDATE);
 
SELECT * FROM Stock;

ALTER TABLE Company ADD CONSTRAINT PK_COMPANY PRIMARY KEY (
	Company_index
);

ALTER TABLE Product ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	Product_index
);

ALTER TABLE Warehousing ADD CONSTRAINT PK_WAREHOUSING PRIMARY KEY (
	Product_index,
	Company_index
);

ALTER TABLE Release ADD CONSTRAINT PK_RELEASE PRIMARY KEY (
	Product_index,
	Company_index
);

ALTER TABLE Stock ADD CONSTRAINT PK_STOCK PRIMARY KEY (
	Product_index
);

ALTER TABLE Warehousing ADD CONSTRAINT FK_Product_TO_Warehousing_1 FOREIGN KEY (
	Product_index
)
REFERENCES Product (
	Product_index
);

ALTER TABLE Warehousing ADD CONSTRAINT FK_Company_TO_Warehousing_1 FOREIGN KEY (
	Company_index
)
REFERENCES Company (
	Company_index
);

ALTER TABLE Release ADD CONSTRAINT FK_Product_TO_Release_1 FOREIGN KEY (
	Product_index
)
REFERENCES Product (
	Product_index
);

ALTER TABLE Release ADD CONSTRAINT FK_Company_TO_Release_1 FOREIGN KEY (
	Company_index
)
REFERENCES Company (
	Company_index
);

ALTER TABLE Stock ADD CONSTRAINT FK_Product_TO_Stock_1 FOREIGN KEY (
	Product_index
)
REFERENCES Product (
	Product_index
);

select p.product_index ,p.product_name as 제품명,w.warehousing_number as 입고수량,w.warehousing_price as 입고가격,c.company_index as 회사인덱스,c.Company_name as 회사이름,w.time from  Warehousing w,Company c,Product p
where w.Product_index=P.Product_index AND w.Company_index=c.Company_index
;

SELECT * FROM w.warehousing_number,w.warehousing_price,