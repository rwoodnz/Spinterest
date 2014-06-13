user = User.create(username: 'test')
user.set_password('pass')


user = User.create(username: 'Widdershin')
user.set_password('pass')

def random_cat
  good_words = ['amazing', 'super', 'wow', 'such', 'great', 'hardcore']
  good_word = good_words.sample
  cat_name = "#{good_word} cat"

  width = [*100..200].sample
  height = [*75..150].sample

  url = "http://placekitten.com/#{width}/#{height}"

  Pic.create(title: cat_name, url: url)
end

# 10.times do
#   random_cat
# end

Pic.delete_all

Pic.create(title: 'whatever', url: 'http://www.annsqualitygrooming.com/dogcat.jpg')
Pic.create(title: 'Nope...', url: 'http://media1.giphy.com/media/y1ewxG8aFWk0M/200.gif')
Pic.create(title: 'Sweg', url: 'http://media3.giphy.com/media/QxifaDk4Yh8Qg/200.gif')
Pic.create(title: 'IDK', url: 'http://media1.giphy.com/media/2n2iZX5lzm9tS/200.gif')
Pic.create(title: 'Disco! Disco!', url: 'http://media3.giphy.com/media/EloZho4xb9ZQI/200.gif')
Pic.create(title: 'WAT', url: 'http://cdn.theanimals.pics/pictures/www.wabashfirstumc.org/dog_v_cat.jpg')
Pic.create(title: 'whatever', url: 'http://i1112.photobucket.com/albums/k497/animalsbeingdicks/abd-6-11-2014.gif')
Pic.create(title: 'Son of a Female dog', url: 'http://i1112.photobucket.com/albums/k497/animalsbeingdicks/abd-5-21-2014.gif')
Pic.create(title: 'Smart doge', url: 'http://i1112.photobucket.com/albums/k497/animalsbeingdicks/abd-5-6-2014.gif')
Pic.create(title: 'best pet everr', url: 'http://www.permaculture.co.uk/sites/default/files/images/greek-potato.standard%20460x345.gif')
Pic.create(title: 'I Haz Sit', url: 'http://i1112.photobucket.com/albums/k497/animalsbeingdicks/abd-4-16-2014.gif')
Pic.create(title: 'Rainbow Cate', url: 'http://24.media.tumblr.com/tumblr_luqgvyxeHL1qdf3pto1_500.gif')
Pic.create(title: 'Prety Pony', url: 'http://media.giphy.com/media/1faY7T5mx64p2/giphy.gif')
Pic.create(title: 'Come at me brah', url: 'http://media1.giphy.com/media/XnkqCp0gzHmyk/200.gif')
Pic.create(title: 'Is on', url: 'http://media3.giphy.com/media/U1rlk8zdcAwbm/200.gif')

