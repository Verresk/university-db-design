--Скрипт для заполнения таблиц


-- Справочные данные
INSERT INTO Gym (gym_id, name, address, phone, work_schedule) VALUES
(1, 'Фитнес Хаус', 'ул. Центральная, 10', '+79001234567', 'Пн-Пт 8:00-22:00, Сб-Вс 10:00-20:00'),
(2, 'СпортЛэнд', 'пр. Мира, 55', '+79007654321', 'Ежедневно 7:00-23:00');

INSERT INTO Payment_method (payment_method_id, method_name) VALUES
(1, 'Наличные'),
(2, 'Банковская карта');

INSERT INTO Client (client_id, first_name, second_name, father_name, phone_number, email, registration_date) VALUES
(1, 'Иван', 'Иванов', 'Петрович', '+79150000001', 'ivan@mail.com', '2024-01-15'),
(2, 'Мария', 'Петрова', NULL, '+79150000002', 'maria@mail.com', '2024-02-20');

-- Базовые сущности
INSERT INTO Subscriptions (subscription_id, gym_id, name, price, subscription_period) VALUES
(1, 1, 'Стандарт', 3000.00, '1 месяц'),
(2, 2, 'Премиум', 5000.00, '6 месяцев');

INSERT INTO Employee (employee_id, gym_id, first_name, second_name, father_name, post, phone, address, start_date) VALUES
(1, 1, 'Алексей', 'Смирнов', 'Олегович', 'Тренер', '+79011234567', 'ул. Спортивная, 5', '2023-05-01'),
(2, 2, 'Ольга', 'Васнецова', NULL, 'Администратор', '+79017654321', 'пр. Победы, 12', '2022-12-15');

INSERT INTO Equipment (name, gym_id, quantity) VALUES
('Беговая дорожка', 1, 5),
('Гантели', 2, 20);

-- Активности
INSERT INTO Activities (activities_id, gym_id, employee_id, activity_time, activity_type) VALUES
(1, 1, 1, 'Пн, Ср, Пт 18:00', 'Йога'),
(2, 2, 2, 'Вт, Чт 19:00', 'Тренажерный зал');

-- Транзакционные данные
INSERT INTO Payment (payment_id, subscription_id, employee_id, payment_method_id, payment_date, status, client_id) VALUES
(1, 1, 1, 1, '2024-03-01', 'Успешно', 1),
(2, 2, 2, 2, '2024-03-02', 'Ожидание', 2);

INSERT INTO Cheque (payment_id, payment_date, check_amount, cheque_format) VALUES
(1, '2024-03-01', '3000', 'Электронный'),
(2, '2024-03-02', '5000', 'Бумажный');

INSERT INTO Club_card (client_id, expiration_time, issue_date) VALUES
(1, '2024-04-01', '2024-03-01'),
(2, '2024-09-02', '2024-03-02');

INSERT INTO Activities_attending (activities_id, client_id, attending_date) VALUES
(1, 1, '2024-03-05'),
(2, 2, '2024-03-06');