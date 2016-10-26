- view: user_order_facts
  derived_table:
    sql: |
      SELECT
              userId as user_id
              , COUNT(DISTINCT id) AS lifetime_orders
              , SUM(revenue) AS lifetime_revenue
              , SUM(rewardPoints) as lifetime_reward_points
              , MIN(NULLIF(createdAt,0)) AS first_order
              , MAX(NULLIF(createdAt,0)) AS latest_order
              
      FROM opensky_devo.orders
      GROUP BY userId
    indexes: [user_id]
            

  fields:

  - dimension: user_id
    type: string
    primary_key: true
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: detail*



##### Time and Cohort Fields ######  

  - dimension_group: first_order
    type: time
    timeframes: [date, week, month, year, raw]
    sql: ${TABLE}.first_order

  - dimension: latest_order
    type: time
    timeframes: [date, week, month, year, raw]
    sql: ${TABLE}.latest_order

  - dimension: days_as_customer
    description: 'Days between first and latest order'
    type: number
    sql: DATEDIFF(${first_order_raw}, ${latest_order_raw})+1
    
  - dimension: days_as_customer_tiered
    type: tier
    tiers: [0,1,7,14, 21, 28,30,60,90,120]
    sql: ${days_as_customer}
    style: integer

##### Lifetime Behavior - Order Counts ######

  - dimension: lifetime_orders
    type: number
    sql: ${TABLE}.lifetime_orders
  
  - dimension: repeat_customer
    description: 'Lifetime Count of Orders > 1'
    type: yesno
    sql: ${lifetime_orders} > 1
  
  - dimension: lifetime_orders_tier
    type: tier
    tiers: [0,1,2,3,5,10]
    sql: ${lifetime_orders}
    style: integer
    
  - measure: average_lifetime_orders
    type: average
    value_format_name: decimal_2
    sql: ${lifetime_orders}

  - dimension: distinct_months_with_orders
    type: number
    sql: ${TABLE}.number_of_distinct_months_with_orders

##### Lifetime Behavior - Revenue ######  
  
  - dimension: lifetime_revenue
    type: number
    value_format_name: usd
    sql: ${TABLE}.lifetime_revenue
  
  - dimension: lifetime_revenue_tier
    type: tier
    tiers: [0, 25, 50, 100, 200, 500, 1000]
    sql: ${lifetime_revenue}
    style: integer
    
  - measure: average_lifetime_revenue
    type: average
    value_format_name: usd
    sql: ${lifetime_revenue}

##### Lifetime Behavior - Rewards ######

  - dimension: lifetime_reward_points
    type: number
    sql: ${TABLE}.lifetime_reward_points

  - dimension: lifetime_rewards_tier
    type: tier
    tiers: [0, 25, 50, 100, 200, 500, 1000]
    sql: ${lifetime_reward_points}
    style: integer
    
  - measure: average_lifetime_rewards
    type: average
    value_format_name: usd
    sql: ${lifetime_reward_points}    
  



  sets:
    detail:
      - user_id
      - lifetime_orders
      - lifetime_revenue
      - lifetime_reward_points
      - first_order
      - latest_order

