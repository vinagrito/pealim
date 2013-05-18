# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# Letter.find_or_create_by_name(:name => "א", :num_value => 1)
# Letter.find_or_create_by_name(:name => "ב", :num_value => 2)
# Letter.find_or_create_by_name(:name => "ג", :num_value => 3)
# Letter.find_or_create_by_name(:name => "ד", :num_value => 4)
# Letter.find_or_create_by_name(:name => "ה", :num_value => 5)
# Letter.find_or_create_by_name(:name => "ו", :num_value => 6)
# Letter.find_or_create_by_name(:name => "ז", :num_value => 7)
# Letter.find_or_create_by_name(:name => "ח", :num_value => 8)
# Letter.find_or_create_by_name(:name => "ט", :num_value => 9)
# Letter.find_or_create_by_name(:name => "י", :num_value => 10)
# Letter.find_or_create_by_name(:name => "כ", :num_value => 20)
# Letter.find_or_create_by_name(:name => "ך", :num_value => 500)
# Letter.find_or_create_by_name(:name => "ל", :num_value => 30)
# Letter.find_or_create_by_name(:name => "מ", :num_value => 40)
# Letter.find_or_create_by_name(:name => "ם", :num_value => 600)
# Letter.find_or_create_by_name(:name => "נ", :num_value => 50)
# Letter.find_or_create_by_name(:name => "ן", :num_value => 700)
# Letter.find_or_create_by_name(:name => "ס", :num_value => 60)
# Letter.find_or_create_by_name(:name => "ע", :num_value => 70)
# Letter.find_or_create_by_name(:name => "פ", :num_value => 80)
# Letter.find_or_create_by_name(:name => "ף", :num_value => 800)
# Letter.find_or_create_by_name(:name => "צ", :num_value => 90)
# Letter.find_or_create_by_name(:name => "ץ", :num_value => 900)
# Letter.find_or_create_by_name(:name => "ק", :num_value => 100)
# Letter.find_or_create_by_name(:name => "ר", :num_value => 200)
# Letter.find_or_create_by_name(:name => "ש", :num_value => 300)
# Letter.find_or_create_by_name(:name => "ת", :num_value => 400)

# puts "ABC created."

# ['פָעַל','פִיעֵל','הִפְעִיל','הִתְפַעֵל','נִפְעַל','פועַל','הופְעַל'].each do |building|
#   Building.find_or_create_by_name(:name => building)
# end

# puts "buildings created."


# [
#  ["Live", "Жить", "Vivir"],["Study", "Учиться", "Estudiar"],
[
  ["Work", "Работать", "Trabajar", ["ע","ב","ד"]],["Come", "Приходить/Наступать", "Venir", ["ב","ו","א"]],
  ["Want", "Хотеть", "Querer",["ר","צ","ה"]],["Love", "Любить", "Amar", ["א","ה","ב"]],
  ["Say (paal)", "Сказать (пааль)", "Decir (paal)", ["א","מ","ר"]],["Sing", "Петь", "Cantar", ["ש","י","ר"]],
  ["Think", "Думать", "Pensar", ["ח","ש","ב"]],["Write", "Писать", "Escribir", ["כ","ת","ב"]],
  ["Do", "Делать", "Hacer", ["ע","ש","ה"]],["Walk/Leave", "Идти/Уходить", "Caminar/Irse", ["ה","ל","כ"]],
  ["Sit", "Сидеть", "Sentarse", ["י","ש","ב"]],["Buy", "Покупать", "Comprar", ["ק","נ","ה"]],
  ["Ask", "Спрашивать", "Preguntar", ["ש","א","ל"]],["Answer", "Отвечать", "Contestar", ["ע","נ","ה"]],
  ["Eat", "Кушать", "Comer", ["א","כ","ל"]],["Dance", "Танцевать", "Bailar", ["ר","ק","ד"]],
  ["Drink", "Пить", "Tomar", ["ש","ת","ה"]],["Meet (Find)", "Встречать", "Recibir (A alguien)", ["פ","ג","ש"]],
  ["Hate", "Ненавидеть", "Odiar", ["ש","נ","א"]],["Read/Call/Name", "Читать/Звать/Называть", "Leer/Nombrar", ["ק","ר","א"]],
  ["Stand up/Arise", "Вставать/Возрождаться", "Levantarse", ["ק","ו","מ"]],
  ["Move(To a place)/Pass/Cross","Переежать/Проходить/Переходить","Mudarse/Pasar/Cruzar", ["ע","ב","ר"]],
  ["Cost/Ascend/Emigrate to Israel", "Стоить/Подниматься/Эмигрировать в Израиль", "Costar, Subir, Emigrar a Israel", ["ע","ל","ה"]],
  ["Stand", "Стоять", "Estar de pie", ["ע","מ","ד"]],["Open", "Открывать", "Abrir", ["פ","ת","ח"]],
  ["See", "Видеть", "Mirar", ["ר","א","ה"]],["Rent(Hire)", "Снимать", "Arrendar(Tomar en arriendo)", ["ש","כ","ר"]],
  ["Hear", "Слышать", "Oir", ["ש","מ","ע"]],["Put", "Класть/Положить", "Colocar", ["ש","י","מ"]],["Grow", "Ростить", "Crecer", ["ג","ד","ל"]],
  ["Descend/Emigrate from Israel", "Спускаться/Эмигрировать из Израиля", "Bajar/Emigrar de Israel", ["י","ר","ד"]],
  ["Go/Ride", "Ехать/Ездить", "Ir/viajar",["נ","ס","ע"]]
].each do |verb|
  begin
    conditions = { :english => verb[0], :russian => verb[1], :spanish => verb[2] }

    new_verb = Verb.find(:first, :conditions => conditions) || Verb.create(conditions.merge!({reviewed: false}))
    root_1, root_2, root_3 = [verb[3][0], verb[3][1], verb[3][2]].map {|letter| Letter.find_by_name(letter).id}

    hebrew_verb = {verb_id: new_verb.id, building_id: 1}
    hebrew_verb.merge! Conjugations::Paal.conjugate_paal({root_1: root_1, root_2: root_2, root_3: root_3})
    hebrew_verb = HebrewVerb.create(hebrew_verb)

  rescue => exception
    puts exception.message
  end
end

puts "Small verbs list created!."



puts "seed done!."