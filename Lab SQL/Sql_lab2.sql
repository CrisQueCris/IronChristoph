Use bank;

-- Query 1 
Select client_id, district_id From client
Where client_id  and
	district_id = 1
order by client_id asc
limit 5;

-- Query 2
Select client_id from client
where district_id = 72
order by client_id desc
limit 1;

-- Query 3
Select amount from loan
order by amount asc
limit 3;

-- Query 4
Select distinct status from loan;

-- Query 5

Select loan_id from loan
order by payments desc
limit 1;

-- Query 6

Select account_id, amount FROM loan
Order by account_id asc
limit 5;

-- Query 7

Select account_id from loan
where duration = 60
order by amount asc
limit 5;

-- Query 8
Select distinct k_symbol from `order`
-- WHERE k_symbol is not Null
;
-- Query 9 
Select order_id from `order`
WHERE Account_id = 34;

-- Query 10

Select distinct account_id from `order`
where order_id between  29540 and 29560;

-- Query 11
Select amount from `order`
Where account_to = 30067122;

-- Query 12

Select trans_id, date, type, amount from trans
where account_id = 793
order by date desc
limit 10;

-- Query 13

Select district_id, count(district_id) from client
WHERE district_id < 10 
Group by district_id
Order by district_id asc;

-- Query 14
Select type, count(type) FROM card
group by type; 

-- query 15

Select account_id, sum(amount) as sum_of_loans from loan
group by account_id
order by sum(amount) desc
limit 10;

-- Query 16

Select date, count(loan_id) from loan
where date < 930907
group by date
order by date desc;

-- Query 17

 select date, duration, count(loan_id) from loan
 where date between 971201 and 971231
 group by date, duration
 order by date asc, duration asc;
 
 -- Query 18
 
 Select account_id, type, sum(amount) from trans
 where account_id = 396
 group by type;
 
 -- Query 19
Select account_id, case when type = 'PRIJEM' then 'INCOMING'
 when type = 'VYDAJ' then 'OUTGOING' end as transaction_type, round(sum(amount), 0) as total_amount from trans
 where account_id = 396
 group by type;
 
-- Query 20
Create View translation as 
Select account_id, case when type = 'PRIJEM' then 'INCOMING'
 when type = 'VYDAJ' then 'OUTGOING' end as transaction_type, round(sum(amount), 0) as total_amount from trans
 where account_id = 396
 group by type;

Update View incoming as 
Select account_id,  
total_amount from translation
where transaction_type = 'INCOMING';

UPdate VIEW outgoing as 
Select account_id, total_amount,
from translation
where transaction_type = 'OUTGOING';

Select incoming.account_id, incoming.total_amount as incoming, outgoing.total_amount  as outgoing,
incoming.total_amount - outgoing.total_amount as difference from incoming 
join outgoing on incoming.account_id = outgoing.account_id

-- Query 21





