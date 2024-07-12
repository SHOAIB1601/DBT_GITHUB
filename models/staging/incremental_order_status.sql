{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

select * from {{ source('payment', 'order_status') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where STATUS_CHANGED_AT > (select max(STATUS_CHANGED_AT) from {{ this }}) 
{% endif %}