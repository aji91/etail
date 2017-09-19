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

  private

  def batch_params
    params.require(:batch).permit(:name, :user_id)
  end

  def bacth_file_params
    params.require(:batch_file).permit(:file_name, :batch_id)
  end
end