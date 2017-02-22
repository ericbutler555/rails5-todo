class TodosController < ApplicationController
  
  # display a list of all todos, /todos
  def index
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
    @todo = Todo.find(params[:id])
  end
  
  # return a form for editing an existing todo, todos/1/edit
  def edit
  end
  
  # update an existing todo, /todos/1
  def update
  end
  
  # delete an existing todo, /todos/1
  def destroy
  end
  
  private
    def todo_params
      params.require(:todo).permit(:name, :description)
    end
  
end
