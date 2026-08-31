select
    date_date,
    orders_id,
    pdt_id as products_id,
    revenue,
    quantity
from {{ source('raw', 'sales') }}