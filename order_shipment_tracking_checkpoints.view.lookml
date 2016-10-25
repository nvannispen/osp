- view: order_shipment_tracking_checkpoints
  sql_table_name: opensky_devo.order_shipment_tracking_checkpoints
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: courier
    type: string
    sql: ${TABLE}.courier

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: locality
    type: string
    sql: ${TABLE}.locality

  - dimension: postal_code
    type: string
    sql: ${TABLE}.postalCode

  - dimension: region
    type: string
    sql: ${TABLE}.region

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: tracking_id
    type: number
    sql: ${TABLE}.trackingId

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updatedAt

  - measure: count
    type: count
    drill_fields: [id]

