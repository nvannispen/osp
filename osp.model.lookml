- connection: test_dw

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# - explore: order_items
#   joins:
#     - join: orders
#       sql_on: ${orders.id} = ${order_items.order_id}
#     - join: users
#       sql_on: ${users.id} = ${orders.user_id}

- explore: order_items
  joins:
    - join: orders
      relationship: many_to_one
      sql_on: ${order_items.order_id} = ${orders.id}
      
    - join: supplier_orders
      relationship: one_to_one
      sql_on: ${orders.id} = ${supplier_orders.order_id}
    
    - join: order_shipments
      relationship: one_to_one
      sql_on: ${supplier_orders.id} = ${order_shipments.supplier_order_id} 
      
- explore: order_shipments
  joins:
    - join: supplier_orders
      relationship: one_to_one
      sql_on: ${order_shipments.supplier_order_id} = ${supplier_orders.id}
      
    - join: orders
      relationship: one_to_one
      sql_on: ${supplier_orders.order_id} = ${orders.id}