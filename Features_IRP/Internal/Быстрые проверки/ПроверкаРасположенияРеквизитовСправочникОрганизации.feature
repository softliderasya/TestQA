﻿#language: ru

@tree
@БыстрыеПроверки

Функционал: Проверка расположения реквизитов в форме элемента справочника Организации
Как Тестировщик я хочу
проверить расположение реквизитов в форме элемента справочника Организации
чтобы расположение не изменилось

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка заполнения справочника Организации
		И В командном интерфейсе я выбираю 'Справочники' 'Организации'
		Тогда открылось окно 'Организации'
		@screenshot
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Организация (создание)'
//		И я закрываю все окна клиентского приложения
