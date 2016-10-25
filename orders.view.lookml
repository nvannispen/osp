- view: orders
  sql_table_name: opensky_devo.orders
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: appeasement_credit_used
    type: number
    sql: ${TABLE}.appeasementCreditUsed

  - dimension_group: approved
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.approvedAt

  - dimension: billing_address1
    type: string
    sql: ${TABLE}.billingAddress1

  - dimension: billing_address2
    type: string
    sql: ${TABLE}.billingAddress2

  - dimension: billing_city
    type: string
    sql: ${TABLE}.billingCity

  - dimension: billing_name
    type: string
    sql: ${TABLE}.billingName

  - dimension: billing_state
    type: string
    sql: ${TABLE}.billingState

  - dimension: billing_zip
    type: string
    sql: ${TABLE}.billingZip

  - dimension: billing_zone_id
    type: number
    sql: ${TABLE}.billingZoneId

  - dimension: calculator_strategy
    type: string
    sql: ${TABLE}.calculatorStrategy

  - dimension: card_expiration_month
    type: string
    sql: ${TABLE}.cardExpirationMonth

  - dimension: card_expiration_year
    type: string
    sql: ${TABLE}.cardExpirationYear

  - dimension: card_last4
    type: string
    sql: ${TABLE}.cardLast4

  - dimension: card_token
    type: string
    sql: ${TABLE}.cardToken

  - dimension: card_type
    type: string
    sql: ${TABLE}.cardType

  - dimension: cardholder_name
    type: string
    sql: ${TABLE}.cardholderName

  - dimension: client_ip
    type: number
    sql: ${TABLE}.clientIP

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.createdAt

  - dimension: credit_used
    type: number
    sql: ${TABLE}.creditUsed

  - dimension: estimated_shipping
    type: string
    sql: ${TABLE}.estimatedShipping

  - dimension: gift_wrap_price
    type: number
    sql: ${TABLE}.giftWrapPrice

  - dimension_group: handling_fee_refunded
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.handlingFeeRefundedAt

  - dimension: handling_price
    type: number
    sql: ${TABLE}.handlingPrice

  - dimension: in_holding
    type: yesno
    sql: ${TABLE}.inHolding

  - dimension_group: locked
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lockedAt

  - dimension: locked_by_user_id
    type: string
    sql: ${TABLE}.lockedByUserId

  - dimension: ma_id
    type: number
    sql: ${TABLE}.maId

  - dimension: marketing_allowance_used
    type: number
    sql: ${TABLE}.marketingAllowanceUsed

  - dimension: open_sky_funded_payment
    type: number
    sql: ${TABLE}.openSkyFundedPayment

  - dimension: order_originator_id
    type: string
    sql: ${TABLE}.orderOriginatorId

  - dimension: product_originator_id
    type: string
    sql: ${TABLE}.productOriginatorId

  - dimension_group: released
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.releasedAt

  - dimension_group: releasing
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.releasingAt

  - dimension: repeat_buyer
    type: yesno
    sql: ${TABLE}.repeatBuyer

  - dimension: revenue
    type: number
    sql: ${TABLE}.revenue

  - dimension: reward_points
    type: number
    sql: ${TABLE}.rewardPoints

  - dimension: shipping_address1
    type: string
    sql: ${TABLE}.shippingAddress1

  - dimension: shipping_address2
    type: string
    sql: ${TABLE}.shippingAddress2

  - dimension: shipping_city
    type: string
    sql: ${TABLE}.shippingCity

  - dimension: shipping_county
    type: string
    sql: ${TABLE}.shippingCounty

  - dimension: shipping_name
    type: string
    sql: ${TABLE}.shippingName

  - dimension: shipping_phone_ext
    type: string
    sql: ${TABLE}.shippingPhoneExt

  - dimension: shipping_phone_number
    type: string
    sql: ${TABLE}.shippingPhoneNumber

  - dimension: shipping_price
    type: number
    sql: ${TABLE}.shippingPrice

  - dimension: shipping_state
    type: string
    sql: ${TABLE}.shippingState

  - dimension: shipping_zip
    type: string
    sql: ${TABLE}.shippingZip

  - dimension: shipping_zone_id
    type: number
    sql: ${TABLE}.shippingZoneId

  - dimension: site_id
    type: string
    # hidden: true
    sql: ${TABLE}.siteId

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: subtotal
    type: number
    sql: ${TABLE}.subtotal

  - dimension: tax
    type: number
    sql: ${TABLE}.tax

  - dimension: tax_rate
    type: number
    sql: ${TABLE}.taxRate

  - dimension: tax_shipping
    type: yesno
    sql: ${TABLE}.taxShipping

  - dimension: total
    type: number
    sql: ${TABLE}.total

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updatedAt

  - dimension: user_id
    type: string
    sql: ${TABLE}.userId

  - dimension: user_originator_id
    type: string
    sql: ${TABLE}.userOriginatorId

  - dimension: version
    type: yesno
    sql: ${TABLE}.version

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - shipping_name
    - billing_name
    - cardholder_name
    - sites.id
    - sites.name
    - sites.domain_name
    - copilot_transactions.count
    - credit_logs.count
    - opensky_cash_events.count
    - order_attributes.count
    - order_fee_items.count
    - order_imports_livingsocial_items.count
    - order_imports_sears_items.count
    - order_items.count
    - order_shipments.count
    - order_sources.count
    - payments.count
    - referral_items.count
    - refunds.count
    - supplier_orders.count
    - transactions.count
    - v_order_items_revenue_and_profit.count

