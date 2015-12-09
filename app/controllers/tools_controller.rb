class ToolsController < ApplicationController
  def index
    tools = Tool.all
    @tools = tools.order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
    @select_menu = ToolType.uniq.pluck(:tool_type)
  end

  def new
  end

  def create
    @tool = Tool.new(tool_params)
    (@tool.valid?) ? (tool_valid(@tool)) : (tool_not_valid(@tool))
    redirect_to :action => :index
  end

  def destroy
    @tool = Tool.find(params[:id])
    if @tool.destroy
      flash[:notice] = "Removed tool"
    else
      flash[:notice] = "Error"
    end
    redirect_to :action => :index
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :description, :quantity)
  end

  def tool_valid(model)
    model.save!
    flash[:notice] = 'Successful created Tool'
  end

  def tool_not_valid(model)
    flash[:alert] = 'Errors, not created'
  end
end
