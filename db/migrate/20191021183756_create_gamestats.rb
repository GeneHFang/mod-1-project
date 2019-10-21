class CreateGamestats < ActiveRecord::Migration[6.0]
  def change
    create_table :gamestats do |t|
      t.integer :rps_score
      t.integer :rps_times
    end
  end
end
