class CreateQuickmathStats < ActiveRecord::Migration[6.0]
  def change
    add_column :gamestats, :quickmath_score, :integer
    add_column :gamestats, :quickmath_times, :integer
  end
end
