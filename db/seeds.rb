# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

CSV.foreach("#{Rails.root}/db/default.csv") do |row|
  Bonus.create(:company_name => row[0], :amount => row[1], :age => row[2], :income => row[1].to_i / 2 * 16)
end
