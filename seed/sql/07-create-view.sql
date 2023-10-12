CREATE VIEW breed_count AS
SELECT * FROM
(
    SELECT
        c.breed,
        c.id
    FROM
        dog a
        INNER JOIN breedLookup c
            ON c.id = a.breedId
) t
PIVOT(
    COUNT(id)
    FOR breed IN ([Am Bulldog], [Blue Tick]
, [Labrador], [Gr Shepard])
) AS pivot_table;
