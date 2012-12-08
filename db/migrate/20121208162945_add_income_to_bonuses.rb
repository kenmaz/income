class AddIncomeToBonuses < ActiveRecord::Migration
  def change
    add_column :bonuses, :income, :integer
  end
end
