﻿#language: ru

@tree
@Отчеты

Функционал: Заказ покупателя: заполнение реквизитов шапки

Как Тестировщик я хочу
Проверить документ Заказ покупателя
чтобы корректно заполнялись реквизиты шапки документа

Контекст:
	 Дано Я открыл новый сеанс TestClient или подключил уже существующий
	 
//Сценарий: _0701 подготовительный сценарий (Заказ покупателя)
//	Когда экспорт основных данных

Сценарий: _0702 Создание Заказа покупателя, проверка заполнения шапки
	* Создание документа Заказ покупателя
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder" 
		И я нажимаю на кнопку с именем 'FormCreate'
	* Заполнение документа
		И я нажимаю кнопку выбора у поля "Партнер"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'            |
			| 'Клиент 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Номенклатура"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'            |
			| 'Товар без характеристик' |
		И в таблице "List" я выбираю текущую строку	
	* Проверка заполнения контргаента и соглашения (по партнеру)		
		Тогда элемент формы с именем "LegalName" стал равен 'Клиент 1'							
		Тогда элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
	* Изменение партнера, проверка перезаполнение контрагента и соглашения
		И я нажимаю кнопку выбора у поля "Партнер"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'            |
			| 'Клиент 2 (2 соглашения)' |
		И в таблице "List" я выбираю текущую строку
		Тогда элемент формы с именем "LegalName" стал равен 'Клиент 2'							
		Тогда элемент формы с именем "Agreement" стал равен ''
	* Изменнеие партнера, проверка перезаполнения цен
		И я нажимаю кнопку выбора у поля "Партнер"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'            |
			| 'Клиент 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Табличная часть товаров будет обновлена'
		И я нажимаю на кнопку 'ОК'
	* Проверка блокировки поля Контрагент, если Партнер не выбран
		И я нажимаю кнопку очистить у поля "Партнер"
		И элемент "LegalName" доступен только для просмотра Тогда
	* Закрываю все окна
		И я закрываю все окна клиентского приложения

				

