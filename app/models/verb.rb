class Verb < ActiveRecord::Base

  has_many :hebrew_verbs

  validate :at_least_one_translation

  private

  def at_least_one_translation
    if errors.empty?
      if self.english.empty? && self.spanish.empty? && self.russian.empty?
        errors[:base] << "You must enter at least one translation"
      end
    end
  end

end
