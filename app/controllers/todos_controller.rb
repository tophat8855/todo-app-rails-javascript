class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    puts "I'm in the create action of the todos controller!"
    @todo = Todo.new(todo_params)
    if @todo.save
      puts "It worked!"
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render json: @todo
  end

  private
  def todo_params
    params.require(:todo).permit(:content, :completed)
  end
end
