require 'roo'
class BatchFile < ApplicationRecord
  mount_uploader :file_name, FileUploader
  belongs_to :batch
  validates :file_name, presence: true
  after_create :create_excel_records

  def create_excel_records
    xls = Roo::Spreadsheet.open(self.file_name.path)
    xls.sheets.each do |sheet|
      xls.default_sheet = sheet
      2.upto(xls.last_row) do |index|
        row = xls.row(index)
        pr = ProductReport.find_by(batch_id: self.batch_id, model_no: row[1])
        if pr.present?
          pr.update_attributes(manufacturer: row[2], category: row[3])
        else
          ProductReport.create(
            model_no: row[1],
            batch_id: self.batch_id,
            manufacturer: row[2],
            category: row[3],
          )
        end
      end
    end
  end
end
