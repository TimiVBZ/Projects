CREATE TABLE country (
	country_id integer primary key autoincrement not null,
	country_name text not null
);

create table card_type (
card_type_id integer primary key autoincrement not null,
card_type_name text 
);

create table customer (
customer_id integer primary key autoincrement not null,
NIN text not null,
first_name text not null,
last_name text not null,
country_id integer not null,
foreign key (country_id) references country (country_id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table card_number (
card_number_id integer primary key autoincrement not null,
card_number text not null,
customer_id integer not null,
card_type_id integer not null,
foreign key (customer_id) references customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (card_type_id) references card_type (card_type_id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table card_transaction (
card_transaction_id integer primary key autoincrement not null,
date_ date,
amount real not null,
card_number_id integer not null,
foreign key (card_number_id) references card_number (card_number_id) ON DELETE CASCADE ON UPDATE CASCADE
);