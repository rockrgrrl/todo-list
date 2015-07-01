class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @tasks = @list.tasks
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)

    if @task.save
      redirect_to list_path(@list)
    else
      render 'show'
    end
  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    @list = List.find(params[:list_id])  
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to list_path(@list)

  end




  private
    def task_params
      params.require(:task).permit(:description)
    end
end
