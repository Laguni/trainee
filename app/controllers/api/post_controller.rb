class Api::PostController < ApplicationController
    def create
        post=Post.new(post_params)
        post.save!
        render json: post, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private

    def post_params
        params.require(:post).permit(:id , :title, :content)
    end
end
