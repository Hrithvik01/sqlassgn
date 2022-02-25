

CREATE TABLE brands (
  brand_id serial NOT NULL,
  brand_name varchar(255) NOT NULL,
  brand_active int NOT NULL DEFAULT '0',
  brand_status int NOT NULL DEFAULT '0'
) ;
drop table brands
-- --------------------------------------------------------


CREATE TABLE categories (
  categories_id serial ,
  categories_name varchar(255) NOT NULL,
  categories_active int NOT NULL DEFAULT '0',
  categories_status int NOT NULL DEFAULT '0'
);
drop table orders

-- --------------------------------------------------------



CREATE TABLE orders (
  order_id serial,
  order_date date NOT NULL,
  client_name varchar(255) NOT NULL,
  client_contact varchar(255) NOT NULL,
  sub_total varchar(255) NOT NULL,
  vat varchar(255) NOT NULL,
  total_amount varchar(255) NOT NULL,
  discount varchar(255) NOT NULL,
  grand_total varchar(255) NOT NULL,
  paid varchar(255) NOT NULL,
  due varchar(255) NOT NULL,
  payment_type int NOT NULL,
  payment_status int NOT NULL,
  payment_place int NOT NULL,
  gstn varchar(255) NOT NULL,
  order_status int NOT NULL DEFAULT '0',
  user_id int NOT NULL references users(user_id),
  product_id int not null references product(product_id)
) ;
drop table orders

-- --------------------------------------------------------



CREATE TABLE order_item (
  order_item_id serial,
  order_id int NOT NULL DEFAULT '0',
  product_id int NOT NULL DEFAULT '0',
  quantity varchar(255) NOT NULL,
  rate varchar(255) NOT NULL,
  total varchar(255) NOT NULL,
  order_item_status int NOT NULL DEFAULT '0'
);
drop table product
-- --------------------------------------------------------




CREATE TABLE product (
  product_id serial,
  product_name varchar(255) NOT NULL,
  product_image text NOT NULL,
  brand_id int NOT NULL,
  categories_id int NOT NULL,
  quantity varchar NOT NULL,
  rate varchar NOT NULL,
  status int NOT NULL DEFAULT '0'
);

-- --------------------------------------------------------


CREATE TABLE users (
  user_id serial,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  email varchar(255) NOT NULL
) 
drop table users
--
-- Dumping data for table `users`
--

INSERT INTO users (user_id, username, password, email) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '');


ALTER TABLE categories
  ADD PRIMARY KEY (categories_id);


ALTER TABLE orders
  ADD PRIMARY KEY (order_id);



ALTER TABLE order_item
  ADD PRIMARY KEY (order_item_id);



ALTER TABLE product
  ADD PRIMARY KEY (product_id);

ALTER TABLE users
  ADD PRIMARY KEY (user_id);
  
create table trigger_table(
	id serial primary key,
	user_id int references users(user_id),
	product_id int references product(product_id),
	order_date timestamp not null
) 
create or replace function new_order()
Returns trigger
language PLPGSQL
as $$
  BEGIN
      insert into trigger_table(user_id, product_id,order_date) values (new.user_id, new.product_id,NOW());
  return new;
  END;
 $$
 create trigger splorder
	
	before insert
	on orders
	FOR EACH ROW
	 execute procedure new_order();




