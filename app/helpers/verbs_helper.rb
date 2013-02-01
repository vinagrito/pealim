# encoding: UTF-8
module VerbsHelper

  def conjugate_paal_present(destination_hash, root)
    destination_hash[:past_base] = "#{root[0]}ָ" + "#{root[1]}ַ" + "#{root[2]}"
      if ['ו','י'].include?(root[1])
        destination_hash[:mas_sing_pres] = "#{root[0]}ָ#{root[2]}"
        destination_hash[:fem_sing_pres] = "#{root[0]}ָ#{root[2]}ָ" + "ה"
        destination_hash[:mas_plu_pres]  = "#{root[0]}ָ#{root[2]}ִ" + "ים"
        destination_hash[:fem_plu_pres]  = "#{root[0]}ָ#{root[2]}ות"
        destination_hash[:past_base]     = "#{root[0]}ָ#{root[2]}"
      elsif ['א','ה'].include?(root[1]) && !['ה'].include?(root[2])
        destination_hash[:mas_sing_pres] = "#{root[0]}ו" + "#{root[1]}ֵ#{root[2]}"
        destination_hash[:fem_sing_pres] = "#{root[0]}ו" + "#{root[1]}ֶ#{root[2]}ֶ" + "ת"
        destination_hash[:mas_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ֲ#{root[2]}ִ" + "ים"
        destination_hash[:fem_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ֲ#{root[2]}ות"
        destination_hash[:past_base]     = "#{root[0]}ָ#{root[1]}ַ#{root[2]}"
      elsif ['א'].include?(root[2])
        destination_hash[:mas_sing_pres] = "#{root[0]}ו" + "#{root[1]}ֵ#{root[2]}"
        destination_hash[:fem_sing_pres] = "#{root[0]}ו" + "#{root[1]}ֵ#{root[2]}" + "ת"
        destination_hash[:mas_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ְ#{root[2]}ִ" + "ים"
        destination_hash[:fem_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ְ#{root[2]}ות"
        destination_hash[:past_base]     = "#{root[0]}ָ" + "#{root[1]}ָ" + "#{root[2]}"
      elsif ['ה'].include?(root[2])
        destination_hash[:mas_sing_pres] = "#{root[0]}ו" + "#{root[1]}ֵ#{root[2]}"
        destination_hash[:fem_sing_pres] = "#{root[0]}ו" + "#{root[1]}ָ#{root[2]}"
        destination_hash[:mas_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ִ" + "ים"
        destination_hash[:fem_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ות"
        destination_hash[:past_base]     = "#{root[0]}ָ" + "#{root[1]}ִ"
      elsif ['ח','ע'].include?(root[2])
        destination_hash[:mas_sing_pres] = "#{root[0]}ו" + "#{root[1]}ֵ#{root[2]}ַ"
        destination_hash[:fem_sing_pres] = "#{root[0]}ו" + "#{root[1]}ַ#{root[2]}ַ" + "ת"
        destination_hash[:mas_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ְ#{root[2]}ִ" + "ים"
        destination_hash[:fem_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ְ#{root[2]}ות"
      else
        destination_hash[:mas_sing_pres] = "#{root[0]}ו" + "#{root[1]}ֵ#{root[2]}"
        destination_hash[:fem_sing_pres] = "#{root[0]}ו" + "#{root[1]}ֶ#{root[2]}ֶ" + "ת"
        destination_hash[:mas_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ְ#{root[2]}ִ" + "ים"
        destination_hash[:fem_plu_pres]  = "#{root[0]}ו" + "#{root[1]}ְ#{root[2]}ות"
      end
  end

  def conjugate_paal_past(past_base)
    if ['ו','י'].include?(root[1])
      hebrew_verb[:me_past] = hebrew_verb[:past_base] + "תִי"
      hebrew_verb[:you_mas_sing_past] = hebrew_verb[:past_base] + "תָ"
      hebrew_verb[:you_fem_sing_past] = hebrew_verb[:past_base]  + "תְ"
      hebrew_verb[:we_past] = hebrew_verb[:past_base] + "נוּ"
      hebrew_verb[:you_mas_plu_past] = hebrew_verb[:past_base]  + "תֵם"
      hebrew_verb[:you_fem_plu_past] = hebrew_verb[:past_base]  + "תֵן"
      hebrew_verb[:he_past] = hebrew_verb[:past_base]
      hebrew_verb[:she_past] = hebrew_verb[:past_base] + "ָה"
      hebrew_verb[:they_past] = hebrew_verb[:past_base] + "וּ"
    elsif ['א'].include?(root[2])
      hebrew_verb[:me_past] = hebrew_verb[:past_base]  + "תִי"
      hebrew_verb[:you_mas_sing_past] = hebrew_verb[:past_base] + "תָ"
      hebrew_verb[:you_fem_sing_past] = hebrew_verb[:past_base]  + "תְ"
      hebrew_verb[:we_past] = hebrew_verb[:past_base]  + "נוּ"
      hebrew_verb[:you_mas_plu_past] = hebrew_verb[:past_base]  + "תֵם"
      hebrew_verb[:you_fem_plu_past] = hebrew_verb[:past_base]  + "תֵן"
      hebrew_verb[:he_past] = hebrew_verb[:past_base]
      hebrew_verb[:she_past] = "#{root[0]}ָ" + "#{root[1]}ְ" + "אָה"
      hebrew_verb[:they_past] = "#{root[0]}ָ" + "#{root[1]}" + "וּ"
    elsif ['ה'].include?(root[2])
      hebrew_verb[:me_past] = hebrew_verb[:past_base] + "יתִי"
      hebrew_verb[:you_mas_sing_past] = hebrew_verb[:past_base] + "יתָ"
      hebrew_verb[:you_fem_sing_past] = hebrew_verb[:past_base] + "יתְ"
      hebrew_verb[:we_past] = hebrew_verb[:past_base] + "ינוּ"
      hebrew_verb[:you_mas_plu_past] = hebrew_verb[:past_base] + "יתֵם"
      hebrew_verb[:you_fem_plu_past] = hebrew_verb[:past_base]  + "יתֵן"
      hebrew_verb[:he_past] = "#{root[0]}ָ#{root[1]}ָ#{root[2]}"
      if !['א'].include?(root[1])
        hebrew_verb[:she_past] = "#{root[0]}ָ#{root[1]}ְ" + "תָה"
      else
        hebrew_verb[:she_past] = "#{root[0]}ָאֲתָה"
      end
      hebrew_verb[:they_past] = "#{root[0]}ָ#{root[1]}וּ"
    else #['ד','ת','ט'].include?(root[2])
      hebrew_verb[:me_past] = hebrew_verb[:past_base]  + "ְתִי"
      hebrew_verb[:you_mas_sing_past] = hebrew_verb[:past_base]  + "ְתָ"
      hebrew_verb[:you_fem_sing_past] = hebrew_verb[:past_base]  + "ְתְ"
      hebrew_verb[:we_past] = hebrew_verb[:past_base]  + "ְנוּ"
      hebrew_verb[:you_mas_plu_past] = hebrew_verb[:past_base]  + "ְתֵם"
      hebrew_verb[:you_fem_plu_past] = hebrew_verb[:past_base]  + "ְתֵן"
      hebrew_verb[:he_past] = hebrew_verb[:past_base]
      hebrew_verb[:she_past] = "#{root[0]}ָ#{root[1]}ְ#{root[2]}ָ" + "ה"
      hebrew_verb[:they_past] = "#{root[0]}ָ#{root[1]}ְ#{root[2]}וּ"
    end
  end

  def get_infinitive_future_base(root)
    hebrew_verb[:infinitive] = "לִ" + "#{root[0]}ְ#{root[1]}ו" + "#{root[2]}"
    if ['ו','י'].include?(root[1])
      hebrew_verb[:infinitive] = "לָ" + "#{root[0]}" + "#{root[1]}" + "#{root[2]}"
    elsif ['ח','ע'].include?(root[0])
      if ['ה'].include?(root[2])
        hebrew_verb[:infinitive] = "לַ" + "#{root[0]}ֲ#{root[1]}" + "ות"
      else
        hebrew_verb[:infinitive] = "לַ" + "#{root[0]}ְ#{root[1]}ו" + "#{root[2]}"
      end
    elsif ['א'].include?(root[2])
      hebrew_verb[:infinitive] = "לִ" + "#{root[0]}ְ" + "#{root[1]}וא"
    elsif ['ה'].include?(root[2])
      hebrew_verb[:infinitive] = "לִ" + "#{root[0]}ְ#{root[1]}" + "ות"
    elsif ['א'].include?(root[0])
      hebrew_verb[:infinitive] = "לֶ" + "אֱ#{root[1]}ו" + "#{root[2]}"
    elsif ['י','ה'].include?(root[0])
      hebrew_verb[:infinitive] = "לָ" + "#{root[1]}ֶ" + "#{root[2]}ֶת"
      hebrew_verb[:fut_base] =  "#{root[1]}ֵ" + "#{root[2]}"
    elsif ['י'].include?(root[0]) && ['ח','ע'].include?(root[2])
      hebrew_verb[:infinitive] = "לָ" + "#{root[1]}ַ" + "#{root[2]}ַת"
      hebrew_verb[:fut_base] = "#{root[1]}ַ" + "#{root[2]}"
    elsif ['ע','ח'].include?(root[2])
      hebrew_verb[:infinitive] = "לִ" + "#{root[0]}ְ#{root[1]}ו" + "#{root[2]}ַ"
      hebrew_verb[:fut_base] = "#{root[0]}ְ" + "#{root[1]}ַ" + "#{root[2]}"
    end
  end

  def conjugate_paal_future(infinitive, future_base)
    verb_exceptions = ['לִלְמוד','לִגְדול','לִלְבוש']
    infinitive_base = infinitive.delete(infinitive[0..1])

    if verb_exceptions.include?(infinitive)
      case infinitive
        when 'לִלְבוש'
           infinitive_base = 'לְבַש'
        when 'לִגְדול'
          infinitive_base = 'גְדַל'
        when 'לִלְמוד'
          infinitive_base = 'לְמַד'
      end
    end

    if ['ו','י'].include?(@root[1])
      hebrew_verb[:me_fut] = "אְַ" + infinitive_base
      hebrew_verb[:you_mas_sing_she_fut] = "תַ" + infinitive_base
      hebrew_verb[:he_fut] = "יַ" + infinitive_base
      hebrew_verb[:we_fut] = "נַ" + infinitive_base
      hebrew_verb[:you_fem_sing_fut] = "תַ" + infinitive_base + "ִי"
      hebrew_verb[:you_plu_fut] = "תַ" + infinitive_base + "וּ"
      hebrew_verb[:they_fut] = "יַ" + infinitive_base + "וּ"
    elsif ['ח','ע'].include?(@root[0])
      if ['ה'].include?(@root[2])
        hebrew_verb[:me_fut] = "אֶ" + "#{@root[0]}ֱ#{@root[1]}ֶ" + "#{@root[2]}"
        hebrew_verb[:you_mas_sing_she_fut] = "תַ" + "#{@root[0]}ֲ#{@root[1]}ֶ#{@root[2]}"
        hebrew_verb[:he_fut] = "יַ" + "#{@root[0]}ֲ#{@root[1]}ֶ#{@root[2]}"
        hebrew_verb[:we_fut] = "נַ" + "#{@root[0]}ֲ#{@root[1]}ֶ#{@root[2]}"
        hebrew_verb[:you_fem_sing_fut] = "תַ" + "#{@root[0]}ַ#{@root[1]}ִי"
        hebrew_verb[:you_plu_fut] = "תַ" + "#{@root[0]}ַ#{@root[1]}וּ"
        hebrew_verb[:they_fut] = "יַ" + "#{@root[0]}ַ#{@root[1]}וּ"
      else
        hebrew_verb[:me_fut] = "אֶ" + "#{@root[0]}ֱ#{@root[1]}ו" + "#{@root[2]}"
        hebrew_verb[:you_mas_sing_she_fut] = "תַ" + "#{@root[0]}ֲ#{@root[1]}ו#{@root[2]}"
        hebrew_verb[:he_fut] = "יַ" + "#{@root[0]}ֲ#{@root[1]}ו#{@root[2]}"
        hebrew_verb[:we_fut] = "נַ" + "#{@root[0]}ֲ#{@root[1]}ו#{@root[2]}"
        hebrew_verb[:you_fem_sing_fut] = "תַ" + "#{@root[0]}ַ#{@root[1]}ְ#{@root[2]}ִי"
        hebrew_verb[:you_plu_fut] = "תַ" + "#{@root[0]}ַ#{@root[1]}ְ#{@root[2]}וּ"
        hebrew_verb[:they_fut] = "יַ" + "#{@root[0]}ַ#{@root[1]}ְ#{@root[2]}וּ"
      end
    elsif ['ה'].include?(@root[2])
      hebrew_verb[:me_fut] = "אֶ" + "#{@root[0]}ְ#{@root[1]}ֶ" + "#{@root[2]}"
      hebrew_verb[:you_mas_sing_she_fut] = "תִ" + "#{@root[0]}ְ#{@root[1]}ֶ#{@root[2]}"
      hebrew_verb[:he_fut] = "יִ" + "#{@root[0]}ְ#{@root[1]}ֶ#{@root[2]}"
      hebrew_verb[:we_fut] = "נִ" + "#{@root[0]}ְ#{@root[1]}ֶ#{@root[2]}"
      hebrew_verb[:you_fem_sing_fut] = "תִ" + "#{@root[0]}ְ#{@root[1]}ִי"
      hebrew_verb[:you_plu_fut] = "תִ" + "#{@root[0]}ְ#{@root[1]}וּ"
      hebrew_verb[:they_fut] = "יִ" + "#{@root[0]}ְ#{@root[1]}וּ"
    elsif ['א'].include?(@root[0])
      hebrew_verb[:me_fut] = "אֹ" + "#{@root[1]}ָ" + "#{@root[2]}"
      hebrew_verb[:you_mas_sing_she_fut] = "תֹ" + "#{@root[1]}ָ#{@root[2]}"
      hebrew_verb[:he_fut] = "יֹ" + "#{@root[1]}ָ#{@root[2]}"
      hebrew_verb[:we_fut] = "נֹ" + "#{@root[1]}ָ#{@root[2]}"
      hebrew_verb[:you_fem_sing_fut] = "תֹ" + "#{@root[1]}ְ#{@root[2]}ִי"
      hebrew_verb[:you_plu_fut] = "תֹ" + "#{@root[1]}ְ#{@root[2]}וּ"
      hebrew_verb[:they_fut] = "יֹ" + "#{@root[1]}ְ#{@root[2]}וּ"
      if ['ה'].include?(@root[1])
        hebrew_verb[:you_fem_sing_fut] = "תֹ" + "#{@root[1]}ֲ#{@root[2]}ִי"
        hebrew_verb[:you_plu_fut] = "תֹ" + "#{@root[1]}ֲ#{@root[2]}וּ"
        hebrew_verb[:they_fut] = "יֹ" + "#{@root[1]}ֲ#{@root[2]}וּ"
      end
    elsif ['א'].include?(@root[2])
      hebrew_verb[:me_fut] = "אֶ" + "#{@root[0]}ְ#{@root[1]}ָא"
      hebrew_verb[:you_mas_sing_she_fut] = "תִ" + "#{@root[0]}ְ#{@root[1]}ָא"
      hebrew_verb[:he_fut] = "יִ" + "#{@root[0]}ְ#{@root[1]}ָא"
      hebrew_verb[:we_fut] = "נִ" + "#{@root[0]}ְ#{@root[1]}ָא"
      hebrew_verb[:you_fem_sing_fut] = "תִ" + "#{@root[0]}ְ#{@root[1]}אִי"
      hebrew_verb[:you_plu_fut] = "תִ" + "#{@root[0]}ְ#{@root[1]}אוּ"
      hebrew_verb[:they_fut] = "יִ" + "#{@root[0]}ְ#{@root[1]}אוּ"
    elsif ['ה','ע','ח','א'].include?(@root[1])
      hebrew_verb[:me_fut] = "אֶ" + "#{@root[0]}ְ" + "#{@root[1]}ַ#{@root[2]}"
      hebrew_verb[:you_mas_sing_she_fut] = "תִ" + "#{@root[0]}ְ" + "#{@root[1]}ַ#{@root[2]}"
      hebrew_verb[:he_fut] = "יִ" + "#{@root[0]}ְ" + "#{@root[1]}ַ#{@root[2]}"
      hebrew_verb[:we_fut] = "נִ" + "#{@root[0]}ְ" + "#{@root[1]}ַ#{@root[2]}"
      hebrew_verb[:you_fem_sing_fut] = "תִ"  + "#{@root[0]}ַ" + "#{@root[1]}ֲ#{@root[2]}ִי"
      hebrew_verb[:you_plu_fut] = "תִ"  + "#{@root[0]}ַ" + "#{@root[1]}ֲ#{@root[2]}וּ"
      hebrew_verb[:they_fut] = "יִ"  + "#{@root[0]}ַ" + "#{@root[1]}ֲ#{@root[2]}וּ"
    elsif ['י','ה'].include?(@root[0])
      hebrew_verb[:me_fut] = "אֵ" + fut_base
      hebrew_verb[:you_mas_sing_she_fut] = "תֵ" + fut_base
      hebrew_verb[:he_fut] = "יֵ"  + fut_base
      hebrew_verb[:we_fut] = "נֵ"  + fut_base
      hebrew_verb[:you_fem_sing_fut] = "תֵ" + "#{@root[1]}ְ#{@root[2]}" + 'ִי'
      hebrew_verb[:you_plu_fut] = "תֵ" + "#{@root[1]}ְ#{@root[2]}"  + 'וּ'
      hebrew_verb[:they_fut] = "יֵ" + "#{@root[1]}ְ#{@root[2]}"  + 'וּ'
    else
      if ['ח','ע'].include?(@root[2])
        infinitive_base = fut_base
      end
      hebrew_verb[:me_fut] = "אֶ" + infinitive_base
      hebrew_verb[:you_mas_sing_she_fut] = "תִ" + infinitive_base
      hebrew_verb[:he_fut] = "יִ" + infinitive_base
      hebrew_verb[:we_fut] = "נִ" + infinitive_base
      hebrew_verb[:you_fem_sing_fut] = "תִ" + "#{@root[0]}ְ#{@root[1]}ְ#{@root[2]}ִי"
      hebrew_verb[:you_plu_fut] = "תִ" + "#{@root[0]}ְ#{@root[1]}ְ#{@root[2]}וּ"
      hebrew_verb[:they_fut] = "יִ" + "#{@root[0]}ְ#{@root[1]}ְ#{@root[2]}וּ"

    end
    ## IMPERATIVE
    #hebrew_verb = paal_imperative(hebrew_verb,@root)
    @size_mas = hebrew_verb[:you_mas_sing_she_fut].size - 1
    @size_fem = hebrew_verb[:you_fem_sing_fut].size - 1
    @size_plu = hebrew_verb[:you_plu_fut].size - 1

    if !['ו','י'].include?(@root[1])
      hebrew_verb[:mas_imp] = hebrew_verb[:you_mas_sing_she_fut][2..@size_mas]

    else
      hebrew_verb[:mas_imp] = hebrew_verb[:you_mas_sing_she_fut][2..@size_mas]
      hebrew_verb[:fem_imp] = hebrew_verb[:you_fem_sing_fut][2..@size_fem]
      hebrew_verb[:plural_imp] = hebrew_verb[:you_plu_fut][2..@size_plu]
    end

    hebrew_verb.each do |key,value|
      case hebrew_verb[key][hebrew_verb[key].size - 1]
        when 'כ'
          hebrew_verb[key][hebrew_verb[key].size - 1] = 'ך'
        when 'מ'
          hebrew_verb[key][hebrew_verb[key].size - 1] = 'ם'
        when 'צ'
          hebrew_verb[key][hebrew_verb[key].size - 1] = 'ץ'
      end
    end

  end


  # def paypal_btn_html
  #   html = "<form action="https://www.paypal.com/cgi-bin/webscr" method="post">"
  #   html += "<input type="hidden" name="cmd" value="_s-xclick">"
  #   html += "<input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----
  #   html += ">"
  #   html += "<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">"
  #   html += "<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">"
  #   html += "</form>"

  # end

end
