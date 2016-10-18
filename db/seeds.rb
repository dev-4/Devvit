require './app'

mike = User.create( username: 'dev.4')
kevin = User.create( username: 'kplaza')
post1 = Post.create( user_id: mike.id, content: 'My first post' )

Comment.create( user_id: kevin.id, post_id: post1.id, content: 'Really? Take the time to write more, please.')