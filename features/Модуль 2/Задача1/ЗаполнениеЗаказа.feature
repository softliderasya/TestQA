﻿#language: ru

@tree

Функционал: Заполнение документа Заказ покупателя

Как Менеджер по закупкам я хочу   (тестировать под Менеджером по закупкам)
Проверить заполнение документа Заказ покупателя

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Подготовка данных для Заказа

	И я загружаю константы
	И я загружаю организации
	И я загружаю склады
	И я загружаю товары
	И я загружаю покупателей

Сценарий: Заполнение шапки Заказа покупателя
Сценарий: Заполнение табличной части Заказа покупателя