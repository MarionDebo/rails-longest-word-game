# range = [*'a'..'z']
# blob = Array.new(9){range.sample}
# p blob

# require 'json'
# require 'open-uri'
# url = 'https://api.github.com/users/ssaunier'
# user_serialized = open(url).read
# user = JSON.parse(user_serialized)
# puts "#{user['name']} - #{user['bio']}"

    range = [*'A'..'Z']
    @letters = Array.new(9){range.sample}.join
    puts @letters
