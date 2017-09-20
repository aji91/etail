class BatchesController < ApplicationController
  def index
    @batches = current_user.batches
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = current_user.batches.new(batch_params)
    if @batch.save
      redirect_to batches_path
    else
      render :new
    end
  end

  def upload_file
    if params[:batch_file].present?
      @batch_file = BatchFile.new(bacth_file_params)
      @batch_file.save
      redirect_to batches_path
    end
  end

  def change_status
    @batches = Batch.all
  end

  def show_batch_records
    @batch = Batch.find_by_id(params[:batch_id])
    @products = @batch.product_reports
  end

  def filter_batch_records
    @batch = Batch.find_by_id(params[:batch_id])
    if params[:status] == 'all'
      @products = @batch.product_reports
    else
      @products = @batch.product_reports.where(status: params[:status])
    end
  end

  def change_record_status
    @product = ProductReport.find_by_id(params[:product_id])
    @product.update_attributes!(status: params[:status])
  end

  def change_multiple_records
    @batch = Batch.find_by_id(params[:batch_id])
    @batch.product_reports.where(id: params[:product_ids]).update_all(status: params[:status])
    @products = @batch.product_reports
  end

  def export_csv
    @batch = Batch.find_by_id(params[:batch_id])
    if params[:status] == 'all' || params[:status] == 'undefined'
      @products = @batch.product_reports
    else
      @products = @batch.product_reports.where(status: params[:status])
    end
    respond_to do |format|
      format.xlsx
    end
  end

  private

  def batch_params
    params.require(:batch).permit(:name, :user_id)
  end

  def bacth_file_params
    params.require(:batch_file).permit(:file_name, :batch_id)
  end
end