class ChangePartiesDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :parties, :start_time, :datetime 
  end
end
