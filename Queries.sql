/* Patient table */
Select * from patient_table;

/* Patient information table */
select * from info_table;

/* Appointments table */
Select * from appointment_table;

/* Payments table */
Select * from payment;

/* Bill table */
Select * from Bill;

/* Specialists table */
Select * from specialist_table;

/* Specialists patients table */
select patient_table.pid, info_table.pname, info_table.pNumber from patient_table inner
join info_table on patient_table.pid=info_table.pid where patient_table.specialist='y';

/* Over 200 table */
select payment.pid, payment.price, bill.payment_due from payment
inner join bill on payment.pid=bill.pid where payment.price > 200;

/* Unpaid table */
select info_table.pid, info_table.pname, info_table.pnumber, payment.price from 
info_table inner join payment on info_table.pid=payment.pid inner join payment on 
info_table.pid=payment.pid where payment.paid='n';

/* Appointments this month table */
select * from appointment_table where app_date < "2021-03-01" and app_date > '2021-01-30';

/* Children table */
select * from info_table where dob > '2004-01-01';

/* Overdue  table */
select pid, payment_due, price from bill where payment_due < '2021-02-01' and paid = "n";