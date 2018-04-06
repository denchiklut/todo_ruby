class TodosController < ApplicationController
  before_action :set_project
  before_action :set_todo, except: [:create]

  def create
    @todo = @project.todos.create(todo_params)
    redirect_to @project
  end

  def destroy
    if @todo.destroy
      flash[:success] = "Задача была удалена."
    else
      flash[:error] = "Задача не мжет быть удалена."
    end

    redirect_to @project
  end

  def complete
    @todo.update_attribute(:completed_at, Time.now)
    redirect_to @project, notice: "Задача выполнена"
  end


  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_todo
    @todo = @project.todos.find(params[:id])
  end

  def todo_params
    params[:todo].permit(:text)
  end
end
