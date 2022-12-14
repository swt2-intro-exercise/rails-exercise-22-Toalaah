class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def index
    @authors = Author.all
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author, notice: 'Successfully created new author!'
    else
      # redirects to new author route in order to display validation errors
      render 'new'
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to @author, notice: 'Successfully updated author!'
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_url, notice: 'Successfully deleted author!'
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
