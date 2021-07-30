class PostsController < ApplicationController
    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        @post.sub_id = params[:sub_id]
        if @post.save
            redirect_to sub_post_url([params[:sub_id], @post.id])
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
            redirect_to sub_post_url(@post)
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to subs_url
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    private
    def post_params
        params.require(:post).permit(:title, :url, :content)
    end

end