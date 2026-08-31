select
    s.date_date,
    s.orders_id,
    s.products_id,
    s.revenue,
    s.quantity,
    round(s.quantity * p.purchase_price, 2) as purchase_cost,
    round(s.revenue - (s.quantity * p.purchase_price), 2) as margin
from {{ ref('stg_sales') }} as s
left join {{ ref('stg_product') }} as p
  on s.products_id = p.products_id