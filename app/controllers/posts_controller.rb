class PostsController < ApplicationController
   protect_from_forgery prepend: true
   before_action :authenticate_user!, only: [ :new, :create ]

   def index
    @posts = Post.all
   end

   def new
    @posts = Post.new
   end

   def  create
      @posts = current_user.posts.build(user_params)

      if @posts.save
        redirect_to @posts, notice: "Post was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
   end

  private

   def user_params
    params.require(:posts).permit(:id, :title, :content)
   end
end
