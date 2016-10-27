- view: orders
  sql_table_name: opensky_devo.orders
  fields:

########## IDs, Foreign Keys ########### 

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id
    
  - dimension: locked_by_user_id
    type: string
    hidden: true
    sql: ${TABLE}.lockedByUserId

  - dimension: ma_id
    type: number
    hidden: true
    #what is this for?
    sql: ${TABLE}.maId

  - dimension: order_originator_id
    type: string
    hidden: true
    sql: ${TABLE}.orderOriginatorId

  - dimension: product_originator_id
    type: string
    hidden: true
    sql: ${TABLE}.productOriginatorId
    
  - dimension: site_id
    type: string
    hidden: true
    sql: ${TABLE}.siteId

  - dimension: user_id
    type: string
    hidden: true
    sql: ${TABLE}.userId

  - dimension: user_originator_id
    type: string
    hidden: true
    sql: ${TABLE}.userOriginatorId
    

    

##### Billing Information ######

  - dimension: billing_address_1
    group_label: Billing Information
    label: "Address 1"
    type: string
    sql: ${TABLE}.billingAddress1

  - dimension: billing_address_2
    label: "Address 2"
    group_label: Billing Information
    type: string
    sql: ${TABLE}.billingAddress2

  - dimension: billing_city
    label: "City"
    group_label: Billing Information
    type: string
    sql: ${TABLE}.billingCity

  - dimension: billing_name
    label: "Name"
    group_label: Billing Information
    type: string
    sql: ${TABLE}.billingName

  - dimension: billing_state
    label: "State"
    group_label: Billing Information
    map_layer: us_states
    sql: ${TABLE}.billingState

  - dimension: billing_zip
    label: "Zip Code"
    group_label: Billing Information
    type: zipcode
    sql: ${TABLE}.billingZip

  - dimension: billing_zone_id
    type: number
    label: "Zone ID"
    group_label: Billing Information
    sql: ${TABLE}.billingZoneId

  - dimension: card_expiration_month
    type: string
    group_label: Billing Information
    sql: ${TABLE}.cardExpirationMonth

  - dimension: card_expiration_year
    type: string
    group_label: Billing Information
    sql: ${TABLE}.cardExpirationYear

  - dimension: card_last_4
    type: string
    group_label: Billing Information
    sql: ${TABLE}.cardLast4

  - dimension: card_token
    type: string
    group_label: Billing Information
    sql: ${TABLE}.cardToken

  - dimension: card_type
    type: string
    group_label: Billing Information
    sql: ${TABLE}.cardType

  - dimension: cardholder_name
    type: string
    group_label: Billing Information
    sql: ${TABLE}.cardholderName

##### Time Dimensions #####

  - dimension_group: created_at
    type: time
    timeframes: [time, date, week, month, year, raw]
    sql: ${TABLE}.createdAt

  - dimension_group: handling_fee_refund_at
    type: time
    hidden: true
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.handlingFeeRefundedAt

  - dimension_group: locked_at
    type: time
    hidden: true
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.lockedAt

  - dimension_group: approved_at
    type: time
    hidden: true
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.approvedAt

  - dimension_group: released_at
    type: time
    timeframes: [time, date, week, month, year, raw]
    sql: ${TABLE}.releasedAt

  - dimension_group: releasing_at
    type: time
    hidden: true
    #what's the difference between this and released?
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.releasingAt
    
  - dimension_group: updated_at
    type: time
    hidden: true
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.updatedAt
    
    
  
##### Client Information #####  
    
  - dimension: client_ip
    type: number
    hidden: true
    sql: ${TABLE}.clientIP
    
  - dimension: is_a_repeat_buyers_order
    type: yesno
    sql: ${TABLE}.repeatBuyer



##### Shipping Info #####

  - dimension: estimated_ship_time_description
    description: this is a string explaining how long it takes for the item to ship
    type: string
    hidden: true
    sql: ${TABLE}.estimatedShipping

  - dimension: shipping_address_1
    label: "Address 1"
    group_label: Shipping Information
    type: string
    sql: ${TABLE}.shippingAddress1

  - dimension: shipping_address_2
    label: "Address 2"
    group_label: Shipping Information
    type: string
    sql: ${TABLE}.shippingAddress2

  - dimension: shipping_city
    label: "City"
    group_label: Shipping Information
    type: string
    sql: ${TABLE}.shippingCity

  - dimension: shipping_county
    label: "County"
    group_label: Shipping Information
    type: string
    sql: ${TABLE}.shippingCounty

  - dimension: shipping_name
    label: "Name"
    group_label: Shipping Information
    type: string
    sql: ${TABLE}.shippingName

  - dimension: shipping_phone_ext
    label: "Phone Extension"
    group_label: Shipping Information
    type: string
    sql: ${TABLE}.shippingPhoneExt

  - dimension: shipping_phone_number
    label: "Phone Number"
    group_label: Shipping Information
    type: string
    sql: ${TABLE}.shippingPhoneNumber

  - dimension: shipping_state
    label: "State"
    group_label: Shipping Information
    map_layer: us_states
    sql: ${TABLE}.shippingState

  - dimension: shipping_zip_code
    label: "Zip Code"
    group_label: Shipping Information
    type: zipcode
    sql: ${TABLE}.shippingZip

  - dimension: shipping_zone_id
    label: "Zone ID"
    group_label: Shipping Information
    type: number
    sql: ${TABLE}.shippingZoneId

##### Logistics #####

  - dimension: is_in_holding
    type: yesno
    sql: ${TABLE}.inHolding

  - dimension: status
    type: string
    sql: ${TABLE}.status
    
  - dimension: days_to_process
    type: number
    sql: |
      CASE
        WHEN ${status} IN ('processing', 'pending', 'review') THEN DATEDIFF(CURDATE(),${created_at_raw})*1.0
        WHEN ${status} = 'complete' THEN DATEDIFF(${released_at_raw},${created_at_raw})*1.0
        WHEN ${status} IN ('canceled', 'auth_failed') THEN NULL
      END
      
  - measure: average_days_to_process
    type: average
    value_format_name: decimal_4
    sql: ${days_to_process}
    drill_fields: [detail*] 

##### Financial Information #####

  - dimension: calculator_strategy
    type: string
    description: this field seems to be a date combined with a numeric value
    hidden: true
    sql: ${TABLE}.calculatorStrategy

  - dimension: subtotal
    group_label: Financial Information
    type: number
    value_format_name: usd
    sql: ${TABLE}.subtotal

  - dimension: tax
    group_label: Financial Information
    type: number
    value_format_name: usd
    sql: ${TABLE}.tax

  - dimension: tax_rate
    group_label: Financial Information
    label: "Tax Rate (%)"
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.taxRate

  - dimension: has_shipping_tax
    group_label: Financial Information
    type: yesno
    sql: ${TABLE}.taxShipping

  - dimension: shipping_price
    group_label: Financial Information
    type: number
    sql: ${TABLE}.shippingPrice

  - dimension: gift_wrap_price
    group_label: Financial Information
    value_format_name: usd
    type: number
    sql: ${TABLE}.giftWrapPrice
    
  - dimension: handling_price
    group_label: Financial Information
    value_format_name: usd
    type: number
    sql: ${TABLE}.handlingPrice

  - dimension: total
    group_label: Financial Information
    value_format_name: usd
    type: number
    sql: ${TABLE}.total

  - dimension: revenue
    group_label: Financial Information
    type: number
    value_format_name: usd
    sql: ${TABLE}.revenue

  - dimension: credit_used
    group_label: Financial Information
    value_format_name: usd
    type: number
    sql: ${TABLE}.creditUsed

  - dimension: marketing_allowance_used
    group_label: Financial Information
    type: number
    hidden: true
    #hidden because only 377 orders have code '15', all other orders are null
    sql: ${TABLE}.marketingAllowanceUsed

  - dimension: open_sky_funded_payment
    group_label: Financial Information
    value_format_name: usd
    type: number
    sql: ${TABLE}.openSkyFundedPayment

  - dimension: appeasement_credit_used
    group_label: Financial Information
    type: number
    value_format_name: usd
    sql: ${TABLE}.appeasementCreditUsed

  - dimension: is_gift_order
    type: yesno
    sql: ${gift_wrap_price} > 0

  - dimension: reward_points_earned
    type: number
    sql: ${TABLE}.rewardPoints

  - measure: order_count
    type: count
    drill_fields: [detail*]
    
  - measure: gift_order_count
    type: count
    filters:
      is_gift_order: yes
    drill_fields: [detail*]
  
#   - measure: percent_gift_orders
#     type: number
#     sql: 1.0 * ${gift_order_count} / NULLIF(${order_count},0)
#     value_format_name: percent_0
  
  - measure: total_revenue
    type: sum
    value_format_name: usd
    drill_fields: [detail*]
    sql: ${revenue}
    
  - measure: total_reward_points
    type: sum
    drill_fields: [detail*]
    sql: ${reward_points_earned}

  - measure: total_shipping_revenue
    drill_fields: [detail*]
    type: sum
    sql: ${shipping_price}
    
  - measure: total_handling_revenue
    drill_fields: [detail*]
    type: sum
    sql: ${handling_price}

  - dimension: user_order_sequence_number
    type: number
    sql: |
      (
        SELECT COUNT(*)
        FROM orders o
        WHERE o.id <= ${TABLE}.id
          AND o.userId = ${TABLE}.userId
      )


##### Flagged for Deletion #####

  - dimension: version
    type: yesno
    hidden: true
    #what is this field for?
    sql: ${TABLE}.version




  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - created_at_date
    - status
    - revenue
    - days_to_process
    - shipping_name
    - user_id

#     - order_items.count


