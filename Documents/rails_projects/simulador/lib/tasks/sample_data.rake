namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Juan Reyes",
                 email: "jreyes@mail.com",
                 pyme: "simuladorCredito",
                 password: "123456",
                 password_confirmation: "123456",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      pyme = "pyme#{n+1}"
      User.create!(name: name,
                   email: email,
                   pyme: pyme,
                   password: password,
                   password_confirmation: password)
    end
  end
end