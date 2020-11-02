class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer :FollowerId
      t.integer :FollowedId

    end
  end
end
