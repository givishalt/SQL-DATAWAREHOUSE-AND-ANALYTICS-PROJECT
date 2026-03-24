--checking top 1000 records of all crm and erp tables for data exploration

SELECT TOP (1000) *
  FROM [bronze].[crm_cust_info]

SELECT TOP (1000)*
  FROM [bronze].[crm_sales_details]

SELECT TOP (1000) *
  FROM [bronze].[prd_info]

select top 1000 * from bronze.erp_cust_az12;
select top 1000 * from bronze.erp_loc_a101
select top 1000 *from bronze.erp_px_cat_g1v2

/*
====================================================================================================================================================
creating store procedure for  inserting all the data into the bronze layer */
create procedure  bronze.load_bronze as
begin 

       declare @start_time datetime , @end_time datetime       


begin try
print 'Loading the bronze layers CRM TABLES ';
--insert values in the table 

set @start_time = getdate();

print'truncate the table bronze.crm_cust_info'
Truncate table bronze.crm_cust_info

print 'Insert Values In Insert bronze.crm_cust_info'
bulk insert bronze.crm_cust_info
from 'C:\Users\lenovo\Downloads\dbc9660c89a3480fa5eb9bae464d6c07 (1)\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
with (firstrow=2 ,
      fieldterminator=',',
      tablock)

set @end_time= getdate()

--check inserted values in the table
---select * from bronze.crm_cust_info

set @start_time = getdate();

truncate table bronze.prd_info


print 'Insert Values in bronze.prd_info'
bulk insert bronze.prd_info
from 'C:\Users\lenovo\Downloads\dbc9660c89a3480fa5eb9bae464d6c07 (1)\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with ( firstrow=2,
      fieldterminator=',',
      tablock)

--check inserted values in the table
--select * from bronze.prd_info

set @start_time = getdate();


print'truncate the table bronze.crm_sales_details'
truncate table  bronze.crm_sales_details

print ' Insert Values in bronze.crm_sales_details'
bulk insert bronze.crm_sales_details
from 'C:\Users\lenovo\Downloads\dbc9660c89a3480fa5eb9bae464d6c07 (1)\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with ( firstrow=2,
fieldterminator=',',
tablock);
set @end_time= getdate()



print'Loading the bronze layers erp TABLES';
--check inserted values in the table
--select * from bronze.crm_sales_details

set @start_time = getdate();

print'truncate the table bronze.erp_loc_a101'
truncate table bronze.erp_loc_a101

print'Insert Values in bronze.erp_loc_a101'
bulk insert bronze.erp_loc_a101
from 'C:\Users\lenovo\Downloads\dbc9660c89a3480fa5eb9bae464d6c07 (1)\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
with ( firstrow= 2,
fieldterminator=',',
tablock);
set @end_time= getdate()

--check inserted values in the table
--select * from bronze.erp_loc_a101

set @start_time = getdate();


print'Truncate the table bronze.erp_cust_az12'
truncate table bronze.erp_cust_az12

print'Insert Values in bronze.erp_cust_az12'
bulk insert bronze.erp_cust_az12
from 'C:\Users\lenovo\Downloads\dbc9660c89a3480fa5eb9bae464d6c07 (1)\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
with ( firstrow=2,
 fieldterminator=',',
 tablock);

 set @end_time= getdate()

--check inserted values in the table
--select * from bronze.erp_cust_az12

set @start_time = getdate();


print'Truncate the table bronze.erp_px_cat_g1v2'
truncate table bronze.erp_px_cat_g1v2

print'Insert values in bronze.erp_px_cat_g1v2'
bulk insert bronze.erp_px_cat_g1v2
from 'C:\Users\lenovo\Downloads\dbc9660c89a3480fa5eb9bae464d6c07 (1)\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
with ( firstrow=2,
fieldterminator=',',
tablock)
set @end_time= getdate()

print' Load Duration ' + cast(datediff(second ,@start_time , @end_time ) as nvarchar) + 'seconds'


end try
 
begin catch

print'error occured during loading bronze layer';
print'error message '+ error_message();
print 'error message' + cast ( error_number () as nvarchar);
print'error message'+ cast ( error_state() as nvarchar)


end catch 
end 


exec bronze.load_bronze
