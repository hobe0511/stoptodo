class TodosController < ApplicationController
	def index
		@todos = Todo.all
		@todo = Todo.new
	end

	def show
		@todo=Todo.find(params[:id])
	end
	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			redirect_to :action => :index
		else
			render :index
		end
	end

	private

	def todo_params
		params.require(:todo).permit(:title)
	end


end
