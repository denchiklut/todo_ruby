class TodosController < ApplicationController
  before_action :set_project

  def create
    @todo = @project.todos.create(todo_params)
    redirect_to @project
  end

  def destroy
    @todo = @project.todos.find(params[:id])
    if @todo.destroy
      flash[:success] = "Задача была удалена."
    else
      flash[:error] = "Задача не мжет быть удалена."
    end

    redirect_to @project
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def todo_params
    params[:todo].permit(:text)
  end
end
