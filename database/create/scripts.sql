CREATE TABLE products (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
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

CREATE TABLE categories (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	slug varchar(255) NULL,
	created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB;

CREATE TABLE sub_categories (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	slug varchar(255) NULL,
	category_id INT UNSIGNED NOT NULL,
	created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `sub_categories_FK_1`
        FOREIGN KEY (`category_id`)
        REFERENCES `categories` (`id`)
)
ENGINE=InnoDB;

CREATE TABLE users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	username varchar(255) NULL,
	fullname varchar(255) NULL,
	email varchar(255) NULL,
	password varchar(255) NULL,
	address varchar(255) NULL,
	`role` varchar(50) NULL,
	created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB;

CREATE TABLE orders (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	product_id INT UNSIGNED NOT NULL,
	unit_price FLOAT NULL,
	total FLOAT NULL,
	status varchar(255) NULL,
	order_no varchar(255) NULL,
	created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `orders_FK_1`
        FOREIGN KEY (`product_id`)
        REFERENCES `products` (`id`),
  CONSTRAINT `orders_FK_2`
        FOREIGN KEY (`user_id`)
        REFERENCES `users` (`id`)
)
ENGINE=InnoDB;

CREATE TABLE payments (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	order_no varchar(255) NULL,
	amount FLOAT NULL,
	status varchar(255) NULL,
	created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `payments_FK_2`
        FOREIGN KEY (`user_id`)
        REFERENCES `users` (`id`)
)
ENGINE=InnoDB;

