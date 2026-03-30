SET PAGESIZE 100
SET LINESIZE 220
SET FEEDBACK ON
SET DEFINE OFF

CONNECT XUANTINH/XUANTINH
SHOW USER

PROMPT
PROMPT ===== BAI 4 - C1 =====
-- 1) Ten san pham, ma san pham, so luong trong don hang ma 101
SELECT p.name AS product_name,
       p.id   AS product_id,
       i.quantity AS ORDERED
FROM s_item i
JOIN s_product p ON p.id = i.product_id
WHERE i.ord_id = 101
ORDER BY p.id;

PROMPT
PROMPT ===== BAI 4 - C2 =====
-- 2) Ma khach hang va ma don hang cua tat ca khach hang
-- Ke ca khach hang chua dat hang
SELECT c.id AS customer_id,
       o.id AS order_id
FROM s_customer c
LEFT JOIN s_ord o ON o.customer_id = c.id
ORDER BY c.id;

PROMPT
PROMPT ===== BAI 4 - C3 =====
-- 3) Ma khach hang, ma san pham, so luong dat hang
-- Cac don hang co tri gia tren 100000
SELECT o.customer_id,
       i.product_id,
       i.quantity
FROM s_ord o
JOIN s_item i ON i.ord_id = o.id
WHERE o.total > 100000
ORDER BY o.customer_id, i.product_id;

EXIT
