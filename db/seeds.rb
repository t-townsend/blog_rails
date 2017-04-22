
POST_IMAGE_NAMES = ['DSC_0205.JPG', 'DSC_0246.JPG', 'DSC_0275.JPG', 'DSC_0291.JPG', 'DSC_0459.JPG', 'DSC_0548.JPG']

# create avatar images

USER_AVATARS = ['archer.jpeg', 'bear.jpg', 'bombrobot.png', 'chicken.jpeg', 'dj.jpeg', 'dog.jpeg', 'dude.jpeg', 'ewf.jpeg',
'flute.png','gangster.jpeg', 'genie.jpeg', 'jackrave.jpeg', 'lady.jpeg', 'mom.jpeg', 'ninja.jpeg', 'poker.jpeg',
'robot.jpeg', 'scot.jpg', 'streetguys.jpeg', 'waitress.jpeg', 'warrior.jpeg', 'woman.jpeg']

# Create Authors
20.times do
  file = File.open("#{Rails.root}/app/assets/images/#{USER_AVATARS.sample}")
  User.create(avatar: file,
              body: Faker::Hipster.paragraph(10),
              name: Faker::StarWars.character,
              email: Faker::Internet.email,
              password: '12345678',

  )
  file.close
end
puts Cowsay.say 'Created 20 users', :ghostbusters


# Create posts

50.times do
  user = User.all.sample

  file = File.open("#{Rails.root}/app/assets/images/#{POST_IMAGE_NAMES.sample}")

  p = Post.create(title: Faker::StarWars.quote,
                  body: Faker::Hipster.paragraph(200),
                  user_id: user.id,
                  image: file
  )

  file.close
end

puts Cowsay.say 'Created 50 products', :dragon

# Create comments
Post.all.each do |post|
  5.times do
    user = User.all.sample

    post.comments.create( title: Faker::StarWars.quote,
                          body: Faker::HarryPotter.quote,
                          user_id: user.id
    )

  end
end
puts Cowsay.say 'Created lots of comments', :stimpy
