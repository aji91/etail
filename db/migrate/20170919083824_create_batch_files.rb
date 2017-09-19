class CreateBatchFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :batch_files do |t|
      t.integer :batch_id
      t.string :file_name
      t.timestamps
    end
  end
end
