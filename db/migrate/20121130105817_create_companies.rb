class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :company_type_id

      t.timestamps
    end
    add_index :companies, :name
    add_index :companies, :company_type_id
  end
end
