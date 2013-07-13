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


[
  ["Live", "Жить", "Vivir", ["ב", "ו", "א"]],["Study", "Учиться", "Estudiar", ["ל", "מ", "ד"]],
  ["Work", "Работать", "Trabajar", ["ע","ב","ד"]],["Come", "Приходить/Наступать", "Venir", ["ב","ו","א"]],
  ["Want", "Хотеть", "Querer",["ר","צ","ה"]],["Love", "Любить", "Amar", ["א","ה","ב"]],
  ["Say (paal)", "Сказать (пааль)", "Decir (paal)", ["א","מ","ר"]],["Sing", "Петь", "Cantar", ["ש","י","ר"]],
  ["Think", "Думать", "Pensar", ["ח","ש","ב"]],["Write", "Писать", "Escribir", ["כ","ת","ב"]],
  ["Do", "Делать", "Hacer", ["ע","ש","ה"]],
  ["Buy", "Покупать", "Comprar", ["ק","נ","ה"]],
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
  ["Finish", "Заканчивать/Кончать", "Terminar", ["ג","מ","ר"]],
  ["Steal", "Воровать/Красть", "Robar", ["ג", "נ", "ב"]],
  ["Cause", "Причинить", "Causar", ["ג", "ר", "מ"]],
  ["Run over", "Переехать/Разадавить", "Atropellar", ["ד", "ר", "ס"]],
  ["Demand/Require", "Требовать", "Demandar/Exigir", ["ד", "ר", "ש"]],
  ["Throw", "Бросать", "Lanzar/Tirar", ["ז", "ר", "ק"]],
  ["Measure", "Мерить", "Medir", ["מ", "ד", "ד"]],
  ["Pour/Decant", "Наливать", "Demarrar/Servir", ["מ", "ז", "ג"]],
  ["Hand over", "Передать", "Dar-2", ["מ", "ס", "ר"]],
  ["Protest", "Восставать", "Protestar", ["מ", "ר", "ד"]],
  ["Atract/Withdraw", "Тянуть/Снимать деньги", "Atraer/Retirar dinero", ["מ", "ש", "כ"]],
  ["Close", "Закрыть", "Cerrar", ["ס", "ג", "ר"]],
  ["Register/Record/Right down", "Записывать", "Registrar/anotar", ["ר", "ש", "מ"] ],
  ["Rob/Steal", "Грабить", "Robar", ["ש", "ד", "ד"] ],
  ["Wash away", "Смывать", "Limpiar", ["ש", "ט", "פ"] ],
  ["Control/Command/Rule", "Править/Владеть/Господствовать", "Controlar/Mandar", ["ש", "ל", "ט"] ],
  ["Deny/Deprive", "Отрицать/Лишать", "Negar/Privar", ["ש", "ל", "ל"] ],
  ["Keep/Reserve/Preserve", "Сторожить/Беречь/Соблюдать", "Mantener/Cuidar", ["ש", "מ", "ר"] ],
  ["Weigh/Balance/Consider", "Взвешивать", "Pesar/Sopesar", ["ש", "ק", "ל"] ],
  ["Set in fire", "Сжигать", "Quemar", ["ש", "ר", "פ"] ],
  ["Plant/Implant", "Сажать", "Plantar/Implantar", ["ש", "ת", "ל"] ],
  ["Shut up/Be silent", "Молчать", "Callar", ["ש", "ת", "ק"] ],
  ["Support", "Поддерживать", "Apoyar", ["ת", "מ", "כ"] ],
  ["Attack/Assault", "Нападать/Атаковать", "Atacar/Asaltar", ["ת", "ק", "פ"] ],
  ["Contribute/Donate", "Жертвовать/Делать взнос", "Donar/Contribuir", ["ת", "ר", "מ"] ],
  ["Check/Test", "Проверять", "Revisar/Comprobar", ["ב", "ד", "ק"] ],
  ["Betray/Cheat", "Изменять/Предавать", "Engañar/Traicionar", ["ב", "ג", "ד"] ],
  ["Stop/Hold back", "Тормозить", "Detener/frenar", ["ב", "ל", "מ"] ],
  ["Include/Contain", "Включать/Содержать", "Incluir/Contener", ["כ", "ל", "ל"] ],
  ["Disqualify/Reject/Rule out", "Браковать/Признавать непригодным", "Descalificar/Descartar", ["פ", "ס", "ל"] ],
  # [ "Burst/Erupt", "Врываться/Проламывать/Вспыхнуть", "", ["פ", "ר", "צ"] ],
  ["Solve/Resolve", "Решать/Отгадывать", "Resolver", ["פ", "ת", "ר"] ],
  ["Suffer/Stand/Tolerate", "Страдать/Терпеть/Переносить", "Padecer/Aguantar/Soportar", ["ס", "ב", "ל"] ],
  # [ "Knock/Screw", "Стучать/Ударять", "", ["ד", "פ", "ק"] ],
  ["Remember", "Помнить", "Recordar", ["ז", "כ", "ר"] ],
  ["Count", "Считать", "Contar", ["ס", "פ", "ר"] ],
  ["Bury", "Хоронить", "Enterrar", ["ק", "ב", "ר"] ],
  ["Purchase/Acquire", "Приобретать", "Adquirir", ["ר", "כ", "ש"] ],
  ["Break/Destroy", "Ломать/Разбивать", "Romper/Destruir", ["ש", "ב", "ר"] ],
  ["Judge", "Судить/Приговаривать", "Juzgar/Sentenciar", ["ש", "פ", "ט"] ],
  ["Spill/Shed", "Выливать/Проливать", "Derramar", ["ש", "פ", "כ"] ],
  ["Catch/Grab/Grasp", "Схватить/Поймать", "Coger/Atrapar", ["ת", "פ", "ס"] ],
  ["Sew/Stitch", "Шить", "Coser", ["ת", "פ", "ר"] ],
  ["Conquer/Occupy", "Завоёвывать/Захватывать", "Conquistar/Ocupar", ["כ", "ב", "ש"] ],
  ["Hide", "Прятать/Скрывать", "Esconder", ["ט", "מ", "נ"] ],
  ["Wear/Put on", "Надевать", "Vestir/Llevar puesto", ["ל", "ב", "ש"] ],
  ["Lie down", "Лежать", "Estar acostado", ["ש", "כ", "ב"] ],
  ["Shine/Radiate", "Сиять/Лучиться", "Brillar/Irradiar", ["ק", "ר", "נ"] ],
  ["Stick/Adhere", "Прилипать/Приклеиваться", "Pegar/Adherir", ["ד", "ב", "ק"] ],
  # Next case
  ["Penetrate/infiltrate", "Проникать", "Penetrar/Infiltrar", ["ח", "ד", "ר"] ],
  ["Return/Go back", "Возвращаться/Повторять", "Volver/Devolverse", ["ח", "ז", "ר"] ],
  ["Dream", "Сниться/Мечтать", "Soñar", ["ח", "ל", "מ"] ],
  ["Slip/Avoid", "Ускользать/Увиливать", "Escabullir/Evadir", ["ח", "מ", "ק"] ],
  ["Save/Economize", "Экономить/Сберегать", "Ahorrar/Guardar", ["ח", "ס", "כ"] ],
  ["Block", "Загораживать", "Obstruir", ["ח", "ס", "מ"] ],
  ["Explore/Research", "Исследовать/Расследовать", "Investigar", ["ח", "ק", "ר"] ],
  ["Suspect", "Подозревать", "Sospechar", ["ח", "ש", "ד"] ],
  ["Expose/Uncover/Unveil", "Подвергать/Обножать/Оголять", "Exponer/Desnudar", ["ח", "ש", "פ"] ],
  ["Fear", "Опасаться/Беспокоиться", "", ["ח", "ש", "ש"] ],
  ["Cut", "Резать", "Cortar", ["ח", "ת", "כ"] ],
  ["Sign", "Подписывать", "Firmar", ["ח", "ת", "מ"] ],
  ["Dig/Trench", "Рыть/Копать", "Cavar", ["ח", "פ", "ר"] ],
  ["Wish/Desire", "Желать", "Desear/Anhelar", ["ח", "פ", "צ"] ],
  ["Celebrate", "Праздновать", "Celebrar", ["ח", "ג", "ג"] ],
  ["Pardon/Forgive", "Помиловать/Одаривать", "Perdonar", ["ח", "נ", "נ"] ],
  ["Dread/Be anxious", "Тревожиться/Страшиться", "Estar atemorizado", ["ח", "ר", "ד"] ],
  ["Cease/Desist", "Переставать/Прекращаться", "Suspender", ["ח", "ד", "ל"] ],
  ["Lack/Decrease", "Недоставать/Отсутствовать", "Hacer falta", ["ח", "ס", "ר"] ],
  # Next case
  ["Repel/Fight off", "Оттеснять/Отталкивать", "Repeler", ["ה", "ד", "פ"] ],
  ["Suit", "Подходить/Быть к лицу", "Lucir", ["ה", "ל", "מ"] ],
  ["Turn/Reverse", "Переворачивать/Перемешивать/Становиться(кем-л)", "Voltear/Mezclar", ["ה", "פ", "כ"] ],
  ["Kill", "Убивать", "Matar", ["ה", "ר", "ג"] ],
  ["Destroy", "Разрушать", "Destruir", ["ה", "ר", "ס"] ],
  ["Leave/Depart", "Оставлять/Покидать", "Dejar", ["ע", "ז", "ב"] ],
  ["Help", "Помогать", "Ayudar", ["ע", "ז", "ר"] ],
  ["Stop", "Останавливать", "Detener", ["ע", "צ", "ר"] ],
  ["Follow", "Следить", "Seguir", ["ע", "ק", "ב"] ],
  ["Displace/Uproot/Eradicate", "Вытеснять/Вырывать/Искоренять", "Desplazar/Erradicar/Expulsar", ["ע", "ק", "ר"] ],
  ["Redact", "Редактировать/Составлять", "Redactar", ["ע", "ר", "כ"] ],
  ["Labor/Make effort", "Трудиться", "Laborar/Esforzarse", ["ע", "מ", "ל"] ],
  # Next case
  ["Collect/Gather", "Собирать", "Recoger", ["א", "ס", "פ"] ],
  ["Estimate", "Оценивать", "Estimar", ["א", "מ", "ד"] ],
  ["Rape", "Изнасиловать", "Violar", ["א", "נ", "ס"] ],
  ["Ban/Arrest", "Арестовывать/Запрешать", "Arrestar/Prohibir", ["א", "ס", "ר"] ],
  ["Sympathize", "Симпатизировать/Сочувствовать", "Simpatizar", ["א", "ה", "ד"] ],
  ["Be lost", "Пропадать/Теряться", "Perderse", ["א", "ב", "ד"] ],
  ["Hold/Grasp", "Держать/Хватать", "Sostener/Mantener/Agarrar", ["א", "ח", "ז"] ],
  ["Diminish/Run out", "Расходиться/Кончаться", "Disminuir/Terminarse", ["א", "ז", "ל"] ],
  # Next case
  ["Create", "Создавать/Творить", "Crear", ["י", "צ", "ר"]],
  ["Spit", "Плевать", "Escupir", ["י", "ר", "ק"]],
  ["Inherit", "Наследовать", "Heredar", ["י", "ר", "ש"]],
  ["Inititate", "Предпринимать/Проявлять инициативу", "Iniciar/Mostrar iniciativa",  ["י", "ז", "מ"]],
  ["Sleep", "Спать", "Dormir", ["י", "ש", "נ"]],
  # ["Advise", "Советовать", "Asesorar/Aconsejar", ["י", "ע", "צ"]],
  ["Come out/Exit", "Выходить", "Salir", ["י", "צ", "א"]],
  ["Sit down", "Сидеть", "Sentarse", ["י", "ש", "ב"]],
  ["Give birth to", "Рожать", "Parir/Dar a luz", ["י", "ל", "ד"]],
  ["Descend/Emigrate from Israel", "Спускаться/Эмигрировать из Израиля", "Bajar/Emigrar de Israel", ["י", "ר", "ד"]],
  ["Go/Walk", "Идти/Ходить", "Ir/Caminar", ["ה", "ל", "כ"]],
  ["Know(Something)", "Знать(что либо)", "Saber", ["י", "ד", "ע"]],
  # ["", "Трудиться/Прилагать усилия", "", ["י", "ג", "ע"]],
  ["Fall/Fall down", "Падать/Выпадать", "Caer/Caerse/Derrumbarse", ["נ", "פ", "ל"]],
  ["Abandon/Desert/Ditch", "Отказываться/Оставлять/Покидать", "Abandonar/Dejar", ["נ", "ט", "ש"]],
  ["Guard/Watch", "Охранять/Хранить/Затаить обиду", "Vigilar", ["נ", "ט", "ר"]],
  ["Leak/Flow", "Протекать/Течь", "Fluir/Correr", ["נ", "ז", "ל"]],
  ["Kiss", "Целовать", "Besar", ["נ", "ש", "ק"]],
  ["Go/Ride", "Ехать", "Ir/viajar", ["נ", "ס", "ע"]],
  ["Take", "Взять/Брать", "Agarrar/Tomar", ["ל", "ק", "ח"]],
  ["Touch", "Трогать/Касаться", "Tocar", ["נ", "ג", "ע"]],
  ["Bear/Carry", "Носить", "Llevar/Cargar", ["נ", "ש", "א"]],
  # # Next case
  ["Worry", "Беспокоиться/заботиться", "Preocuparse", ["ד", "א", "ג"]],
  ["Push", "Толкать", "Empujar", ["ד", "ח", "פ"]],
  # ["", "Давить/Заталкивать", "", ["ד", "ח", "ק"]],
  ["Creep/Crawl", "Ползать", "Arrastrarse", ["ז", "ח", "ל"]],
  ["Taste", "Пробовать на вкус", "Probar/Saborear", ["ט", "ע", "מ"]],
  ["Fight/", "Бороться", "Luchar", ["ל", "ח", "מ"]],
  # ["Press", "Давить/Нажимать", "", ["ל", "ח", "צ"]],
  ["Whisper", "Шептать", "Susurrar", ["ל", "ח", "ש"]],
  ["Mock", "Насмехиваться", "Burlarse", ["ל", "ע", "ג"]],
  ["Delete/Erase", "Удалять/Зачеркивать/Стирать", "Borrar", ["מ", "ח", "ק"]],
  ["Make a speech", "Выступать/Произносить речь", "Dar un discurso", ["נ", "א", "מ"]],
  ["Drive", "Вводить", "Conducir", ["נ", "ה", "ג"]],
  ["Lock", "Запирать/Закрывать", "Cerrar con seguro", ["נ", "ע", "ל"]],
  ["Trade", "Торговать", "Comerciar", ["ס", "ח", "ר"]],
  ["Laugh", "Смеяться", "Reirse", ["צ", "ח", "ק"]],
  ["Shout/Yell", "Кричать", "Gritar", ["צ", "ע", "ק"]],
  ["Wah", "Мыть", "Lavar", ["ר", "ח", "צ"]],
  ["Shake", "Трясти/Дрожать/Выбрировать", "Sacudir", ["ר", "ע", "ד"]],
  ["Ask/Borrow", "Спрашивать/Брать (бещь) на время", "Preguntar/Pedir(una cosa)", ["ש", "א", "ל"]],
  ["Strive/Aspire", "Вдыхать/Стараться/Стремиться", "Esforzarse", ["ש", "א", "פ"]],
  ["Act(do)", "Действовать", "Actuar(Hacer)", ["פ", "ע", "ל"]],
  ["Choose", "Выбирать", "Elegir", ["ב", "ח", "ר"]],
  ["Burn", "Гореть", "Arder en llamas", ["ב", "ע", "ר"]],
  ["Ache", "Чувствовать боль", "Sentir dolor", ["כ", "א", "ב"]],
  ["Be angry", "Сердиться/Гневаться", "Enojarse/Enfurecerse", ["כ", "ע", "ס"]],
  ["Fear", "Бояться", "Temer", ["פ", "ח", "ד"]],
  ["Load", "Загрузить", "Cargar", ["ט", "ע", "נ"]],
  ["Examin/Test", "Экзаменовать/Тестировать", "Examinar", ["ב", "ח", "נ"]],
  ["Starve", "Голодать", "Pasar hambre", ["ר", "ע", "ב"]],
  ["Be pleasant", "Быть приятним,", "Ser agradable", ["נ", "ע", "מ"]]
].each do |verb|
  begin
    conditions = { :english => verb[0], :russian => verb[1], :spanish => verb[2] }

    new_verb = Verb.find(:first, :conditions => conditions) || Verb.create(conditions.merge!({reviewed: false}))
    root_1, root_2, root_3 = [verb[3][0], verb[3][1], verb[3][2]]

    hebrew_verb = {verb_id: new_verb.id, building_id: 1}
    hebrew_verb.merge! Conjugations::Paal.conjugate_paal([root_1, root_2, root_3])
    hebrew_verb = HebrewVerb.create(hebrew_verb)

  rescue => exception
    puts exception.message
  end
end

puts "Small verbs list created!."
puts "DON'T FORGET TO FIX THE RUSSIAN TRANSLATIONS & GIVE MORE TRANSLATIONS FOR THE NEXT VERBS:"
["СТОЯТЬ,КУШАТЬ,СНИМАТЬ"].map{|verb| puts verb }


puts "seed done!."