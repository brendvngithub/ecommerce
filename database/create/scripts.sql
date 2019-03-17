CREATE TABLE store.products (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	price FLOAT NULL,
	description varchar(255) NULL,
	category_id varchar(255) NULL,
	sub_category_id varchar(255) NULL,
	image_path varchar(255) NULL,
	created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB;

CREATE TABLE store.categories (
	id INT NOT NULL AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	slug varchar(255) NULL,
	created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB;

CREATE TABLE store.sub_categories (
	id INT NOT NULL AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	slug varchar(255) NULL,
	category_id INT NOT NULL,
	created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB;

CREATE TABLE store.orders (
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	product_id INT NOT NULL,
	unit_price FLOAT NULL,
	total FLOAT NULL,
	status varchar(255) NULL,
	order_no varchar(255) NULL,
	created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB;

CREATE TABLE store.payments (
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	order_no varchar(255) NULL,
	amount FLOAT NULL,
	status varchar(255) NULL,
	created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB;

CREATE TABLE store.users (
	id INT NOT NULL AUTO_INCREMENT,
	username varchar(255) NULL,
	fullname varchar(255) NULL,
	email varchar(255) NULL,
	pasword varchar(255) NULL,
	address varchar(255) NULL,
	`role` varchar(50) NULL,
	created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB;