- view: order_items
  sql_table_name: opensky_devo.order_items
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

  - dimension: cart_referral_id
    type: string
    sql: ${TABLE}.cartReferralId

  - dimension: cost
    type: number
    sql: ${TABLE}.cost

  - dimension: credit_used
    type: number
    sql: ${TABLE}.creditUsed

  - dimension: customizable
    type: yesno
    sql: ${TABLE}.customizable

  - dimension: customization
    type: string
    sql: ${TABLE}.customization

  - dimension: customization_prompt
    type: string
    sql: ${TABLE}.customizationPrompt

  - dimension: flash_id
    type: string
    sql: ${TABLE}.flashId

  - dimension: gift_message
    type: string
    sql: ${TABLE}.giftMessage

  - dimension: gift_wrap
    type: yesno
    sql: ${TABLE}.giftWrap

  - dimension: gift_wrap_price
    type: number
    sql: ${TABLE}.giftWrapPrice

  - dimension: handling_price
    type: number
    sql: ${TABLE}.handlingPrice

  - dimension: merchant_id
    type: string
    sql: ${TABLE}.merchantId

  - dimension: order_id
    type: number
    # hidden: true
    sql: ${TABLE}.orderId

  - dimension: price
    type: number
    sql: ${TABLE}.price

  - dimension: price_code_id
    type: string
    sql: ${TABLE}.priceCodeId

  - dimension: product_id
    type: string
    sql: ${TABLE}.productId

  - dimension: product_is_bundle
    type: yesno
    sql: ${TABLE}.productIsBundle

  - dimension: product_msrp
    type: number
    sql: ${TABLE}.productMsrp

  - dimension: product_name
    type: string
    sql: ${TABLE}.productName

  - dimension: product_originator_id
    type: string
    sql: ${TABLE}.productOriginatorId

  - dimension: product_promotion_id
    type: number
    # hidden: true
    sql: ${TABLE}.productPromotionId

  - dimension_group: product_review_email
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.productReviewEmailDate

  - dimension: product_weight
    type: number
    sql: ${TABLE}.productWeight

  - dimension: quantity
    type: number
    sql: ${TABLE}.quantity

  - dimension: referral_id
    type: string
    sql: ${TABLE}.referralId

  - dimension: return_days
    type: yesno
    sql: ${TABLE}.returnDays

  - dimension: revenue
    type: number
    sql: ${TABLE}.revenue
    
  - dimension: profit
    type: number
    sql: ${revenue} - ${cost}
    
  - measure: total_profit
    type: sum
    sql: ${profit}

  - dimension: sellable_credit_used
    type: number
    sql: ${TABLE}.sellableCreditUsed

  - dimension: sellable_estimated_shipping
    type: string
    sql: ${TABLE}.sellableEstimatedShipping

  - dimension: sellable_estimated_shipping_days
    type: number
    sql: ${TABLE}.sellableEstimatedShippingDays

  - dimension: sellable_id
    type: string
    # hidden: true
    sql: ${TABLE}.sellableId

  - dimension: sellable_image_small
    type: string
    sql: ${TABLE}.sellableImageSmall

  - dimension: sellable_image_thumbnail
    type: string
    sql: ${TABLE}.sellableImageThumbnail

  - dimension: sellable_name
    type: string
    sql: ${TABLE}.sellableName

  - dimension: sellable_slug
    type: string
    sql: ${TABLE}.sellableSlug

  - dimension: seller_id
    type: string
    # hidden: true
    sql: ${TABLE}.sellerId

  - dimension: seller_name
    type: string
    sql: ${TABLE}.sellerName

  - dimension: ship_speed_fixed_price
    type: number
    sql: ${TABLE}.shipSpeedFixedPrice

  - dimension: shipping_price
    type: number
    sql: ${TABLE}.shippingPrice

  - dimension_group: shipping_refunded
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.shippingRefundedAt

  - dimension: special_location
    type: number
    sql: ${TABLE}.specialLocation

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: stock_item_id
    type: number
    # hidden: true
    sql: ${TABLE}.stockItemId

  - dimension: stock_item_sku
    type: string
    sql: ${TABLE}.stockItemSku

  - dimension: supplier_order_id
    type: number
    # hidden: true
    sql: ${TABLE}.supplierOrderId

  - dimension: tax
    type: number
    sql: ${TABLE}.tax

  - dimension: tax_rate
    type: number
    sql: ${TABLE}.taxRate

  - dimension: tax_shipping
    type: yesno
    sql: ${TABLE}.taxShipping

  - dimension: two_item_base_shipping
    type: number
    sql: ${TABLE}.twoItemBaseShipping

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - dimension: undiscounted_price
    type: number
    sql: ${TABLE}.undiscountedPrice

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updatedAt

  - dimension: use_secondary_shipping
    type: yesno
    sql: ${TABLE}.useSecondaryShipping

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - product_name
    - sellable_name
    - seller_name
    - sellables.id
    - sellables.name
    - sellers.id
    - sellers.first_name
    - sellers.last_name
    - orders.id
    - orders.shipping_name
    - orders.billing_name
    - orders.cardholder_name
    - product_promotions.id
    - stock_items.id
    - supplier_orders.id
    - order_drip_emails.count
    - order_fee_items.count
    - order_item_attributes.count
    - order_item_details.count

