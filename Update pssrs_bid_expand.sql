update pssrs_bid_expand as bid 
set level0 = ph.level0, level1 = ph.level1, level2 = ph.level2,level3 = ph.level3,level4 = ph.level4,level5 = ph.level5
from pssrs_product_hierarchy ph
where bid.machine_type = ph.machine_type and bid.machine_model = ph.machine_model;

update pssrs_bid_expand as bid 
set level0 = ph.level0, level1 = ph.level1, level2 = ph.level2,level3 = ph.level3,level4 = ph.level4,level5 = ph.level5
from pssrs_product_hierarchy ph
where bid.level5 is null and trim(bid.material_no) = trim(ph.level5);

update pssrs_bid_expand as bid 
set level0 = ph.level0, level1 = ph.level1, level2 = ph.level2,level3 = ph.level3,level4 = ph.level4,level5 = ph.level5
from pssrs_product_hierarchy_add ph
where bid.level5 is null and trim(bid.price_material) = trim(ph.level5);

update pssrs_bid_expand as bid 
set level0 = ph.level0, level1 = ph.level1, level2 = ph.level2,level3 = ph.level3,level4 = ph.level4,level5 = ph.level5
from pssrs_product_hierarchy ph
where bid.level5 is null and trim(bid.price_material) = trim(ph.level5);

update pssrs_bid_expand as bid 
set level0 = ph.level0, level1 = ph.level1, level2 = ph.level2,level3 = ph.level3,level4 = ph.level4,level5 = ph.level5
from pssrs_product_hierarchy ph
where bid.level5 is null and trim(bid.machine_type) = trim(ph.machine_type);

update pssrs_bid_expand as bid 
set level0 = ph.level0, level1 = ph.level1, level2 = ph.level2,level3 = ph.level3,level4 = ph.level4,level5 = ph.level5
from pssrs_product_hierarchy_add ph
where bid.level5 is null and trim(bid.material_no) = trim(ph.level5);


update pssrs_bid_expand set so_lead_time = extract(day from t1_sales_date - invoice_date);

update pssrs_bid_expand set sellout_week = CAST(EXTRACT(WEEK FROM t1_sales_date) as integer) % 13;
update pssrs_bid_expand set sellout_week = sellout_week + 13 where sellout_week = 0;
update pssrs_bid_expand set usd_amount = invoice_amount where invoice_crcy = 'USD';

update pssrs_bid_expand set usd_amount = invoice_amount/8.4 where invoice_crcy = 'CNY' and INVOICE_DATE <= '2017-01-01';
update pssrs_bid_expand set usd_amount = invoice_amount/6.8966 where invoice_crcy = 'CNY' and INVOICE_DATE >= '2017-01-01' and INVOICE_DATE <= '2017-03-31';
update pssrs_bid_expand set usd_amount = invoice_amount/6.8935 where invoice_crcy = 'CNY' and INVOICE_DATE >= '2017-04-01' and INVOICE_DATE <= '2017-06-30';
