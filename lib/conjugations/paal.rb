# encoding: UTF-8
module Conjugations
  class Paal
    def self.conjugate_paal(params)
      temp_hebrew_verb = Hash.new
      root = Letter.create_root_from_letters(params)
      temp_hebrew_verb[:root] = root[2] + "." + root[1] + "." + root[0]
      paal = VerbConstructors::Paal.new
      # PRESENT TENSE
        temp_hebrew_verb.merge! paal.present_tense(root)
      # PAST TENSE
        temp_hebrew_verb.merge! paal.past_tense(root, temp_hebrew_verb[:past_base])
      # INFINITIVE AND FUTURE BASE
        temp_hebrew_verb.merge! paal.infinitive(root)
      # FUTURE TENSE
        temp_hebrew_verb.merge! paal.future_tense(root, temp_hebrew_verb[:infinitive])
      # FIXES VERB WITH LAST ROOT COMPONENT -> ה
        temp_hebrew_verb = paal.lamed_ha_poal_future_case_fix(root, temp_hebrew_verb) if root[2] == "ה"
      # IMPERATIVE
        temp_hebrew_verb.merge! paal.imperative(temp_hebrew_verb)
      # SETS ENDING CONSONANTS
        temp_hebrew_verb = paal.config_final_letters(root.last, temp_hebrew_verb) if %w(כ מ נ פ צ).include? root.last

      temp_hebrew_verb
    end
  end
end