﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 

Сценарий: изменение количества во всех строках Поступления
		И для каждой строки таблицы "ItemList" я выполняю используя колонку "N"
			И в таблице "ItemList" в поле "Количество" я ввожу текст "10,00"

Сценарий: удаление строк таблицы
	И пока в таблице "ItemList" количество строк ">" 0 тогда
		и в таблице "ItemList" я удаляю строку

Сценарий: изменение вида цен по условиям
	И для каждой строки таблицы "ItemList" я выполняю
		Если таблица "ItemList" содержит строки Тогда
			| 'Номенклатура'            | 'Характеристика'          | 'Вид цены'          |
			| 'Товар без характеристик' | 'Товар без характеристик' | 'Ручное назначение' |
			И в таблице "ItemList" я перехожу к строке
			| 'Номенклатура'            | 'Характеристика'          | 'Вид цены'          |
			| 'Товар без характеристик' | 'Товар без характеристик' | 'Ручное назначение' |
			И в таблице "ItemList" я выбираю текущую строку
			И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Вид цены"
			И в таблице "List" я перехожу к строке:
				| 'Наименование'      |
				| 'Цена поставщика 1' |
			И в таблице "List" я выбираю текущую строку

	И таблица  "ItemList" не содержит строки:
		| 'Номенклатура'            | 'Характеристика'          | 'Вид цены'          |
		| 'Товар без характеристик' | 'Товар без характеристик' | 'Ручное назначение' |
							
Сценарий: перебор элементов справочника Номенклатура
	И для каждой строки таблицы "List" я выполняю
		и в таблице "List" я выбираю текущую строку
		Тогда не появилось окно предупреждения системы
		И я закрываю текущее окно
		
Сценарий: создание большого объема справочных данных
	И Я запоминаю значение выражения '1' в переменную "Шаг"
	и я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$+1' в переменную "Шаг"
		И Я запоминаю значение выражения '"ед.изм" + $Шаг$' в переменную "ЕдиницаИзмерения"
		И я проверяю или создаю для справочника "Units" объекты:
		| 'Ref'                                                           | 'DeletionMark' | 'Code' | 'Item' | 'Quantity' | 'BasisUnit' | 'UOM' | 'Description_en'   | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Units?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        | 1      | ''     | 1          | ''          | ''    | '$ЕдиницаИзмерения$' | ''                 | ''               | ''               |          |          |          |          |         |


