-- Which brand offerst the most affordable smartphones on average?
select 
	brand,
	round(avg(final_price), 2) average_price
from smartphones s
group by brand
order by avg(final_price)
limit 1;

-- What are the top 5 most frequently sold models, and what are their average prices?
select 
	brand,
	model,
	count(*) sales_count,
	concat(min(final_price),'-',max(final_price)) as price_range,
	round(avg(final_price), 2) average_price
from smartphones s
group by brand, model
order by sales_count desc
limit 5;

-- How does each brand's price range vary across their models?
select 
	brand,
	count(model) number_of_models,
	concat(min(final_price), '-', max(final_price)) price_range,
	max(final_price) - min(final_price) price_spread,
	round(stddev(final_price)/avg(final_price), 2) price_cv
from smartphones s 
group by brand
order by price_cv desc;