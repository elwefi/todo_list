# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

categories = Category.create([{ name: "Personal", position: 1}, { name: "Contact", position: 2} , { name: "Work", position: 3}, { name: "Movies to watch", position: 4}])
