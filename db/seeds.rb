puts "======== Create example users ======="
users = [
  {
    name: "Admin", 
    username: "admin1",
    email: "admin@example.com", 
    password: "12345678", 
    user_type: UserTypeEnum.user_type.teacher.value
  },
  {
    name: "Teacher", 
    username: "teacher1",
    email: "teacher@example.com", 
    password: "12345678", 
    user_type: UserTypeEnum.user_type.teacher.value
  },
  {
    name: "Student", 
    username: "student1",
    email: "student@example.com", 
    password: "12345678", 
    user_type: UserTypeEnum.user_type.student.value
  },
  {
    name: "User", 
    username: "user1",
    email: "user@example.com", 
    password: "12345678", 
    user_type: UserTypeEnum.user_type.student.value
  }
]

users.each do |user|
  unless User.where(email: user[:email]).exists?
    User.create(user)
  end
end


