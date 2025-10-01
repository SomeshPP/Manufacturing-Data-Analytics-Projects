create table manufacturing_data(
Date	date	not null,
Shift	int,	
Machine_No	int,	
Product_ID	varchar(20),	
Operator	varchar(20),	
Qty_Produced	int,	
Defects	int,	
Breakdown_Min	int
)

drop table manufacturing_data

select * from manufacturing_data

-- Total Production
select product_id,sum(qty_produced) as Totalproduction 
from manufacturing_data
group by product_id;

--Total Defect
select product_id,sum(defects)
from manufacturing_data
group by product_id;

-- Product Defect%
select product_id,sum(defects)*100.0 / sum(qty_produced) as Defect_percentage
from manufacturing_data
group by product_id;

--Shiftwise Defect%
select shift,sum(defects)*100.0 / sum(qty_produced) as Defect_percentage
from manufacturing_data
group by shift;

--operator Performance
select operator,sum(defects) as total_defects
from manufacturing_data
group by operator;

--operator Performance by %
select operator,sum(defects)*100.0 / sum(qty_produced) as Defect_percentage
from manufacturing_data
group by operator;

--machine breakdown
select machine_no,sum(breakdown_min) as breakdown_minutes
from manufacturing_data
group by machine_no;

--day defects
select date,sum(defects)
from manufacturing_data
group by date
order by date;

--monthly defects
select to_char(date,'yyyy-mm') as Month, sum(defects) 
from manufacturing_data
group by to_char(date,'yyyy-mm')
order by month;

--monthly defects%
select to_char(date,'yyyy-mm') as Month, 
sum(defects)*100.0 / sum(qty_produced) as Defect_percentage
from manufacturing_data
group by to_char(date,'yyyy-mm')
order by month;