# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Letter.find_or_create_by_name(:name => "א", :num_value => 1)
Letter.find_or_create_by_name(:name => "ב", :num_value => 2)
Letter.find_or_create_by_name(:name => "ג", :num_value => 3)
Letter.find_or_create_by_name(:name => "ד", :num_value => 4)
Letter.find_or_create_by_name(:name => "ה", :num_value => 5)
Letter.find_or_create_by_name(:name => "ו", :num_value => 6)
Letter.find_or_create_by_name(:name => "ז", :num_value => 7)
Letter.find_or_create_by_name(:name => "ח", :num_value => 8)
Letter.find_or_create_by_name(:name => "ט", :num_value => 9)
Letter.find_or_create_by_name(:name => "י", :num_value => 10)
Letter.find_or_create_by_name(:name => "כ", :num_value => 20)
Letter.find_or_create_by_name(:name => "ך", :num_value => 500)
Letter.find_or_create_by_name(:name => "ל", :num_value => 30)
Letter.find_or_create_by_name(:name => "מ", :num_value => 40)
Letter.find_or_create_by_name(:name => "ם", :num_value => 600)
Letter.find_or_create_by_name(:name => "נ", :num_value => 50)
Letter.find_or_create_by_name(:name => "ן", :num_value => 700)
Letter.find_or_create_by_name(:name => "ס", :num_value => 60)
Letter.find_or_create_by_name(:name => "ע", :num_value => 70)
Letter.find_or_create_by_name(:name => "פ", :num_value => 80)
Letter.find_or_create_by_name(:name => "ף", :num_value => 800)
Letter.find_or_create_by_name(:name => "צ", :num_value => 90)
Letter.find_or_create_by_name(:name => "ץ", :num_value => 900)
Letter.find_or_create_by_name(:name => "ק", :num_value => 100)
Letter.find_or_create_by_name(:name => "ר", :num_value => 200)
Letter.find_or_create_by_name(:name => "ש", :num_value => 300)
Letter.find_or_create_by_name(:name => "ת", :num_value => 400)

puts "ABC created."

['פָעַל','פִיעֵל','הִפְעִיל','הִתְפַעֵל','נִפְעַל','פועַל','הופְעַל'].each do |building|
  Building.find_or_create_by_name(:name => building)
end

puts "buildings created."

# [
#  ["Live", "Жить", "Vivir"],["Study", "Учиться", "Estudiar"],
#  ["Work", "Работать", "Trabajar"],["Come", "Приходить/Наступать", "Venir"],
#  ["Want", "Хотеть", "Querer"],["Love", "Любить", "Amar"],
#  ["Say - 1", "Сказать - 1", "Decir - 1"],["Sing", "Петь", "Cantar"],
#  ["Think", "Думать", "Pensar"],["Write", "Писать", "Escribir"],
#  ["Do", "Делать", "Hacer"],["Walk/Leave", "Идти/Уходить", "Caminar/Irse"],
#  ["Sit", "Сидеть", "Sentarse"],["Buy", "Покупать", "Comprar"],
#  ["Ask", "Спрашивать", "Preguntar"],["Answer", "Отвечать", "Contestar"],
#  ["Eat", "Кушать", "Comer"],["Dance", "Танцевать", "Bailar"],
#  ["Drink", "Пить", "Tomar"],["Meet (Find)", "Встречать", "Recibir (A alguien)"],
#  ["Hate", "Ненавидеть", "Odiar"],["Read/Call/Name", "Читать/Звать/Называть", "Leer/Nombrar"],
#  ["Stand up/Arise", "Вставать/Возрождаться", "Levantarse"],
#  ["Move(To a place)/Pass/Cross","Переежать/Проходить/Переходить","Mudarse/Pasar/Cruzar"],
#  ["Cost/Ascend/Emigrate to Israel", "Стоить/Подниматься/Эмигрировать в Израиль", "Costar, Subir, Emigrar a Israel"],
#  ["Stand", "Стоять", "Estar de pie"],["Open", "Открывать", "Abrir"],
#  ["See", "Видеть", "Mirar"],["Rent(Hire)", "Снимать", "Arrendar(Tomar en arriendo)"],
#  ["Hear", "Слышать", "Oir"],["Put", "Класть/Положить", "Colocar"],["Grow", "Ростить", "Crecer"],
#  ["Descend/Emigrate from Israel", "Спускаться/Эмигрировать из Израиля", "Bajar/Emigrar de Israel"]
# ].each do |verb|
#   conditions = { :english => verb[0], :russian => verb[1], :spanish => verb[2] }

#   v = Verb.find(:first, :conditions => conditions) || Verb.create(conditions)
# end

# puts "vebs infinitives created."



puts "seed done!."