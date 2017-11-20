class AddResolvedToMicropost < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :resolved, :boolean
  end
end
