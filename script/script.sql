CREATE OR REPLACE VIEW v_categories AS
SELECT rs.*
FROM (
    SELECT
        c.id,
        c.name,
        'en' AS lang,
        'English' AS language,
        c.state
    FROM categories c
    UNION
    SELECT
        c.id,
        ct.translation AS name,
        sl.code AS lang,
        sl.name AS language,
        c.state
    FROM category_translations ct
    JOIN categories c
        ON c.id = ct.category_id
    JOIN supported_languages sl
        ON sl.id = ct.supported_language_id
) rs
;

CREATE OR REPLACE VIEW v_treatments AS
SELECT rs.*
FROM (
    SELECT
        t.id,
        t.category_id,
        t.name,
        'en' AS lang,
        'English' AS language,
        t.state
    FROM treatments t
    UNION
    SELECT
        t.id,
        t.category_id,
        tt.translation AS name,
        sl.code AS lang,
        sl.name AS language,
        t.state
    FROM treatment_translations tt
    JOIN treatments t
        ON t.id = tt.treatment_id
    JOIN supported_languages sl
        ON sl.id = tt.supported_language_id
) rs
;