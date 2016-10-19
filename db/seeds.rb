require './app'

mike = User.create( username: 'dev.4', email: 'dev4mc@gmail.com')
kevin = User.create( username: 'kplaza', email: 'kplaza212@gmail.com')

post1 = Post.create( user_id: mike.id, content: "I can't even" )
post2 = Post.create( user_id: kevin.id, content: "This website is amazing!" )

Comment.create( user_id: kevin.id, post_id: post1.id, content: 'Really? Take the time to write more, please.')
Comment.create( user_id: mike.id, post_id: post2.id, content: 'Wise guy, eh?')