class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :forbid_user_vote!, only: [:vote]


  def shared_vote(instance)
    if params[:vote] == 'up'
      instance.liked_by current_user
      values_difference = instance.get_likes.size - instance.get_dislikes.size
      if values_difference % 5 == 0
        UserMailer.five_like(instance.user).deliver
      end
    else
      instance.downvote_from current_user
    end

    if instance.vote_registered?
      instance.set_carma(params[:vote], current_user)
      message = params[:vote] == 'up' ? 'Liked your' : 'Disliked your'
      instance.create_activity key: message, owner: current_user, recipient: instance.user
      flash[:success] = 'Thanks for your vote!'
    else
      flash[:danger] = 'You\'ve already voted that post!'
    end
  end

  private
  def forbid_user_vote!
    if params[:controller] == 'examples'
      phrase = Phrase.friendly.find(params[:phrase_id])
      cheater = phrase.examples.find_by(id: params[:example_id]).user == current_user
    else
      cheater = Phrase.friendly.find(params[:id]).user == current_user
    end

    if cheater
      flash[:danger] = 'You can\'t vote for yourself little cheater !'
      redirect_back fallback_location: {action: "show"}
    end
  end
end