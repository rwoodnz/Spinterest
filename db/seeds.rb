user = User.create(username: 'test')
user.set_password('pass')

Pic.create(title: 'amazing cat', url: 'http://placekitten.com/200/200')
Pic.create(title: 'super cat', url: 'http://placekitten.com/300/300')
