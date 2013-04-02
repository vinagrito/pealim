class Verb < ActiveRecord::Base

  has_many :hebrew_verbs

  #validate :has_translation

  private

  def has_translation
    if errors.empty?
      binding.pry
      if english.blank? && spanish.blank? && russian.blank?
        errors[:base] << t("verb.translation_missing")
      end
    end
  end

end
