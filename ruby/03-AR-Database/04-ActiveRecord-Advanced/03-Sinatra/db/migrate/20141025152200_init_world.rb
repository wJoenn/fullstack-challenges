class InitWorld < ActiveRecord::Migration[7.0]
  def change
    create_users
    create_posts
  end

  private

  def create_users
    create_table :users do |t|
      t.string :username
      t.string :email
      t.timestamps null: false
    end
  end

  def create_posts
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.integer :votes, default: 0
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
