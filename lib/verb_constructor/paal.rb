# encoding: UTF-8
module VerbConstructor
  class Paal
    UNEXISTING = "-----//-----"
    GUTTURAL = %w( א ה ח ע )
    PEI_HA_POAL_XET_EXCEPTIONS_PRESENT = %w( ח.ד.ל ח.ס.ר ח.ר.ד ח.פ.צ )
    PEI_HA_POAL_XET_EXCEPTIONS_PRESENT_AND_FUT = %w( ח.ד.ל ח.ס.ר ח.ר.ד )
    # PEI_HA_POAL_YUD_EXCEPTIONS_1 = %w( י.צ.ר י.ר.ק י.ר.ש י.ז.מ )
    # PEI_HA_POAL_YUD_EXCEPTIONS_2 = %w( י.ש.נ י.ע.צ )
    CONDITION_VERBS_AND_SIMILAR_PEI_HA_POAL_YUD_EXCEPTIONS = %w( ר.ע.ב כ.מ.ה ש.מ.ח י.ג.ע י.ר.א צ.מ.א )
    EXCEPTION_ROOTS = %w( ת.מ.מ י.כ.ל נ.ג.ש נ.ת.נ ה.י.ה ח.י.ה מ.ו.ת )
    EXCEPTION_FUTURE_ROOTS = %w( ל.מ.ד ל.ב.ש ש.כ.ב ק.ר.נ ג.ד.ל ד.ב.ק)
    LETTERS_WITH_VISUAL_STRESS = %w( ב כ פ )
    PEI_HA_POAL_NUN_NORMAL_ALIKE = %w( נ.ק.מ נ.ש.מ)
    HEI_EXCEPTION = %w( כ.מ.ה ג.ב.ה)

    def present_tense(root)
      hebrew_verb = Hash.new

      hebrew_verb[:mas_sing_pres] = "#{root[0]}וֹ#{root[1]}ֵ#{root[2]}"
      hebrew_verb[:fem_sing_pres] = "#{root[0]}וֹ#{root[1]}ֶ#{root[2]}ֶת"
      hebrew_verb[:mas_plu_pres]  = "#{root[0]}וֹ#{root[1]}ְ#{root[2]}ִים"
      hebrew_verb[:fem_plu_pres]  = "#{root[0]}וֹ#{root[1]}ְ#{root[2]}וֹת"
      hebrew_verb[:past_base]     = "#{root[0]}ָ#{root[1]}ַ#{root[2]}"

      if PEI_HA_POAL_XET_EXCEPTIONS_PRESENT.include? root.join(".")
        hebrew_verb[:mas_sing_pres] = "#{root[0]}ָ#{root[1]}ֵ#{root[2]}"
        hebrew_verb[:fem_sing_pres] = "#{root[0]}ֲ#{root[1]}ֵ#{root[2]}ָה"
        hebrew_verb[:mas_plu_pres]  = "#{root[0]}ֲ#{root[1]}ֵ#{root[2]}ִים"
        hebrew_verb[:fem_plu_pres]  = "#{root[0]}ֲ#{root[1]}ֵ#{root[2]}וֹת"
      end

      if (%w( ו י ).include?(root[1]) && root[2] != "ה")
        hebrew_verb[:mas_sing_pres] = "#{root[0]}ָ#{root[2]}"
        hebrew_verb[:fem_sing_pres] = "#{root[0]}ָ#{root[2]}ָה"
        hebrew_verb[:mas_plu_pres]  = "#{root[0]}ָ#{root[2]}ִים"
        hebrew_verb[:fem_plu_pres]  = "#{root[0]}ָ#{root[2]}וֹת"
        hebrew_verb[:past_base]     = "#{root[0]}ָ#{root[2]}"
      end

      if %w( ח ע ).include?(root[2]) && !%w(ו ח י).include?(root[1])
        hebrew_verb[:mas_sing_pres] += "ַ"
        hebrew_verb[:fem_sing_pres] = "#{root[0]}וֹ#{root[1]}ַ#{root[2]}ַת"
      end

      if root[2] == "א" && (root[0] != "ב" && root[1] != "ו")
        hebrew_verb[:fem_sing_pres] = "#{root[0]}וֹ#{root[1]}ֵ#{root[2]}ת"
        hebrew_verb[:past_base]     = "#{root[0]}ָ#{root[1]}ָ#{root[2]}"
      end

      if root[2] == "ה" && !HEI_EXCEPTION.include?(root.join("."))
        hebrew_verb[:mas_sing_pres] = "#{root[0]}וֹ#{root[1]}ֶה"
        hebrew_verb[:fem_sing_pres] = "#{root[0]}וֹ#{root[1]}ָה"
        hebrew_verb[:mas_plu_pres]  = "#{root[0]}וֹ#{root[1]}ִים"
        hebrew_verb[:fem_plu_pres]  = root[1] == "ו" ? "#{root[0]}ֹוֹות" : "#{root[0]}וֹ#{root[1]}וֹת"

        if root.join(".") == "כ.ב.ה"
          hebrew_verb[:mas_sing_pres] = "כבֶה"
          hebrew_verb[:fem_sing_pres] = "כבָה"
          hebrew_verb[:mas_plu_pres]  = "כבִים"
          hebrew_verb[:fem_plu_pres]  = "כבוֹת"
        end

        hebrew_verb[:past_base]     = "#{root[0]}ָ#{root[1]}ָה"
      end

      if root.join(".") == "י.ש.נ"
        hebrew_verb[:mas_sing_pres] = "יָשֵׁנ"
        hebrew_verb[:fem_sing_pres] = "יְשֵׁנה"
        hebrew_verb[:mas_plu_pres]  = "יְשֵׁנִים"
        hebrew_verb[:fem_plu_pres]  = "יְשֵׁנוֹת"
      end

      if CONDITION_VERBS_AND_SIMILAR_PEI_HA_POAL_YUD_EXCEPTIONS.include? root.join(".")
        sound = (root[0] == "י" || root.join(".") == "צ.מ.א") ? "ָ" : "ַ"
        hebrew_verb[:mas_sing_pres] = "#{root[0]}#{sound}#{root[1]}ֵ#{root[2]}"
        hebrew_verb[:mas_sing_pres] += "ַ" if root[2] == "ח"
        hebrew_verb[:fem_sing_pres] = "#{root[0]}ְ#{root[1]}ֵ#{root[2]}ָה"
        hebrew_verb[:mas_plu_pres]  = "#{root[0]}ְ#{root[1]}ֵ#{root[2]}ִים"
        hebrew_verb[:fem_plu_pres]  = "#{root[0]}ְ#{root[1]}ֵ#{root[2]}וֹת"
        hebrew_verb[:past_base] = "יָרֵא" if root.join(".") == "י.ר.א"
      end

      if %w(ג.ד.ל ד.ב.ק).include? root.join(".")
        hebrew_verb[:mas_sing_pres] = "#{root[0]}ָ#{root[1]}ֵ#{root[2]}"
        hebrew_verb[:fem_sing_pres] = "#{root[0]}ְ#{root[1]}ֵ#{root[2]}ָה"
        hebrew_verb[:mas_plu_pres] = "#{root[0]}ְ#{root[1]}ֵ#{root[2]}ִים"
        hebrew_verb[:fem_plu_pres] ="#{root[0]}ְ#{root[1]}ֵ#{root[2]}וֹת"
      end

      if EXCEPTION_ROOTS.include? root.join(".")
        hebrew_verb = conjugate_present_for_exception(root)
      end


      if GUTTURAL.include?(root[1]) && !GUTTURAL.include?(root[2]) && !CONDITION_VERBS_AND_SIMILAR_PEI_HA_POAL_YUD_EXCEPTIONS.include?(root.join("."))
        hebrew_verb[:mas_plu_pres]  = "#{root[0]}וֹ#{root[1]}ֲ#{root[2]}ִים"
        hebrew_verb[:fem_plu_pres]  = "#{root[0]}וֹ#{root[1]}ֲ#{root[2]}וֹת"
      end

      if LETTERS_WITH_VISUAL_STRESS.include? root[0]
        hebrew_verb[:mas_sing_pres].insert 1, "ּ"
        hebrew_verb[:fem_sing_pres].insert 1, "ּ"
        hebrew_verb[:mas_plu_pres].insert 1, "ּ"
        hebrew_verb[:fem_plu_pres].insert 1, "ּ"
      end

      hebrew_verb
    end

    def infinitive(root)
      hebrew_verb = Hash.new

      hebrew_verb[:infinitive] = "לִ#{root[0]}ְ#{root[1]}וֹ#{root[2]}"

      if GUTTURAL.include?(root[0])
        if root[0] == "א"
          if root[1] == "מ" && root[2] == "ר"
            hebrew_verb[:infinitive] = "לוֹמַר"
          else
            hebrew_verb[:infinitive] = "לֶ#{root[0]}ֱ#{root[1]}וֹ#{root[2]}"
          end
        else
          if root.join(".") == "ח.נ.נ"
            hebrew_verb[:infinitive] = "לָחוֹנ"
          else
            hebrew_verb[:infinitive] = "לַ#{root[0]}ֲ#{root[1]}וֹ#{root[2]}"
          end
        end
      end

      if root[0] == "י" || root.join(".") == "ה.ל.כ"
        hebrew_verb[:infinitive] = "לָ#{root[1]}ֶ#{root[2]}ֶת"
        hebrew_verb[:infinitive] = "לִ#{root[0]}#{root[1]}וֹ#{root[2]}" unless %w(ה.ל.כ י.ר.ד י.ד.ע י.ל.ד י.ש.ב י.ר.ש).include? root.join(".")
        if root[2] == "א"
          hebrew_verb[:infinitive] = root[1] == "ר" ? "לִירוֹא" : "לָ#{root[1]}ֵאת"
        end
        hebrew_verb[:infinitive] = "לָ#{root[1]}ַעַת" if root[2] == "ע"

        if root.join(".") == "י.ג.ע"
          hebrew_verb[:infinitive] = UNEXISTING
        end
      end

      if root[0] == "נ"
        if (root[2] == "ע" && root.join(".") == "נ.ג.ע")
          hebrew_verb[:infinitive] = "לָ#{root[1]}ַעֲת"
        elsif root[2] == "א"
          hebrew_verb[:infinitive] = "לָ#{root[1]}ֵאת"
        elsif root.join(".") == "נ.פ.ל"
          hebrew_verb[:infinitive] = "לִפוֹל"
        end
      end

      if root[2] == "ה"
        hebrew_verb[:infinitive][-1] = "ת"
      end

      if %w( ו י ).include?(root[1]) && root[2] != "ה"
        second_component = root[1] == "ו" ? "וּ" : "ִי"
        second_component = "וֹ" if root.join(".") == "ב.ו.א"
        hebrew_verb[:infinitive] = "לָ#{root[0]}#{second_component}#{root[2]}"
      end

      if root.join(".") == "ל.ק.ח"
        hebrew_verb[:infinitive] = "לָקַחַת"
      end

      if root.join(".") == "ש.כ.ב"
        hebrew_verb[:infinitive] = "לִשְכַּב"
      end

      if EXCEPTION_ROOTS.include? root.join(".")
        case root.join(".")
        when "ת.מ.מ"
          hebrew_verb[:infinitive] = "לָתֹמ"
        when "י.כ.ל"
          hebrew_verb[:infinitive] = UNEXISTING
        when "נ.ג.ש"
          hebrew_verb[:infinitive] = "לָגֶשֶת"
        when "נ.ת.נ"
          hebrew_verb[:infinitive] = "לָתֵת"
        when "ה.י.ה"
          hebrew_verb[:infinitive] = "לִהְיוֹת"
        when "ח.י.ה"
          hebrew_verb[:infinitive] = "לִחְיוֹת"
        end
      end

      if %w(ח ע).include?(root[2]) && root[0] != "י"
        hebrew_verb[:infinitive] += "ַ"
      end

      if LETTERS_WITH_VISUAL_STRESS.include?(root[1]) && !%w(א ה י ע).include?(root[0]) && hebrew_verb[:infinitive] != UNEXISTING
        hebrew_verb[:infinitive].insert 5, "ּ"
      end

      hebrew_verb
    end

    def past_tense(root, past_base)
      hebrew_verb = Hash.new
      _past_base = past_base.clone

      if root[2] == "ה" && !HEI_EXCEPTION.include?(root.join("."))
        _past_base.slice!(-2..-1)
        _past_base += "ִי"
      end

      _past_base += "ְ" if root[2] != "ה" && root[2] != "א" || HEI_EXCEPTION.include?(root.join("."))
      _past_base.slice!(-2..-1) if root[2] == "ת"

      hebrew_verb[:me_past]           = _past_base + "תִי"
      hebrew_verb[:you_mas_sing_past] = _past_base + "תָ"
      hebrew_verb[:you_fem_sing_past] = _past_base + "תְ"
      hebrew_verb[:we_past]           = root[2] == "נ" ?  _past_base + "וּ" : _past_base + "נוּ"
      hebrew_verb[:you_mas_plu_past]  = _past_base + "תֶם"
      hebrew_verb[:you_fem_plu_past]  = _past_base + "תֶן"
      if root[2] == "ה" && !HEI_EXCEPTION.include?(root.join("."))
        hebrew_verb[:he_past] = past_base.clone
      else
        if %w(ת ע).include?(root[2])
          hebrew_verb[:he_past] = past_base.clone
          _past_base = past_base.clone if root[2] == "ת"
        else
          hebrew_verb[:he_past] =  _past_base.clone
        end

      end

      _past_base.slice! 3
      _past_base.slice! 4

      if GUTTURAL.include? root[2]
        if root[2] == "ה" && !HEI_EXCEPTION.include?(root.join("."))
          _past_base.slice!(-1)
        end
      end

      _past_base.insert 3, "ְ" if root[1] != "ו"

      if root[2] == "ה" && !HEI_EXCEPTION.include?(root.join("."))
        hebrew_verb[:she_past] = _past_base + "ְתָה"
        hebrew_verb[:they_past] = _past_base + "וּ "
      else
        hebrew_verb[:she_past]  =  _past_base + "ָה"
        hebrew_verb[:they_past] = _past_base + "וּ"
      end

      if LETTERS_WITH_VISUAL_STRESS.include? root[0]
        hebrew_verb[:me_past].insert 1, "ּ"
        hebrew_verb[:you_mas_sing_past].insert 1, "ּ"
        hebrew_verb[:you_fem_sing_past].insert 1, "ּ"
        hebrew_verb[:we_past].insert 1, "ּ"
        hebrew_verb[:you_mas_plu_past].insert 1, "ּ"
        hebrew_verb[:you_fem_plu_past].insert 1, "ּ"
        hebrew_verb[:he_past].insert 1, "ּ"
        hebrew_verb[:she_past].insert 1, "ּ"
        hebrew_verb[:they_past].insert 1, "ּ"
      end

      if EXCEPTION_ROOTS.include? root.join(".")
        hebrew_verb = conjugate_past_for_exceptions(root)
      end
      hebrew_verb
    end

    def future_tense(root, infinitive)
      hebrew_verb = Hash.new

      prefix_sound_me = "ֶ"
      prefix_sound_you_us = "ִ"
      prefix_sound_plural = "ִ"

      future_base_me = "#{root[0]}ְ#{root[1]}וֹ#{root[2]}"
      future_base_you_us = "#{root[0]}ְ#{root[1]}וֹ#{root[2]}"
      youfem_youplural_they_fut_base = "#{root[0]}ְ#{root[1]}ְ#{root[2]}"

      if EXCEPTION_FUTURE_ROOTS.include? root.join(".")
        future_base_me = "#{root[0]}ְ#{root[1]}ַ#{root[2]}"
        future_base_you_us = "#{root[0]}ְ#{root[1]}ַ#{root[2]}"
      end

      if %w(ה ח ע).include?(root[0]) && root.join(".") != "ה.ל.כ"
        if root.join(".") == "ח.נ.נ"
          future_base_me = future_base_you_us = youfem_youplural_they_fut_base = infinitive.clone[2..-1]
          prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ָ"
        elsif PEI_HA_POAL_XET_EXCEPTIONS_PRESENT_AND_FUT.include? root.join(".")
          prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ֶ"
          future_base_me = future_base_you_us = youfem_youplural_they_fut_base = "#{root[0]}ְ#{root[1]}ַ#{root[2]}"
        else
          prefix_sound_me = "ֶ"
          prefix_sound_you_us = prefix_sound_plural = "ַ"

          future_base_me = "#{root[0]}ֱ#{root[1]}וֹ#{root[2]}"
          future_base_you_us = "#{root[0]}ֲ#{root[1]}וֹ#{root[2]}"
          youfem_youplural_they_fut_base = "#{root[0]}ַ#{root[1]}ְ#{root[2]}"
        end
      end

      if root[0] == "א"
        if %w(א.ה.ב א.כ.ל א.ב.ד א.מ.ר א.ח.ז).include? root.join(".")
          prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ֹ"

          future_base_me = "#{root[1]}ַ#{root[2]}"
          future_base_you_us = "א#{root[1]}ַ#{root[2]}"
          youfem_youplural_they_fut_base = root[1] == "ה" ? "א#{root[1]}ֲ#{root[2]}" : "א#{root[1]}ְ#{root[2]}"
        else
          prefix_sound_me = "ֶ"
          prefix_sound_you_us = "ֶ"
          prefix_sound_plural = "ַ"

          future_base_me = "אֱ#{root[1]}וֹ#{root[2]}"
          future_base_you_us = "אֱ#{root[1]}וֹ#{root[2]}"
          youfem_youplural_they_fut_base = "אַ#{root[1]}ְ#{root[2]}"
        end
      end

      if root[0] == "י" || root.join(".") == "ה.ל.כ"
        if (infinitive[2..-1] == "#{root[1]}ֶ#{root[2]}ֶת" || root[2] == "א") && root.join(".") != "י.ר.ש"
          prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ֵ"

          future_base_me = future_base_you_us = "#{root[1]}ֵ#{root[2]}"
          youfem_youplural_they_fut_base = "#{root[1]}ְ#{root[2]}"
        elsif %w(י.צ.ר י.ז.מ).include? root.join(".")
          prefix_sound_me = "ֶ"
          prefix_sound_you_us = prefix_sound_plural = "ִ"

          future_base_me = "#{root[1]}וֹ#{root[2]}"
          future_base_you_us = "י#{root[1]}וֹ#{root[2]}"
          youfem_youplural_they_fut_base = "י#{root[1]}ְ#{root[2]}"
        elsif infinitive[2..-1] == "#{root[1]}ַ#{root[2]}ַת"
          prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ֵ"

          future_base_me = future_base_you_us = "#{root[1]}ַ#{root[2]}"
          youfem_youplural_they_fut_base = "#{root[1]}ְ#{root[2]}"
        else
          prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ִ"

          future_base_me = "#{root[0]}#{root[1]}ַ#{root[2]}"
          future_base_you_us = "#{root[0]}#{root[1]}ַ#{root[2]}"
          youfem_youplural_they_fut_base = "#{root[0]}#{root[1]}ְ#{root[2]}"
        end
      end

      if ((root[0] == "נ" && !PEI_HA_POAL_NUN_NORMAL_ALIKE.include?(root.join("."))) || root.join(".") == "ל.ק.ח") && !GUTTURAL.include?(root[1])
        prefix_sound_me = "ֶ"
        prefix_sound_you_us = prefix_sound_plural = "ִ"

        if root[2] == "א"
          future_base_me = "#{root[1]}ָא"
          future_base_you_us = "#{root[1]}ָא"
          youfem_youplural_they_fut_base = "#{root[1]}ְא"
        else
          future_base_me = "#{root[1]}ַ#{root[2]}"
          future_base_you_us = "#{root[1]}ַ#{root[2]}"
          youfem_youplural_they_fut_base = "#{root[1]}ְ#{root[2]}"
        end

        if %w(נ.פ.ל נ.ט.ש נ.ט.ר).include? root.join(".")
          future_base_me = "#{root[1]}וֹ#{root[2]}"
          future_base_you_us = "#{root[1]}וֹ#{root[2]}"
        end
      end

      if GUTTURAL.include?(root[1]) && root[0] != "א"
        prefix_sound_me = "ֶ"
        prefix_sound_you_us = prefix_sound_plural = "ִ"

        future_base_me = "#{root[0]}ְ#{root[1]}ַ#{root[2]}"
        future_base_you_us = "#{root[0]}ְ#{root[1]}ַ#{root[2]}"
        youfem_youplural_they_fut_base = "#{root[0]}ְ#{root[1]}ֲ#{root[2]}"
      end

      if (%w(ח ע).include?(root[2]) && !%w(י נ).include?(root[0])) || root.join(".") == "כ.מ.ה"
        prefix_sound_me = "ֶ"
        prefix_sound_you_us = prefix_sound_plural = "ִ"

        future_base_me = "#{root[0]}ְ#{root[1]}ַ#{root[2]}"
        future_base_you_us = "#{root[0]}ְ#{root[1]}ַ#{root[2]}"
        youfem_youplural_they_fut_base = "#{root[0]}ְ#{root[1]}ְ#{root[2]}"
      end

      if root[2] == "א" && !%w(י נ).include?(root[0])
        prefix_sound_me = "ֶ"
        prefix_sound_you_us = prefix_sound_plural = "ִ"

        future_base_me = "#{root[0]}ְ#{root[1]}ָא"
        future_base_you_us = "#{root[0]}ְ#{root[1]}ָא"
        youfem_youplural_they_fut_base = GUTTURAL.include?(root[1]) ? "#{root[0]}ְ#{root[1]}ֲא" : "#{root[0]}ְ#{root[1]}ְא"
      end

      if root[2] == "ה" && root.join(".") != "כ.מ.ה"
        if root[0] == "ע"
          prefix_sound_me = "ֶ"
          prefix_sound_you_us = prefix_sound_plural = "ַ"

          future_base_me = "#{root[0]}ֱ#{root[1]}ֶה"
          future_base_you_us = "#{root[0]}ֲ#{root[1]}ֶה"
          youfem_youplural_they_fut_base = "#{root[0]}ֲ#{root[1]}"
        elsif root[0] == "ה"
          prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ֶ"

          future_base_me = "הֱ#{root[1]}ֶה"
          future_base_you_us = "הֱ#{root[1]}ֶה"
          youfem_youplural_they_fut_base = "הֱ#{root[1]}"
        elsif root[0] == "א"
          prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ֹ"

          future_base_me = "#{root[1]}ֶה"
          future_base_you_us = "א#{root[1]}ֶה"
          youfem_youplural_they_fut_base = "א#{root[1]}"
        else
          prefix_sound_me = root[0] == "י" ? "ִ" : "ֶ"
          prefix_sound_you_us = prefix_sound_plural = "ִ"

          if root[0] == "י"
            future_base_me = "#{root[0]}#{root[1]}ֶה"
            future_base_you_us = "#{root[0]}#{root[1]}ֶה"
            youfem_youplural_they_fut_base = "#{root[0]}#{root[1]}"
          elsif root[0] == "נ"
            future_base_me = "#{root[1]}ֶה"
            future_base_you_us = "#{root[1]}ֶה"
            youfem_youplural_they_fut_base = "#{root[1]}"
          else
            future_base_me = "#{root[0]}ְ#{root[1]}ֶה"
            future_base_you_us = "#{root[0]}ְ#{root[1]}ֶה"
            youfem_youplural_they_fut_base = "#{root[0]}ְ#{root[1]}"
          end
        end
      end

      if %w(ו י).include?(root[1]) && root[2] != "ה"
        prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ָ"

        if root[1] == "ו"
          future_base_me = "#{root[0]}ו#{infinitive[4]}#{root[2]}"
          future_base_you_us = "#{root[0]}ו#{infinitive[4]}#{root[2]}"
          youfem_youplural_they_fut_base = "#{root[0]}ו#{infinitive[4]}#{root[2]}"
        else
          future_base_me = "#{root[0]}ִי#{root[2]}"
          future_base_you_us = "#{root[0]}ִי#{root[2]}"
          youfem_youplural_they_fut_base = "#{root[0]}ִי#{root[2]}"
        end

        if %w(ח ע).include?(root[2])
          future_base_me += "ַ"
          future_base_you_us += "ַ"
        end
      end

      if LETTERS_WITH_VISUAL_STRESS.include?(root[1]) && !%w(א ה י ע).include?(root[0])
        stress_position = root[0] == "נ" ? 1 : 3
        future_base_me.insert stress_position, "ּ"
        future_base_you_us.insert stress_position, "ּ"
        youfem_youplural_they_fut_base.insert stress_position, "ּ"
      end

      hebrew_verb[:me_fut] = "א#{prefix_sound_me}" + future_base_me
      hebrew_verb[:you_mas_sing_she_fut] = "ת#{prefix_sound_you_us}" + future_base_you_us
      hebrew_verb[:he_fut] = "י#{prefix_sound_you_us}" + future_base_you_us
      hebrew_verb[:we_fut] = "נ#{prefix_sound_you_us}" + future_base_you_us
      hebrew_verb[:you_fem_sing_fut] = "ת#{prefix_sound_plural}" + youfem_youplural_they_fut_base + "ִי"
      hebrew_verb[:you_plu_fut] = "ת#{prefix_sound_plural}" + youfem_youplural_they_fut_base  + "וּ"
      hebrew_verb[:they_fut] = "י#{prefix_sound_plural}" + youfem_youplural_they_fut_base  + "וּ"

      if EXCEPTION_ROOTS.reject{|r| r == "מ.ו.ת"}.include? root.join(".")
        hebrew_verb = conjugate_future_for_exceptions(root)
      end

      hebrew_verb
    end

    def imperative_tense(root, conjugated_verb)
      hebrew_verb = Hash.new
      _conjugated_verb = conjugated_verb.clone
      hebrew_verb[:mas_imp] = _conjugated_verb[:you_mas_sing_she_fut][2..-1]
      hebrew_verb[:fem_imp] = _conjugated_verb[:you_fem_sing_fut][2..-1]
      hebrew_verb[:plural_imp] = _conjugated_verb[:you_plu_fut][2..-1]

      if %w(ה ח ע).include?(root[0]) && !%w(ה.ל.כ ח.נ.נ).include?(root.join("."))
        hebrew_verb[:mas_imp][1] = "ֲ"
        hebrew_verb[:fem_imp][1] = "ִ"
        hebrew_verb[:plural_imp][1] = "ִ"
      end

      if root[0] == "א" && root.join(".") != "א.ה.ד" && root[2] != "ה"
        if root.join(".") == "א.ה.ב"
          hebrew_verb[:mas_imp].insert 1, "ֱ"
          hebrew_verb[:fem_imp].insert 1, "ַ"
          hebrew_verb[:plural_imp].insert 1, "ַ"
        elsif %w(א.כ.ל א.ב.ד א.מ.ר א.ח.ז).include? root.join(".")
          hebrew_verb[:mas_imp].insert 1, "ֱ"
          hebrew_verb[:mas_imp][3] = "ֹ"
          hebrew_verb[:fem_imp].insert 1, "ִ"
          hebrew_verb[:plural_imp].insert 1, "ִ"
        else
          hebrew_verb[:fem_imp][1] = "ִ"
          hebrew_verb[:plural_imp][1] = "ִ"
        end
      end

      if root[0] == "י"
        if conjugated_verb[:infinitive] != "#{root[0]}ֶ#{root[1]}ֶת" || root.join(".") == "י.ר.ש"
          if %w(י.צ.ר י.ש.נ י.ר.ש ).include? root.join(".")
            hebrew_verb[:mas_imp].slice! 0
            hebrew_verb[:fem_imp].slice! 0
            hebrew_verb[:plural_imp].slice! 0
          elsif GUTTURAL.include? root[1]
            hebrew_verb[:mas_imp][1] = "ְ"
            hebrew_verb[:fem_imp][1] = "ַ"
            hebrew_verb[:plural_imp][1] = "ַ"
          elsif %w(ז ר).include?(root[1])
            hebrew_verb[:mas_imp].insert 1, "ְ"
            hebrew_verb[:fem_imp].insert 1, "ִ"
            hebrew_verb[:plural_imp].insert 1, "ִ"
          elsif root.join(".") == "י.ג.ע"
            hebrew_verb[:mas_imp].insert 1, "ְ"
            hebrew_verb[:fem_imp].insert 1, "ִ"
            hebrew_verb[:plural_imp].insert 1, "ִ"
          end
        end
      end

      if root[0] == "נ" && !PEI_HA_POAL_NUN_NORMAL_ALIKE.include?(root.join("."))
        if conjugated_verb[:me_fut][-2] == "ֹ"
          hebrew_verb[:mas_imp] = "נְ" + hebrew_verb[:mas_imp]
          hebrew_verb[:fem_imp] = "נִ" + hebrew_verb[:fem_imp]
          hebrew_verb[:plural_imp] = "נִ" + hebrew_verb[:plural_imp]
        end
      end

      if GUTTURAL.include?(root[1])
        hebrew_verb[:fem_imp][1] = "ַ"
        hebrew_verb[:plural_imp][1] = "ַ"
      end

      if GUTTURAL.include?(root[2]) && root.join(".") != "ב.ו.א" && !%w(י נ).include?(root[0]) || %w(י.ר.ה נ.ט.ה).include?(root.join("."))
        if root[2] == "ה" && !%w(כ.מ.ה ג.ב.ה).include?(root.join("."))
          if root[0] == "נ"
            hebrew_verb[:mas_imp] = "נְ" + hebrew_verb[:mas_imp]
            hebrew_verb[:fem_imp] = "נְ" + hebrew_verb[:fem_imp]
            hebrew_verb[:plural_imp] = "נְ" + hebrew_verb[:plural_imp]
          elsif %w(ה ח ע).include? root[0]
            hebrew_verb[:fem_imp][1] = "ֲ"
            hebrew_verb[:plural_imp][1] = "ֲ"
          elsif root[0] == "א"
            hebrew_verb[:mas_imp].insert 1, "ֱ"
            hebrew_verb[:fem_imp].insert 1, "ֱ"
            hebrew_verb[:plural_imp].insert 1, "ֱ"
          else
            hebrew_verb[:fem_imp][1] = "ְ"
            hebrew_verb[:plural_imp][1] = "ְ"
          end

          tsere_position =  LETTERS_WITH_VISUAL_STRESS.include?(root[1]) && root.join(".") != "א.פ.ה" ? 4 : 3
          hebrew_verb[:mas_imp][tsere_position] = "ֵ"
        else
          hebrew_verb[:fem_imp][1] = "ִ"
          hebrew_verb[:plural_imp][1] = "ִ"
        end

        if root[1] == "ח"
          hebrew_verb[:fem_imp][3] = "ְ"
          hebrew_verb[:plural_imp][3] = "ְ"
        end
      end

      is_verb_with_no_guttural = root.select{|_root| GUTTURAL.include?(_root)}.empty?

      if %w(י נ).include?(root[0]) && hebrew_verb[:fem_imp][0] == root[0] && !GUTTURAL.include?(root[1])
        hebrew_verb[:fem_imp][1] = "ִ"
        hebrew_verb[:plural_imp][1] = "ִ"
      end

      if is_verb_with_no_guttural && root[1] != "ו" && !%w(י נ).include?(root[0])
        hebrew_verb[:fem_imp][1] = "ִ"
        hebrew_verb[:plural_imp][1] = "ִ"
      end

      if LETTERS_WITH_VISUAL_STRESS.include?(root[1]) && !%w(א ה י ע).include?(root[0])
        hebrew_verb[:mas_imp].slice! 3
        hebrew_verb[:fem_imp].slice! 3
        hebrew_verb[:plural_imp].slice! 3
      end

      if LETTERS_WITH_VISUAL_STRESS.include?(root[0])
        hebrew_verb[:mas_imp].insert 1, "ּ"
        hebrew_verb[:fem_imp].insert 1, "ּ"
        hebrew_verb[:plural_imp].insert 1, "ּ"
      end

      if EXCEPTION_ROOTS.include? root.join(".")
        hebrew_verb = conjugate_imperative_for_exception(root, hebrew_verb)
      end

      hebrew_verb
    end

    def config_final_letters(root_last, conjugated_verb)
      # FINAL LETTERS CONFIG
      case root_last
        when "כ"
          last_letter = "ך"
        when "מ"
          last_letter = "ם"
        when "נ"
          last_letter = "ן"
        when "פ"
          last_letter = "ף"
        when "צ"
          last_letter = "ץ"
      end

      %w(mas_sing_pres infinitive he_past me_fut you_mas_sing_she_fut he_fut we_fut mas_imp).each do |person|
        index_to_change = -1 if conjugated_verb[person.to_sym][-1] == root_last
        index_to_change = -2 if conjugated_verb[person.to_sym][-2] == root_last
        conjugated_verb[person.to_sym][index_to_change] = last_letter if index_to_change
      end

      conjugated_verb
    end

    private

    def conjugate_present_for_exception(root)
      case root.join(".")
      when "ג.ב.ה"
        mas_sing_pres = "גָבוֹהַ"
        fem_sing_pres = "גְבוֹהָה"
        mas_plu_pres = "גְבוֹהִים"
        fem_plu_pres = "גְבוֹהֹת"
        past_base = "גָבַה"
      when "ת.מ.מ"
        mas_sing_pres = "תַמ"
        fem_sing_pres = "תַמָה"
        mas_plu_pres = "תַמִימ"
        fem_plu_pres = "תַמוֹת"
        past_base = "תַמ"
      when "י.כ.ל"
        mas_sing_pres = "יָכוֹל"
        fem_sing_pres = "יָכוֹלָה"
        mas_plu_pres = "יָכוֹלִים"
        fem_plu_pres = "יָכוֹלוֹת"
        past_base = "יָכוֹל"
      # when "י.ר.א"
      when "נ.ג.ש"
        mas_sing_pres = "נִיגָשׁ"
        fem_sing_pres = "נִיגֶשֶׁת"
        mas_plu_pres = "נִיגָשִׁים"
        fem_plu_pres = "נִיגָשׁוֹת"
        past_base = "נִיגַשׁ"
      when "נ.ת.נ"
        mas_sing_pres = "נוֹתֵנ"
        fem_sing_pres = "נוֹתֶנֶת"
        mas_plu_pres = "נוֹתְנִים"
        fem_plu_pres = "נוֹתְנוֹת"
        past_base = "נָתַנ"
      when "ה.י.ה"
        mas_sing_pres = UNEXISTING
        fem_sing_pres = UNEXISTING
        mas_plu_pres = UNEXISTING
        fem_plu_pres = UNEXISTING
        past_base = "הָיָה"
      when "ח.י.ה"
        mas_sing_pres = "חַי"
        fem_sing_pres = "חַיָה"
        mas_plu_pres = "חַיִים"
        fem_plu_pres = "חַיות"
        past_base = "חָיָה"
      when "מ.ו.ת"
        mas_sing_pres = "מֵת"
        fem_sing_pres = "מֵתָה"
        mas_plu_pres = "מֵתִים"
        fem_plu_pres = "מֵתוֹת"
        past_base = "מֵת"
      end

      {
        mas_sing_pres: mas_sing_pres,
        fem_sing_pres: fem_sing_pres,
        mas_plu_pres: mas_plu_pres,
        fem_plu_pres: fem_plu_pres,
        past_base: past_base
      }
    end

    def conjugate_past_for_exceptions(root)
      case root.join(".")
      when "ת.מ.מ"
        me_past           = "תַמוֹתִי"
        you_mas_sing_past = "תַמוֹתָ"
        you_fem_sing_past = "תַמוׂתְ"
        we_past           = "תַמוֹנוּ"
        you_mas_plu_past  = "תַמוֹתֶמ"
        he_past           = "תַמ"
        she_past          = "תַמָה"
        they_past         = "תַמוֹ"
      when "י.כ.ל"
        me_past           = "יָכֹלתִי"
        you_mas_sing_past = "יָכֹלתָ"
        you_fem_sing_past = "יָכֹלתְ"
        we_past           = "יָכֹלנוּ"
        you_mas_plu_past  = "יָכֹלתֶם"
        he_past           = "היִיה יָכֹל"
        she_past          = "יָכְלָה"
        they_past         = "יָכְֹלוֹ"
      when "י.ר.א"
        me_past           = "יָרֵאתִי"
        you_mas_sing_past = "יָרֵאתָ"
        you_fem_sing_past = "יָרֵאתְ"
        we_past           = "יָרֵאנוּ"
        you_mas_plu_past  = "יָרֵאתֶם"
        he_past           = "יָרֵא"
        she_past          = "יָרֵאָה"
        they_past         = "יָרְאוּ"
      when "נ.ג.ש"
        me_past           = "נִגַשְׂתִי"
        you_mas_sing_past = "נִגַשְׂתָ"
        you_fem_sing_past = "נִגַשְׂתְ"
        we_past           = "נִגַשְׂנוּ"
        you_mas_plu_past  = "נִגַשְׂתֶם"
        he_past           = "נִגַשֹ"
        she_past          = "נִגְשָׂה"
        they_past         = "נִגְשׂוּ"
      when "נ.ת.נ"
        me_past           = "נָתַתִי"
        you_mas_sing_past = "נָתַתָ"
        you_fem_sing_past = "נָתַתְ"
        we_past           = "נָתַנוּ"
        you_mas_plu_past  = "נָתַתֶם"
        he_past           = "נָתַנ"
        she_past          = "נָתְנָה"
        they_past         = "נָתְנוּ"
      when "ה.י.ה"
        me_past           = "הָיִיתִי"
        you_mas_sing_past = "הָיִיתָ"
        you_fem_sing_past = "הָיִיתְ"
        we_past           = "הָיִינוּ"
        you_mas_plu_past  = "הָיִיתֶם"
        he_past           = "הָיָה"
        she_past          = "הָיְתָה"
        they_past         = "הָיוּ"
      when "ח.י.ה"
        me_past           = "חָָיִיתִי"
        you_mas_sing_past = "חָָיִיתָ"
        you_fem_sing_past = "חָָיִיתְ"
        we_past           = "חָָיִינוּ"
        you_mas_plu_past  = "חָָיִיתֶם"
        he_past           = "חַָי"
        she_past          = "חָָיְתָה"
        they_past         = "חָָיוּ"
      when "מ.ו.ת"
        me_past           = "מֵתִי"
        you_mas_sing_past = "מֵתָ"
        you_fem_sing_past = "מֵתְ"
        we_past           = "מַתְנוּ"
        you_mas_plu_past  = "מַתֶם"
        he_past           = "מֵת"
        she_past          = "מֵתָה"
        they_past         = "מֵתוּ"
      end

      {
        me_past: me_past,
        you_mas_sing_past: you_mas_sing_past,
        you_fem_sing_past: you_fem_sing_past,
        we_past: we_past,
        you_mas_plu_past: you_mas_plu_past,
        he_past: he_past,
        she_past: she_past,
        they_past: they_past
      }
    end

    def conjugate_future_for_exceptions(root)
      base = ""
      case root.join(".")
      when "ג.ב.ה"
        me_fut = "אֶגְבַּה"
        you_mas_sing_she_fut = "תִגְבַּה"
        he_fut = "יִגְבַּה"
        we_fut = "נִגְבַּה"
        you_fem_sing_fut = "תִגְבְּהִי"
        you_plu_fut = "תִגְבְּהוּ"
        they_fut = "יִגְבְּהוּ"
      when "ת.מ.מ"
        base = "תַם"
        me_fut = "אֶ#{base}"
        you_mas_sing_she_fut = "תִ#{base}"
        he_fut = "יִ#{base}"
        we_fut = "נִ#{base}"
        you_fem_sing_fut = "תִ#{base}ִי"
        you_plu_fut = "תִ#{base}וּ"
        they_fut = "יִ#{base}וּ"
      when "י.כ.ל"
        me_fut = "אוּכַל"
        you_mas_sing_she_fut = "תוּכַל"
        he_fut = "יוּכַל"
        we_fut = "נוּכַל"
        you_fem_sing_fut = "תוּכְלִי"
        you_plu_fut = "תוּכְלוּ"
        they_fut = "יוּכְלוּ"
      when "נ.ג.ש"
        me_fut = "אֶגַשׂ"
        you_mas_sing_she_fut = "תִגַשׂ"
        he_fut = "יִגַשׂ"
        we_fut = "נִגַשׂ"
        you_fem_sing_fut = "תִגְשִׂי"
        you_plu_fut = "תִגְשׂוּ"
        they_fut = "יִגְשׂוּ"
      when "נ.ת.נ"
        me_fut = "אֶתֵנ"
        you_mas_sing_she_fut = "תִתֵנ"
        he_fut = "יִתֵנ"
        we_fut = "נִתֵנ"
        you_fem_sing_fut = "תִתְנִי"
        you_plu_fut = "תִתְנוּ"
        they_fut = "יִתְנוּ"
      when "ה.י.ה"
        me_fut = "אֶהֱיֶה"
        you_mas_sing_she_fut = "תִהְיֶה"
        he_fut = "יִהְיֶה"
        we_fut = "נִהְיֶה"
        you_fem_sing_fut = "תִהְיִי"
        you_plu_fut = "תִהְיִוּ"
        they_fut = "יִהְיוּ"
      when "ח.י.ה"
        me_fut = "אֶחְיֶה"
        you_mas_sing_she_fut = "תִחְיֶה"
        he_fut = "יִחְיֶה"
        we_fut = "נִחְיֶה"
        you_fem_sing_fut = "תִחְיִי"
        you_plu_fut = "תִחְיִוּ"
        they_fut = "יִחְיוּ"
      end

      {
        me_fut: me_fut,
        you_mas_sing_she_fut: you_mas_sing_she_fut,
        he_fut: he_fut,
        we_fut: we_fut,
        you_fem_sing_fut: you_fem_sing_fut,
        you_plu_fut: you_plu_fut,
        they_fut: they_fut,
      }
    end

    def conjugate_imperative_for_exception(root, hebrew_verb)
      case root.join(".")
      when "ג.ב.ה"
        mas_imp = hebrew_verb[:mas_imp]
        fem_imp = hebrew_verb[:fem_imp]
        plural_imp = hebrew_verb[:plural_imp]
      when "ת.מ.מ"
        mas_imp = "תֹמ"
        fem_imp = "תֹמִי"
        plural_imp = "תֹמוּ"
      when "י.כ.ל"
        mas_imp = UNEXISTING
        fem_imp = UNEXISTING
        plural_imp = UNEXISTING
      when "נ.ג.ש"
        mas_imp = hebrew_verb[:mas_imp]
        fem_imp = hebrew_verb[:fem_imp]
        plural_imp = hebrew_verb[:plural_imp]
      when "נ.ת.נ"
        mas_imp = hebrew_verb[:mas_imp]
        fem_imp = hebrew_verb[:fem_imp]
        plural_imp = hebrew_verb[:plural_imp]
      when "ה.י.ה"
        mas_imp = "הֱיֵה"
        fem_imp = "הֲיִי"
        plural_imp = "הֱיוּ"
      when "ח.י.ה"
        mas_imp = hebrew_verb[:mas_imp]
        fem_imp = hebrew_verb[:fem_imp]
        plural_imp = hebrew_verb[:plural_imp]
      when "מ.ו.ת"
        mas_imp = hebrew_verb[:mas_imp]
        fem_imp = hebrew_verb[:fem_imp]
        plural_imp = hebrew_verb[:plural_imp]
      end
      {
        mas_imp: mas_imp,
        fem_imp: fem_imp,
        plural_imp: plural_imp
      }
    end
  end
end