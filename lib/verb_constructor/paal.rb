# encoding: UTF-8
module VerbConstructor
  class Paal
    GUTTURAL = %w( א ה ח ע )
    PEIL_HA_POAL_XET_EXCEPTIONS = %w( ח.ד.ל ח.ס.ר ח.ר.ד )
    PEIL_HA_POAL_YUD_EXCEPTIONS_1 = %w( י.צ.ר י.ר.ק י.ר.ש י.ז.מ )
    PEIL_HA_POAL_YUD_EXCEPTIONS_2 = %w( י.ש.נ י.ע.צ )
    EXCEPTION_ROOTS = %w( י.כ.ל נ.ג.ש נ.ת.נ ה.י.ה ח.י.ה מ.ו.ת)

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

      if %w( ו י ).include?(root[1]) || (root[1] == root[2] && !GUTTURAL.include?(root[0]) )
        hebrew_verb[:mas_sing_pres] = "#{root[0]}ָ#{root[2]}"
        hebrew_verb[:fem_sing_pres] = "#{root[0]}ָ#{root[2]}ָה"
        hebrew_verb[:mas_plu_pres]  = "#{root[0]}ָ#{root[2]}ִים"
        hebrew_verb[:fem_plu_pres]  = "#{root[0]}ָ#{root[2]}וֹת"
        hebrew_verb[:past_base]     = "#{root[0]}ָ#{root[1]}"
      end

      if %w( ח ע ).include? root[2]
        hebrew_verb[:mas_sing_pres] += "ַ"
        hebrew_verb[:fem_sing_pres] = "#{root[0]}וֹ#{root[1]}ַ#{root[2]}ַת"
      end

      if root[2] == "א"
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
        hebrew_verb[:mas_sing_pres] = "יָשֵׁן"
        hebrew_verb[:fem_sing_pres] = "יְשֵׁנה"
        hebrew_verb[:mas_plu_pres]  = "יְשֵׁנִים"
        hebrew_verb[:fem_plu_pres]  = "יְשֵׁנוֹת"
      end

      if %w(י.ג.ע י.ר.א).include? root.join(".")
        hebrew_verb[:mas_sing_pres] = "יָ#{root[1]}ֵ#{root[2]}"
        hebrew_verb[:fem_sing_pres] = "יְ#{root[1]}ֵ#{root[2]}ָה"
        hebrew_verb[:mas_plu_pres]  = "יְ#{root[1]}ֵ#{root[2]}ִים"
        hebrew_verb[:fem_plu_pres]  = "יְ#{root[1]}ֵ#{root[2]}וֹת"
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
          hebrew_verb[:infinitive] = "לַ#{root[0]}ֲ#{root[1]}וֹ#{root[2]}"
        end
      end

      if root[0] == "י" || root.join(".") == "ה.ל.כ"
        hebrew_verb[:infinitive] = "לָ#{root[1]}ֶ#{root[2]}ֶת"
        hebrew_verb[:infinitive] = "לָ#{root[1]}ֵאת" if root[2] == "א"
        hebrew_verb[:infinitive] = "לָ#{root[1]}ַעַת" if root[2] == "ע"

        if root.join(".") == "י.ג.ע"
          hebrew_verb[:infinitive] = "----//----"
        end
      end

      if root[0] == "נ"
        if (root[2] == "ע" && root.join(".") != "נ.ס.ע")
          hebrew_verb[:infinitive] = "לָ#{root[1]}ַעֲת"
        elsif root[2] == "א"
          hebrew_verb[:infinitive] = "לָ#{root[1]}ֵאת"
        end
      end

      if root[2] == "ה"
        hebrew_verb[:infinitive][-1] = "ת"
      end

      if %w( ו י ).include?(root[1]) && root[2] != "ה"
        second_component = root[1] == "ו" ? "וּ" : "ִי"
        third_component = root[2] == "ח" ? "חַ" : "#{root[2]}"
        hebrew_verb[:infinitive] = "לָ#{root[0]}#{second_component}#{third_component}"
      end

      if root.join(".") == "ל.ק.ח"
        hebrew_verb[:infinitive] = "לָקַחַת"
      end

      if root.join(".") == "ש.כ.ב"
        hebrew_verb[:infinitive] = "לִשְכַּב"
      end

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
        past_base = "הָיָה"
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

  end
end