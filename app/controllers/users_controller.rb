class UsersController < ApplicationController
  before_filter :load_helpfulness
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
  end
  
  def create
  end
    
private

    def load_helpfulness
	   #modelclass = [Medication].detect { |c| params["#{c.name.underscore}_id"]}
	   # @helpfulness = modelclass.find(params["#{modelclass.name.underscore}_id"])
    # @helpfulness = Medication.find(params[:medication_id])
       resource, id = request.path.split('/')[1, 2]
       @helpfulness = resource.singularize.classify.constantize.find(id)
    end 
end