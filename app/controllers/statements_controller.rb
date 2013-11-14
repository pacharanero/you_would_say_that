class StatementsController < ApplicationController

  def index
  @statements = Statement.all
  end

  def new   
  end 
  
  def create
    @statement = Statement.new(statement_params)
    @statement.save
    redirect_to action: :show, id: @statement.id
  end
  
  def show
  @statement = Statement.find(params[:id])
  end
  
  private
    def statement_params
      params.require(:statement).permit(:statement_metadata, :statement_body)
    end

end
