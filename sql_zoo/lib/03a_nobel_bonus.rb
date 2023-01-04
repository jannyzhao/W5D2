# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT DISTINCT yr
  FROM nobels
  WHERE subject in ('Physics') AND yr NOT in
  (SELECT DISTINCT yr
  FROM nobels
  WHERE subject IN ('Chemistry'));
  SQL

  # execute(<<-SQL)
  # SELECT DISTINCT yr
  # FROM nobels
  # WHERE subject IN 'Physics' AND subject NOT IN 'Chemistry';
  # SQL


  # execute(<<-SQL)
  # SELECT DISTINCT yr
  # FROM nobels
  # WHERE subject NOT in ('Chemistry') AND subject = 'Physics';
  # SQL
end
