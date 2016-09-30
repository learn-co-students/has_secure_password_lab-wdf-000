class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :force => true do |t|
      t.string :password_digest
      t.string :name
    end
  end
end
