
require './app'

mike = User.create( username: 'dev.4', email: 'dev4mc@gmail.com', password: 'carrots1')
kevin = User.create( username: 'kplaza', email: 'kplaza212@gmail.com', password: 'peas1')
john = User.create( username: 'doctorfarts', email: 'umm@gmail.com', password: '1two3four5')


post1 = Post.create( user_id: mike.id, title: 'Potatoes are the future!', content: '
	Have you ever felt like pototoes were used as food? 
	Well guess what buddy, potatoes also contain molecules used to create a meal called, "Poutine".
	Poutine is an ancient word made by French to show other nations that they aren\'t afraid!' )
post2 = Post.create( user_id: kevin.id, title: 'This website is amazing!', content: '
	I know I know... this sounds like I\'m patting myself on the back but look at this!
 This website uses Devkit v2.4.2 and it\'s more functional than your iPhone!' )

Comment.create( user_id: kevin.id, post_id: post1.id, content: 'Is this thread using Devkit v2.4.2? I really hope you are using it.')
Comment.create( user_id: mike.id, post_id: post2.id, content: 'FYI, Devvit and devkit v2.4.2 are not related to me.')
Comment.create( user_id: john.id, post_id: post1.id, content: 'Potatoes are not the future!')

