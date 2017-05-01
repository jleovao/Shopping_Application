CREATE TABLE USERS (
	NAME TEXT PRIMARY KEY,
	AGE INTEGER NOT NULL,
	ROLE TEXT NOT NULL,
	STATE TEXT NOT NULL);
    
CREATE TABLE CATEGORIES(
    CATEGORY_ID SERIAL PRIMARY KEY,
	CATEGORY_NAME TEXT UNIQUE NOT NULL,
	DESCRIPTION TEXT NOT NULL);

CREATE TABLE PRODUCT(
	SKU TEXT PRIMARY KEY,
	PRODUCT_NAME TEXT NOT NULL,
	CATEGORY_NAME TEXT REFERENCES CATEGORIES(CATEGORY_NAME) NOT NULL,
	PRICE DECIMAL(9,2) NOT NULL);

CREATE TABLE SHOPPING_CART(
	ID SERIAL PRIMARY KEY,
	NAME TEXT NOT NULL,
	PRODUCT_SKU TEXT REFERENCES PRODUCT(SKU) NOT NULL,
	PURCHASED BOOLEAN NOT NULL,
	QUANTITY INTEGER NOT NULL);

CREATE TABLE CART_PRICE (
	CART_PRICE_ID SERIAL PRIMARY KEY,
	CART_ID INTEGER REFERENCES SHOPPING_CART(ID) NOT NULL,
	TOTAL_PRICE DECIMAL(9,2) NOT NULL);

CREATE TABLE PURCHASES(
	BUYS_ID SERIAL PRIMARY KEY,
	NAME TEXT REFERENCES USERS(NAME) NOT NULL,
	CREDIT_CARD_NUMBER INTEGER NOT NULL,
	PURCHASE_DATE DATE NOT NULL);

