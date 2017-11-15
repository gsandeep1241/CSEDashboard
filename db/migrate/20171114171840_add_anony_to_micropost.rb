class AddAnonyToMicropost < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :anony, :boolean
  end
end
