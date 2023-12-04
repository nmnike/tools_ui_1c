Перем мМенеджеры Экспорт;

Функция ПолучитьВидСравнения(ИмяПоля, ВидСравненияОтбора, ИмяПараметра) Экспорт
	
	//issues470 удалено условие

	Если ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.Равно Тогда
		Возврат "_Таблица." + ИмяПоля + " = &" + ИмяПараметра;

	ИначеЕсли ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.Больше Тогда
		Возврат "_Таблица." + ИмяПоля + " > &" + ИмяПараметра;

	ИначеЕсли ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.БольшеИлиРавно Тогда
		Возврат "_Таблица." + ИмяПоля + " >= &" + ИмяПараметра;

	ИначеЕсли ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.ВИерархии Или ВидСравненияОтбора
		= ВидСравненияКомпоновкиДанных.ВСпискеПоИерархии Тогда
		Возврат "_Таблица." + ИмяПоля + " В ИЕРАРХИИ (&" + ИмяПараметра + ")";

	ИначеЕсли ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.ВСписке Тогда
		Возврат "_Таблица." + ИмяПоля + " В (&" + ИмяПараметра + ")";

	ИначеЕсли ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.Меньше Тогда
		Возврат "_Таблица." + ИмяПоля + " < &" + ИмяПараметра;

	ИначеЕсли ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.МеньшеИлиРавно Тогда
		Возврат "_Таблица." + ИмяПоля + " <= &" + ИмяПараметра;

	ИначеЕсли ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.НеВСписке Тогда
		Возврат "НЕ _Таблица." + ИмяПоля + " В (&" + ИмяПараметра + ")";

	ИначеЕсли ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.НеВИерархии Или ВидСравненияОтбора
		= ВидСравненияКомпоновкиДанных.НеВСпискеПоИерархии Тогда
		Возврат "НЕ _Таблица." + ИмяПоля + " В ИЕРАРХИИ (&" + ИмяПараметра + ")";

	ИначеЕсли ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.НеРавно Тогда
		Возврат "_Таблица." + ИмяПоля + " <> &" + ИмяПараметра;
	ИначеЕсли ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.Содержит Тогда
		Возврат "_Таблица." + ИмяПоля +" ПОДОБНО ""%""+&"+ИмяПараметра+"+""%"" ";
	ИначеЕсли ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.НеСодержит Тогда
		Возврат "НЕ _Таблица." + ИмяПоля +" ПОДОБНО ""%""+&"+ИмяПараметра+"+""%"" ";
	ИначеЕсли ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.НачинаетсяС Тогда
		Возврат "_Таблица." + ИмяПоля +" ПОДОБНО """"+&"+ИмяПараметра+"+""%"" ";
	ИначеЕсли ВидСравненияОтбора = ВидСравненияКомпоновкиДанных.НеНачинаетсяС Тогда
		Возврат "НЕ _Таблица." + ИмяПоля +" ПОДОБНО """"+&"+ИмяПараметра+"+""%"" ";

	КонецЕсли;

КонецФункции // ()

Функция РазложитьСтрокуВМассивПодстрок(Знач Стр, Разделитель = ",") Экспорт

	МассивСтрок = Новый Массив;
	Если Разделитель = " " Тогда
		Стр = СокрЛП(Стр);
		Пока Истина Цикл
			Поз = Найти(Стр, Разделитель);
			Если Поз = 0 Тогда
				МассивСтрок.Добавить(Стр);
				Возврат МассивСтрок;
			КонецЕсли;
			МассивСтрок.Добавить(Лев(Стр, Поз - 1));
			Стр = СокрЛ(Сред(Стр, Поз));
		КонецЦикла;
	Иначе
		ДлинаРазделителя = СтрДлина(Разделитель);
		Пока Истина Цикл
			Поз = Найти(Стр, Разделитель);
			Если Поз = 0 Тогда
				Если (СокрЛП(Стр) <> "") Тогда
					МассивСтрок.Добавить(Стр);
				КонецЕсли;
				Возврат МассивСтрок;
			КонецЕсли;
			МассивСтрок.Добавить(Лев(Стр, Поз - 1));
			Стр = Сред(Стр, Поз + ДлинаРазделителя);
		КонецЦикла;
	КонецЕсли;

КонецФункции

Функция ПолучитьСтрокуИзМассиваПодстрок(Массив, Разделитель = ",") Экспорт
	Результат = "";
	Для Каждого Элемент Из Массив Цикл
		Подстрока = ?(ТипЗнч(Элемент) = Тип("Строка"), Элемент, Строка(Элемент));
		РазделительПодстрок = ?(ПустаяСтрока(Результат), "", Разделитель);
		Результат = Результат + РазделительПодстрок + Подстрока;
	КонецЦикла;

	Возврат Результат;
КонецФункции

Процедура ЗагрузитьОбработки(ТекФорма, ДоступныеОбработки2, ВыбранныеОбработки2) Экспорт

	СоответствиеДоступностиНастроек=Новый Соответствие;
	СоответствиеДоступностиНастроек.Вставить("ПроизвольныйАлгоритм", Истина);
	СоответствиеДоступностиНастроек.Вставить("ПеренумерацияОбъектов", Истина);
	СоответствиеДоступностиНастроек.Вставить("ПометитьНаУдаление", Ложь);
	СоответствиеДоступностиНастроек.Вставить("ПровестиДокументы", Ложь);
	СоответствиеДоступностиНастроек.Вставить("ОтменитьПроведениеДокументов", Ложь);
	СоответствиеДоступностиНастроек.Вставить("СнятьПометкуУдаления", Ложь);
	СоответствиеДоступностиНастроек.Вставить("ИзменитьВремяДокументов", Истина);
	СоответствиеДоступностиНастроек.Вставить("ИзменитьСуммуОперации", Истина);
	СоответствиеДоступностиНастроек.Вставить("Удалить", Ложь);
	СоответствиеДоступностиНастроек.Вставить("УстановкаРеквизитов", Истина);

	_ДоступныеОбработки = ТекФорма.РеквизитФормыВЗначение("ДоступныеОбработки");
	_ВыбранныеОбработки = ТекФорма.РеквизитФормыВЗначение("ВыбранныеОбработки");

	Формы = ЭтотОбъект.Метаданные().Формы;

	Для Каждого Форма Из Формы Цикл
		Если Форма.Имя = "ПодборИОбработка" Или Форма.Имя = "ФормаНастроек" Или Форма.Имя = "ШаблонОбработки"
			Или Форма.Имя = "ФормаВыбораТаблиц" Или Форма.Имя = "ФормаОтбора" Тогда

			Продолжить;
		КонецЕсли;
		НайденнаяСтрока = _ДоступныеОбработки.Строки.Найти(Форма.Имя, "ИмяФормы");
		Если Не НайденнаяСтрока = Неопределено Тогда
			Если Не НайденнаяСтрока.Обработка = Форма.Синоним Тогда
				НайденнаяСтрока.Обработка = Форма.Синоним;
			КонецЕсли;
			//Если НЕ ЭтотОбъект.ПолучитьФорму(Форма.Имя).мИспользоватьНастройки Тогда
			Если Не СоответствиеДоступностиНастроек[Форма.Имя] Тогда
				НайденнаяСтрока.Строки.Очистить();
			КонецЕсли;
			Продолжить;
		КонецЕсли;

		НоваяОбработка = _ДоступныеОбработки.Строки.Добавить();
		НоваяОбработка.Обработка = Форма.Синоним;
		НоваяОбработка.ИмяФормы  = Форма.Имя;

		Настройка = Новый Структура;
		Настройка.Вставить("Обработка", Форма.Синоним);
		Настройка.Вставить("Прочее", Неопределено);
		НоваяОбработка.Настройка.Добавить(Настройка);
	КонецЦикла;

	МассивДляУдаления = Новый Массив;

	Для Каждого ДоступнаяОбработка Из _ДоступныеОбработки.Строки Цикл
		Если Формы.Найти(ДоступнаяОбработка.ИмяФормы) = Неопределено Тогда
			МассивДляУдаления.Добавить(ДоступнаяОбработка);
		КонецЕсли;
	КонецЦикла;

	Для Индекс = 0 По МассивДляУдаления.Количество() - 1 Цикл
		_ДоступныеОбработки.Строки.Удалить(МассивДляУдаления[Индекс]);
	КонецЦикла;

	МассивДляУдаления.Очистить();

	Для Каждого ВыбраннаяОбработка Из _ВыбранныеОбработки Цикл
		Если ВыбраннаяОбработка.СтрокаДоступнойОбработки = Неопределено Тогда
			МассивДляУдаления.Добавить(ВыбраннаяОбработка);
		Иначе
			Если ВыбраннаяОбработка.СтрокаДоступнойОбработки.Родитель = Неопределено Тогда
				Если _ДоступныеОбработки.Строки.Найти(ВыбраннаяОбработка.СтрокаДоступнойОбработки.ИмяФормы, "ИмяФормы")
					= Неопределено Тогда
					МассивДляУдаления.Добавить(ВыбраннаяОбработка);
				КонецЕсли;
			Иначе
				Если _ДоступныеОбработки.Строки.Найти(ВыбраннаяОбработка.СтрокаДоступнойОбработки.Родитель.ИмяФормы,
					"ИмяФормы") = Неопределено Тогда
					МассивДляУдаления.Добавить(ВыбраннаяОбработка);
				КонецЕсли;
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;

	Для Индекс = 0 По МассивДляУдаления.Количество() - 1 Цикл
		_ВыбранныеОбработки.Удалить(МассивДляУдаления[Индекс]);
	КонецЦикла;

	ТекФорма.ЗначениеВРеквизитФормы(_ДоступныеОбработки, "ДоступныеОбработки");
	ТекФорма.ЗначениеВРеквизитФормы(_ВыбранныеОбработки, "ВыбранныеОбработки");

КонецПроцедуры

// Инициализирует переменную мМенеджеры, содержащую соответствия типов объектов их свойствам.
//
// Параметры:
//  Нет.
//
// Возвращаемое значение:
//  Соответствие, содержащее соответствия типов объектов их свойствам.
// 
Функция ИнициализацияМенеджеров() Экспорт

	Менеджеры = Новый Соответствие;

	ИмяТипа = "Справочник";
	Для Каждого ОбъектМД Из Метаданные.Справочники Цикл
		Имя              = ОбъектМД.Имя;
		Менеджер         = Справочники[Имя];
		ТипСсылкиСтрокой = "СправочникСсылка." + Имя;
		ТипСсылки        = Тип(ТипСсылкиСтрокой);
		Структура = Новый Структура("Имя,ИмяТипа,ТипСсылкиСтрокой,Менеджер,ТипСсылки, ОбъектМД", Имя, ИмяТипа,
			ТипСсылкиСтрокой, Менеджер, ТипСсылки, ОбъектМД);
		Менеджеры.Вставить(ОбъектМД, Структура);
	КонецЦикла;

	ИмяТипа = "Документ";
	Для Каждого ОбъектМД Из Метаданные.Документы Цикл
		Имя              = ОбъектМД.Имя;
		Менеджер         = Документы[Имя];
		ТипСсылкиСтрокой = "ДокументСсылка." + Имя;
		ТипСсылки        = Тип(ТипСсылкиСтрокой);
		Структура = Новый Структура("Имя,ИмяТипа,ТипСсылкиСтрокой,Менеджер,ТипСсылки, ОбъектМД", Имя, ИмяТипа,
			ТипСсылкиСтрокой, Менеджер, ТипСсылки, ОбъектМД);
		Менеджеры.Вставить(ОбъектМД, Структура);
	КонецЦикла;

	Возврат Менеджеры;

КонецФункции // вИнициализацияМенеджеров()

мМенеджеры = ИнициализацияМенеджеров();