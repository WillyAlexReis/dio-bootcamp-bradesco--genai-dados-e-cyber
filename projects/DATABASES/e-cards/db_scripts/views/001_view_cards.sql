CREATE VIEW vw_cards AS
SELECT
    c.id,
    c.name,
    c.hp,
    t.name AS type,
    s.name AS stage,
    c.info,
    c.attack,
    c.damage,
    c.weak,
    c.resistance,
    c.retreat,
    c.card_number_in_collection,
    col.collection_set_name,
    col.release_date,
    col.total_cards_in_collection
FROM tbl_cards c
INNER JOIN tbl_types t
    ON c.type_id = t.id
INNER JOIN tbl_stages s
    ON c.stage_id = s.id
INNER JOIN tbl_collections col
    ON c.collection_id = col.id;