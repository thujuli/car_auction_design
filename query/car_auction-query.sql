-- 1. Transactional query
-- 1.1 Mencari mobil keluaran 2015 keatas
select product_id,
	brand,
	model,
	year,
	price
from products
where year >= 2015
order by year asc;

-- 1.2 Menambahkan satu data bid produk baru
select * from bids;
insert into bids(bid_id, ad_id, customer_id, date_bid, price_bid, status_bid)
values(101, 19, 20, '2022-05-16', 130000000, default);

-- 1.3. Melihat semua mobil yang dijual oleh akun Marsito Hassanah
--		urutkan berdasarkan date_post terbaru
select p.product_id,
	p.brand,
	p.model,
	p.year,
	p.price,
	a.date_post
from products p
join ads a
	using(product_id)
join sellers s
	using(seller_id)
where s.first_name = 'Marsito' and s.last_name = 'Hassanah'
order by date_post desc;

-- 1.4 Mencari mobil bekas termurah berdasarkan keyword "Yaris"
select product_id, 
	brand,
	model,
	year,
	price
from products
where model ilike '%yaris%'
order by price asc;

-- 1.5

-- 2. Analytical Query
-- 2.1 Ranking popularitas model mobil berdasrkan jumlah bid
select model, 
	product_id,
	bid_id, 
	ad_id
from products p
join ads a
	using(product_id)
join bids b
	using(ad_id);	
	
select * from ads
join bids
	using(ad_id);
	
select p.model, 
	count(a.product_id) as count_product
from products p
join ads a
	using(product_id)
group by p.model;