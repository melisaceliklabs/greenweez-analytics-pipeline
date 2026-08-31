select
    orders_id,
    shipping_fee,
    logCost as log_cost,
    cast(ship_cost as float64) as ship_cost
from {{ source('raw', 'ship') }}