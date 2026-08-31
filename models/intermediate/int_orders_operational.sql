select
    o.orders_id,
    o.date_date,
    o.revenue,
    o.quantity,
    o.purchase_cost,
    o.margin,
    s.shipping_fee,
    s.log_cost,
    s.ship_cost,
    round(
        o.margin + s.shipping_fee - s.log_cost - s.ship_cost
    , 2) as operational_margin
from {{ ref('int_orders_margin') }} as o
left join {{ ref('stg_ship') }} as s
  on o.orders_id = s.orders_id