class CommentsController < ApplicationController
  # comments_controller.rb
  def create
    @publication = Publication.find(params[:publication_id])
    @comment = @publication.comments.new(comment_params)
    @comment.user = current_user if user_signed_in?
    @comment.save
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end

end


