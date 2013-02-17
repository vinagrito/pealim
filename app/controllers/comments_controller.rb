class CommentsController < ApplicationController

  def index
    @comments = Comment.ordered
  end

  def show

    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html { render :partial => 'index_comments'}
    end
  end

  def new
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        flash[:notice] = "Thank you."
        format.html { redirect_to comment_path(@comment) }
      else
        flash[:comment_errors] = @comment.errors.full_messages
        format.html { render :partial => 'errors_new_comment' }
      end
    end
  end
end
