﻿#language: ru
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Заказ покупателя: заполнение шапки

@ТипШага: Загрузка данных
@Описание: Экспортный сценарий на перезаполнение организаций
@ПримерИспользования: и я заполняю Заказ (шапка)

Сценарий: Я заполняю Заказ (шапка)

*Создание нового Заказа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
*Заполнение шапка Заказа	
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'           |
		| '000000016' | 'Магазин "Мясная лавка"' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
	И я перехожу к следующему реквизиту
		
