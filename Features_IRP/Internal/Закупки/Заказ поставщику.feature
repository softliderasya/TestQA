﻿#language: ru

@tree

Функционал: Заказ поставщику

Как Менеджер по закупкам я хочу
Зафиксировать заказанный поставщику товар
чтобы проанализировать разницу между тем что было заказано и тем что было доставлено фактически

Контекст:
	 Дано Я открыл новый сеанс TestClient или подключил уже существующий
	 
//Сценарий: _0401 подготовительный сценарий (Заказ поставщику)
//	Когда экспорт основных данных

Сценарий: _0402 проверка заполнения цены из соглашения
	* Заполнение документа Заказа поставщику
		Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseOrder"
		И я нажимаю на кнопку с именем 'FormCreate'
		И я нажимаю кнопку выбора у поля "Партнер"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'               |
			| 'Поставщик 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
		И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
		И в таблице "ItemList" я активизирую поле "Номенклатура"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Номенклатура"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            | 'Ссылка'                  |
			| '2'   | 'Товар без характеристик' | 'Товар без характеристик' |
		И в таблице "List" я активизирую поле "Наименование"
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
	* Проверка заполнения цены из соглашения
		Тогда таблица "ItemList" стала равной:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена'   |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 1' | '150,00' |
		
	* Изменение вида цен и проверка его перезаполнения при выборе соглашения		
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Вид цены"
		И в таблице "List" я перехожу к строке:
			| 'Валюта' | 'Код' | 'Наименование'      | 'Ссылка'            |
			| 'USD'    | '4'   | 'Цена поставщика 2' | 'Цена поставщика 2' |
		И в таблице "List" я выбираю текущую строку
		Тогда таблица "ItemList" стала равной:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена' |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 2' | ''     |
		
		И я нажимаю кнопку выбора у поля "Соглашение"
		И в таблице "List" я активизирую поле "Наименование"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'               |
			| 'Соглашение с поставщиком 1' |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Табличная часть товаров будет обновлена'
		И я нажимаю на кнопку 'ОК'
		Тогда таблица "ItemList" стала равной:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена'   |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 1' | '150,00' |
		И я закрываю все окна клиентского приложения
		
		
	