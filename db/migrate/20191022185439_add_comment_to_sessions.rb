class AddCommentToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :comment, :text
  end
end
