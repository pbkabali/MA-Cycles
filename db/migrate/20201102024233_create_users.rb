class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :Username
      t.string :FullName
      t.string :Photo
      t.string :CoverImage

      t.timestamps
    end
  end
end
