create table inventory(
Date	date	not null,
Product	varchar(10),	
Warehouse	varchar(50),	
Supplier	varchar(50),	
Opening_Stock	int,	
Inward	int,	
Outward	int,	
Closing_Stock	int,	
Lead_Time_Days	int	
)

select * from inventory;

--product below reorder level
select product,warehouse,date,closing_stock
from inventory
where closing_stock<500;

--avg lead time
select supplier,avg(lead_time_days) as average_leadtime
from inventory
group by supplier;

--stock utilization
select warehouse,sum(outward)*100.0/nullif(sum(opening_stock+inward),0) as utilization_per
from inventory
group by warehouse;

--net stock movement
select to_char(date,'yyyy-mm')as month,
sum(inward-outward) as netstock
from inventory
group by to_char(date,'yyyy-mm') order by month;
