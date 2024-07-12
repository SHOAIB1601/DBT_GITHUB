{% snapshot snapshot_name %}
    {{
        config(
            target_schema='schemasnapshot_july',
            
            unique_key='customer_id',
            strategy='timestamp',
            invalidate_hard_deletes=False,
            updated_at='updated_at'
        )
    }}

    select * from {{ source('payment', 'customer_address') }}
 {% endsnapshot %}