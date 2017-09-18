view: investments {
  sql_table_name: crunchbase.investments ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  dimension: funding_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.funding_id ;;
  }

  dimension: investor_permalink {
    type: string
    sql: ${TABLE}.investor_permalink ;;
  }

  dimension: is_company {
    type: yesno
    sql: ${TABLE}.is_company ;;
  }

  measure: count {
    type: count
    drill_fields: [id, funding.id]
  }

  measure: percent_investor_type {      #single measure way--use with is_company dimension (cheating?)
    type: percent_of_total
    sql: ${count} ;;
  }

  measure: percent_people_investors {}



}
