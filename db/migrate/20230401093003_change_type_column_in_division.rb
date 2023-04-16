class ChangeTypeColumnInDivision < ActiveRecord::Migration[6.1]
  def change
    rename_column :divisions, :type, :division_type
  end
end
