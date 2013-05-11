# encoding: UTF-8
module VerbConstructors
  class Paal
    def present_tense(root)
      # DEFAULT VERB CONJUGATION
      hebrew_verb = Hash.new
      hebrew_verb[:mas_sing_pres] = root[2] == "ה" ? "#{root[0]}ו#{root[1]}ֶ#{root[2]}" : "#{root[0]}ו#{root[1]}ֵ#{root[2]}"
      hebrew_verb[:fem_sing_pres] = "#{root[0]}ו#{root[1]}ֶ#{root[2]}ֶת"
      hebrew_verb[:mas_plu_pres]  = "#{root[0]}ו#{root[1]}ְ#{root[2]}ִים"
      hebrew_verb[:fem_plu_pres]  = "#{root[0]}ו#{root[1]}ְ#{root[2]}ות"
      hebrew_verb[:past_base]     = "#{root[0]}ָ#{root[1]}ַ#{root[2]}"

      # HANDLING SOME EXCEPTIONS
      exception_sign = "--/--"
      if root[0] == "ה" && root[1] == "י" && root[2] == "ה"
        hebrew_verb[:mas_sing_pres] = exception_sign
        hebrew_verb[:fem_sing_pres] = exception_sign
        hebrew_verb[:mas_plu_pres]  = exception_sign
        hebrew_verb[:fem_plu_pres]  = exception_sign
        hebrew_verb[:past_base]     = "הָיָה"

        return hebrew_verb
      end
      if root[0] == "י" && root[1] == "כ" && root[2] == "ל"
        hebrew_verb[:mas_sing_pres] = "יָכול"
        hebrew_verb[:fem_sing_pres] = "יָכולה"
        hebrew_verb[:mas_plu_pres]  = "יָכולים"
        hebrew_verb[:fem_plu_pres]  = "יָכולות"
        hebrew_verb[:past_base]     = "יָכול"

        return hebrew_verb
      end

      if root[0] == "צ" && root[1] == "מ" && root[2] == "א"
        hebrew_verb[:mas_sing_pres] = "צָמֵא"
        hebrew_verb[:fem_sing_pres] = "צְמֵאָה"
        hebrew_verb[:mas_plu_pres]  = "צְמֵאִים"
        hebrew_verb[:fem_plu_pres]  = "צְמֵאוֹת"
        hebrew_verb[:past_base]     = "צָמֵא"

        return hebrew_verb
      end

      if root[0] == "נ" && root[1] == "ת" && root[2] == "נ"
        hebrew_verb[:past_base]     = "נַתַן"
        return hebrew_verb
      end


      if ["ו","י"].include?(root[1])
        hebrew_verb[:mas_sing_pres] = "#{root[0]}ָ#{root[2]}"
        hebrew_verb[:fem_sing_pres] = "#{root[0]}ָ#{root[2]}ָ" + "ה"
        hebrew_verb[:mas_plu_pres]  = "#{root[0]}ָ#{root[2]}ִ" + "ים"
        hebrew_verb[:fem_plu_pres]  = "#{root[0]}ָ#{root[2]}ות"
        hebrew_verb[:past_base]     = "#{root[0]}ָ#{root[2]}"
      end

      if ["א","ה"].include?(root[1])
        hebrew_verb[:mas_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ֲ#{root[2]}ִ" + "ים"
        hebrew_verb[:fem_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ֲ#{root[2]}ות"
      end

      if ["א", "ה"].include?(root[2])
        hebrew_verb[:past_base]     = "#{root[0]}ָ#{root[1]}ָ#{root[2]}"
        if root[2] == "א"
          hebrew_verb[:fem_sing_pres] = "#{root[0]}ו#{root[1]}ֵ#{root[2]}ת" if root[1] != "ו"
          hebrew_verb[:past_base]     = "#{root[0]}ָ#{root[2]}" if root[1] == "ו"
          hebrew_verb[:past_base]     = "שָנֵא" if root[0] == "ש" && root[1] == "נ"
        elsif root[2] == "ה"
          if root[1] == "ו"
            hebrew_verb[:mas_sing_pres] = "#{root[0]}ו#{root[1]}ֶה"
            hebrew_verb[:fem_plu_pres]  = "#{root[0]}וות"
          else
            hebrew_verb[:fem_plu_pres]  = "#{root[0]}ו#{root[1]}ות"
          end
          hebrew_verb[:fem_sing_pres] = "#{root[0]}ו#{root[1]}ָה"
          hebrew_verb[:mas_plu_pres]  = "#{root[0]}ו#{root[1]}ִים"
        end
      end

      if ["ח","ע"].include?(root[2])
        if !["ו","י"].include?(root[1])
          hebrew_verb[:mas_sing_pres] = "#{root[0]}ו" + "#{root[1]}ֵ#{root[2]}ַ"
          hebrew_verb[:fem_sing_pres] = "#{root[0]}ו" + "#{root[1]}ַ#{root[2]}ַ" + "ת"
          hebrew_verb[:mas_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ְ#{root[2]}ִ" + "ים"
          hebrew_verb[:fem_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ְ#{root[2]}ות"
        end
      end

      if hebrew_verb[:mas_sing_pres][hebrew_verb[:mas_sing_pres].length - 1] == "נ"
        hebrew_verb[:mas_sing_pres][hebrew_verb[:mas_sing_pres].length - 1] = "ן"
      end

      hebrew_verb
    end

    def past_tense(root, past_base)
      hebrew_verb = Hash.new
      if hebrew_verb[:past_base] == "נַתַן"
        _past_base                      = past_base[0..2]
        hebrew_verb[:me_past]           = _past_base + "ַתִי"
        hebrew_verb[:you_mas_sing_past] = _past_base + "ַתְ"
        hebrew_verb[:you_fem_sing_past] = _past_base + "ַתָ"
        hebrew_verb[:we_past]           = _past_base + "ַנו"
        hebrew_verb[:you_mas_plu_past]  = _past_base + "ַתֶם"
        hebrew_verb[:you_fem_plu_past]  = _past_base + "ַתֶן"
        hebrew_verb[:he_past]           = past_base
        hebrew_verb[:she_past]          = _past_base + "ְנָה"
        hebrew_verb[:they_past]         = _past_base + "ְנוּ"

        return hebrew_verb
      end

      _past_base = past_base.clone

      if ["ו","י"].include?(root[1]) && root[2] != "ה"
        hebrew_verb[:me_past]           = _past_base + "תִי"
        hebrew_verb[:you_mas_sing_past] = _past_base + "תָ"
        hebrew_verb[:you_fem_sing_past] = _past_base + "תְ"
        hebrew_verb[:we_past]           = _past_base + "נוּ"
        hebrew_verb[:you_mas_plu_past]  = _past_base + "תֶם"
        hebrew_verb[:you_fem_plu_past]  = _past_base + "תֶן"
        hebrew_verb[:he_past]           = _past_base
        hebrew_verb[:she_past]          = _past_base + "ָה"
        hebrew_verb[:they_past]         = _past_base + "וּ"

        return hebrew_verb
      end

      if root[2] == "א"
        hebrew_verb[:me_past]           = _past_base + "תִי"
        hebrew_verb[:you_mas_sing_past] = _past_base + "תָ"
        hebrew_verb[:you_fem_sing_past] = _past_base + "תְ"
        hebrew_verb[:we_past]           = _past_base + "נוּ"
        hebrew_verb[:he_past]           = _past_base
        if root[0] == "צ" && root[1] == "מ"
          hebrew_verb[:you_mas_plu_past]  = "צְמֵתֶם"
          hebrew_verb[:you_fem_plu_past]  = "צְמֵתֶן"
          hebrew_verb[:she_past]          = "צָמְאָה"
          hebrew_verb[:they_past]         = "צָמְאוּ"
        else
          hebrew_verb[:you_mas_plu_past]  = _past_base + "תֶם"
          hebrew_verb[:you_fem_plu_past]  = _past_base + "תֶן"
          _past_base.slice! 3
          _past_base.insert 3, "ְ"
          hebrew_verb[:she_past]          = _past_base + "ָה"
          hebrew_verb[:they_past]         = _past_base + "וּ"
        end

        return hebrew_verb
      end

      if root[2] == "ה"
        _past_base = past_base[0..-3]
        hebrew_verb[:me_past]           = _past_base + "ִיתִי"
        hebrew_verb[:you_mas_sing_past] = _past_base + "ִיתָ"
        hebrew_verb[:you_fem_sing_past] = _past_base + "ִיתְ"
        hebrew_verb[:we_past]           = _past_base + "ִינוּ"
        hebrew_verb[:you_mas_plu_past]  = _past_base + "ִיתֶם"
        hebrew_verb[:you_fem_plu_past]  = _past_base + "ִיתֶן"
        hebrew_verb[:he_past]           = past_base
        if ["א","ע","ח","ה"].include? root[1]
          hebrew_verb[:she_past] = _past_base + "ֲתָה"
        else
          hebrew_verb[:she_past] = _past_base + "ְתָה"
        end
        hebrew_verb[:they_past]  = _past_base + "וּ"
      else #["ד","ת","ט"].include?(root[2])
        hebrew_verb[:me_past]           = _past_base + "תִי"
        hebrew_verb[:you_mas_sing_past] = _past_base + "תָ"
        hebrew_verb[:you_fem_sing_past] = _past_base + "תְ"
        hebrew_verb[:we_past]           = _past_base + "נו"
        hebrew_verb[:you_mas_plu_past]  = _past_base + "תֶם"
        hebrew_verb[:you_fem_plu_past]  = _past_base + "תֶן"
        hebrew_verb[:he_past]           = past_base
        if ["א","ע","ח","ה"].include? root[1]
          _past_base.slice! 3
          _past_base.insert 3, "ֲ"
        else
          _past_base.slice! 3
          _past_base.insert 3, "ְ"
        end
        hebrew_verb[:she_past] = _past_base + "ָה"
        hebrew_verb[:they_past] = _past_base + "וּ"
      end
      hebrew_verb
    end

    def infinitive(root)
      hebrew_verb = Hash.new
      infinitive_end = root[2] == "ה" ? "ת" : "#{root[2]}"
      hebrew_verb[:infinitive] = "לִ#{root[0]}ְ#{root[1]}וֹ" + infinitive_end

      if ["ח", "ע", "ה"].include?(root[0])
        infinitive_start = root[0] == "ח" ? "לַ#{root[0]}ְ#{root[1]}וֹ" : "לַ#{root[0]}ֲ#{root[1]}וֹ"
        hebrew_verb[:infinitive] = infinitive_start + infinitive_end
        hebrew_verb[:infinitive] = "לָלֶכֶת" if root[0] == "ה" && root[1] == "ל" && root[2] == "כ"
        return hebrew_verb
      end

      if root[0] == "א"
        if root[1] == "מ" && root[2] == "ר"
          hebrew_verb[:infinitive] = "לוֹמַר"
        else
          hebrew_verb[:infinitive] = "לֶאֱ#{root[1]}ו#{root[2]}"
        end
        return hebrew_verb
      end

      if root[0] == "י"
        # * It presents several exception cases *
        if ["ח", "ע"].include?(root[2])
          hebrew_verb[:infinitive] = "לָ#{root[1]}ַ#{root[2]}ַת"
        elsif ["ש", "ל", "ר"].include?(root[1]) && ["ב", "ד", "ר", "ל"].include?(root[2])
          hebrew_verb[:infinitive] = "לָ#{root[1]}ֶ#{root[2]}ֶת"
        elsif root[1] == "צ" && root[2] = "א"
          hebrew_verb[:infinitive] = "לָצֵאת"
        else
          hebrew_verb[:infinitive] = "לִי#{root[1]}וֹ#{root[2]}"
        end
        return hebrew_verb
      end

      if ["ו", "י"].include?(root[1]) && root[2] != "ה"
        hebrew_verb[:infinitive] = "לָ#{root[0]}#{root[1]}#{root[2]}"
        return hebrew_verb
      end

      if root[2] == "א"
        hebrew_verb[:infinitive] = "לִ" + "#{root[0]}ְ" + "#{root[1]}וא"
        if ["ח", "ע"].include?(root[0])
          hebrew_verb[:infinitive] = "לַ" + "#{root[0]}ֲ" + "#{root[1]}וא"
        end
        return hebrew_verb
      end

      if ["ע","ח"].include?(root[2])
        hebrew_verb[:infinitive] = "לִ" + "#{root[0]}ְ#{root[1]}ו" + "#{root[2]}ַ"
        return hebrew_verb
      end
      hebrew_verb
    end

    def future_tense(root, infinitive)
      hebrew_verb = Hash.new
      verb_exceptions = ["לִלְמוֹד","לִגְדוֹל","לִלְבוֹש"]
      future_base = infinitive[2..-1]
      future_base = infinitive[4..-1] if root[0] == "נ"
      youfem_youplural_they_fut_base = future_base.delete future_base[3..4]

      if verb_exceptions.include?(infinitive)
        case infinitive
          when "לִלְבוֹש"
            future_base = "לְבַש"
          when "לִגְדוֹל"
            future_base = "גְדַל"
          when "לִלְמוֹד"
            future_base = "לְמַד"
        end
      end

      if ["ח", "ע", "ה"].include?(root[0]) && (root[1] != "ל" && root[2] != "כ")
        future_base.slice! 1
        future_base.insert 1,"ֱ"
        hebrew_verb[:me_fut]               = "אֶ" + future_base
        future_base[1] = "ֲ"
        hebrew_verb[:you_mas_sing_she_fut] = "תַ" + future_base
        hebrew_verb[:he_fut]               = "יַ" + future_base
        hebrew_verb[:we_fut]               = "נַ" + future_base
        youfem_youplural_they_fut_base.slice! 1
        youfem_youplural_they_fut_base.insert 1, "ַ"
        youfem_youplural_they_fut_base.slice! 2
        youfem_youplural_they_fut_base.insert 2, "#{root[1]}ְ"
        hebrew_verb[:you_fem_sing_fut]     = "תַ" + youfem_youplural_they_fut_base + "ִי"
        hebrew_verb[:you_plu_fut]          = "תַ" + youfem_youplural_they_fut_base + "וּ"
        hebrew_verb[:they_fut]             = "יַ" + youfem_youplural_they_fut_base + "וּ"

        return hebrew_verb
      end

      if root[0] == "א"
        return pei_ha_poal_alef_future_case(root)
      end

      if root[0] == "י" || (root[0] == "ה" && root[1] == "ל" && root[2]== "כ")
        future_base = ["ע", "ח"].include?(root[2]) ? "#{root[1]}ַ#{root[2]}" : "#{root[1]}ֵ#{root[2]}"
        youfem_youplural_they_fut_base = "#{root[1]}ְ#{root[2]}"
        hebrew_verb[:me_fut] = "אֵ" + future_base
        hebrew_verb[:you_mas_sing_she_fut] = "תֵ" + future_base
        hebrew_verb[:he_fut] = "יֵ" + future_base
        hebrew_verb[:we_fut] = "נֵ" + future_base
        hebrew_verb[:you_fem_sing_fut] = "תֵ" + youfem_youplural_they_fut_base + "ִי"
        hebrew_verb[:you_plu_fut] = "תֵ" + youfem_youplural_they_fut_base  + "וּ"
        hebrew_verb[:they_fut] = "יֵ" + youfem_youplural_they_fut_base  + "וּ"
        return hebrew_verb
      end

      if ["ו","י"].include?(root[1]) && root[2] != "ה"
        hebrew_verb[:me_fut] = "אַ" + future_base
        hebrew_verb[:you_mas_sing_she_fut] = "תַ" + future_base
        hebrew_verb[:he_fut] = "יַ" + future_base
        hebrew_verb[:we_fut] = "נַ" + future_base
        hebrew_verb[:you_fem_sing_fut] = "תַ" + future_base + "ִי"
        hebrew_verb[:you_plu_fut] = "תַ" + future_base + "וּ"
        hebrew_verb[:they_fut] = "יַ" + future_base + "וּ"
      elsif root[2] == "א"
        hebrew_verb[:me_fut] = "אֶ" + "#{root[0]}ְ#{root[1]}ָא"
        hebrew_verb[:you_mas_sing_she_fut] = "תִ" + "#{root[0]}ְ#{root[1]}ָא"
        hebrew_verb[:he_fut] = "יִ" + "#{root[0]}ְ#{root[1]}ָא"
        hebrew_verb[:we_fut] = "נִ" + "#{root[0]}ְ#{root[1]}ָא"
        hebrew_verb[:you_fem_sing_fut] = "תִ" + "#{root[0]}ְ#{root[1]}אִי"
        hebrew_verb[:you_plu_fut] = "תִ" + "#{root[0]}ְ#{root[1]}אוּ"
        hebrew_verb[:they_fut] = "יִ" + "#{root[0]}ְ#{root[1]}אוּ"
      elsif ["ה","ע","ח","א"].include?(root[1])
        hebrew_verb[:me_fut] = "אֶ" + "#{root[0]}ְ" + "#{root[1]}ַ#{root[2]}"
        hebrew_verb[:you_mas_sing_she_fut] = "תִ" + "#{root[0]}ְ" + "#{root[1]}ַ#{root[2]}"
        hebrew_verb[:he_fut] = "יִ" + "#{root[0]}ְ" + "#{root[1]}ַ#{root[2]}"
        hebrew_verb[:we_fut] = "נִ" + "#{root[0]}ְ" + "#{root[1]}ַ#{root[2]}"
        hebrew_verb[:you_fem_sing_fut] = "תִ"  + "#{root[0]}ְ" + "#{root[1]}ֲ#{root[2]}ִי"
        hebrew_verb[:you_plu_fut] = "תִ"  + "#{root[0]}ְ" + "#{root[1]}ֲ#{root[2]}וּ"
        hebrew_verb[:they_fut] = "יִ"  + "#{root[0]}ְ" + "#{root[1]}ֲ#{root[2]}וּ"
      elsif ["ח", "ע"].include? root[2]
        future_base.slice! future_base[-3..-1]
        hebrew_verb[:me_fut] = "אֶ" + future_base + "ַ#{root[2]}"
        hebrew_verb[:you_mas_sing_she_fut] = "תִ" + future_base + "ַ#{root[2]}"
        hebrew_verb[:he_fut] = "יִ" + future_base + "ַ#{root[2]}"
        hebrew_verb[:we_fut] = "נִ" + future_base + "ַ#{root[2]}"
        hebrew_verb[:you_fem_sing_fut] = "תִ" + future_base + "ְ#{root[2]}ִי"
        hebrew_verb[:you_plu_fut] = "תִ" + future_base + "ְ#{root[2]}וּ"
        hebrew_verb[:they_fut] = "יִ" + future_base + "ְ#{root[2]}וּ"
      else
        hebrew_verb[:me_fut] = "אֶ" + future_base
        hebrew_verb[:you_mas_sing_she_fut] = "תִ" + future_base
        hebrew_verb[:he_fut] = "יִ" + future_base
        hebrew_verb[:we_fut] = "נִ" + future_base
        hebrew_verb[:you_fem_sing_fut] = "תִ" + "#{root[0]}ְ#{root[1]}ְ#{root[2]}ִי"
        hebrew_verb[:you_plu_fut] = "תִ" + "#{root[0]}ְ#{root[1]}ְ#{root[2]}וּ"
        hebrew_verb[:they_fut] = "יִ" + "#{root[0]}ְ#{root[1]}ְ#{root[2]}וּ"

      end

      hebrew_verb.delete(:past_base)
      hebrew_verb
    end

    def imperative(conjugated_verb)
      hebrew_verb = Hash.new
      root_reversed = conjugated_verb[:root].split(".")
      if root_reversed[2] == "א"
        hebrew_verb[:mas_imp]    = "אֱ#{root_reversed[1]}ֹ#{root_reversed[0]}"
        if %w(ה ח).include? root_reversed[1]
          hebrew_verb[:fem_imp]    = "אֶ#{root_reversed[1]}ֱ#{root_reversed[0]}ִי"
          hebrew_verb[:plural_imp] = "אֶ#{root_reversed[1]}ֱ#{root_reversed[0]}וּ"
        else
          hebrew_verb[:fem_imp]    = "אִ#{root_reversed[1]}ְ#{root_reversed[0]}ִי"
          hebrew_verb[:plural_imp] = "אִ#{root_reversed[1]}ְ#{root_reversed[0]}וּ"
        end
      else
        hebrew_verb[:mas_imp]    = conjugated_verb[:you_mas_sing_she_fut][2..-1]
        hebrew_verb[:fem_imp]    = conjugated_verb[:you_fem_sing_fut][2..-1]
        hebrew_verb[:plural_imp] = conjugated_verb[:you_plu_fut][2..-1]
        # FIXES ה''ל SOUND
        hebrew_verb[:mas_imp][-2..-2] = "ֵ" if hebrew_verb[:mas_imp][-2..-2] == "ֶ"
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
        when "נִ"
          last_letter = "ן"
        when "פ"
          last_letter = "ף"
        when "צ"
          last_letter = "ץ"
      end

      %w(mas_sing_pres infinitive he_past me_fut you_mas_sing_she_fut he_fut we_fut).each do |person|
        conjugated_verb[person.to_sym][-1..-1] = last_letter
      end

      conjugated_verb
    end

    def pei_ha_poal_alef_future_case(root)
      hebrew_verb = Hash.new
      if (root[1] == "ה" && root[2] == "ב") ||
         (root[1] == "כ" && root[2] == "ל") ||
         (root[1] == "מ" && root[2] == "ר") ||
         (root[1] == "ב" && root[2] == "ד") ||
         (root[1] == "ח" && root[2] == "ז") ||
         (root[1] == "פ" && root[2] == "ה")
        hebrew_verb[:me_fut]               = "אֹ" + "#{root[1]}ַ#{root[2]}"
        hebrew_verb[:you_mas_sing_she_fut] = "תֹ" + "א#{root[1]}ַ#{root[2]}"
        hebrew_verb[:he_fut]               = "יֹ" + "א#{root[1]}ַ#{root[2]}"
        hebrew_verb[:we_fut]               = "נֹ" + "א#{root[1]}ַ#{root[2]}"
        youfem_youplural_they_fut_base = root[1] == "ה" ? "א#{root[1]}ֲ#{root[2]}" : "א#{root[1]}ְ#{root[2]}"
        hebrew_verb[:you_fem_sing_fut]     = "תֹ" + youfem_youplural_they_fut_base + "ִי"
        hebrew_verb[:you_plu_fut]          = "תֹ" + youfem_youplural_they_fut_base + "וּ"
        hebrew_verb[:they_fut]             = "יֹ" + youfem_youplural_they_fut_base + "וּ"
      else
        hebrew_verb[:me_fut]               = "אֶ" + "אֱ#{root[1]}ֹ#{root[2]}"
        hebrew_verb[:you_mas_sing_she_fut] = "תֶ" + "אֱ#{root[1]}ֹ#{root[2]}"
        hebrew_verb[:he_fut]               = "יֶ" + "אֱ#{root[1]}ֹ#{root[2]}"
        hebrew_verb[:we_fut]               = "נֶ" + "אֱ#{root[1]}ֹ#{root[2]}"
        if %w(ע ה ח א).include? root[1]
          hebrew_verb[:you_fem_sing_fut]     = "תֶ" + "אֱ#{root[1]}ֶ#{root[2]}י"
          hebrew_verb[:you_plu_fut]          = "תֶ" + "אֱ#{root[1]}ֶ#{root[2]}וּ"
          hebrew_verb[:they_fut]             = "יֶ" + "אֱ#{root[1]}ֶ#{root[2]}וּ"
        else
          hebrew_verb[:you_fem_sing_fut]     = "תַ" + "אַ#{root[1]}ְ#{root[2]}י"
          hebrew_verb[:you_plu_fut]          = "תַ" + "אַ#{root[1]}ְ#{root[2]}וּ"
          hebrew_verb[:they_fut]             = "יַ" + "אַ#{root[1]}ְ#{root[2]}וּ"
        end
      end
      hebrew_verb
    end

    def lamed_ha_poal_future_case_fix(root, conjugated_verb)
      if ["ה","ע","ח","א"].include?(root[1])
        range_start = -2
      else
        range_start = -3
      end
      %w(me_fut you_mas_sing_she_fut he_fut we_fut).each do |key|
        base_to_use = conjugated_verb[key.to_sym]
        base_to_use.slice!(base_to_use[range_start..-1])
        conjugated_verb[key.to_sym] = conjugated_verb[key.to_sym]  + "ֶה"
      end
      base_to_use = conjugated_verb[:you_fem_sing_fut]
      base_to_use.slice!(base_to_use[-4..-1])
      conjugated_verb[:you_fem_sing_fut] = base_to_use + "ִי"
      conjugated_verb[:you_plu_fut] = base_to_use + "וּ"
      base_to_use = conjugated_verb[:they_fut]
      base_to_use.slice!(base_to_use[-4..-1])
      conjugated_verb[:they_fut] = base_to_use + "וּ"
      conjugated_verb
    end
  end
end