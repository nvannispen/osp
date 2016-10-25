- view: order_item_details
  sql_table_name: opensky_devo.order_item_details
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: appeasement_credit_used
    type: number
    sql: ${TABLE}.appeasementCreditUsed

  - dimension: cancel_status
    type: yesno
    sql: ${TABLE}.cancelStatus

  - dimension: coupon_code_id
    type: string
    sql: ${TABLE}.couponCodeId

  - dimension: credit_used
    type: number
    sql: ${TABLE}.creditUsed

  - dimension: discount_id
    type: string
    sql: ${TABLE}.discountId

  - dimension: marketing_allowance_used
    type: number
    sql: ${TABLE}.marketingAllowanceUsed

  - dimension: merchant_discount
    type: number
    sql: ${TABLE}.merchantDiscount

  - dimension: open_sky_discount
    type: number
    sql: ${TABLE}.openSkyDiscount

  - dimension: open_sky_funded_payment
    type: number
    sql: ${TABLE}.openSkyFundedPayment

  - dimension: order_item_id
    type: number
    # hidden: true
    sql: ${TABLE}.orderItemId

  - dimension: revenue
    type: number
    sql: ${TABLE}.revenue

  - dimension: sellable_credit_used
    type: number
    sql: ${TABLE}.sellableCreditUsed

  - dimension: shipping
    type: number
    sql: ${TABLE}.shipping

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: tax
    type: number
    sql: ${TABLE}.tax

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
    - order_items.id
    - order_items.product_name
    - order_items.sellable_name
    - order_items.seller_name
    - order_item_details_payment.count
    - order_item_details_payment_details.count
    - order_item_detail_commissions.count
    - order_item_detail_returns.count
    - order_shipment_item_details.count

