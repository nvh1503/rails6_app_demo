# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
  name: "Admin", 
  email: "teacher@example.com", 
  password: "12345678", 
  user_type: UserTypeEnum.user_type.teacher.value
) unless User.where(email: "teacher@example.com").exists?