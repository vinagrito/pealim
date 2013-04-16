class Verb < ActiveRecord::Base

  has_one :hebrew_verb

  #validate :has_translation

  def self.new_preview_instance(params)
    self.new(english: params[:english],russian: params[:russian], spanish: params[:spanish], confirmed: false)
  end

  def check_for_existing
    binding.pry
    root = hebrew_verb.root if hebrew_verb
    if HebrewVerb.all.map(&:root).include? root
       errors[:base] << I18n.t("verb.already_exists")
    end
  end

  private

  def has_translation
    if errors.empty?
      if english.blank? && spanish.blank? && russian.blank?
        errors[:base] << I18n.t("verb.translation_missing")
      end
    end
  end

end
