- view: order_shipment_tracking
  sql_table_name: opensky_devo.order_shipment_tracking
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: courier
    type: string
    sql: ${TABLE}.courier

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.createdAt

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: destination
    type: string
    sql: ${TABLE}.destination

  - dimension_group: expected
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expectedAt

  - dimension: number
    type: string
    sql: ${TABLE}.number

  - dimension: origin
    type: string
    sql: ${TABLE}.origin

  - dimension: packages
    type: number
    sql: ${TABLE}.packages

  - dimension: shipment_id
    type: number
    sql: ${TABLE}.shipmentId

  - dimension: signature
    type: string
    sql: ${TABLE}.signature

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updatedAt

  - measure: count
    type: count
    drill_fields: [id]

