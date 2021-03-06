#language: ru

@tree

Функционал: проверка исключения заполнения кол-ва Услуг в документе Заказ покупателя

Как Менеджер хочу проверить НЕ заполнение кол-ва по Услугам в Заказе покупателя

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: проверка пересчета сумм в Заказе покупателя
* Создание документа Заказ покупателя
	И я закрываю все окна клиентского приложения	
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'

* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000012' | 'Мосхлеб ОАО'  |
	И в таблице "Список" я выбираю текущую строку
	
* Заполнение товарной части - указание услуги
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000037' | 'Доставка'     |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
	
* Проверка исключения кол-ва	
	Когда Проверяю шаги на Исключение:
        |'И в поле с именем "ТоварыКоличество" я ввожу текст "1"'|

*Закрытие окон
	И я закрываю все окна клиентского приложения
