- view: order_shipments
  sql_table_name: opensky_devo.order_shipments
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: accepted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.acceptedAt

  - dimension: appeasement_credit_used
    type: number
    sql: ${TABLE}.appeasementCreditUsed

  - dimension_group: archived
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.archivedAt

  - dimension: capture_status
    type: string
    sql: ${TABLE}.captureStatus

  - dimension: captured_total
    type: number
    sql: ${TABLE}.capturedTotal

  - dimension: carrier
    type: string
    sql: ${TABLE}.carrier

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.createdAt

  - dimension: credit_used
    type: number
    sql: ${TABLE}.creditUsed

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deletedAt

  - dimension_group: delivered
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deliveredAt

  - dimension: external_id
    type: string
    sql: ${TABLE}.externalId

  - dimension: marketing_allowance_used
    type: number
    sql: ${TABLE}.marketingAllowanceUsed

  - dimension: open_sky_funded_payment
    type: number
    sql: ${TABLE}.openSkyFundedPayment

  - dimension: order_id
    type: number
    # hidden: true
    sql: ${TABLE}.orderId

  - dimension: other_carrier
    type: string
    sql: ${TABLE}.otherCarrier

  - dimension: posted_to_net_suite
    type: yesno
    sql: ${TABLE}.postedToNetSuite

  - dimension_group: prepared
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.preparedAt

  - dimension_group: shipped
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.shippedAt

  - dimension: shipping_cost
    type: number
    sql: ${TABLE}.shippingCost

  - dimension: shipping_price
    type: number
    sql: ${TABLE}.shippingPrice

  - dimension: subtotal
    type: number
    sql: ${TABLE}.subtotal

  - dimension: supplier_order_id
    type: number
    # hidden: true
    sql: ${TABLE}.supplierOrderId

  - dimension: tax
    type: number
    sql: ${TABLE}.tax

  - dimension: total
    type: number
    sql: ${TABLE}.total

  - dimension: tracking_number
    type: string
    sql: ${TABLE}.trackingNumber

  - dimension: tracking_number_exists
    type: yesno
    sql: ${TABLE}.trackingNumberExists

  - dimension: tracking_number_valid
    type: yesno
    sql: ${TABLE}.trackingNumberValid

  - dimension_group: tracking_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.trackingUpdatedAt

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
    - supplier_orders.id

