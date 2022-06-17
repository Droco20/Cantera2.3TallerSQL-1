-- 1. Consulta SQL donde pueda obtener los productos vendidos digitando tipo de documento y numero.
SELECT
     type_doc.type_doc_ref as 'Tipo de Documento',
     customer.cus_doc as 'Documento Nro',
     product.prod_name as 'Compra'
FROM
     product
     JOIN article ON article.article_prod_id = product.prod_id
     JOIN sale ON sale.sale_id = article.article_sale_id
     JOIN customer ON customer.cus_id = sale.sale_cus_id
     JOIN type_doc ON type_doc.type_doc_id = customer.cus_type_doc_id
WHERE
     cus_type_doc_id = 2
     AND cus_doc = '70500448';

-- 2. Consultar productos por medio del nombre y mostrar el proveedor.
SELECT
     prod_name as 'Articulo',
     sup_name as 'Distribuye'
FROM
     supplier
     JOIN product ON product.prod_sup_id = supplier.sup_id
WHERE
     prod_name = 'Celular';

-- [PLUS] crear una consulta que permita ver que priducto ha sido el mas vendido y que cantidades de mayor a menor
SELECT
     product.prod_name as 'Articulo',
     SUM(article.article_quantity) as 'Más Vendido'
FROM
     article
     JOIN product ON product.prod_id = article.article_prod_id
GROUP BY
     article.article_prod_id
ORDER BY
     SUM(article.article_quantity) DESC;