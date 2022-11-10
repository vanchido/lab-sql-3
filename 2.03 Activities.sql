select bd.A1 as district_code, bd.A2 as district_name, bd.A3 as region,
bd.A4 as nb_inhabitants, bd.A5 as muni_inhab_more_499,
bd.A6 as muni_inhab_500_1999, bd.A7 as muni_inhab_2000_9999,
bd.A8 as muni_inhab_more_10000, bd.A9 as nb_cities, bd.A10 as ratio_urban_inhab,
bd.A11 as avg_salary, bd.A12 as unemploy_95, bd.A13 as unemploy_96,
bd.A14 as enterpreneurs_per_1000_inhabs, 
bd.A15 as commited_crimes_95, bd.A16 as commited_crimes_96
from bank.district as bd;

#data_2.02_activities

#2.02_activity_2

select A2 as district_name, A11 as average_salary 
from bank.district 
where A11 > '10000';

select * from bank.loan 
where status = 'B'; 
#'B' stands for contract finished, loan not paid

select * from bank.card 
where type = 'junior'
limit 10;

#2.02_activity_3

select * from bank.card 
order by issued desc; 
#find last year = 1998

select * from bank.trans
where trans.type = 'VYDAJ' #trans.type = 'VYDAJ' for withdrawal
and trans.operation != 'VYBER' #trans.operation = 'VYBER' is withdrawal in cash
limit 10;

select loan_id, account_id, amount as debt_value from bank.loan 
where status = 'B'
and amount > '1000'
order by amount desc; 

#2.02_activity_4

select * from bank.trans
order by amount asc;
select max(amount) from bank.trans;
select min(amount) from bank.trans;

select *, date_format(convert(date,date), '%Y') as opening_year from bank.account;

#data_2.03_activities

#2.03_activity_1

select *, date_format(convert(left(issued,6),date), '%Y') as year_issued
from bank.card
where type = 'gold'
order by issued asc; #first gold card issued in 1995

select *, date_format(convert(left(issued,6),date), '%M %D,%Y') as date_issued
from bank.card;

select *, date_format(convert(left(issued,6),date), '%d of %M of %Y') as fecha_emision
from bank.card;

#2.03_activity_3

select count(*) from bank.trans
where amount is null;

select count(nullif(trim(k_symbol),'')) as empty_k_symbol, #count empty if k_symbol is null or = ' '
count(amount)-count(nullif(trim(k_symbol),'')) as non_empty_k_symbol #(total transactions) - (empty k_symbol) = (non-empty k_symbol)
from bank.trans;