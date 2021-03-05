# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT projects.title, SUM(pledges.amount) FROM projects INNER JOIN pledges ON projects.id = pledges.project_id GROUP BY projects.id ORDER BY projects.title;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  # selecting users.name & users.age & pledges.amount from USER table
  # joining users & pledges /// users.id = pledge.id ?? <-- the id should be the same so they should equal
  # group by the users' name so... users.name ?
  "SELECT users.name, users.age, 
    SUM(pledges.amount) 
    FROM users 
    INNER JOIN pledges 
    ON users.id = pledges.user_id 
    GROUP BY users.name 
    ORDER BY users.name;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  # project.title -- SUM the pledges.amount and subtract the .funding_goal FROM the PROJECTS table
  # JOIN the pledges by the projects.id & pledges.project.id
  # GROUP project.title if SUM >= projects.funding_goal
  "SELECT projects.title, 
      SUM(pledges.amount) - projects.funding_goal
      FROM projects
      JOIN pledges ON projects.id = pledges.project_id
      GROUP BY projects.title HAVING SUM(pledges.amount) >= projects.funding_goal;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  # users.name & SUM amount from users
  # join pledges by .id=pledges_id
  # group by users.name and ORDER by SUM amount
  "SELECT users.name, SUM(pledges.amount)
    FROM users
    JOIN pledges ON users.id = pledges.user_id
    GROUP BY users.name
    ORDER BY SUM(pledges.amount);"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  # selects from projects the .category & .amount 
  # since we're selecting from "of all pledges" we have to JOIN pledges by .id=pledges.project_id
  # join by "music" -- group by? or where?
  "SELECT projects.category, pledges.amount
    FROM projects
    JOIN pledges ON projects.id = pledges.project_id
    WHERE projects.category = 'music';"
 
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  # here the name => category in the table projects
  # select .category and SUM pledges.amount (need join)
  # JOIN table pledges by .id=pledges.project_id
  # WHERE .category 
  "SELECT projects.category, SUM(pledges.amount)
    FROM projects
    JOIN pledges ON projects.id = pledges.project_id
    WHERE projects.category = 'books';"
end
