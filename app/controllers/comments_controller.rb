class CommentsController < ApplicationController
before_action :set_comment
before_action :authenticate_user!

def create
    @comment = @blogpost.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_back(fallback_location: root_path)
end

def destroy
    @comment = @blogpost.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
end


private
def comment_params
    params.require(:comment).permit(:body, :blogpost_id)
end        
def set_comment
     @blogpost= Blogpost.find(params[:blogpost_id])
end
end
