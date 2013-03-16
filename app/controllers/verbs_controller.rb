# encoding: UTF-8
class VerbsController < ApplicationController
  include VerbContructor::PaalHelper

  before_filter :get_language


  def index
    @verbs = Verb.all

    respond_to do |format|
      if request.xhr?
        format.json { render :json => @verbs.to_json }
      else
        format.html
      end
    end
  end

  def show
    @hebrew_verb = HebrewVerb.find(params[:verb][:id])
  end

  def new
    @letters = Letter.where("num_value <= ? ", 400) # We don't query for ending letters
    @buildings = Building.get_allowed_building_types
    @heb_verb = HebrewVerb.new

  end

  def create

    verb = Verb.new(:english => params[:hebrew_verb][:english],
                    :russian => params[:hebrew_verb][:russian],
                    :spanish => params[:hebrew_verb][:spanish]
                    )
    if verb.valid?
      verb.save
    else
      flash[:errors] = verb.errors.full_messages
      render 'new'
    end

    hebrew_verb = {}.merge(:verb_id => verb.id)

    hebrew_verb[:building_id] = params[:hebrew_verb][:building_id]
    root = [
             Letter.find(params[:hebrew_verb][:root_1]).name,
             Letter.find(params[:hebrew_verb][:root_2]).name,
             Letter.find(params[:hebrew_verb][:root_3]).name
            ]
    hebrew_verb[:root] = root[0] + "." + root[1] + "." + root[2]

    case hebrew_verb[:building_id]
      when '1' # *PAAL*
      # PRESENT TENSE
        hebrew_verb.merge(present_tense(hebrew_verb, root))

      # PAST TENSE
        hebrew_verb.merge(past_tense(hebrew_verb, root))

      # INFINITIVE AND FUTURE BASE
        hebrew_verb.merge(infinitive_and_future_base(hebrew_verb, root))

      # FUTURE TENSE
        hebrew_verb.merge(future_tense(hebrew_verb,root))
      when '2' # *PIEL*
      when '3' # *HITPAEL*
    end


    # if(root[2] == 'כ')
    #   root[2] = 'ך'
    # elsif root[2] == 'מ'
    #   root[2] = 'ם'
    # elsif root[2] == 'נ'
    #   root[2] = 'ן'
    # elsif root[2] == 'פ'
    #   root[2] = 'ף'
    # elsif root[2] == 'צ'
    #   root[2] = 'ץ'
    # end
    @past_base = hebrew_verb[:past_base]
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


end
