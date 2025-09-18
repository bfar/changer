class ChangeRecordsController < ApplicationController
  def index
    @change_records = ChangeRecord.all
  end

  def show
    @change_record = ChangeRecord.includes(:risk, :change_type).find(params[:id])
  end

  def new
    @change_record  = ChangeRecord.new
  end

  def create
    @change_record  = ChangeRecord.new(change_params)

    if @change_record.save
      flash[:notice] = "Change created sucessfully"
      redirect_to change_record_path(@change_record)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @change_record  = ChangeRecord.find(params[:id])
  end

  def update
    @change_record  = ChangeRecord.find(params[:id])

    if @change_record.update(change_params)
      flash[:notice] = "Change updated sucessfully"
      redirect_to change_record_path(@change_record)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @change_record  = ChangeRecord.find(params[:id])

    @change_record.destroy
    flash[:notice] = "Change deleted."
    redirect_to changes_path
  end

  def change_params
    # params.require(:change).permit(:name, :description, :business_justification, :implementation_plan, :risks, :test_plan, :rollback_plan, :risk_id, :change_type_id)
    params.expect(change_record: [ :name, :description, :business_justification, :implementation_plan, :risks, :test_plan, :rollback_plan, :risk_id, :change_type_id ])
  end
end
