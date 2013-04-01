# encoding: UTF-8
module VerbContructor::PaalHelper

  def present_tense(root)
    # DEFAULT VERB CONJUGATION
    hebrew_verb = Hash.new
    hebrew_verb[:mas_sing_pres] = "#{root[0]}ו#{root[1]}ֵ#{root[2]}"
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
      elsif root[2] == "ה"
        if root[1] == "ו"
          hebrew_verb[:mas_sing_pres] = "#{root[0]}ו#{root[1]}ֶה"
          hebrew_verb[:fem_plu_pres]  = "#{root[0]}וות"
        end
        hebrew_verb[:fem_sing_pres] = "#{root[0]}ו#{root[1]}ָה"
        hebrew_verb[:mas_plu_pres]  = "#{root[0]}ו#{root[1]}ִים"
        hebrew_verb[:fem_plu_pres]  = "#{root[0]}ו#{root[1]}ות"
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

    # hebrew_verb.each do |key,value|
    #   case hebrew_verb[key][hebrew_verb[key].size - 1]
    #     when "כ"
    #       hebrew_verb[key][hebrew_verb[key].size - 1] = "ך"
    #     when "מ"
    #       hebrew_verb[key][hebrew_verb[key].size - 1] = "ם"
    #     when "נִ"
    #       hebrew_verb[key][hebrew_verb[key].size - 1] = "ן"
    #     when "פ"
    #       hebrew_verb[key][hebrew_verb[key].size - 1] = "ף"
    #     when "צ"
    #       hebrew_verb[key][hebrew_verb[key].size - 1] = "ץ"
    #   end
    # end

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

    _past_base = past_base

    if ["ו","י"].include?(root[1])
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
      hebrew_verb[:you_mas_plu_past]  = _past_base + "תֵם"
      hebrew_verb[:you_fem_plu_past]  = _past_base + "תֵן"
      hebrew_verb[:he_past]           = _past_base
      hebrew_verb[:she_past]          = _past_base + "ְאָה"
      hebrew_verb[:they_past]         = _past_base + "ְְאו"

      return hebrew_verb
    end

    if root[2] == "ה"
      _past_base = past_base.delete past_base[3..-1]
      hebrew_verb[:me_past]           = _past_base + "ִתִי"
      hebrew_verb[:you_mas_sing_past] = _past_base + "ִתְ"
      hebrew_verb[:you_fem_sing_past] = _past_base + "ִתָ"
      hebrew_verb[:we_past]           = _past_base + "ִנו"
      hebrew_verb[:you_mas_plu_past]  = _past_base + "ִתֶם"
      hebrew_verb[:you_fem_plu_past]  = _past_base + "ִתֶן"
      hebrew_verb[:he_past]           = past_base
      if root[1] == "א"
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
      _past_base = _past_base.gsub("ַ", "ְ")
      hebrew_verb[:she_past]          = _past_base + "ָה"
      hebrew_verb[:they_past]         = _past_base + "וּ"
      hebrew_verb[:he_past]           = past_base

    end
    hebrew_verb
  end

  def infinitive(root)
    hebrew_verb = Hash.new
    infinitive_end = root[2] == "ה" ? "ת" : "#{root[2]}"
    hebrew_verb[:infinitive] = "לִ#{root[0]}ְ#{root[1]}ו" + infinitive_end

    if ["ח", "ע", "ה"].include?(root[0])
      infinitive_start = root[0] == "ח" ? "לַ#{root[0]}ְ#{root[1]}וֹ" : "לַ#{root[0]}ֲ#{root[1]}וֹ"
      hebrew_verb[:infinitive] = infinitive_start + infinitive_end
      return hebrew_verb
    end

    if root[0] == "א"
      hebrew_verb[:infinitive] = "לֶאֱ#{root[1]}ו#{root[2]}"
      return hebrew_verb
    end

    if root[0] == "י"
      # * It presents several exception cases *
      if ["ח", "ע"].include?(root[2])
        hebrew_verb[:infinitive] = "לָ#{root[1]}ַ#{root[2]}ַת"
      elsif ["ש", "ל", "ר"].include?(root[1]) && ["ב", "ד", "ר", "ל"].include?(root[2])
        hebrew_verb[:infinitive] = "לָ#{root[1]}ֶ#{root[2]}ֶת"
      else
        hebrew_verb[:infinitive] = "לִי#{root[1]}ו#{root[2]}"
      end
      return hebrew_verb
    end

    if ["ו", "י"].include?(root[1])
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
    verb_exceptions = ["לִלְמוד","לִגְדול","לִלְבוש"]
    future_base = infinitive.delete(infinitive[0..1])
    youfem_youplural_they_fut_base = future_base.delete future_base[3..4]

    if verb_exceptions.include?(infinitive)
      case infinitive
        when "לִלְבוש"
           future_base = "לְבַש"
        when "לִגְדול"
          future_base = "גְדַל"
        when "לִלְמוד"
          future_base = "לְמַד"
      end
    end

    if ["ח", "ע", "ה"].include?(root[0])
      future_base.slice! 1
      if root[2] == "ה" # ע"פ & ה"ל CASE
        future_base.insert 1,"ֶ"
        hebrew_verb[:me_fut]               = "אֶ" + future_base
        future_base[1] = "ֲ"
        hebrew_verb[:you_mas_sing_she_fut] = "תַ" + future_base
        hebrew_verb[:he_fut]               = "יַ" + future_base
        hebrew_verb[:we_fut]               = "נַ" + future_base
        youfem_youplural_they_fut_base.slice! 1
        youfem_youplural_they_fut_base.insert 1, "ַ"
        hebrew_verb[:you_fem_sing_fut]     = "תַ" + youfem_youplural_they_fut_base + "ִי"
        hebrew_verb[:you_plu_fut]          = "תַ" + youfem_youplural_they_fut_base + "וּ"
        hebrew_verb[:they_fut]             = "יַ" + youfem_youplural_they_fut_base + "וּ"
      else
        future_base.insert 1,"ֶ"
        hebrew_verb[:me_fut]               = "אֶ" + future_base
        future_base[1] = "ֲ"
        hebrew_verb[:you_mas_sing_she_fut] = "תַ" + future_base
        hebrew_verb[:he_fut]               = "יַ" + future_base
        hebrew_verb[:we_fut]               = "נַ" + future_base
        youfem_youplural_they_fut_base.slice! 1
        youfem_youplural_they_fut_base.insert 1, "ַ"
        hebrew_verb[:you_fem_sing_fut]     = "תַ" + youfem_youplural_they_fut_base + "ִי"
        hebrew_verb[:you_plu_fut]          = "תַ" + youfem_youplural_they_fut_base + "וּ"
        hebrew_verb[:they_fut]             = "יַ" + youfem_youplural_they_fut_base + "וּ"
      end
      return hebrew_verb
    end

    if root[0] == "א"
      hebrew_verb[:me_fut]               = "אֹ" + "#{root[1]}ָ" + "#{root[2]}"
      hebrew_verb[:you_mas_sing_she_fut] = "תֹ" + "#{root[1]}ָ#{root[2]}"
      hebrew_verb[:he_fut]               = "יֹ" + "#{root[1]}ָ#{root[2]}"
      hebrew_verb[:we_fut]               = "נֹ" + "#{root[1]}ָ#{root[2]}"
      hebrew_verb[:you_fem_sing_fut]     = "תֹ" + "#{root[1]}ְ#{root[2]}ִי"
      hebrew_verb[:you_plu_fut]          = "תֹ" + "#{root[1]}ְ#{root[2]}וּ"
      hebrew_verb[:they_fut]             = "יֹ" + "#{root[1]}ְ#{root[2]}וּ"
      if root[1] == "ה"
        hebrew_verb[:you_fem_sing_fut]   = "תֹ" + "#{root[1]}ֲ#{root[2]}ִי"
        hebrew_verb[:you_plu_fut]        = "תֹ" + "#{root[1]}ֲ#{root[2]}וּ"
        hebrew_verb[:they_fut]           = "יֹ" + "#{root[1]}ֲ#{root[2]}וּ"
      end

      return hebrew_verb
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

    if ["ו","י"].include?(root[1])
      hebrew_verb[:me_fut] = "אְַ" + future_base
      hebrew_verb[:you_mas_sing_she_fut] = "תַ" + future_base
      hebrew_verb[:he_fut] = "יַ" + future_base
      hebrew_verb[:we_fut] = "נַ" + future_base
      hebrew_verb[:you_fem_sing_fut] = "תַ" + future_base + "ִי"
      hebrew_verb[:you_plu_fut] = "תַ" + future_base + "וּ"
      hebrew_verb[:they_fut] = "יַ" + future_base + "וּ"
    elsif root[2] == "ה"
      hebrew_verb[:me_fut] = "אֶ" + "#{root[0]}ְ#{root[1]}ֶ" + "#{root[2]}"
      hebrew_verb[:you_mas_sing_she_fut] = "תִ" + "#{root[0]}ְ#{root[1]}ֶ#{root[2]}"
      hebrew_verb[:he_fut] = "יִ" + "#{root[0]}ְ#{root[1]}ֶ#{root[2]}"
      hebrew_verb[:we_fut] = "נִ" + "#{root[0]}ְ#{root[1]}ֶ#{root[2]}"
      hebrew_verb[:you_fem_sing_fut] = "תִ" + "#{root[0]}ְ#{root[1]}ִי"
      hebrew_verb[:you_plu_fut] = "תִ" + "#{root[0]}ְ#{root[1]}וּ"
      hebrew_verb[:they_fut] = "יִ" + "#{root[0]}ְ#{root[1]}וּ"
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
      hebrew_verb[:you_fem_sing_fut] = "תִ"  + "#{root[0]}ַ" + "#{root[1]}ֲ#{root[2]}ִי"
      hebrew_verb[:you_plu_fut] = "תִ"  + "#{root[0]}ַ" + "#{root[1]}ֲ#{root[2]}וּ"
      hebrew_verb[:they_fut] = "יִ"  + "#{root[0]}ַ" + "#{root[1]}ֲ#{root[2]}וּ"

    else
      hebrew_verb[:me_fut] = "אֶ" + future_base
      hebrew_verb[:you_mas_sing_she_fut] = "תִ" + future_base
      hebrew_verb[:he_fut] = "יִ" + future_base
      hebrew_verb[:we_fut] = "נִ" + future_base
      hebrew_verb[:you_fem_sing_fut] = "תִ" + "#{root[0]}ְ#{root[1]}ְ#{root[2]}ִי"
      hebrew_verb[:you_plu_fut] = "תִ" + "#{root[0]}ְ#{root[1]}ְ#{root[2]}וּ"
      hebrew_verb[:they_fut] = "יִ" + "#{root[0]}ְ#{root[1]}ְ#{root[2]}וּ"

      if hebrew_verb[:fut_base]
        hebrew_verb.delete(:fut_base)
      end
    end
    ## IMPERATIVE
    #hebrew_verb = paal_imperative(hebrew_verb,root)
    @size_mas = hebrew_verb[:you_mas_sing_she_fut].size - 1
    @size_fem = hebrew_verb[:you_fem_sing_fut].size - 1
    @size_plu = hebrew_verb[:you_plu_fut].size - 1

    if !["ו","י"].include?(root[1])
      hebrew_verb[:mas_imp] = hebrew_verb[:you_mas_sing_she_fut][2..@size_mas]

    else
      hebrew_verb[:mas_imp] = hebrew_verb[:you_mas_sing_she_fut][2..@size_mas]
      hebrew_verb[:fem_imp] = hebrew_verb[:you_fem_sing_fut][2..@size_fem]
      hebrew_verb[:plural_imp] = hebrew_verb[:you_plu_fut][2..@size_plu]
    end




    hebrew_verb.delete(:past_base)
    hebrew_verb
  end

  def config_final_letters(hebrew_verb)
    # FINAL LETTERS CONFIG
    hebrew_verb.each do |key,value|
      #if ["past_base".to_sym, "root".to_sym].include?(key)
        case hebrew_verb[key][hebrew_verb[key].size - 1]
          when "כ"
            hebrew_verb[key][hebrew_verb[key].size - 1] = "ך"
          when "מ"
            hebrew_verb[key][hebrew_verb[key].size - 1] = "ם"
          when "נִ"
            hebrew_verb[key][hebrew_verb[key].size - 1] = "ן"
          when "פ"
            hebrew_verb[key][hebrew_verb[key].size - 1] = "ף"
          when "צ"
            hebrew_verb[key][hebrew_verb[key].size - 1] = "ץ"
        end
      #end
    end
    hebrew_verb
  end

end

