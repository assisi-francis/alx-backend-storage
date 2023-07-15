-- A SQL script that lists all bands with Glam rock as main style
-- ranked by their loongevity
-- column name: band_name and lifespan (using 2022 instead of YEAR(CURDATED())
-- Using attributes formed and split for computing lifespan
SELECT band_name,
       (YEAR('2022-01-01') - YEAR(formed)) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
