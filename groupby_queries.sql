select s.GeoID, sum(s.Amount), avg(s.Amount), sum(s.Boxes)
from sales as s
group by s.GeoID
order by s.GeoID;

select gr.Geo, sum(s.Amount), avg(s.Amount), sum(s.Boxes)
from sales as s
join geo as gr on gr.GeoID = s.GeoID
group by gr.Geo
order by gr.Geo;

