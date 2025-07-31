# 🧠 Customer Segmentation with SQL

## 📌 Описание проекта

Этот проект — пример аналитики поведения клиентов с использованием SQL-запросов в PostgreSQL. Анализ проводится по двум таблицам: `customers` и `transactions`. Для работы использовалась среда DBeaver, скриншоты запросов и результатов включены.

Проект иллюстрирует базовые и продвинутые SQL-техники, включая оконные функции, агрегации и работу с датами.

---

## 📂 Структура репозитория

customer-segmentation-sql/
* ├── images/ # Скриншоты результатов SQL-запросов
* ├── sql_queries/ # SQL-скрипты
* └── README.md # Описание проекта


---

## 🧩 Используемые SQL-инструменты

- `SELECT`, `JOIN`, `GROUP BY`, `ORDER BY`
- Агрегации: `COUNT()`, `SUM()`, `MAX()`, `MIN()`
- Оконные функции: `ROW_NUMBER() OVER (...)`
- Работа с датами: `TO_CHAR`, `MAX(date) - MIN(date)`
- Фильтрация: `WHERE`, `LIMIT`

---

## 🔎 Аналитические вопросы

| №  | Описание запроса                                               | Скриншот результата                              | 
|----|----------------------------------------------------------------|--------------------------------------------------|
| 1  | Количество клиентов по индустриям                              | ![img](https://github.com/SuperMBA/customer-segmentation-sql/blob/main/images/01_customer_count_by_industry.png) 
| 2  | Сумма транзакций по месяцам и индустриям                       | ![img](https://github.com/SuperMBA/customer-segmentation-sql/blob/main/images/02_monthly_transaction_sum_by_industry.png)
| 3  | Онлайн-покупки IT-клиентов по брендам                          | ![img](https://github.com/SuperMBA/customer-segmentation-sql/blob/main/images/03_online_transactions_it_customers_by_brand.png)
| 4  | Сумма, минимум, максимум по клиенту                            | ![img](https://github.com/SuperMBA/customer-segmentation-sql/blob/main/images/04_total_min_max_transaction_per_customer.png)
| 5  | Те же метрики с оконными функциями                             | ![img](https://github.com/SuperMBA/customer-segmentation-sql/blob/main/images/05_total_min_max_transaction_with_window_functions.png)
| 6  | Клиент с наименьшими тратами                                   | ![img](https://github.com/SuperMBA/customer-segmentation-sql/blob/main/images/06_lowest_total_spender.png)
| 7  | Клиент с наибольшими тратами                                   | ![img](https://github.com/SuperMBA/customer-segmentation-sql/blob/main/images/07_highest_total_spender.png)
| 8  | Самая первая транзакция по каждому клиенту                     | ![img]([https://github.com/SuperMBA/customer-segmentation-sql/blob/main/images/09_customer_with_max_transaction_interval.png](https://github.com/SuperMBA/customer-segmentation-sql/blob/main/images/08_first_transaction_per_customer.png))
| 9  | Клиент с наибольшим интервалом между транзакциями              | ![img](https://github.com/SuperMBA/customer-segmentation-sql/blob/main/images/09_customer_with_max_transaction_interval.png)
| 10 | Топ-10 клиентов по интервалу между покупками                   | ![img](https://github.com/SuperMBA/customer-segmentation-sql/blob/main/images/10_top10_customers_by_transaction_interval.png)

---


## 📚 Автор

Маргарита Баландина


