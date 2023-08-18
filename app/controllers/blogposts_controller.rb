class BlogpostsController < ApplicationController
    before_action :setparams, except: %i[index new create search likedpost myblog allblog mostlikedblog category]
    before_action :authenticate_user!, except: [:index, :show, :allblog]
    before_action :correct_user, only: [:edit, :update, :destroy]

    def correct_user
        @blogpost=current_user.blogposts.find_by(id: params[:id])
        redirect_to blogposts_path, notice: "you are not authorized to make change" if @blogpost.nil?
    end
    def index
        @blogpost=Blogpost.all

    end
    def new
        @blogpost=current_user.blogposts.build

    end
    def create
        @blogpost=current_user.blogposts.build(blogpost_params)
        if @blogpost.save
            flash[:notice] = "#{@blogpost.title} is successfully created "
            redirect_to blogposts_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    def show
        @comment =Comment.new
        @comments=@blogpost.comments.order("created_at DESC")
    end
    def edit

    end
    def update
        if @blogpost.update(blogpost_params)
            flash[:notice]="#{@blogpost.title} is updated"
            redirect_to blogposts_path
        else
            render :edit, status: :unprocessable_entity
        end
    end
    def destroy
        @blogpost.destroy
        flash[:notice]="#{@blogpost.title} is deleted"
        redirect_to blogposts_path
    end
    def search
        @blogposts = Blogpost.where("title LIKE?","%"+ params[:q] +"%")

    end
    def likedpost
        @l= Lik.select(:blogpost_id).where(user_id: current_user.id)
        @blogpost=Blogpost.where(id: @l )
    end

    def myblog
        @blogpost=Blogpost.where(user_id: current_user.id )
    end

    def allblog
        @a=params[:s].to_i
        if @a==1
            @blogpost=Blogpost.order("created_at DESC")
        elsif @a==2
            @blogpost=Blogpost.order("created_at")
        elsif @a==3
            @blogpost=Blogpost.order("title ")
        elsif @a==4
            @blogpost=Blogpost.order("title DESC ")
        else
            @blogpost=Blogpost.all
        end

        @c=params[:c]
        if @c
            @blogpost=Blogpost.where(category: "#{@c}")

        end
        end

        def mostlikedblog
            @b=Lik.group(:blogpost_id).order('count_all DESC').count.keys.first
            @blogpost=Blogpost.where(id: @b )
        end
      


private
    def blogpost_params
        params.require(:blogpost).permit(:title, :content, :category)
    end
    def setparams
        @blogpost = Blogpost.find(params[:id])
    end
end