class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.integer :gamestat_id
    end
  end
end
