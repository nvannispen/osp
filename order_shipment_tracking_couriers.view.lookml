- view: order_shipment_tracking_couriers
  sql_table_name: opensky_devo.order_shipment_tracking_couriers
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.createdAt

  - dimension: display_order
    type: number
    sql: ${TABLE}.displayOrder

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: phone
    type: string
    sql: ${TABLE}.phone

  - dimension: preferred_choice
    type: yesno
    sql: ${TABLE}.preferredChoice

  - dimension: service_countries
    type: string
    sql: ${TABLE}.serviceCountries

  - dimension: slug
    type: string
    sql: ${TABLE}.slug

  - dimension: source
    type: string
    sql: ${TABLE}.source

  - dimension: support_languages
    type: string
    sql: ${TABLE}.supportLanguages

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updatedAt

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - measure: count
    type: count
    drill_fields: [id, name]

