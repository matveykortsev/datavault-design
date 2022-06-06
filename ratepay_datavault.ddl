
create table if not exists h_shop (
    h_shop_rk uuid DEFAULT uuid_generate_v4 (),
    shop_id bigint UNIQUE,
    source_system text,
    processed_dttm timestamp,
    PRIMARY KEY (h_shop_rk)
);

create table if not exists h_order (
    h_order_rk uuid DEFAULT uuid_generate_v4 (),
    id varchar(30) UNIQUE,
    source_system text,
    processed_dttm timestamp,
    PRIMARY KEY (h_order_rk)
);

create table if not exists h_transactions (
    h_transaction_rk uuid DEFAULT uuid_generate_v4 (),
    transaction_id varchar(20) UNIQUE,
    source_system text,
    processed_dttm timestamp,
    PRIMARY KEY (h_transaction_rk)
);

create table if not exists h_items (
    h_item_rk uuid DEFAULT uuid_generate_v4 (),
    identification_number varchar(20) UNIQUE,
    source_system text,
    processed_dttm timestamp,
    PRIMARY KEY (h_item_rk)
);

create table if not exists h_buyer (
    h_buyer_rk uuid DEFAULT uuid_generate_v4 (),
    ratepay_id bigint UNIQUE,
    source_system text,
    processed_dttm timestamp,
    PRIMARY KEY (h_buyer_rk)
);

create table if not exists h_partner (
    h_partner_rk uuid DEFAULT uuid_generate_v4 (),
    partner bigint UNIQUE,
    source_system text,
    processed_dttm timestamp,
    PRIMARY KEY (h_partner_rk)
);


create table if not exists s_order (
    h_order_rk uuid,
	payment_option text,
	transfer_type varchar(20),
    source_system varchar(20),
    hash_diff varchar(32),
    processed_dttm timestamp,
    PRIMARY KEY (h_order_rk, processed_dttm)
);


create table if not exists s_transaction (
    h_transaction_rk uuid,
    reference varchar(10),
    clearing_reference varchar(10),
    source_system varchar(20),
    hash_diff varchar(32),
    processed_dttm timestamp,
    PRIMARY KEY (h_transaction_rk, processed_dttm)
);


create table if not exists s_items (
    h_item_rk uuid,
    description text,
    additional_description text,
    article_number varchar(20),
    category varchar(15),
    tax_rate int,
    net_unit_price real,
    gross_unit_price real,
    unit int,
    source_system varchar(20),
    hash_diff varchar(32),
    processed_dttm timestamp,
    PRIMARY KEY (h_item_rk, processed_dttm)
);

create table if not exists s_buyer_person (
    h_buyer_rk uuid,
    first_name varchar(30),
    last_name varchar(30),
    middle_name varchar(30),
    name_suffix varchar(30),
    salutation varchar(15),
    title varchar(5),
    gender varchar(10),
    date_of_birth date,
    company text,
    language varchar(15),
    source_system varchar(20),
    hash_diff varchar(32),
    processed_dttm timestamp,
    PRIMARY KEY (h_buyer_rk, processed_dttm)
);


create table if not exists s_buyer_contact (
    h_buyer_rk uuid,
    email varchar(40),
    mobile varchar(30),
    phone varchar(30),
    fax varchar(30),
    source_system varchar(20),
    hash_diff varchar(32),
    processed_dttm timestamp,
    PRIMARY KEY (h_buyer_rk, processed_dttm)
);



create table if not exists s_buyer_delivery (
    h_buyer_rk uuid,
    first_name varchar(30),
    last_name varchar(30),
    salutation varchar(15),
    street varchar(45),
    street_addition varchar(50),
    street_number varchar(5),
    zip_code int,
    city varchar(30),
    country_code varchar(10),
    company text,
    pick_up_location boolean,
    pick_up_location_name text NULL,
    selected_shipping_method text NULL,
    parcel_service text NULL,
    pick_up_account_id text NULL,
    source_system varchar(20),
    hash_diff varchar(32),
    processed_dttm timestamp,
    PRIMARY KEY (h_buyer_rk, processed_dttm)
);


create table if not exists s_buyer_billing (
    h_buyer_rk uuid,
    first_name varchar(30),
    last_name varchar(30),
    salutation varchar(15),
    street varchar(45),
    street_addition varchar(50),
    street_number varchar(5),
    zip_code int,
    city varchar(30),
    country_code varchar(10),
    company text,
    source_system varchar(20),
    hash_diff varchar(32),
    processed_dttm timestamp,
    PRIMARY KEY (h_buyer_rk, processed_dttm)
);



CREATE TABLE if not exists l_shop_order (
    shop_order_id uuid DEFAULT uuid_generate_v4 (),
    h_order_rk uuid,
    h_shop_rk uuid,
    source_system text,
    processed_dttm timestamp,
    UNIQUE (h_order_rk, h_shop_rk)
);


CREATE TABLE if not exists l_transaction_items (
    shop_order_id uuid DEFAULT uuid_generate_v4 (),
    h_transaction_rk uuid,
    h_item_rk uuid,
    source_system text,
    processed_dttm timestamp,
    UNIQUE (h_transaction_rk, h_item_rk)
);


CREATE TABLE if not exists l_buyer_transaction_items (
    l_buyer_transaction_item_rk uuid DEFAULT uuid_generate_v4 (),
    h_buyer_rk uuid,
    h_item_rk uuid,
    h_transaction_rk uuid,
    source_system text,
    processed_dttm timestamp,
    UNIQUE (h_transaction_rk, h_item_rk, h_transaction_rk)
);

CREATE TABLE if not exists l_partner_transaction (
    partner_transaction_id uuid DEFAULT uuid_generate_v4 (),
    h_partner_rk uuid,
    h_transaction_rk uuid,
    source_system text,
    processed_dttm timestamp,
    UNIQUE (h_partner_rk, h_transaction_rk)
);


create table if not exists core.l_s_transaction_items (
    l_transaction_items_rk  uuid,
    quantity int,
    net_total_price real,
    gross_total_price real,
    discount real,
    source_system text,
    processed_dttm timestamp,
    PRIMARY KEY (l_transaction_items_rk, processed_dttm)
);


