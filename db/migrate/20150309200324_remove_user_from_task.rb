class RemoveUserFromTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :user_id, :integer
  end
end
