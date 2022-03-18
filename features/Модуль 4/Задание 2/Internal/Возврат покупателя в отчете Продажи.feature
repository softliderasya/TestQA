﻿#language: ru

@tree

Функционал: Возврат от покупателя: отражение в отчете D2001 Продажи
Как Тестировщик я хочу
Проверить отражение Возвратов от покупателя в отчете D2001 Продажи
чтобы возвраты в отчете присутствовали

Контекст:
	 Дано Я открыл новый сеанс TestClient или подключил уже существующий
	 
Сценарий: _0801 подготовительный сценарий (Поступление товаров и услуг)
	Когда экспорт основных данных
	Когда Загрузка документов Возврат от покупателя (будущим числом)
	Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesReturn"
	Тогда в таблице "List" я выделяю все строки
	И в таблице "List" я нажимаю на кнопку с именем 'ListContextMenuPost'
	
Сценарий: _0802 проверка Возврата покупателя в отчете Продажи
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	Тогда открылось окно 'D2001 Продажи'
	И в табличном документе 'Result' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку 'Сформировать'
	И я жду когда в табличном документе "Result" заполнится ячейка "R8C4" в течение 20 секунд
	И табличный документ "Result" содержит строки:
		| 'Товар без характеристик' | '-10,000'                                                           | '-4 500,00' | '-3 750,00'         | ''             |
	И я закрываю все окна клиентского приложения
	