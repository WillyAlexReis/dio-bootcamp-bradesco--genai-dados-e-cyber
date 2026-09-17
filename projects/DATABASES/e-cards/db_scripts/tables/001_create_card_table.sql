CREATE TABLE tbl_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE tbl_stages (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE tbl_collections (
    id SERIAL PRIMARY KEY,
    collection_set_name VARCHAR(100) NOT NULL,
    release_date DATE NOT NULL,
    total_cards_in_collection SMALLINT NOT NULL
);

CREATE TABLE tbl_cards (
    id SERIAL PRIMARY KEY,
    hp SMALLINT,
    name VARCHAR(80) NOT NULL,
    info TEXT,
    attack VARCHAR(100),
    damage VARCHAR(20),
    weak VARCHAR(30),
    resistance VARCHAR(30),
    retreat SMALLINT,
    card_number_in_collection SMALLINT NOT NULL,

    collection_id INTEGER NOT NULL,
    type_id INTEGER NOT NULL,
    stage_id INTEGER NOT NULL,

    CONSTRAINT fk_cards_collection
    FOREIGN KEY (collection_id)
    REFERENCES tbl_collections(id),

    CONSTRAINT fk_cards_type
    FOREIGN KEY (type_id)
    REFERENCES tbl_types(id),

    CONSTRAINT fk_cards_stage
    FOREIGN KEY (stage_id)
    REFERENCES tbl_stages(id)
);

CREATE INDEX idx_cards_collection_id
ON tbl_cards(collection_id);

CREATE INDEX idx_cards_type_id
ON tbl_cards(type_id);

CREATE INDEX idx_cards_stage_id
ON tbl_cards(stage_id);