with orders_per_day as (
    select
        date_date,
        count(distinct orders_id) as nb_transactions,
        round(sum(revenue), 0) as revenue,
        round(sum(margin), 0) as margin,
        round(sum(operational_margin), 0) as operational_margin,
        round(sum(purchase_cost), 0) as purchase_cost,
        round(sum(shipping_fee), 0) as shipping_fee,
        round(sum(log_cost), 0) as log_cost,
        round(sum(ship_cost), 0) as ship_cost,
        sum(quantity) as quantity
    from {{ ref('int_orders_operational') }}
    group by date_date
)

select
    date_date,
    nb_transactions,
    revenue,
    margin,
    operational_margin,
    purchase_cost,
    shipping_fee,
    log_cost,
    ship_cost,
    quantity,
    round(revenue / nullif(nb_transactions, 0), 2) as average_basket
from orders_per_day
order by date_date desc