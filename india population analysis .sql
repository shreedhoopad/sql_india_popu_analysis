use analysis_db;
show tables;


-- retrieve all the columns from tables:

select * from dataset1;

select* from dataset2;

-- number  of rows in datasets:

select count(*) from dataset1;

select count(*) from dataset2;

-- unique district from the dataset

select distinct(District) from dataset1;

-- dataset for jharkhand and gujarat

select * from dataset1 where state in ('jharkhand' , 'gujarat');

-- total population of india

select* from dataset2;
select sum(population) as population from dataset2;

-- find the average growth of india:

select  state,avg(growth)*100 as india_growth from  dataset1 group by state;

-- find the state who has highest sex ratio:

select  state,avg(Sex_Ratio)*100 as india_sex_ratio from  dataset1 group by state
 order by india_sex_ratio desc;
 
 -- find the state who has minimum average literacy rate:
 
 select  state,round( avg(literacy)) as india_literacy from  dataset1 group by state
 order by india_literacy asc;
 
 -- find the  three top most state having maximum average growth:
 
 select  state,avg(growth)*100 as india_growth from  dataset1 group by 
 state order by  india_growth desc limit 3;
 
 
 
 