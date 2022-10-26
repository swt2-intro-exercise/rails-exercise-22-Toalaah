class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def index
    @authors = Author.all
  end

  def create
    @author = Author.new(author_params)
    @author.save()

    redirect_to @author, notice: 'Successfully created new author!'
  end

  def show
    @author = Author.find(params[:id])
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
