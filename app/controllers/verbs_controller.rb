# encoding: UTF-8
class VerbsController < ApplicationController
  include VerbContructor::PaalHelper

  before_filter :get_language
  before_filter :set_root, only: :create
  before_filter :get_values_for_create, only: [:index, :show, :preview]

  def index
    @verbs = Verb.all

    respond_to do |format|
        format.html
        format.json { render :json => @verbs.to_json }
    end
  end

  def show
    @hebrew_verb ||= HebrewVerb.find_by_id(params[:verb][:id])
  end

  def preview
    verb = Verb.new(english: params[:english],
                    russian: params[:russian],
                    spanish: params[:spanish])

    if verb.valid?
      verb.save
    else
      flash[:errors] = verb.errors.full_messages
      render "index"
    end

    hebrew_verb = {verb_id: verb.id, building_id: params[:hebrew_verb][:building_id]}

    root = [
             Letter.find(params[:root_1]).name,
             Letter.find(params[:root_2]).name,
             Letter.find(params[:root_3]).name
            ]
    hebrew_verb[:root] = root[0] + "." + root[1] + "." + root[2]
    case hebrew_verb[:building_id]
      when "1" # *PAAL*
      # PRESENT TENSE
        hebrew_verb.merge! present_tense(root)
      # PAST TENSE
        hebrew_verb.merge! past_tense(root, hebrew_verb[:past_base])
      # INFINITIVE AND FUTURE BASE
        hebrew_verb.merge! infinitive(root)
      # FUTURE TENSE
        hebrew_verb.merge! future_tense(root, hebrew_verb[:infinitive])
      # FIXES VERB WITH LAST ROOT COMPONENT -> ה
        hebrew_verb = lamed_ha_poal_future_case_fix(root, hebrew_verb) if root[2] == "ה"
      # IMPERATIVE
        hebrew_verb.merge! imperative(hebrew_verb)
      # SETS ENDING CONSONANTS
        hebrew_verb = config_final_letters(root.last, hebrew_verb) if %w(כ מ נ פ צ).include? root.last
      # when '2' # *PIEL*
      # when '3' # *HITPAEL*
    end

    @hebrew_verb = HebrewVerb.new(hebrew_verb)

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

  def create
    binding.pry
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
