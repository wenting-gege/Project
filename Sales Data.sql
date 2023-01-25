-- inspecting Data 

SELECT * FROM sales.sales_data_sample;

-- checking unique value
select distinct `status` from sales.sales_data_sample;
select distinct `year_id` from sales.sales_data_sample;
select distinct `PRODUCTLINE` from sales.sales_data_sample;
select distinct `COUNTRY` from sales.sales_data_sample;
select distinct `DEALSIZE` from sales.sales_data_sample;
select distinct `TERRITORY` from sales.sales_data_sample;

-- Analysis
-- let's start by grouping sales by productline
select `PRODUCTLINE`, sum(sales) as Revenue 


from sales.sales_data_sample
group by PRODUCTLINE
order by 2 desc ;

select `YEAR_ID`,sum(sales) as Revenue
from sales.sales_data_sample
group by YEAR_ID
order by 2 desc;

select `DEALSIZE`,sum(sales) as Revenue
from sales.sales_data_sample
group by DEALSIZE
order by 2 desc;


-- what was the best month for sales in a specific year? how much was earned that month?
select `MONTH_ID`, sum( sales) as Revenue, count(ORDERNUMBER) as Frequency
from sales.sales_data_sample
where YEAR_ID=2004   -- change year to see the rest
group by MONTH_ID
order by 2 desc;

-- November seems to be the month, what product do they sell in November, classic I belive
select `MONTH_ID`, sum( sales) as Revenue, count(ORDERNUMBER) as Frequency
from sales.sales_data_sample
where YEAR_ID=2004  and  MONTH_ID=11 -- change year to see the rest
group by MONTH_ID, PRODUCTLINE
order by 3 desc;

-- who is our best customer (this could be best answered with RFM)
select
`CUSTOMERNAME`,
sum(sales) as MonetaryValue,
avg(sales) as AvgMonetaryValue,
count(ORDERNUMBER) as Frequency,
max(ORDERDATE)as Last_order_date,
(select max(ORDERDATE) from sales.sales_date_sample as Max_order_date,
TIMEDIFF(max(ORDERDATE), max(ORDERDATE))

from sales.sales_date_sample
group by CUSTOMERNAME;









 
 
 
 
 
 


 
 
 





