# encoding: UTF-8
module VerbConstructor
  class Paal
    GUTTURAL = %w( א ה ח ע )
    PEIL_HA_POAL_XET_EXCEPTIONS = %w( ח.ד.ל ח.ס.ר ח.ר.ד )
    PEIL_HA_POAL_YUD_EXCEPTIONS_1 = %w( י.צ.ר י.ר.ק י.ר.ש י.ז.מ )
    PEIL_HA_POAL_YUD_EXCEPTIONS_2 = %w( י.ש.נ י.ע.צ )
    CONDITION_VERBS_AND_SIMILAR_PEIL_HA_POAL_YUD_EXCEPTIONS = %w( ר.ע.ב כ.מ.ה ש.מ.ח י.ג.ע י.ר.א )
    EXCEPTION_ROOTS = %w( י.כ.ל נ.ג.ש נ.ת.נ ה.י.ה ח.י.ה מ.ו.ת)
    EXCEPTION_FUTURE_ROOTS = %w( ל.מ.ד ל.ב.ש ש.כ.ב ק.ר.נ ג.ד.ל ד.ב.ק)
    LETTERS_WITH_VISUAL_STRESS = %w( ב כ פ )

    def present_tense(root)
      hebrew_verb = Hash.new

      hebrew_verb[:mas_sing_pres] = "#{root[0]}וֹ#{root[1]}ֵ#{root[2]}"
      hebrew_verb[:fem_sing_pres] = "#{root[0]}וֹ#{root[1]}ֶ#{root[2]}ֶת"
      hebrew_verb[:mas_plu_pres]  = "#{root[0]}וֹ#{root[1]}ְ#{root[2]}ִים"
      hebrew_verb[:fem_plu_pres]  = "#{root[0]}וֹ#{root[1]}ְ#{root[2]}וֹת"
      hebrew_verb[:past_base]     = "#{root[0]}ָ#{root[1]}ַ#{root[2]}"

      if PEIL_HA_POAL_XET_EXCEPTIONS.include? root.join(".")
        hebrew_verb[:mas_sing_pres] = "#{root[0]}ָ#{root[1]}ֵ#{root[2]}"
        hebrew_verb[:fem_sing_pres] = "#{root[0]}ֲ#{root[1]}ֵ#{root[2]}ָה"
        hebrew_verb[:mas_plu_pres]  = "#{root[0]}ֲ#{root[1]}ֵ#{root[2]}ִים"
        hebrew_verb[:fem_plu_pres]  = "#{root[0]}ֲ#{root[1]}ֵ#{root[2]}וֹת"
      end

      if (%w( ו י ).include?(root[1]) && root[2] != "ה") || (root.join(".") == "ת.מ.מ" )
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

      if root[2] == "ה"
        hebrew_verb[:mas_sing_pres] = "#{root[0]}וֹ#{root[1]}ֶה"
        hebrew_verb[:fem_sing_pres] = "#{root[0]}וֹ#{root[1]}ָה"
        hebrew_verb[:mas_plu_pres]  = "#{root[0]}וֹ#{root[1]}ִים"
        hebrew_verb[:fem_plu_pres]  = root[1] == "ו" ? "#{root[0]}ֹוֹות" : "#{root[0]}וֹ#{root[1]}וֹת"

        if root[0] == "כ" && root [1] == "ב"
          hebrew_verb[:mas_sing_pres] = "כּבֶה"
          hebrew_verb[:fem_sing_pres] = "כּבָה"
          hebrew_verb[:mas_plu_pres]  = "כּבִים"
          hebrew_verb[:fem_plu_pres]  = "כּבוֹת"
        end

        hebrew_verb[:past_base]     = "#{root[0]}ָ#{root[1]}ָה"
      end

      if root.join(".") == "י.ש.נ"
        hebrew_verb[:mas_sing_pres] = "יָשֵׁנ"
        hebrew_verb[:fem_sing_pres] = "יְשֵׁנה"
        hebrew_verb[:mas_plu_pres]  = "יְשֵׁנִים"
        hebrew_verb[:fem_plu_pres]  = "יְשֵׁנוֹת"
      end

      if CONDITION_VERBS_AND_SIMILAR_PEIL_HA_POAL_YUD_EXCEPTIONS.include? root.join(".")
        sound = root[0] == "י" ? "ָ" : "ַ"
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


      if GUTTURAL.include?(root[1]) && !GUTTURAL.include?(root[2])
        hebrew_verb[:mas_plu_pres]  = "#{root[0]}וֹ#{root[1]}ֲ#{root[2]}ִים"
        hebrew_verb[:fem_plu_pres]  = "#{root[0]}וֹ#{root[1]}ֲ#{root[2]}וֹת"
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
          hebrew_verb[:infinitive] = "----//----"
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
        second_component = root.join(".") == "ב.ו.א" ? "וֹ" : "וּ"
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
        when "י.כ.ל"
          hebrew_verb[:infinitive] = "----//----"
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

      if %w(ח ע).include? root[2]
        hebrew_verb[:infinitive] += "ַ"
      end

      if LETTERS_WITH_VISUAL_STRESS.include?(root[1]) && !%w(א ה).include?(root[0])
        hebrew_verb[:infinitive].insert 5, "ּ"
      end

      hebrew_verb
    end

    def past_tense(root, past_base)
      hebrew_verb = Hash.new
      _past_base = past_base.clone

      if root[2] == "ה"
        _past_base.slice!(-2..-1)
        _past_base += "ִי"
      end

      _past_base += "ְ" if root[2] != "ה" && root[2] != "א"
      _past_base.slice!(-2..-1) if root[2] == "ת"

      hebrew_verb[:me_past]           = _past_base + "תִי"
      hebrew_verb[:you_mas_sing_past] = _past_base + "תָ"
      hebrew_verb[:you_fem_sing_past] = _past_base + "תְ"
      hebrew_verb[:we_past]           = root[2] == "נ" ?  _past_base + "וּ" : _past_base + "נוּ"
      hebrew_verb[:you_mas_plu_past]  = _past_base + "תֶם"
      hebrew_verb[:you_fem_plu_past]  = _past_base + "תֶן"
      if root[2] == "ה"
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

      if GUTTURAL.include? root[2]
        if root[2] == "ה"
          _past_base.slice!(-1)
        elsif root[2] == "ח"
          _past_base.insert 3, "ֲ"
        end
      end

      _past_base.insert 3, "ְ" if root[1] != "ו"


      if root[2] == "ה"
        hebrew_verb[:she_past] = _past_base + "ְתָה"
        hebrew_verb[:they_past] = _past_base + "וּ "
      else
        hebrew_verb[:she_past]  =  _past_base + "ָה"
        hebrew_verb[:they_past] = _past_base + "וּ"
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

      future_baseֹ_me = future_baseֹ_you_us = "#{root[0]}ְ#{root[1]}וֹ#{root[2]}"
      youfem_youplural_they_fut_base = "#{root[0]}ְ#{root[1]}ְ#{root[2]}"

      if EXCEPTION_FUTURE_ROOTS.include? root.join(".")
        future_baseֹ_me = future_baseֹ_you_us = "#{root[0]}ְ#{root[1]}ַ#{root[2]}"
      end

      if %w(ה ח ע).include?(root[0]) && root.join(".") != "ה.ל.כ"
        if root.join(".") == "ח.נ.נ"
          future_baseֹ_me = future_baseֹ_you_us = youfem_youplural_they_fut_base = infinitive.clone[2..-1]
          prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ָ"
        else
          prefix_sound_me = "ֶ"
          prefix_sound_you_us = prefix_sound_plural = "ַ"

          future_baseֹ_me = "#{root[0]}ֱ#{root[1]}וֹ#{root[2]}"
          future_baseֹ_you_us = "#{root[0]}ֲ#{root[1]}וֹ#{root[2]}"
          youfem_youplural_they_fut_base = "#{root[0]}ַ#{root[1]}ְ#{root[2]}"
        end
      end

      if root[0] == "א"
        if %w(א.ה.ב א.כ.ל א.ב.ד א.מ.ר א.ח.ז).include? root.join(".")
          prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ֹ"

          future_baseֹ_me = "#{root[1]}ַ#{root[2]}"
          future_baseֹ_you_us = "א#{root[1]}ַ#{root[2]}"
          youfem_youplural_they_fut_base = root[1] == "ה" ? "א#{root[1]}ֲ#{root[2]}" : "א#{root[1]}ְ#{root[2]}"
        else
          prefix_sound_me = "ֶ"
          prefix_sound_you_us = "ֶ"
          prefix_sound_plural = "ַ"

          future_baseֹ_me = "אֱ#{root[1]}וֹ#{root[2]}"
          future_baseֹ_you_us = "אֱ#{root[1]}וֹ#{root[2]}"
          youfem_youplural_they_fut_base = "אַ#{root[1]}ְ#{root[2]}"
        end
      end

      if root[0] == "י" || root.join(".") == "ה.ל.כ"
        if (infinitive[2..-1] == "#{root[1]}ֶ#{root[2]}ֶת" || root[2] == "א") && root.join(".") != "י.ר.ש"
          prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ֵ"

          future_baseֹ_me = future_baseֹ_you_us = "#{root[1]}ֵ#{root[2]}"
          youfem_youplural_they_fut_base = "#{root[1]}ְ#{root[2]}"
        elsif %w(י.צ.ר י.ז.מ).include? root.join(".")
          prefix_sound_me = "ֶ"
          prefix_sound_you_us = prefix_sound_plural = "ִ"

          future_baseֹ_me = "#{root[1]}וֹ#{root[2]}"
          future_baseֹ_you_us = "#{root[1]}וֹ#{root[2]}"
          youfem_youplural_they_fut_base = "#{root[1]}ְ#{root[2]}"
        elsif infinitive[2..-1] == "#{root[1]}ַ#{root[2]}ַת"
          prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ֵ"

          future_baseֹ_me = future_baseֹ_you_us = "#{root[1]}ַ#{root[2]}"
          youfem_youplural_they_fut_base = "#{root[1]}ְ#{root[2]}"
        else
          prefix_sound_me = prefix_sound_you_us = prefix_sound_plural = "ִ"

          future_baseֹ_me = "#{root[0]}#{root[1]}ַ#{root[2]}"
          future_baseֹ_you_us = "#{root[0]}#{root[1]}ַ#{root[2]}"
          youfem_youplural_they_fut_base = "#{root[0]}#{root[1]}ְ#{root[2]}"
        end
      end

      if (root[0] == "נ" || root.join(".") == "ל.ק.ח") && !GUTTURAL.include?(root[1])
        prefix_sound_me = "ֶ"
        prefix_sound_you_us = prefix_sound_plural = "ִ"

        future_baseֹ_me = "#{root[1]}ַ#{root[2]}"
        future_baseֹ_you_us = "#{root[1]}ַ#{root[2]}"
        youfem_youplural_they_fut_base = "#{root[1]}ְ#{root[2]}"

        if %w(נ.פ.ל נ.ט.ש נ.ט.ר).include? root.join(".")
          future_baseֹ_me = future_baseֹ_you_us = "#{root[1]}וֹ#{root[2]}"
        end
      end

      if GUTTURAL.include? root[1]
        prefix_sound_me = "ֶ"
        prefix_sound_you_us = prefix_sound_plural = "ִ"

        future_baseֹ_me = "#{root[0]}ְ#{root[1]}ַ#{root[2]}"
        future_baseֹ_you_us = "#{root[0]}ְ#{root[1]}ַ#{root[2]}"
        youfem_youplural_they_fut_base = "#{root[0]}ְ#{root[1]}ֲ#{root[2]}"
      end

      if %w(ח ע).include? root[2]
        prefix_sound_me = "ֶ"
        prefix_sound_you_us = prefix_sound_plural = "ִ"

        future_baseֹ_me = "#{root[0]}ְ#{root[1]}ַ#{root[2]}"
        future_baseֹ_you_us = "#{root[0]}ְ#{root[1]}ַ#{root[2]}"
        youfem_youplural_they_fut_base = "#{root[0]}ְ#{root[1]}ְ#{root[2]}"
      end

      if root[2] == "א"
        prefix_sound_me = "ֶ"
        prefix_sound_you_us = prefix_sound_plural = "ִ"

        future_baseֹ_me = "#{root[0]}ְ#{root[1]}ָא"
        future_baseֹ_you_us = "#{root[0]}ְ#{root[1]}ָא"
        youfem_youplural_they_fut_base = GUTTURAL.include?(root[1]) ? "#{root[0]}ְ#{root[1]}ֲא" : "#{root[0]}ְ#{root[1]}ְא"
      end

      if LETTERS_WITH_VISUAL_STRESS.include?(root[1]) && !%w(א ה).include?(root[0])
        future_baseֹ_me.insert 3, "ּ"
        future_baseֹ_you_us.insert 3, "ּ"
        youfem_youplural_they_fut_base.insert 3, "ּ"
      end

      hebrew_verb[:me_fut] = "א#{prefix_sound_me}" + future_baseֹ_me
      hebrew_verb[:you_mas_sing_she_fut] = "ת#{prefix_sound_you_us}" + future_baseֹ_you_us
      hebrew_verb[:he_fut] = "י#{prefix_sound_you_us}" + future_baseֹ_you_us
      hebrew_verb[:we_fut] = "נ#{prefix_sound_you_us}" + future_baseֹ_you_us
      hebrew_verb[:you_fem_sing_fut] = "ת#{prefix_sound_plural}" + youfem_youplural_they_fut_base + "ִי"
      hebrew_verb[:you_plu_fut] = "ת#{prefix_sound_plural}" + youfem_youplural_they_fut_base  + "וּ"
      hebrew_verb[:they_fut] = "י#{prefix_sound_plural}" + youfem_youplural_they_fut_base  + "וּ"

      hebrew_verb
    end

    private

    def conjugate_present_for_exception(root)
      case root.join(".")
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
        mas_sing_pres = "----//----"
        fem_sing_pres = "----//----"
        mas_plu_pres = "----//----"
        fem_plu_pres = "----//----"
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

  end
end