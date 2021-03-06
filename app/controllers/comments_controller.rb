class CommentsController < ApplicationController
  def create
    topic = Topic.find(params[:topic_id])
    comment = Comment.new(comment_params)
    comment.topic = topic
    comment.user = current_user
    comment.save!

    redirect_to topic_path(topic)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end