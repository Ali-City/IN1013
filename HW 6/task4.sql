SELECT DISTINCT restBill.cust_name
FROM restBill
JOIN restRoom_management ON restBill.table_no IN (SELECT table_no FROM restRest_table WHERE room_name = restRoom_management.room_name)
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles' AND restBill.bill_total > 450.00;

SELECT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.staff_no = (
    SELECT restRoom_management.headwaiter
    FROM restRoom_management
    WHERE restRoom_management.room_date = 160111
    LIMIT 1
);

SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

SELECT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.staff_no NOT IN (SELECT DISTINCT waiter_no FROM restBill);

SELECT restBill.cust_name, restStaff.first_name AS headwaiter_first, restStaff.surname AS headwaiter_surname, restRoom_management.room_name
FROM restBill
JOIN restRoom_management ON restBill.table_no IN (SELECT table_no FROM restRest_table WHERE room_name = restRoom_management.room_name)
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restBill.bill_total = (SELECT MAX(bill_total) FROM restBill);
