class AddTagToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :tag, :string
  end
end
