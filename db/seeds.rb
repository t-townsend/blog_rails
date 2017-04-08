
# CREATE images
['DSC_0205.JPG', 'DSC_0246.JPG', 'DSC_0275.JPG', 'DSC_0291.JPG', 'DSC_0459.JPG', 'DSC_0548.JPG'].each do |image|
  Image.create(name: image)
end

# create avatar images
['archer.jpeg', 'bear.jpg', 'bombrobot.png', 'chicken.jpeg', 'dj.jpeg', 'dog.jpeg', 'dude.jpeg', 'ewf.jpeg',
'flute.png','gangster.jpeg', 'genie.jpeg', 'jackrave.jpeg', 'lady.jpeg', 'mom.jpeg', 'ninja.jpeg', 'poker.jpeg',
'robot.jpeg', 'scot.jpg', 'streetguys.jpeg', 'waitress.jpeg', 'warrior.jpeg', 'woman.jpeg'].each do |avatar|
  Avatar.create(name: avatar)
end


# Create Authors
20.times do
  avatar = Avatar.all.sample
  User.create(avatar: avatar.name,
              name: Faker::StarWars.character,
              email: Faker::Internet.email,
              password: '12345678',

  )
end
puts Cowsay.say 'Created 20 users', :ghostbusters


# Create posts

50.times do
  image = Image.all.sample
  user = User.all.sample

  p = Post.create(title: Faker::StarWars.quote,
                  body: Faker::Hipster.paragraph(6),
                  user_id: user.id,
                  image: image.name
  )
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
