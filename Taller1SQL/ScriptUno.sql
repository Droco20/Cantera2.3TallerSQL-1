-- Crea el esquema de tienda.
CREATE SCHEMA store;

USE store;

-- Tabla de proveedores
CREATE TABLE supplier(
     sup_id INT NOT NULL AUTO_INCREMENT,
     sup_name VARCHAR(45) NOT NULL,
     sup_phone VARCHAR(15) NOT NULL,
     sup_email VARCHAR(50) NOT NULL,
     created_at DATETIME NOT NULL,
     updated_at DATETIME NULL,
     deleted_at DATETIME NULL,
     PRIMARY KEY (sup_id)
) ENGINE = InnoDB;

-- Agrega registros a la tabla proveedor.
INSERT INTO
     supplier (sup_name, sup_phone, sup_email, created_at)
VALUES
     (
          'Todo En Tecnologia',
          '66629911',
          'todotec@ventastec.com',
          now()
     );

-----------------------------------------------------------  
-- Tabla producto
CREATE TABLE product(
     prod_id INT NOT NULL AUTO_INCREMENT,
     prod_sup_id INT NOT NULL,
     prod_name VARCHAR(45) NOT NULL,
     prod_description VARCHAR(145) NOT NULL,
     prod_price DOUBLE NOT NULL,
     created_at DATETIME NOT NULL,
     updated_at DATETIME NULL,
     deleted_at DATETIME NULL,
     PRIMARY KEY (prod_id),
     INDEX fk_product_supplier_idx (prod_sup_id ASC) VISIBLE,
     CONSTRAINT fk_product_supplier FOREIGN KEY (prod_sup_id) REFERENCES supplier (sup_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Agrega registros a la tabla producto.
INSERT INTO
     product (
          prod_sup_id,
          prod_name,
          prod_price,
          prod_description,
          created_at
     )
VALUES
     (
          1,
          'TV LED',
          160000,
          'Lo mejor en tecnologia',
          now()
     );

INSERT INTO
     product (
          prod_sup_id,
          prod_name,
          prod_price,
          prod_description,
          created_at
     )
VALUES
     (
          1,
          'Computador',
          30000,
          'Lo mejor en tecnologia',
          now()
     );

INSERT INTO
     product (
          prod_sup_id,
          prod_name,
          prod_price,
          prod_description,
          created_at
     )
VALUES
     (
          1,
          'Nevera',
          250000,
          'Lo mejor en tecnologia',
          now()
     );

INSERT INTO
     product (
          prod_sup_id,
          prod_name,
          prod_price,
          prod_description,
          created_at
     )
VALUES
     (
          1,
          'Celular',
          20000,
          'Lo mejor en tecnologia',
          now()
     );

INSERT INTO
     product (
          prod_sup_id,
          prod_name,
          prod_price,
          prod_description,
          created_at
     )
VALUES
     (
          1,
          'Camara de seguridad',
          3500,
          'Lo mejor en tecnologia',
          now()
     );

INSERT INTO
     product (
          prod_sup_id,
          prod_name,
          prod_price,
          prod_description,
          created_at
     )
VALUES
     (
          1,
          'Panel solar',
          120000,
          'Lo mejor en tecnologia',
          now()
     );

INSERT INTO
     product (
          prod_sup_id,
          prod_name,
          prod_price,
          prod_description,
          created_at
     )
VALUES
     (
          1,
          'Audifonos bt',
          3000,
          'Lo mejor en tecnologia',
          now()
     );

-----------------------------------------------------------
-- Tabla  vendedor
CREATE TABLE seller(
     sel_id INT NOT NULL AUTO_INCREMENT,
     sel_name VARCHAR(45) NOT NULL,
     PRIMARY KEY (sel_id)
) ENGINE = InnoDB;

-- Agrega registros a la tabla vendedor
INSERT INTO
     seller (sel_name)
VALUES
     ('Andres Lopera');

----------------------------------------------------------- 
-- Tabla tipo documento.
CREATE TABLE type_doc(
     type_doc_id INT NOT NULL AUTO_INCREMENT,
     type_doc_ref VARCHAR(2) NULL,
     PRIMARY KEY (type_doc_id)
) ENGINE = InnoDB;

-- Agrega registros a la tabla tipo de documento.
INSERT INTO
     type_doc (type_doc_ref)
VALUES
     ('TI');

INSERT INTO
     type_doc (type_doc_ref)
VALUES
     ('CC');

----------------------------------------------------------- 
-- Tabla  cliente.
CREATE TABLE customer(
     cus_id INT NOT NULL AUTO_INCREMENT,
     cus_type_doc_id INT NOT NULL,
     cus_doc VARCHAR(11) NOT NULL,
     PRIMARY KEY (cus_id),
     UNIQUE INDEX cus_doc_UNIQUE (cus_type_doc_id ASC, cus_doc ASC) INVISIBLE,
     INDEX fk_customer_type_doc1_idx (cus_type_doc_id ASC) VISIBLE,
     CONSTRAINT fk_customer_type_doc1 FOREIGN KEY (cus_type_doc_id) REFERENCES type_doc (type_doc_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Agrega registros a la tabla cliente.
INSERT INTO
     customer (cus_type_doc_id, cus_doc)
VALUES
     (2, '70500448');

INSERT INTO
     customer (cus_type_doc_id, cus_doc)
VALUES
     (1, '1223-6988');

INSERT INTO
     customer (cus_type_doc_id, cus_doc)
VALUES
     (2, '8022365496');

INSERT INTO
     customer (cus_type_doc_id, cus_doc)
VALUES
     (1, '2022-114572');

INSERT INTO
     customer (cus_type_doc_id, cus_doc)
VALUES
     (1, '2021-11145');

-----------------------------------------------------------		 
-- Se crea la tabla Articulo
CREATE TABLE article(
     article_id INT NOT NULL AUTO_INCREMENT,
     article_sale_id INT NOT NULL,
     article_prod_id INT NOT NULL,
     article_quantity VARCHAR(45) NOT NULL,
     PRIMARY KEY (article_id),
     INDEX fk_article_sale_idx (article_sale_id ASC) VISIBLE,
     INDEX fk_article_product_idx (article_prod_id ASC) VISIBLE,
     CONSTRAINT fk_article_sale FOREIGN KEY (article_sale_id) REFERENCES sale (sale_id) ON DELETE CASCADE ON UPDATE CASCADE,
     CONSTRAINT fk_article_product FOREIGN KEY (article_prod_id) REFERENCES product (prod_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Agrega registros a la tabla article.
INSERT INTO
     article (
          article_sale_id,
          article_prod_id,
          article_quantity
     )
VALUES
     (1, 1, 3);

INSERT INTO
     article (
          article_sale_id,
          article_prod_id,
          article_quantity
     )
VALUES
     (1, 4, 1);

INSERT INTO
     article (
          article_sale_id,
          article_prod_id,
          article_quantity
     )
VALUES
     (2, 2, 4);

INSERT INTO
     article (
          article_sale_id,
          article_prod_id,
          article_quantity
     )
VALUES
     (3, 4, 1);

INSERT INTO
     article (
          article_sale_id,
          article_prod_id,
          article_quantity
     )
VALUES
     (4, 3, 4);

INSERT INTO
     article (
          article_sale_id,
          article_prod_id,
          article_quantity
     )
VALUES
     (4, 4, 1);

----------------------------------------------------------- 
-- Tabla venta.
CREATE TABLE sale(
     sale_id INT NOT NULL AUTO_INCREMENT,
     sale_sel_id INT NOT NULL,
     sale_cus_id INT NOT NULL,
     created_at DATETIME NOT NULL,
     deleted_at TIMESTAMP,
     PRIMARY KEY (sale_id),
     INDEX fk_sale_seller_idx (sale_sel_id ASC) VISIBLE,
     INDEX fk_sale_customer_idx (sale_cus_id ASC) VISIBLE,
     CONSTRAINT fk_sale_seller FOREIGN KEY (sale_sel_id) REFERENCES seller (sel_id) ON DELETE RESTRICT ON UPDATE CASCADE,
     CONSTRAINT fk_sale_customer FOREIGN KEY (sale_cus_id) REFERENCES customer (cus_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Agrega registros a la tabla venta.
INSERT INTO
     sale (sale_sel_id, sale_cus_id, created_at)
VALUES
     (1, 1, now());

INSERT INTO
     sale (sale_sel_id, sale_cus_id, created_at)
VALUES
     (1, 2, now());

INSERT INTO
     sale (sale_sel_id, sale_cus_id, created_at)
VALUES
     (1, 3, now());

INSERT INTO
     sale (sale_sel_id, sale_cus_id, created_at)
VALUES
     (1, 3, now());

INSERT INTO
     sale (sale_sel_id, sale_cus_id, created_at)
VALUES
     (1, 3, now());

----------------------------------------------------------- 
-- Realiza los borrados logicos de la tabla venta.
UPDATE
     sale
SET
     deleted_at = now()
WHERE
     sale_id = 1;

UPDATE
     sale
SET
     deleted_at = now()
WHERE
     sale_id = 2;

-- Realiza el borrado fisico de la tabla venta.
DELETE FROM
     sale
WHERE
     sale_id = 3;

DELETE FROM
     sale
WHERE
     sale_id = 4;

-- Modifica el nombre de los productos.
UPDATE
     product
SET
     prod_name = 'Camara Digital',
     prod_sup_id = 2
WHERE
     prod_id = 1;

UPDATE
     product
SET
     prod_name = 'Parlante Stereo',
     prod_sup_id = 1
WHERE
     prod_id = 2;

UPDATE
     product
SET
     prod_name = 'Reloj Digital',
     prod_sup_id = 1
WHERE
     prod_id = 3;