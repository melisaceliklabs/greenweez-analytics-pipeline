select
    products_id,
    purchSE_PRICE as purchase_price
from {{ source('raw', 'product') }}