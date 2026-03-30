SET PAGESIZE 100
SET LINESIZE 200
SET FEEDBACK ON
SET DEFINE OFF

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

CONNECT XUANTINH/XUANTINH
SHOW USER

PROMPT
PROMPT ===== C1 =====
-- 1) Ten, ma khach hang. Dat ten cot: Ten khach hang, Ma khach hang.
SELECT name AS "Ten khach hang",
       id   AS "Ma khach hang"
FROM s_customer
ORDER BY id DESC;

PROMPT
PROMPT ===== C2 =====
-- 2) Hien thi ho ten (noi bang ||) va ma phong cua nhan vien phong 10, 50.
SELECT first_name || ' ' || last_name AS Employees,
       dept_id
FROM s_emp
WHERE dept_id IN (10, 50)
ORDER BY first_name;

PROMPT
PROMPT ===== C3 =====
-- 3) Tat ca nhan vien co ten chua chu "S".
SELECT id,
       first_name,
       last_name
FROM s_emp
WHERE UPPER(first_name) LIKE '%S%'
   OR UPPER(last_name) LIKE '%S%'
ORDER BY id;

PROMPT
PROMPT ===== C4 =====
-- 4) Userid va ngay bat dau lam viec trong khoang 14/05/1990 -> 26/05/1991.
SELECT userid,
       start_date
FROM s_emp
WHERE start_date BETWEEN TO_DATE('14/05/1990','DD/MM/YYYY')
                     AND TO_DATE('26/05/1991','DD/MM/YYYY')
ORDER BY start_date;

PROMPT
PROMPT ===== C5 =====
-- 5) Ten nhan vien va luong trong khoang 1000 -> 2000/thang.
SELECT first_name || ' ' || last_name AS employee_name,
       salary
FROM s_emp
WHERE salary BETWEEN 1000 AND 2000
ORDER BY salary;

PROMPT
PROMPT ===== C6 =====
-- 6) Nhan vien phong 31, 42, 50 co luong > 1350.
-- Dat ten cot: "Emloyee Name" va "Monthly Salary" (giu dung theo de bai).
SELECT first_name || ' ' || last_name AS "Emloyee Name",
       salary AS "Monthly Salary"
FROM s_emp
WHERE dept_id IN (31, 42, 50)
  AND salary > 1350
ORDER BY salary DESC;

PROMPT
PROMPT ===== C7 =====
-- 7) Ten va ngay bat dau lam viec cua nhan vien duoc thue trong nam 1991.
SELECT first_name || ' ' || last_name AS employee_name,
       start_date
FROM s_emp
WHERE EXTRACT(YEAR FROM start_date) = 1991
ORDER BY start_date;

PROMPT
PROMPT ===== C8 =====
-- 8) Ho ten tat ca nhan vien khong phai la nguoi quan ly.
SELECT first_name || ' ' || last_name AS employee_name
FROM s_emp
WHERE id NOT IN (
    SELECT manager_id
    FROM s_emp
    WHERE manager_id IS NOT NULL
)
ORDER BY 1;

PROMPT
PROMPT ===== C9 =====
-- 9) Tat ca san pham co ten bat dau bang Pro, sap xep ABC.
SELECT name
FROM s_product
WHERE UPPER(name) LIKE 'PRO%'
ORDER BY name;

PROMPT
PROMPT ===== C10 =====
-- 10) Ten san pham va SHORT_DESC co chua tu "bicycle".
SELECT name,
       short_desc
FROM s_product
WHERE LOWER(short_desc) LIKE '%bicycle%'
ORDER BY name;

PROMPT
PROMPT ===== C11 =====
-- 11) Hien thi tat ca SHORT_DESC.
SELECT short_desc
FROM s_product;

PROMPT
PROMPT ===== C12 =====
-- 12) Ten nhan vien va chuc vu trong ngoac don: Ho Ten (Chuc vu tieng Viet).
SELECT last_name || ' ' || first_name || ' (' ||
       CASE title
         WHEN 'President' THEN 'Giam doc'
         WHEN 'VP Sales' THEN 'Pho giam doc kinh doanh'
         WHEN 'Sales Representative' THEN 'Nhan vien kinh doanh'
         WHEN 'Warehouse Manager' THEN 'Quan ly kho'
         WHEN 'Clerk' THEN 'Nhan vien'
         ELSE title
       END || ')' AS employee_info
FROM s_emp
ORDER BY 1;

EXIT

PROMPT ===== C11 =====
SELECT last_name || ' ' || first_name || ' (' ||
       CASE title
         WHEN 'President' THEN 'Giám đốc'
         WHEN 'VP Sales' THEN 'Phó giám đốc kinh doanh'
         WHEN 'Sales Representative' THEN 'Nhân viên kinh doanh'
         WHEN 'Warehouse Manager' THEN 'Quản lý kho'
         WHEN 'Clerk' THEN 'Nhân viên'
         ELSE title
       END || ')' AS employee_info
FROM s_emp
ORDER BY 1;
