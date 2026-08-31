select
    orders_id,
    shipping_fee,
    logCost as log_cost,
    ship_cost
from {{ source('raw', 'ship') }}