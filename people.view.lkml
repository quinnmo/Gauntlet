view: people {
  sql_table_name: crunchbase.people ;;

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: full_name {
    type: string
    sql: concat(${TABLE}.first_name, " ", ${TABLE}.last_name) ;;
  }

  dimension: permalink {
    primary_key: yes
    type: string
    sql: ${TABLE}.permalink ;;
  }

  measure: count {
    type: count
    drill_fields: [last_name, first_name]
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${permalink} ;;
  }
}
