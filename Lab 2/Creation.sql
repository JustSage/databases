CREATE TABLE Product(
Maker VARCHAR2(10),
Model  NUMBER(4),
Type VARCHAR2(10),
CONSTRAINT model_pk PRIMARY KEY(Model)
);
CREATE TABLE Pc(
Model NUMBER(4) NOT NULL CONSTRAINT pc_model_fk REFERENCES Product(Model),
Speed NUMBER(4),
Ram NUMBER (3),
Hd NUMBER (2),
Price NUMBER (4)
);
CREATE TABLE Laptop(
Model NUMBER(4) NOT NULL CONSTRAINT laptop_model_fk REFERENCES Product(Model),
Speed NUMBER(4),
Ram NUMBER (3),
Hd NUMBER (2),
Screen NUMBER(3,1),
Price NUMBER (4)
);

CREATE TABLE Printer(
Model NUMBER(4) NOT NULL CONSTRAINT printer_model_fk REFERENCES Product(Model),
Color VARCHAR2(10),
Type VARCHAR2(10),
Price NUMBER(4)
);
