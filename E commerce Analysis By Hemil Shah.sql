select * from customers
where customer_state  not in ('MG','SP','SC')

select * from orders
where order_status ='canceled'

select * from payments
where payment_type='UPI' and payment_value>= 500 and payment_installments =1

select * from payments
where payment_value between 150 and 200
order by payment_value 

select customer_city from customers
where customer_city like 'r%'

select * from payments
where payment_installments = 1
order by payment_value desc

select top 5 * from payments

select round(sum(payment_value),2) as 'Total Payments'from payments

select avg(payment_value) as 'Average Payment value' from payments

select count(customer_id) as 'Total Customers' from customers 

select count(distinct(customer_city)) as 'Total Cities' from customers

select seller_city,len(trim(seller_city)) from sellers

select upper(seller_city) from sellers

select seller_city,replace(seller_city,'CURITIBA','AHMEDABAD') as 'replaced city' from sellers

select seller_city +'-' +seller_state from sellers
select CONCAT(seller_city ,'-', seller_state) as 'City and state' from sellers

SELECT 
    order_delivered_customer_date,
    DAY(order_delivered_customer_date) AS 'Day',
    MONTH(order_delivered_customer_date) AS 'MonthNumber',
    FORMAT(order_delivered_customer_date, 'MMMM') AS 'MonthName',
    YEAR(order_delivered_customer_date) AS 'Year'
FROM 
    orders;
	


select distinct(year(order_delivered_customer_date)) as 'year'
from orders

SELECT 
    DATEDIFF(day, orders.order_delivered_customer_date, orders.order_estimated_delivery_date) AS 'DifferenceInDays'
FROM 
    orders;

select payment_value,ceiling(payment_value) as 'upper bound'from payments

select * from orders
where orders.order_delivered_customer_date is null



select upper(orders.order_status) as 'order status'
,count(orders.order_status) as 'Count of Order Status' 
from orders
group by orders.order_status
order by count(orders.order_status) desc



select payment_type,round(avg(payments.payment_value),2) as 'Avg payment by payment method'
from payments
where payment_installments <= 4 
group by payment_type



select payment_type,round(avg(payments.payment_value),2) as 'Avg payment by payment method'
from payments
where payment_value > 100
group by payment_type



select customers.customer_id,order_status 
from customers join orders
on customers.customer_id = orders.customer_id
where order_status = 'shipped'



select year(orders.order_delivered_customer_date) as 'Year',
(round(sum(payments.payment_value),1))   as 'Total payment per year ',
(round(sum(payments.payment_value),1)*100/(select sum(payments.payment_value) from payments))  as 'Percentage from Total payment per year '
from orders join payments
on payments.order_id = orders.order_id
group by year(orders.order_delivered_customer_date)
order by year(orders.order_delivered_customer_date)



select Top 5 product_category,sum(payment_value) as 'Total Payment Value',
(sum(payment_value)*100/(select sum(payments.payment_value) from payments)) as 'Percentage from Total Payment Value'
from products join order_items
on order_items.product_id = products.product_id
join payments
on order_items.order_id = payments.order_id
group by product_category
order by sum(payment_value) desc






































































































































































