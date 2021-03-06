class ExamplesController < ApplicationController
  before_action :set_phrase!, only: [:create, :destroy, :vote]
  before_action :set_example!, only: [:destroy, :vote]

  def create
    @example = @phrase.examples.new(example_params)
    if @example.save
      flash[:success] = 'Example has been created!'
    else
      flash[:danger] = @example.errors.full_messages.to_sentence
    end
    redirect_to phrase_path(@phrase)
  end

  def destroy
    @example.destroy
    flash[:success] = 'Example has been deleted!'
    redirect_to phrase_path(@phrase)
  end

  def vote
    shared_vote(@example)
    redirect_to phrase_path(@phrase)
  end

  private

  def example_params
    params.require(:example).permit(:example, :user_id)
  end

  def set_phrase!
    @phrase = Phrase.friendly.find(params[:phrase_id])
  end

  def set_example!
    if params[:example_id]
      param = params[:example_id]
    else
      param = params[:id]
    end
    @example = @phrase.examples.find_by(id: param)
  end

end