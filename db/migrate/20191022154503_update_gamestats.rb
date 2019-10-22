class UpdateGamestats < ActiveRecord::Migration[6.0]
  def change
    add_column :gamestats, :colortext_score, :integer
    add_column :gamestats, :colortext_times, :integer
    add_column :gamestats, :score, :integer
    add_column :gamestats, :times_played, :integer

  end
end
