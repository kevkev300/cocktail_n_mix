class ChangeTypeColumnNameInDose < ActiveRecord::Migration[5.2]
  def change
    rename_column :doses, :type, :unit
  end
end
