class Verb < ActiveRecord::Base

  has_one :hebrew_verb, dependent: :destroy
  has_many :searches, class_name: "VerbSearch"

  #validate :has_at_least_translation

  def self.new_preview_instance(params)
    self.new(english: params[:english], russian: params[:russian], spanish: params[:spanish], confirmed: false)
  end

  def self.check_for_existing(added_id)
    exists = false
    msg = "verb.verb_added_thx"
    recent_verb = find_by_id(added_id)
    root = recent_verb && recent_verb.hebrew_verb ? recent_verb.hebrew_verb.root : ""
    if HebrewVerb.all.map(&:root).include? root
      verb = HebrewVerb.where(root: root).first.verb
      recent_verb.destroy
      exists = true
      msg = I18n.t("verb.already_exists")
    end
    return_value = exists ? [verb, exists, msg] : [recent_verb, exists, msg]
    return return_value
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
