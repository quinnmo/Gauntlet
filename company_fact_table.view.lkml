 view: company_fact_table {
   derived_table: {
    persist_for: "1 hour"
    indexes: ["company_permalink"]
    sql: SELECT
      companies.permalink as company_permalink,
      companies.name as company_name,
      acquisitions.acquired_by_permalink as acquired_by_permalink,
      acquisitions.acquired_permalink as acquired_permalink
      FROM crunchbase.companies companies
      LEFT JOIN crunchbase.acquisitions acquisitions
      ON companies.permalink = acquisitions.acquired_by_permalink
      GROUP BY company_permalink ;;
  }

  dimension: company_permalink {
    primary_key: yes
    type: string
    sql: ${TABLE}.company_permalink ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: acquired_by_permalink {
    type: string
    sql: ${TABLE}.acquired_by_permalink ;;
  }

  dimension: acquired_permalink {
    type: string
    sql: ${TABLE}.aquired_permalink ;;
  }

  dimension: company_acquired {
    type: yesno
    sql: ${TABLE}.aquired_by_permalink is NULL ;;
  }




# # You can specify the table name if it's different from the view name:
#   # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: company_fact_table {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
