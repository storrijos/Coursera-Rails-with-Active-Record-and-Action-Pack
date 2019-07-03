# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 

User.destroy_all

fiorina = User.create! username: "Fiorina", password_digest: "pass1"
trump = User.create! username: "Trump", password_digest: "pass2"
carson = User.create! username: "Carson", password_digest: "pass3"
clinton = User.create! username: "Clinton", password_digest: "pass4"

Profile.destroy_all


fiorina.create_profile! gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina"
trump.create_profile! gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump"
carson.create_profile! gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson"
clinton.create_profile! gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton"


TodoList.destroy_all
TodoItem.destroy_all

User.all.each_with_index do |user, index|
    todo_list_per_user = user.todo_lists.create! list_name: "List #{index}", list_due_date: 1.year.since(Date.today) 
    5.times do |i|
        todo_list_per_user.todo_items.create! due_date: 1.year.since(Date.today), title: "Random title #{Random.rand(11)}", description: "Random description #{Random.rand(11)}"
    end
end
