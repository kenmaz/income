class AddFacebookIdToBonuses < ActiveRecord::Migration
  def change
    add_column :bonuses, :facebook_id, :string
  end
end
