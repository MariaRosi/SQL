select s.SaleDate, s.Amount, p.Salesperson, s.SPID, p.SPID
from sales as s
join people as p 
on p.SPID = s.SPID;

select s.SaleDate, s.Amount, pr.Product
from sales as s
left join products as pr
on pr.PID = s.PID;

select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
from sales as s
join people as p on p.SPID = s.SPID
join products as pr on pr.PID = s.PID;

select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team, gr.Geo
from sales as s
join people as p on p.SPID = s.SPID
join products as pr on pr.PID = s.PID
join geo as gr on gr.GeoID = s.GeoID
where s.Amount < 500
and p.Team = 'Delish'
and gr.Geo in ('New Zealand', 'India')
order by s.SaleDate
