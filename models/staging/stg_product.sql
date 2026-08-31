select
    products_id,
    cast(purchSE_PRICE as float64) as purchase_price
from {{ source('raw', 'product') }}