class Verb < ActiveRecord::Base
  extend FriendlyId
  friendly_id :english, use: :slugged

  has_one :hebrew_verb, dependent: :destroy
  has_many :searches, class_name: "VerbSearch"

  #validate :has_at_least_translation

  scope :all_reviewed, where(reviewed: true)



  def self.new_preview_instance(params)
    self.new(english: params[:english], russian: params[:russian], spanish: params[:spanish], reviewed: false)
  end

  def self.check_for_existing(added_id, with_errors=false)
    exists = false
    msg = "verb.verb_added_thx"
    recent_verb = find_by_id(added_id)
    root = recent_verb && recent_verb.hebrew_verb ? recent_verb.hebrew_verb.root : ""

    all_roots_without_last_added =  HebrewVerb.all.reject{|h_verb| h_verb.verb_id == added_id.to_i }.map(&:root)

    if all_roots_without_last_added.include? root
      verb = HebrewVerb.where(root: root).first.verb
      recent_verb.destroy
      exists = true
      msg = I18n.t("verb.already_exists")
    # elsif with_errors
    #   return nil, false, I18n.t("verb.error_reported")
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
