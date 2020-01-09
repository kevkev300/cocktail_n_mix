class AddDescriptionToDose < ActiveRecord::Migration[5.2]
  def change
    add_column :doses, :description, :string
  end
end
