- view: sellables
  sql_table_name: jetstream_mongo.sellables
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: category_id
    type: string
    sql: ${TABLE}.categoryId

  - dimension: clearance
    type: yesno
    sql: ${TABLE}.clearance

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.createdAt

  - dimension: cs
    type: string
    sql: ${TABLE}.cs

  - dimension: customizable
    type: yesno
    sql: ${TABLE}.customizable

  - dimension: customization_prompt
    type: string
    sql: ${TABLE}.customizationPrompt

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deletedAt

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: discount_percentage
    type: number
    sql: ${TABLE}.discountPercentage

  - dimension: discount_percentage_locked
    type: yesno
    sql: ${TABLE}.discountPercentageLocked

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.endDate

  - dimension: estimated_items
    type: number
    sql: ${TABLE}.estimatedItems

  - dimension: estimated_shipping_days
    type: number
    sql: ${TABLE}.estimatedShippingDays

  - dimension: exclusive
    type: yesno
    sql: ${TABLE}.exclusive

  - dimension: free_shipping
    type: yesno
    sql: ${TABLE}.freeShipping

  - dimension: handling_fee
    type: number
    sql: ${TABLE}.handlingFee

  - dimension: hero
    type: yesno
    sql: ${TABLE}.hero

  - dimension: image_id
    type: string
    sql: ${TABLE}.imageId

  - dimension: insider_pick
    type: yesno
    sql: ${TABLE}.insiderPick

  - dimension: is_discoverable
    type: yesno
    sql: ${TABLE}.isDiscoverable

  - dimension: love_count
    type: number
    sql: ${TABLE}.loveCount

  - dimension: max_price
    type: number
    sql: ${TABLE}.maxPrice

  - dimension: merchant_id
    type: string
    # hidden: true
    sql: ${TABLE}.merchantId

  - dimension: min_price
    type: number
    sql: ${TABLE}.minPrice

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: num_orders
    type: number
    sql: ${TABLE}.numOrders

  - dimension: num_page_views
    type: number
    sql: ${TABLE}.numPageViews

  - dimension: opensky_certified
    type: yesno
    sql: ${TABLE}.openskyCertified

  - dimension: originator_id
    type: string
    # hidden: true
    sql: ${TABLE}.originatorId

  - dimension: parent_seller
    type: string
    sql: ${TABLE}.parentSeller

  - dimension: primary_taxon
    type: string
    sql: ${TABLE}.primaryTaxon

  - dimension: product_id
    type: string
    # hidden: true
    sql: ${TABLE}.productId

  - dimension: product_type
    type: string
    sql: ${TABLE}.productType

  - dimension: return_policy
    type: number
    sql: ${TABLE}.returnPolicy

  - dimension: seller_id
    type: string
    # hidden: true
    sql: ${TABLE}.sellerId

  - dimension: shipping_price
    type: number
    sql: ${TABLE}.shippingPrice

  - dimension: show_reviews
    type: yesno
    sql: ${TABLE}.showReviews

  - dimension: slug
    type: string
    sql: ${TABLE}.slug

  - dimension: sort
    type: number
    sql: ${TABLE}.sort

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.startDate

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: subscription
    type: yesno
    sql: ${TABLE}.subscription

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updatedAt

  - dimension: video_url
    type: string
    sql: ${TABLE}.videoUrl

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - name
    - products.id
    - products.name
    - sellers.id
    - sellers.first_name
    - sellers.last_name
    - originators.id
    - merchants.id
    - guide_sellables.count
    - identities_cart.count
    - product_attribution.count
    - sellables_flashes.count
    - sellables_flashes_tmp.count
    - sellables_media_images.count
    - sellables_shipping_prices.count
    - sellables_shipping_prices_tmp.count
    - sellables_taxons.count
    - sellable_images.count
    - sellable_price_codes.count
    - sellable_sites.count
    - seller_category_flashes.count
    - wish_list_items.count

