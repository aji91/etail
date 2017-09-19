class CreateProductReports < ActiveRecord::Migration[5.1]
  def change
    create_table :product_reports do |t|
      t.integer :batch_id
      t.string :model_no
      t.string :manufacturer
      t.string :category
      t.string :status
      t.string :image
      t.string :meta_title
      t.string :meta_keywords
      t.string :meta_description
      t.string :title
      t.timestamps
    end
  end
end
