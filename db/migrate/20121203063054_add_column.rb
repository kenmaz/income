class AddColumn < ActiveRecord::Migration
  def up
    add_column :bonuses, :comment, :string
  end

  def down
    remove_column :bonuses, :comment
  end
end
