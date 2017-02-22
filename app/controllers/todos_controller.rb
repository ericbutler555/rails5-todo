class TodosController < ApplicationController
  
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  
  # display a list of all todos, /todos
  def index
    @todos = Todo.all
  end
  
  # return a form for creating a new todo, /todos/new
  def new
    @todo = Todo.new
  end
  
  # create a new todo, /todos
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo was created successfully"
      redirect_to todo_path(@todo) # go to /todos/[this id]
    else
      render 'new'
    end
  end
  
  # display an existing todo, /todos/1
  def show
  end
  
  # return a form for editing an existing todo, todos/1/edit
  def edit
  end
  
  # update an existing todo, /todos/1
  def update
    if @todo.update(todo_params)
      flash[:notice] = "Todo was successfully updated"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end
  
  # delete an existing todo, /todos/1
  def destroy
    @todo.destroy
    flash[:notice] = "Todo was deleted successfully"
    redirect_to todos_path
  end
  
  private
    
    def todo_params
      params.require(:todo).permit(:name, :description)
    end
    
    def set_todo
      @todo = Todo.find(params[:id])
    end
    
end
