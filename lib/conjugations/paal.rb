# encoding: UTF-8
module Conjugations
  class Paal
    def self.conjugate_paal(root)
      temp_hebrew_verb = Hash.new

      temp_hebrew_verb[:root] = root[2] + "." + root[1] + "." + root[0]

      paal = VerbConstructor::Paal.new
      # Present tense
      temp_hebrew_verb.merge! paal.present_tense(root)
      # Infinitive
      temp_hebrew_verb.merge! paal.infinitive(root)
      # PAST TENSE
      temp_hebrew_verb.merge! paal.past_tense(root, temp_hebrew_verb[:past_base])
      # FUTURE TENSE
      temp_hebrew_verb.merge! paal.future_tense(root, temp_hebrew_verb[:infinitive])
      # INFINITIVE TENSE
      temp_hebrew_verb.merge! paal.imperative_tense(root, temp_hebrew_verb)
      # SETS ENDING CONSONANTS
      temp_hebrew_verb = paal.config_final_letters(root.last, temp_hebrew_verb) if %w(כ מ נ פ צ).include? root.last

      temp_hebrew_verb
    end
  end
end