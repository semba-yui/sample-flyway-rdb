-- user

CREATE TABLE schema1."user"
(
    user_id        BIGINT GENERATED ALWAYS AS IDENTITY
        CONSTRAINT user_pk
            PRIMARY KEY,
    name           VARCHAR(255)                        NOT NULL,
    email          VARCHAR(255)                        NOT NULL,
    password_hash  VARCHAR(255)                        NOT NULL,
    prefecture     VARCHAR(5),
    city           VARCHAR(50),
    street_address VARCHAR(255),
    building_name  VARCHAR(255),
    postal_code    VARCHAR(8),
    phone_number   VARCHAR(11),
    deleted_at     TIMESTAMP,
    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

COMMENT ON TABLE schema1."user" IS 'ユーザー';

COMMENT ON COLUMN schema1."user".user_id IS 'ユーザーID';

COMMENT ON COLUMN schema1."user".name IS 'ユーザー名';

COMMENT ON COLUMN schema1."user".email IS 'メールアドレス';

COMMENT ON COLUMN schema1."user".password_hash IS 'パスワード（ハッシュ値）';

COMMENT ON COLUMN schema1."user".prefecture IS '都道府県';

COMMENT ON COLUMN schema1."user".city IS '市区町村';

COMMENT ON COLUMN schema1."user".street_address IS '番地';

COMMENT ON COLUMN schema1."user".building_name IS '建物名/アパート名';

COMMENT ON COLUMN schema1."user".postal_code IS '郵便番号（ハイフン付）';

COMMENT ON COLUMN schema1."user".phone_number IS '電話番号';

COMMENT ON COLUMN schema1."user".deleted_at IS '削除日時';

COMMENT ON COLUMN schema1."user".created_at IS '登録日時';

COMMENT ON COLUMN schema1."user".updated_at IS '更新日時';

CREATE UNIQUE INDEX user_email_unique_index ON schema1."user" (email) WHERE "user".deleted_at IS NULL;

CREATE UNIQUE INDEX user_phone_number_unique_index ON schema1."user" (phone_number) WHERE "user".deleted_at IS NULL;

-- product_category

CREATE TABLE schema1.product_category
(
    product_category_id BIGINT GENERATED ALWAYS AS IDENTITY
        CONSTRAINT product_category_pk
            PRIMARY KEY,
    name                VARCHAR(50)                         NOT NULL,
    description         VARCHAR(1000)                       NOT NULL,
    deleted_at          TIMESTAMP,
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

COMMENT ON TABLE schema1.product_category IS '商品カテゴリ';

COMMENT ON COLUMN schema1.product_category.name IS 'カテゴリー名';

COMMENT ON COLUMN schema1.product_category.description IS 'カテゴリー説明';

COMMENT ON COLUMN schema1.product_category.deleted_at IS '削除日時';

COMMENT ON COLUMN schema1.product_category.created_at IS '作成日時';

-- product_brand

CREATE TABLE schema1.product_brand
(
    product_brand_id BIGINT GENERATED ALWAYS AS IDENTITY
        CONSTRAINT product_brand_pk
            PRIMARY KEY,
    name             VARCHAR(50)                         NOT NULL,
    description      VARCHAR(1000)                       NOT NULL,
    deleted_at       TIMESTAMP,
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

COMMENT ON TABLE schema1.product_brand IS '商品ブランド';

COMMENT ON COLUMN schema1.product_brand.name IS 'ブランド名';

COMMENT ON COLUMN schema1.product_brand.description IS 'ブランド説明';

COMMENT ON COLUMN schema1.product_brand.deleted_at IS '削除日時';

COMMENT ON COLUMN schema1.product_brand.created_at IS '作成日時';

COMMENT ON COLUMN schema1.product_brand.updated_at IS '更新日時';

-- store

CREATE TABLE schema1.store
(
    store_id   BIGINT GENERATED ALWAYS AS IDENTITY
        CONSTRAINT store_pk
            PRIMARY KEY,
    name       VARCHAR(100),
    valid_from TIMESTAMP                           NOT NULL,
    valid_to   TIMESTAMP                           NOT NULL,
    deleted_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

COMMENT ON TABLE schema1.store IS '店舗';

COMMENT ON COLUMN schema1.store.store_id IS '店舗ID';

COMMENT ON COLUMN schema1.store.name IS '店舗名';

COMMENT ON COLUMN schema1.store.valid_from IS '開始日時';

COMMENT ON COLUMN schema1.store.valid_to IS '終了日時';

COMMENT ON COLUMN schema1.store.deleted_at IS '削除日時';

COMMENT ON COLUMN schema1.store.created_at IS '作成日時';

COMMENT ON COLUMN schema1.store.updated_at IS '更新日時';

CREATE INDEX store_valid_from_valid_to_index
    ON schema1.store (valid_from, valid_to)
    WHERE (deleted_at IS NULL);

-- order

CREATE TABLE schema1."order"
(
    order_id                BIGINT GENERATED ALWAYS AS IDENTITY
        CONSTRAINT order_pk
            PRIMARY KEY,
    user_id                 BIGINT                              NOT NULL
        CONSTRAINT user_id_fk
            REFERENCES schema1."user",
    total_price             NUMERIC(10, 2)                      NOT NULL,
    status                  VARCHAR(20)                         NOT NULL,
    order_date              TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    shipping_prefecture     VARCHAR(5)                          NOT NULL,
    shipping_city           VARCHAR(50)                         NOT NULL,
    shipping_street_address VARCHAR(255)                        NOT NULL,
    shipping_building_name  VARCHAR(255),
    payment_method          VARCHAR(20)                         NOT NULL,
    payment_status          VARCHAR(20)                         NOT NULL,
    payment_date            TIMESTAMP,
    created_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
) PARTITION BY RANGE (order_date);

COMMENT ON TABLE schema1."order" IS '注文';

COMMENT ON COLUMN schema1."order".order_id IS '注文ID';

COMMENT ON COLUMN schema1."order".user_id IS 'ユーザーID';

COMMENT ON COLUMN schema1."order".total_price IS '合計金額';

COMMENT ON COLUMN schema1."order".status IS 'ステータス';

COMMENT ON COLUMN schema1."order".order_date IS '注文日時';

COMMENT ON COLUMN schema1."order".shipping_prefecture IS '配送先都道府県';

COMMENT ON COLUMN schema1."order".shipping_city IS '配送先市区町村';

COMMENT ON COLUMN schema1."order".shipping_street_address IS '配送先番地';

COMMENT ON COLUMN schema1."order".shipping_building_name IS '配送先建物名';

COMMENT ON COLUMN schema1."order".payment_method IS '支払いステータス';

COMMENT ON COLUMN schema1."order".payment_status IS '支払いステータス';

COMMENT ON COLUMN schema1."order".payment_date IS '支払い日時';

COMMENT ON COLUMN schema1."order".created_at IS '作成日時';

COMMENT ON COLUMN schema1."order".updated_at IS '更新日時';

CREATE TABLE order_2024_01 PARTITION OF schema1."order"
    FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

CREATE TABLE order_2024_02 PARTITION OF schema1."order"
    FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');

CREATE TABLE order_2024_03 PARTITION OF schema1."order"
    FOR VALUES FROM ('2024-03-01') TO ('2024-04-01');

CREATE TABLE order_2024_04 PARTITION OF schema1."order"
    FOR VALUES FROM ('2024-04-01') TO ('2024-05-01');

CREATE TABLE order_2024_05 PARTITION OF schema1."order"
    FOR VALUES FROM ('2024-05-01') TO ('2024-06-01');

CREATE TABLE order_2024_06 PARTITION OF schema1."order"
    FOR VALUES FROM ('2024-06-01') TO ('2024-07-01');

CREATE TABLE order_2024_07 PARTITION OF schema1."order"
    FOR VALUES FROM ('2024-07-01') TO ('2024-08-01');

CREATE TABLE order_2024_08 PARTITION OF schema1."order"
    FOR VALUES FROM ('2024-08-01') TO ('2024-09-01');

CREATE TABLE order_2024_09 PARTITION OF schema1."order"
    FOR VALUES FROM ('2024-09-01') TO ('2024-10-01');

CREATE TABLE order_2024_10 PARTITION OF schema1."order"
    FOR VALUES FROM ('2024-10-01') TO ('2024-11-01');

CREATE TABLE order_2024_11 PARTITION OF schema1."order"
    FOR VALUES FROM ('2024-11-01') TO ('2024-12-01');

CREATE TABLE order_2024_12 PARTITION OF schema1."order"
    FOR VALUES FROM ('2024-12-01') TO ('2025-01-01');

-- product

CREATE TABLE schema1.product
(
    product_id          BIGINT GENERATED ALWAYS AS IDENTITY
        CONSTRAINT product_pk
            PRIMARY KEY,
    name                VARCHAR(100)                        NOT NULL,
    description         VARCHAR(1000)                       NOT NULL,
    sku                 VARCHAR(20)                         NOT NULL,
    product_brand_id    BIGINT                              NOT NULL
        CONSTRAINT product_brand_id_fk
            REFERENCES schema1.product_brand,
    product_category_id BIGINT                              NOT NULL
        CONSTRAINT product_category_id_fk
            REFERENCES schema1.product_category,
    price               NUMERIC(10, 2)                      NOT NULL,
    unit                VARCHAR(10)                         NOT NULL,
    valid_from          TIMESTAMP                           NOT NULL,
    valid_to            TIMESTAMP                           NOT NULL,
    deleted_at          TIMESTAMP,
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at           TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

COMMENT ON TABLE schema1.product IS '商品';

COMMENT ON COLUMN schema1.product.product_id IS '商品ID';

COMMENT ON COLUMN schema1.product.name IS '商品名';

COMMENT ON COLUMN schema1.product.description IS '商品の説明';

COMMENT ON COLUMN schema1.product.sku IS 'SKU';

COMMENT ON COLUMN schema1.product.product_brand_id IS 'ブランドID';

COMMENT ON COLUMN schema1.product.product_category_id IS 'カテゴリID';

COMMENT ON COLUMN schema1.product.price IS '商品価格';

COMMENT ON COLUMN schema1.product.unit IS '販売単位';

COMMENT ON COLUMN schema1.product.valid_from IS '販売開始日時';

COMMENT ON COLUMN schema1.product.valid_to IS '販売終了日時';

COMMENT ON COLUMN schema1.product.deleted_at IS '削除日時';

COMMENT ON COLUMN schema1.product.created_at IS '作成日時';

COMMENT ON COLUMN schema1.product.update_at IS '更新日時';

CREATE INDEX product_valid_from_valid_to_index
    ON schema1.product (valid_from, valid_to)
    WHERE (deleted_at IS NULL);

-- order_item

CREATE TABLE schema1.order_item
(
    order_item_id BIGINT GENERATED ALWAYS AS IDENTITY
        CONSTRAINT order_item_pk
            PRIMARY KEY,
    order_id      BIGINT                              NOT NULL
        CONSTRAINT order_id_fk
            REFERENCES schema1."order",
    product_id    BIGINT                              NOT NULL
        CONSTRAINT product_id_fk
            REFERENCES schema1.product,
    order_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    quantity      INTEGER                             NOT NULL,
    price         NUMERIC(10, 2)                      NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
) PARTITION BY RANGE (order_date);

COMMENT ON TABLE schema1.order_item IS '注文商品';

COMMENT ON COLUMN schema1.order_item.order_item_id IS '注文商品ID';

COMMENT ON COLUMN schema1.order_item.order_id IS '注文ID';

COMMENT ON COLUMN schema1.order_item.product_id IS '商品ID';

COMMENT ON COLUMN schema1."order_item".order_date IS '注文日時';

COMMENT ON COLUMN schema1.order_item.quantity IS '注文数';

COMMENT ON COLUMN schema1.order_item.price IS '注文時の商品の単価';

COMMENT ON COLUMN schema1.order_item.created_at IS '作成日時';

COMMENT ON COLUMN schema1.order_item.updated_at IS '更新日時';

CREATE TABLE order_item_2024_01 PARTITION OF schema1.order_item
    FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

CREATE TABLE order_item_2024_02 PARTITION OF schema1.order_item
    FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');

CREATE TABLE order_item_2024_03 PARTITION OF schema1.order_item
    FOR VALUES FROM ('2024-03-01') TO ('2024-04-01');

CREATE TABLE order_item_2024_04 PARTITION OF schema1.order_item
    FOR VALUES FROM ('2024-04-01') TO ('2024-05-01');

CREATE TABLE order_item_2024_05 PARTITION OF schema1.order_item
    FOR VALUES FROM ('2024-05-01') TO ('2024-06-01');

CREATE TABLE order_item_2024_06 PARTITION OF schema1.order_item
    FOR VALUES FROM ('2024-06-01') TO ('2024-07-01');

CREATE TABLE order_item_2024_07 PARTITION OF schema1.order_item
    FOR VALUES FROM ('2024-07-01') TO ('2024-08-01');

CREATE TABLE order_item_2024_08 PARTITION OF schema1.order_item
    FOR VALUES FROM ('2024-08-01') TO ('2024-09-01');

CREATE TABLE order_item_2024_09 PARTITION OF schema1.order_item
    FOR VALUES FROM ('2024-09-01') TO ('2024-10-01');

CREATE TABLE order_item_2024_10 PARTITION OF schema1.order_item
    FOR VALUES FROM ('2024-10-01') TO ('2024-11-01');

CREATE TABLE order_item_2024_11 PARTITION OF schema1.order_item
    FOR VALUES FROM ('2024-11-01') TO ('2024-12-01');

CREATE TABLE order_item_2024_12 PARTITION OF schema1.order_item
    FOR VALUES FROM ('2024-12-01') TO ('2025-01-01');

-- cart

CREATE TABLE schema1.cart
(
    cart_id    BIGINT GENERATED ALWAYS AS IDENTITY
        CONSTRAINT cart_pk
            PRIMARY KEY,
    user_id    BIGINT
        CONSTRAINT cart_user_user_id_fk
            REFERENCES schema1."user",
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

COMMENT ON TABLE schema1.cart IS 'カート';

COMMENT ON COLUMN schema1.cart.cart_id IS 'カートiD';

COMMENT ON COLUMN schema1.cart.user_id IS 'ユーザーID';

COMMENT ON COLUMN schema1.cart.created_at IS '作成日時';

COMMENT ON COLUMN schema1.cart.updated_at IS '更新日時';

-- cart_item

CREATE TABLE schema1.cart_item
(
    cart_item_id BIGINT GENERATED ALWAYS AS IDENTITY
        CONSTRAINT cart_item_pk
            PRIMARY KEY,
    cart_id      INTEGER                             NOT NULL
        CONSTRAINT cart_id_fk
            REFERENCES schema1.cart,
    product_id   INTEGER                             NOT NULL
        CONSTRAINT product_id_fk
            REFERENCES schema1.product,
    quantity     INTEGER                             NOT NULL,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

COMMENT ON TABLE schema1.cart_item IS 'カート商品';

COMMENT ON COLUMN schema1.cart_item.cart_item_id IS 'カート商品ID';

COMMENT ON COLUMN schema1.cart_item.cart_id IS 'カートID';

COMMENT ON COLUMN schema1.cart_item.product_id IS '商品ID';

COMMENT ON COLUMN schema1.cart_item.quantity IS '商品数量';

COMMENT ON COLUMN schema1.cart_item.created_at IS '作成日時';

COMMENT ON COLUMN schema1.cart_item.updated_at IS '更新日時';
