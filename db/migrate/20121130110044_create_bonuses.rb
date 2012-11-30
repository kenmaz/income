class CreateBonuses < ActiveRecord::Migration
  def change
    create_table :bonuses do |t|
      t.integer :amount
      t.integer :age
      t.integer :company_id

      t.timestamps
    end
    add_index :bonuses, :age
    add_index :bonuses, :company_id
  end
end
