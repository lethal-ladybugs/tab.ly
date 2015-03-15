# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

business1 = Business.create({name: 'My Restaurant'})

job_1 = Job.create({user_id: 1, yelp_id: 'red-and-white-burger-north-bergen-2', position: 'waiter'})
job_2 = Job.create({user_id: 2, yelp_id: 'red-and-white-burger-north-bergen-2', position: 'waiter'})
job_3 = Job.create({user_id: 3, yelp_id: 'red-and-white-burger-north-bergen-2', position: 'waiter'})
