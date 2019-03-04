class PhrasesController < ApplicationController
  before_action :set_phrase!, only: [:edit, :update, :destroy, :show, :vote]
  before_action :check_user!, only: [:edit, :update, :destroy]
  before_action :check_user_before_example_deletion!, only: [:delete_example]

  def index
    @phrases = Phrase.includes(:user).paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @phrase = Phrase.new()
    @phrase.examples.build(:user_id => current_user.id)
  end

  def show
    @examples = @phrase.examples.includes(:user).paginate(:page => params[:page], :per_page => 10)
    @example = @phrase.examples.build(:user_id => current_user.id)
  end

  def edit
  end

  def update
    if @phrase.update_attributes(phrase_params)
      flash[:success] = 'Phrase has been updated!'
      redirect_to phrases_path
    else
      flash[:danger] = @phrase.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @phrase.destroy
    flash[:success] = 'Phrase has been deleted!'
    redirect_to user_path(@phrase.user)
  end

  def create_example
    @example = @phrase.examples.new(example_params)
    if @example.save
      flash[:success] = 'Example has been created!'
    else
      flash[:danger] = @example.errors.full_messages.to_sentence
    end
    redirect_to phrase_path
  end

  def create
    @phrase = current_user.phrases.new(phrase_params)
    if @phrase.save
      flash[:success] = 'Phrase has been created'
      redirect_to phrases_path
    else
      flash[:danger] = @phrase.errors.full_messages.to_sentence
      render :new
    end
  end

  def vote
    shared_vote(@phrase)
    redirect_back fallback_location: {action: "show"}
  end

  private

  def phrase_params
    phrase = params.require(:phrase).permit(:phrase, :translation, :category, examples_attributes: [ :example, :user_id, :_destroy ])
    phrase[:category] = phrase[:category].to_i
    phrase
  end

  def set_phrase!
    @phrase = Phrase.friendly.find_by(phrase: params[:id])
  end

  def check_user!
    unless @phrase.is_author? current_user
      flash[:danger] = 'You don\'t author of phrase, go away!'
      redirect_back fallback_location: phrase_path
    end
  end

end
