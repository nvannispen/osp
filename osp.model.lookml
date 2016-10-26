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
      
    # - join: order_item_details
    #   relationship: one_to_many
    
- explore: orders
#   joins: 
#     - join: user_order_facts
#       relationship: many_to_one
#       sql_on: ${orders.user_id} = ${user_order_facts.user_id}

- explore: user_order_facts