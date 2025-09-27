class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :avatar_url
      t.string :github_token

      t.timestamps
    end
    
    add_index :users, [:provider, :uid], unique: true
  end
end
