class Verb < ActiveRecord::Base

  has_many :hebrew_verbs

  #validate :has_translation

  def self.new_preview_instance(params)
    self.new(english: params[:english],russian: params[:russian], spanish: params[:spanish], confirmed: false)
  end

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
