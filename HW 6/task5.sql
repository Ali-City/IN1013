SELECT restStaff.first_name, restStaff.surname, restBill.bill_date, COUNT(restBill.bill_no) AS bill_count
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
GROUP BY restBill.bill_date, restStaff.staff_no
HAVING COUNT(restBill.bill_no) >= 2;

SELECT restRest_table.room_name, COUNT(*) AS table_count
FROM restRest_table
WHERE restRest_table.no_of_seats > 6
GROUP BY restRest_table.room_name;

SELECT restRest_table.room_name, SUM(restBill.bill_total) AS total_bills
FROM restBill
JOIN restRest_table ON restBill.table_no = restRest_table.table_no
GROUP BY restRest_table.room_name;

SELECT headwaiter_table.first_name, headwaiter_table.surname, SUM(restBill.bill_total) AS total_bill_amount
FROM restBill
JOIN restStaff AS waiter_table ON restBill.waiter_no = waiter_table.staff_no
JOIN restStaff AS headwaiter_table ON waiter_table.headwaiter = headwaiter_table.staff_no
GROUP BY headwaiter_table.staff_no
ORDER BY total_bill_amount DESC;

SELECT restBill.cust_name
FROM restBill
GROUP BY restBill.cust_name
HAVING AVG(restBill.bill_total) > 400;

SELECT restStaff.first_name, restStaff.surname, COUNT(restBill.bill_no) AS bill_count
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
GROUP BY restBill.bill_date, restStaff.staff_no
HAVING COUNT(restBill.bill_no) >= 3;

