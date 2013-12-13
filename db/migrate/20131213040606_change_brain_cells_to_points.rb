class ChangeBrainCellsToPoints < ActiveRecord::Migration
  def change
  	rename_column :brains, :brain_cells, :points 
  end
end
