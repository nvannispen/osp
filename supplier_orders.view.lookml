- view: supplier_orders
  sql_table_name: opensky_devo.supplier_orders
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: appeasement_credit_used
    type: number
    sql: ${TABLE}.appeasementCreditUsed

  - dimension: credit_used
    type: number
    sql: ${TABLE}.creditUsed

  - dimension_group: estimated_ship
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.estimatedShipDate

  - dimension: fulfillment_id
    type: string
    sql: ${TABLE}.fulfillmentId

  - dimension: gift_wrap_price
    type: number
    sql: ${TABLE}.giftWrapPrice

  - dimension: handling_price
    type: number
    sql: ${TABLE}.handlingPrice

  - dimension_group: in_processing
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.inProcessingAt

  - dimension: order_id
    type: number
    # hidden: true
    sql: ${TABLE}.orderId

  - dimension: sellable_credit_used
    type: number
    sql: ${TABLE}.sellableCreditUsed

  - dimension: ship_speed_code
    type: string
    sql: ${TABLE}.shipSpeedCode

  - dimension: ship_speed_fixed_price
    type: number
    sql: ${TABLE}.shipSpeedFixedPrice

  - dimension: shipper_id
    type: string
    sql: ${TABLE}.shipperId

  - dimension: shipping_price
    type: number
    sql: ${TABLE}.shippingPrice

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: subtotal
    type: number
    sql: ${TABLE}.subtotal

  - dimension: tax
    type: number
    sql: ${TABLE}.tax

  - dimension: total
    type: number
    sql: ${TABLE}.total

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updatedAt

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - orders.id
    - orders.shipping_name
    - orders.billing_name
    - orders.cardholder_name
    - chargebacks.count
    - order_items.count
    - order_shipments.count
    - shipping_exports.count
    - shipping_updates.count
    - supplier_order_customer_emails.count

