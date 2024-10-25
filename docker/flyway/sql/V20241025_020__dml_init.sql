-- user

INSERT INTO schema1."user" (name, email, password_hash, prefecture, city, street_address, building_name, postal_code,
                            phone_number, deleted_at, created_at, updated_at)
VALUES ('テスト太郎1',
        'test1@example.com',
        '$2y$10$H0eCzNWF/aOAub44DkJiG.R6oAQmTx1nt6Zn8ll8j/NSiC.DNjeEa',
        '東京都',
        '千代田区',
        '千代田１−１',
        '皇居',
        '100-8111',
        '00000000001',
        NULL,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1."user" (name, email, password_hash, prefecture, city, street_address, building_name, postal_code,
                            phone_number, deleted_at, created_at, updated_at)
VALUES ('テスト太郎2',
        'test2@example.com',
        '$2y$10$H0eCzNWF/aOAub44DkJiG.R6oAQmTx1nt6Zn8ll8j/NSiC.DNjeEa',
        '東京都',
        '千代田区',
        '千代田１−１',
        '皇居',
        '100-8111',
        '00000000002',
        NULL,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1."user" (name, email, password_hash, prefecture, city, street_address, building_name, postal_code,
                            phone_number, deleted_at, created_at, updated_at)
VALUES ('テスト太郎3',
        'test3@example.com',
        '$2y$10$H0eCzNWF/aOAub44DkJiG.R6oAQmTx1nt6Zn8ll8j/NSiC.DNjeEa',
        '東京都',
        '千代田区',
        '千代田１−１',
        '皇居',
        '100-8111',
        '00000000003',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1."user" (name, email, password_hash, prefecture, city, street_address, building_name, postal_code,
                            phone_number, deleted_at, created_at, updated_at)
VALUES ('テスト太郎4',
        'test4@example.com',
        '$2y$10$H0eCzNWF/aOAub44DkJiG.R6oAQmTx1nt6Zn8ll8j/NSiC.DNjeEa',
        '東京都',
        '千代田区',
        '千代田１−１',
        '皇居',
        '100-8111',
        '00000000004',
        NULL,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

-- store

INSERT INTO schema1.store (name, valid_from, valid_to, deleted_at, created_at, updated_at)
VALUES ('テスト店舗01',
        '2024-01-01 00:00:00',
        '2999-12-31 23:59:59',
        NULL,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1.store (name, valid_from, valid_to, deleted_at, created_at, updated_at)
VALUES ('テスト店舗02',
        '2024-01-01 00:00:00',
        '2999-12-31 23:59:59',
        NULL,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1.store (name, valid_from, valid_to, deleted_at, created_at, updated_at)
VALUES ('テスト店舗03',
        '2024-01-01 00:00:00',
        '2999-12-31 23:59:59',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

-- product_category

INSERT INTO schema1.product_category (name, description, deleted_at, created_at, updated_at)
VALUES ('カテゴリ01',
        'テストカテゴリー01',
        NULL,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1.product_category (name, description, deleted_at, created_at, updated_at)
VALUES ('カテゴリ02',
        'テストカテゴリー02',
        NULL,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1.product_category (name, description, deleted_at, created_at, updated_at)
VALUES ('カテゴリ03',
        'テストカテゴリー03',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

-- product_brand

INSERT INTO schema1.product_brand (name, description, deleted_at, created_at, updated_at)
VALUES ('ブランド01',
        'テストブランド01',
        NULL,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1.product_brand (name, description, deleted_at, created_at, updated_at)
VALUES ('ブランド02',
        'テストブランド02',
        NULL,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1.product_brand (name, description, deleted_at, created_at, updated_at)
VALUES ('ブランド03',
        'テストブランド03',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

-- product

INSERT INTO schema1.product (name, description, sku, product_brand_id, product_category_id, price, unit, valid_from,
                             valid_to, deleted_at, created_at, update_at)
VALUES ('商品01',
        'テスト商品01',
        'SKU01',
        1,
        1,
        1000,
        '個',
        '2024-01-01 00:00:00',
        '2999-12-31 23:59:59',
        NULL,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1.product (name, description, sku, product_brand_id, product_category_id, price, unit, valid_from,
                             valid_to, deleted_at, created_at, update_at)
VALUES ('商品02',
        'テスト商品02',
        'SKU01',
        1,
        2,
        2000,
        '個',
        '2024-01-01 00:00:00',
        '2999-12-31 23:59:59',
        NULL,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1.product (name, description, sku, product_brand_id, product_category_id, price, unit, valid_from,
                             valid_to, deleted_at, created_at, update_at)
VALUES ('商品03',
        'テスト商品03',
        'SKU01',
        2,
        1,
        1000,
        '枚',
        '2024-01-01 00:00:00',
        '2999-12-31 23:59:59',
        NULL,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1.product (name, description, sku, product_brand_id, product_category_id, price, unit, valid_from,
                             valid_to, deleted_at, created_at, update_at)
VALUES ('商品04',
        'テスト商品04',
        'SKU01',
        2,
        2,
        10,
        'kg',
        '2024-01-01 00:00:00',
        '2999-12-31 23:59:59',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

-- order

INSERT INTO schema1."order" (user_id, total_price, status, order_date, shipping_prefecture, shipping_city,
                             shipping_street_address, shipping_building_name, payment_method, payment_status,
                             payment_date, created_at, updated_at)
VALUES (1,
        12000,
        'ORDERED',
        '2024-09-01 10:00:00',
        '東京都',
        '千代田区',
        '千代田１−１',
        '皇居',
        'CREDIT_CARD',
        'PAID',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1."order" (user_id, total_price, status, order_date, shipping_prefecture, shipping_city,
                             shipping_street_address, shipping_building_name, payment_method, payment_status,
                             payment_date, created_at, updated_at)
VALUES (2,
        1000,
        'ORDERED',
        '2024-09-02 10:00:00',
        '東京都',
        '千代田区',
        '千代田１−１',
        NULL,
        'UNPAID',
        'BANK_TRANSFER',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

-- order_item

INSERT INTO schema1.order_item (order_id, product_id, order_date, quantity, price, created_at, updated_at)
VALUES (1,
        1,
        '2024-09-01 10:00:00',
        10,
        10000,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1.order_item (order_id, product_id, order_date, quantity, price, created_at, updated_at)
VALUES (1,
        2,
        '2024-09-01 10:00:00',
        1,
        2000,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO schema1.order_item (order_id, product_id, order_date, quantity, price, created_at, updated_at)
VALUES (2,
        1,
        '2024-09-02 10:00:00',
        1,
        1000,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

-- cart

INSERT INTO schema1.cart (user_id, created_at, updated_at)
VALUES (4,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

-- cart_item

INSERT INTO schema1.cart_item (cart_id, product_id, quantity, created_at, updated_at)
VALUES (1,
        3,
        2,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);
