class AddIsOnlineToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_online, :boolean, deafult: false
  end
end
