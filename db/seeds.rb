require 'faker'

# Seed user data
users = User.create!([
                       { email: 'john@example.com', password: 'password', admin: true },
                       { email: 'jane@example.com', password: 'password', admin: false }
                     ])

# Seed education data
5.times do
  passed_year = [Faker::Number.between(from: 2000, to: 2023), nil].sample
  anticipated_passed_year = [Faker::Number.between(from: 2024, to: 2028), nil].sample

  Education.create(
    level: Faker::Educator.degree,
    course: Faker::Educator.course_name,
    university: Faker::University.name,
    passed_year: passed_year,
    anticipated_passed_year: anticipated_passed_year,
    gpa: passed_year ? Faker::Number.between(from: 2.0, to: 4.0).round(2) : nil
  )
end

# Seed project data
5.times do
  Project.create(
    title: Faker::App.name,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    link: Faker::Internet.url
  )
end

# Seed skill data
5.times do
  Skill.create(
    name: Faker::ProgrammingLanguage.name,
    proficiency: Faker::Number.between(from: 1, to: 5).to_s
  )
end

# Seed resume data
5.times do
  Resume.create!(
    title: Faker::Job.title,
    user_id: users.sample.id  # Randomly assign a user_id to each resume
  )
end
