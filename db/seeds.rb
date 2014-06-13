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

10.times do
  random_cat
end