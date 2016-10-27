- view: sellers
  sql_table_name: jetstream_mongo.sellers
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: address_verified
    type: yesno
    sql: ${TABLE}.addressVerified

  - dimension: chargeback_penalty_percentage_threshold
    type: number
    sql: ${TABLE}.chargebackPenaltyPercentageThreshold

  - dimension: copilot_id
    type: string
    # hidden: true
    sql: ${TABLE}.copilotId

  - dimension: coupon_percentage
    type: number
    sql: ${TABLE}.couponPercentage

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.createdAt

  - dimension: credentials
    type: string
    sql: ${TABLE}.credentials

  - dimension: credit_percentage
    type: number
    sql: ${TABLE}.creditPercentage

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deletedAt

  - dimension: dhl_mailer_id
    type: string
    sql: ${TABLE}.dhlMailerId

  - dimension: disc
    type: yesno
    sql: ${TABLE}.disc

  - dimension: employees
    type: number
    sql: ${TABLE}.employees

  - dimension: first_name
    type: string
    sql: ${TABLE}.firstName

  - dimension_group: fsuntil
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.fsuntil

  - dimension: has_chargeback_penalty_waiver
    type: yesno
    sql: ${TABLE}.hasChargebackPenaltyWaiver

  - dimension: holidayreturns
    type: string
    sql: ${TABLE}.holidayreturns

  - dimension: instagram_url
    type: string
    sql: ${TABLE}.instagramUrl

  - dimension: last_name
    type: string
    sql: ${TABLE}.lastName

  - dimension: logo
    type: string
    sql: ${TABLE}.logo

  - dimension: merchant_id
    type: string
    # hidden: true
    sql: ${TABLE}.merchantId

  - dimension_group: metadata_expected_go_live
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.metadata_expectedGoLiveDate

  - dimension: net_conns
    type: number
    sql: ${TABLE}.netConns

  - dimension: num_followers
    type: number
    sql: ${TABLE}.numFollowers

  - dimension: num_originated
    type: number
    sql: ${TABLE}.numOriginated

  - dimension: num_page_views
    type: number
    sql: ${TABLE}.numPageViews

  - dimension_group: plan_created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.planCreatedAt

  - dimension_group: plan_first_billing
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.planFirstBillingDate

  - dimension: plan_first_billing_price
    type: number
    sql: ${TABLE}.planFirstBillingPrice

  - dimension: plan_free
    type: yesno
    sql: ${TABLE}.planFree

  - dimension: plan_id
    type: string
    sql: ${TABLE}.planId

  - dimension_group: plan_next_billing
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.planNextBillingDate

  - dimension: plan_normal_billing_price
    type: number
    sql: ${TABLE}.planNormalBillingPrice

  - dimension: plan_order_id
    type: number
    sql: ${TABLE}.planOrderId

  - dimension: plan_subscription_id
    type: string
    sql: ${TABLE}.planSubscriptionId

  - dimension: primary_category
    type: string
    sql: ${TABLE}.primaryCategory

  - dimension: primary_taxon
    type: string
    sql: ${TABLE}.primaryTaxon

  - dimension: primary_user_id
    type: string
    sql: ${TABLE}.primaryUserId

  - dimension: promotable
    type: string
    sql: ${TABLE}.promotable

  - dimension: slug
    type: string
    sql: ${TABLE}.slug

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: t2
    type: yesno
    sql: ${TABLE}.t2

  - dimension: twitter_marketplace_id
    type: string
    sql: ${TABLE}.twitterMarketplaceId

  - dimension: twitter_marketplace_status
    type: yesno
    sql: ${TABLE}.twitterMarketplaceStatus

  - dimension: type
    type: yesno
    sql: ${TABLE}.type

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
    - first_name
    - last_name
    - merchants.id
    - copilot.id
    - copilot.count
    - copilot_bo.count
    - copilot_tmp.count
    - coupon_codes.count
    - facebook_comments.count
    - merchants.count
    - originators.count
    - product_attribution.count
    - sellables.count
    - sellables_1.count
    - sellables_shipping_prices.count
    - sellables_shipping_prices_tmp.count
    - sellables_tmp.count
    - sellable_price_codes.count
    - sellers_email_group_members.count
    - seller_categories.count
    - seller_identities.count
    - seller_sites.count
    - seller_subscriptions.count
    - seller_tags.count
    - session_attribution.count

