#language: ru

@tree
@Отчеты

Функционал: Проверка отчетов

Как Тестировщик я хочу
ПРоверить отчеты
чтобы у пользователя не возникло проблем

Контекст:
	 Дано Я открыл новый сеанс TestClient или подключил уже существующий
	 
Сценарий: _0601 подготовительный сценарий (Отчеты)
	Когда экспорт основных данных
	Когда Загрузка документов Поступление товаров и услуг\
	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
	Тогда в таблице "List" я выделяю все строки
	И в таблице "List" я нажимаю на кнопку с именем 'ListContextMenuPost'

Сценарий: _0602 Проверка отчета Информация по номенклатуре
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Отчеты' 'D0010 Информация по товарам'
	Тогда открылось окно 'D0010 Информация по товарам'
	И в табличном документе 'Result' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку 'Сформировать'
	Дано табличный документ "Result" равен макету "ИнформацияПоТоварам1" по шаблону
	И в табличном документе "Result" ячейка с адресом "R8C3" равна "787889899"

Сценарий: _0603 Проверка отчета Информация по номенклатуре
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Отчеты' 'D1001 Закупки'
	Тогда открылось окно 'D1001 Закупки'
	И в табличном документе 'Result' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку 'Сформировать'
	И я жду когда в табличном документе "Result" заполнится ячейка "R13C4" в течение 20 секунд
	Дано Табличный документ "Result" равен макету "Закупки1" по шаблону
	
	
	
	
