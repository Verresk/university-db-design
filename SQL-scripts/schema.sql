--Скрипт для создания таблиц и связей между ними


CREATE TABLE Gym (
  gym_id bigint NOT NULL PRIMARY KEY,
  name text NOT NULL,
  address varchar(500) NOT NULL,
  phone varchar(500) NOT NULL,
  work_schedule varchar(500) NOT NULL
);


CREATE TABLE Cheque (
  cheque_id bigserial NOT NULL PRIMARY KEY,
  payment_id bigint NOT NULL,
  payment_date varchar(500) NOT NULL,
  check_amount varchar(500),
  cheque_format text
);


CREATE TABLE Employee (
  employee_id bigint NOT NULL PRIMARY KEY,
  gym_id bigint NOT NULL,
  first_name varchar(500) NOT NULL,
  second_name varchar(500) NOT NULL,
  father_name varchar(500),
  post text NOT NULL,
  phone varchar(500) NOT NULL,
  address varchar(500) NOT NULL,
  start_date varchar(500) NOT NULL
);


CREATE TABLE Club_card (
  club_card_id bigserial NOT NULL PRIMARY KEY,
  client_id bigint NOT NULL,
  expiration_time varchar(500) NOT NULL,
  issue_date varchar(500) NOT NULL
);


CREATE TABLE Activities (
  activities_id bigint NOT NULL PRIMARY KEY,
  gym_id bigint NOT NULL,
  employee_id bigint NOT NULL,
  activity_time varchar(500) NOT NULL,
  activity_type text NOT NULL
);


CREATE TABLE Activities_attending (
  avtivities_attending_id bigserial NOT NULL PRIMARY KEY,
  activities_id bigint NOT NULL,
  client_id bigint NOT NULL,
  attending_date varchar(500) NOT NULL
);


CREATE TABLE Client (
  client_id bigint NOT NULL PRIMARY KEY,
  first_name text NOT NULL,
  second_name text NOT NULL,
  father_name text,
  phone_number varchar(500) NOT NULL,
  email text,
  registration_date varchar(500) NOT NULL
);


CREATE TABLE Subscriptions (
  subscription_id bigint NOT NULL PRIMARY KEY,
  gym_id bigint NOT NULL,
  name text NOT NULL,
  price numeric NOT NULL,
   subscription_period varchar(500) NOT NULL
);


CREATE TABLE Payment_method (
  payment_method_id bigint NOT NULL PRIMARY KEY,
  method_name text NOT NULL
);


CREATE TABLE Payment (
  payment_id bigint NOT NULL PRIMARY KEY,
  subscription_id bigint NOT NULL,
  employee_id bigint NOT NULL,
  payment_method_id bigint NOT NULL,
  payment_date varchar(500) NOT NULL,
  status text NOT NULL,
  client_id bigint NOT NULL
);


CREATE TABLE Equipment (
  equipment_id bigserial NOT NULL PRIMARY KEY,
  name text NOT NULL,
  gym_id bigint NOT NULL,
  quantity smallint
);


ALTER TABLE Activities_attending ADD CONSTRAINT Activities_attending_activities_id_fk FOREIGN KEY (activities_id) REFERENCES Activities (activities_id);
ALTER TABLE Activities_attending ADD CONSTRAINT Activities_attending_client_id_fk FOREIGN KEY (client_id) REFERENCES Client (client_id);
ALTER TABLE Activities ADD CONSTRAINT Activities_employee_id_fk FOREIGN KEY (employee_id) REFERENCES Employee (employee_id);
ALTER TABLE Activities ADD CONSTRAINT Activities_gym_id_fk FOREIGN KEY (gym_id) REFERENCES Gym (gym_id);
ALTER TABLE Cheque ADD CONSTRAINT Cheque_payment_id_fk FOREIGN KEY (payment_id) REFERENCES Payment (payment_id);
ALTER TABLE Club_card ADD CONSTRAINT Club_card_client_id_fk FOREIGN KEY (client_id) REFERENCES Client (client_id);
ALTER TABLE Employee ADD CONSTRAINT Employee_gym_id_fk FOREIGN KEY (gym_id) REFERENCES Gym (gym_id);
ALTER TABLE Equipment ADD CONSTRAINT Equipment_gym_id_fk FOREIGN KEY (gym_id) REFERENCES Gym (gym_id);
ALTER TABLE Payment ADD CONSTRAINT Payment_client_id_fk FOREIGN KEY (client_id) REFERENCES Client (client_id);
ALTER TABLE Payment ADD CONSTRAINT Payment_employee_id_fk FOREIGN KEY (employee_id) REFERENCES Employee (employee_id);
ALTER TABLE Payment ADD CONSTRAINT Payment_payment_method_id_fk FOREIGN KEY (payment_method_id) REFERENCES Payment_method (payment_method_id);
ALTER TABLE Payment ADD CONSTRAINT Payment_subscription_id_fk FOREIGN KEY (subscription_id) REFERENCES Subscriptions (subscription_id);
ALTER TABLE Subscriptions ADD CONSTRAINT Subscriptions_gym_id_fk FOREIGN KEY (gym_id) REFERENCES Gym (gym_id);