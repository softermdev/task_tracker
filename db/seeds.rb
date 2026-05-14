# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "🌱 Seeding database..."

# Create Admin User
admin = User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
  user.admin = true
end
puts "✅ Admin user created: #{admin.email}"

# Create Regular Users
user1 = User.find_or_create_by!(email: 'john@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
end
puts "✅ User created: #{user1.email}"

user2 = User.find_or_create_by!(email: 'jane@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
end
puts "✅ User created: #{user2.email}"

user3 = User.find_or_create_by!(email: 'bob@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
end
puts "✅ User created: #{user3.email}"

# Create Projects
project1 = Project.find_or_create_by!(name: 'Website Redesign') do |project|
  project.description = 'Complete redesign of company website with modern UI/UX'
  project.owner = user1
end
puts "✅ Project created: #{project1.name}"

project2 = Project.find_or_create_by!(name: 'Mobile App Development') do |project|
  project.description = 'Build iOS and Android mobile application'
  project.owner = user2
end
puts "✅ Project created: #{project2.name}"

project3 = Project.find_or_create_by!(name: 'Marketing Campaign') do |project|
  project.description = 'Q2 marketing campaign planning and execution'
  project.owner = admin
end
puts "✅ Project created: #{project3.name}"

# Add Project Members
project1.add_member(user1, role: 'owner') unless project1.members.include?(user1)
project1.add_member(user2, role: 'member') unless project1.members.include?(user2)
project1.add_member(user3, role: 'member') unless project1.members.include?(user3)

project2.add_member(user2, role: 'owner') unless project2.members.include?(user2)
project2.add_member(user1, role: 'member') unless project2.members.include?(user1)

project3.add_member(admin, role: 'owner') unless project3.members.include?(admin)
project3.add_member(user1, role: 'member') unless project3.members.include?(user1)
project3.add_member(user2, role: 'member') unless project3.members.include?(user2)

puts "✅ Project members added"

# Create Labels
label1 = project1.labels.find_or_create_by!(name: 'Bug') do |label|
  label.color = '#ef4444'
end

label2 = project1.labels.find_or_create_by!(name: 'Feature') do |label|
  label.color = '#3b82f6'
end

label3 = project1.labels.find_or_create_by!(name: 'Enhancement') do |label|
  label.color = '#10b981'
end

label4 = project2.labels.find_or_create_by!(name: 'UI/UX') do |label|
  label.color = '#8b5cf6'
end

label5 = project2.labels.find_or_create_by!(name: 'Backend') do |label|
  label.color = '#f59e0b'
end

puts "✅ Labels created"

# Create Tasks
task1 = project1.tasks.find_or_create_by!(title: 'Design homepage mockup') do |task|
  task.description = 'Create high-fidelity mockup for new homepage design'
  task.status = 'in_progress'
  task.priority = 'high'
  task.due_date = Date.today + 7.days
  task.creator = user1
  task.assignee = user2
end
task1.labels << label2 unless task1.labels.include?(label2)

task2 = project1.tasks.find_or_create_by!(title: 'Fix navigation menu bug') do |task|
  task.description = 'Navigation menu not working on mobile devices'
  task.status = 'todo'
  task.priority = 'high'
  task.due_date = Date.today + 3.days
  task.creator = user1
  task.assignee = user3
end
task2.labels << label1 unless task2.labels.include?(label1)

task3 = project1.tasks.find_or_create_by!(title: 'Implement contact form') do |task|
  task.description = 'Add contact form with validation and email notification'
  task.status = 'todo'
  task.priority = 'medium'
  task.due_date = Date.today + 14.days
  task.creator = user1
  task.assignee = user1
end
task3.labels << label2 unless task3.labels.include?(label2)

task4 = project2.tasks.find_or_create_by!(title: 'Setup project structure') do |task|
  task.description = 'Initialize React Native project with necessary dependencies'
  task.status = 'done'
  task.priority = 'high'
  task.due_date = Date.today - 5.days
  task.creator = user2
  task.assignee = user1
end
task4.labels << label5 unless task4.labels.include?(label5)

task5 = project2.tasks.find_or_create_by!(title: 'Design app screens') do |task|
  task.description = 'Create UI designs for all main app screens'
  task.status = 'in_progress'
  task.priority = 'high'
  task.due_date = Date.today + 10.days
  task.creator = user2
  task.assignee = user2
end
task5.labels << label4 unless task5.labels.include?(label4)

task6 = project3.tasks.find_or_create_by!(title: 'Create social media content') do |task|
  task.description = 'Prepare content calendar for social media posts'
  task.status = 'todo'
  task.priority = 'medium'
  task.due_date = Date.today + 7.days
  task.creator = admin
  task.assignee = user1
end

puts "✅ Tasks created"

# Create Comments
comment1 = task1.comments.find_or_create_by!(content: 'Started working on the mockup. Will share draft by EOD.', user: user2)
comment2 = task1.comments.find_or_create_by!(content: 'Great! Looking forward to seeing it.', user: user1)
comment3 = task2.comments.find_or_create_by!(content: 'I can reproduce this issue. Will fix it today.', user: user3)
comment4 = task4.comments.find_or_create_by!(content: 'Project setup completed. Ready for development.', user: user1)
comment5 = task5.comments.find_or_create_by!(content: 'Working on the login and dashboard screens first.', user: user2)

puts "✅ Comments created"

puts "🎉 Seeding completed!"
puts ""
puts "📧 Login credentials:"
puts "Admin: admin@example.com / password123"
puts "User 1: john@example.com / password123"
puts "User 2: jane@example.com / password123"
puts "User 3: bob@example.com / password123"
