class VerbSearchesController < ApplicationController
  before_filter :set_search_instance
  before_filter :get_values_for_new_verb
  before_filter :remove_ugc_verb_if_not_confirmed

  def new
  end

  def create
    if params[:verb_search][:verb_id].empty?
      redirect_to request.referer
    else
      @search = VerbSearch.create! params[:verb_search]

      redirect_to verb_path(@search.verb)
    end
  end

end
