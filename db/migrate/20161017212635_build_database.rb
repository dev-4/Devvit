class BuildDatabase < ActiveRecord::Migration
  def change

  	create_table 'user' do |t|
  	t.string :username, limit:10
  	t.string :password
 	t.string :email
 	t.string :fname
    t.string :lname
    end

  	end

  	create_table 'posts' do |t|
  		t.integer :user_id
  		t.text :content
  	end

  	create_table 'comments' do |t|
  		t.integer :user_id
  		t.integer :post_id
  		t.string :content
  	end

  end
end
