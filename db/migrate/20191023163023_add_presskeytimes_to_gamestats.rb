class AddPresskeytimesToGamestats < ActiveRecord::Migration[6.0]
  def change
    add_column :gamestats, :presskeytimes_score, :integer
    add_column :gamestats, :presskeytimes_times, :integer
  end
end
