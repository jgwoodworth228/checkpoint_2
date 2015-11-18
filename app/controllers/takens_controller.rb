class TakensController < ApplicationController
  def index
    @takens = Taken.all
  end

  def show
    @taken = Taken.find(params[:id])
  end

  def new
    @taken = Taken.new
  end

  def create
    @taken = Taken.new
    @taken.user_id = params[:user_id]
    @taken.course_id = params[:course_id]

    if @taken.save
      redirect_to "/courses", :notice => "Taken created successfully."
    else
      render 'new'
    end
  end

  def edit
    @taken = Taken.find(params[:id])
  end

  def update
    @taken = Taken.find(params[:id])

    @taken.user_id = params[:user_id]
    @taken.course_id = params[:course_id]

    if @taken.save
      redirect_to "/takens", :notice => "Taken updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @taken = Taken.find(params[:id])

    @taken.destroy

    redirect_to "/courses", :notice => "Taken deleted."
  end
end
