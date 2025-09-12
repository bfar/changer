class ChangesController < ApplicationController
  def index
    @changes = Change.all
    # @risk = Risk.all
    # @change_type = ChangeType.all
  end

  def show
    @change = Change.find(params[:id])
  end

  def new
    @change = Change.new
  end

  def create
    @change = Change.new(change_params)

    if @change.save
      redirect_to change_path(@change)
    else
      render :new
    end
  end


  def change_params
    # params.require(:change).permit(:name, :description, :business_justification, :implementation_plan, :risks, :test_plan, :rollback_plan, :risk_id, :change_type_id)
    params.expect(change: [ :name, :description, :business_justification, :implementation_plan, :risks, :test_plan, :rollback_plan, :risk_id, :change_type_id ])
  end
end
