class VerbsController < ApplicationController
  before_filter :session_language, only: [:show, :preview]
  before_filter :set_search_instance
  before_filter :set_root, only: :preview
  before_filter :get_values_for_new_verb, only: [:index, :show, :preview]

  def index
    @verbs = Verb.all

    respond_to do |format|
        format.html
        format.json { render json: @verbs.to_json }
    end
  end

  def show
    if params[:commit] == "Confirm"
      verb, _exists, msg = Verb.check_for_existing(params[:id])

      if _exists
        flash[:errors] = msg
      else
        flash[:notice] = msg
      end
      @hebrew_verb = verb.hebrew_verb
    else
      flash.delete(:errors)
      @hebrew_verb = HebrewVerb.find_by_id(params[:id])
    end
  end

  def preview
    verb = Verb.new_preview_instance(params)

    if verb.valid?
      verb.save
    else
      flash[:errors] = verb.errors.full_messages
      render "index"
    end

    hebrew_verb = {verb_id: verb.id, building_id: params[:hebrew_verb][:building_id]}
    hebrew_verb.merge! Conjugations::Paal.conjugate_paal(params)

    @hebrew_verb = HebrewVerb.create(hebrew_verb)

    render :show
    #@past_base = hebrew_verb[:past_base]
    #hebrew_verb.delete(:past_base)

    # @hebrew_verb = HebrewVerb.new(hebrew_verb)

    # if @hebrew_verb.save
    #   flash[:notice] = 'Verb successfully created!.'
    #   redirect_to verb_path(@hebrew_verb)
    # else
    #   flash[:errors] = @hebrew_verb.errors.full_messages
    #   render 'new'
    # end

  end

  private

  def set_root
    if params[:hidden_root_4] == "delete"
      params[:hebrew_verb].delete(:root_4)
    end
  end

end
