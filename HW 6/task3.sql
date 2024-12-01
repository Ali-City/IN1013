SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
WHERE restBill.cust_name = 'Tanya Singh';

SELECT restRoom_management.room_date
FROM restRoom_management
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles' AND restRoom_management.room_name = 'Green'
  AND restRoom_management.room_date BETWEEN 160201 AND 160229;

SELECT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.headwaiter = (
    SELECT headwaiter FROM restStaff WHERE first_name = 'Zoe' AND surname = 'Ball'
);

SELECT restBill.cust_name, restBill.bill_total, restStaff.first_name AS waiter_name
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
WHERE restStaff.headwaiter IN (
    SELECT headwaiter
    FROM restStaff
    WHERE staff_no IN (SELECT waiter_no FROM restBill WHERE bill_no IN (00014, 00017))
);

SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restStaff
JOIN restRoom_management ON restStaff.staff_no = restRoom_management.headwaiter 
  OR restStaff.headwaiter = restRoom_management.headwaiter
WHERE restRoom_management.room_name = 'Blue' AND restRoom_management.room_date = 160312;
