create table Production_OEE(
Date	date	not null,
Shift	int,	
Machine_No	int,	
Product	varchar(10),	
Operator	varchar(10),	
Planned_Time_Min	int,	
Run_Time_Min	int,	
Downtime_Min	int,	
Qty_Produced	int,	
Scrap	int,	
Standard_Rate	int	);

select * from Production_OEE;

-- Availability%
select machine_no,sum(run_time_min)*100.0/sum(planned_time_min) as availability
from Production_OEE
group by machine_no;

--Performance %
select machine_no,sum(qty_produced)*60.0/sum(run_time_min*standard_rate) as performance
from Production_OEE
group by machine_no;

--Quality%
select machine_no,(sum(qty_produced-scrap))*100.0/sum(qty_produced) as quantity
from Production_OEE
group by machine_no;

--Scrap
select operator,sum(scrap) as totalscrap 
from Production_OEE
group by operator;
