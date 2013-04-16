class VerbsController < ApplicationController

  before_filter :get_language
  before_filter :set_root, only: :preview
  before_filter :get_values_for_create, only: [:index, :show, :preview]

  def index
    @verbs = Verb.all

    respond_to do |format|
        format.html
        format.json { render json: @verbs.to_json }
    end
  end

  def show
    if params[:id]
      verb = Verb.find(params[:id])
      verb.check_for_existing
      binding.pry
      @hebrew_verb = HebrewVerb.find_by_root(verb.hebrew_verb.root)
      flash[:errors] = verb.errors.full_messages
      verb.destroy unless verb.errors.empty?
    else
      @hebrew_verb = HebrewVerb.find_by_id(params[:verb][:id])
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

  def get_language
    case I18n.locale
    when :en
      @language = "english"
    when :es
      @language = "spanish"
    when :ru
      @language = "russian"
    end
  end

  def set_root
    if params[:hidden_root_4] == "delete"
      params[:hebrew_verb].delete(:root_4)
    end
  end

  def get_values_for_create
    @letters = Letter.where("num_value <= ? ", 400) # We don't query for ending letters
    @buildings = *Building.first#Building.get_allowed_building_types
    @new_heb_verb = HebrewVerb.new
  end

end
