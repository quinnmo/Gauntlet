view: companies_to_update {
  sql_table_name: crunchbase.companies_to_update ;;

  dimension: permalink {
    primary_key: yes
    type: string
    sql: ${TABLE}.permalink ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
