class BuildDatabase < ActiveRecord::Migration[5.0]
  def change
  	# user table
  	create_table 'users' do |t|
  		t.string :username, limit: 10
  		t.string :password
  		t.string :email
  end
	  # post table
	  create_table 'posts' do |t|
	  	t.integer :user_id
	  	t.text :content
	  end
	  # comment table
	  create_table 'comments' do |t|
	  	t.integer :user_id
	  	t.integer :post_id
	  	t.string :content
	  end
  end
end
