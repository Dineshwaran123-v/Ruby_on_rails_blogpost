class LiksController < ApplicationController
def create
    @lik=current_user.liks.new(params_lik)
if !@lik.save
    flash[:notice]=@lik.errors.full_messages.to_sentence
end
    redirect_to @lik.blogpost
end

def destroy
    @lik=current_user.liks.find(params[:id])
    @lik.destroy
    blogpost=@lik.blogpost
    redirect_to blogpost
end


private
def params_lik
    params.require(:lik).permit(:blogpost_id)
end
end
