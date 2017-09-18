connection: "crunchbase"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: acquisitions {
}

explore: companies {            #companies that aquired others
  join: acquisitioners {
    from: acquisitions
    type: left_outer
    relationship: one_to_one    #one to many?
    sql_on: ${companies.permalink} = ${acquisitioners.acquired_by_permalink} ;;
  }
  join: acquisitioned {      #companies that were aquired
    from: acquisitions
    type: left_outer
    relationship: one_to_one
    sql_on: ${companies.permalink} = ${acquisitioned.acquired_permalink} ;;
  }
  join: investments {
    type: left_outer
    relationship: one_to_one
    sql_on: ${companies.permalink} = ${investments.investor_permalink} ;;
  }
}

explore: companies_to_update {}

explore: competitions {}

explore: employment {}

explore: funding {      #instances of funding for companies
  join: companies {
    type: left_outer
    relationship: many_to_one
    sql_on: ${funding.permalink} = ${companies.permalink} ;;
  }
}

explore: investments {
  join: funding {
    type: left_outer
    sql_on: ${investments.funding_id} = ${funding.id} ;;
    relationship: many_to_one
  }
  join: companies {
    type: left_outer
    relationship: many_to_one
    sql_on: ${companies.permalink} = ${investments.investor_permalink} ;;
  }
  join: people {
    type: left_outer
    relationship: many_to_one
    sql_on: ${investments.investor_permalink} = ${people.permalink} ;;
  }
}

explore: ipo {}

explore: offices {}

explore: people {}

explore: runs {}

explore: tags {}
