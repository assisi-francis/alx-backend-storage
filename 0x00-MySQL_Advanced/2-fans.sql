-- A SQL script that ranks country origins of bands 
-- ordered by the number of (non-unique) fans
-- column names: origin and nb_fans
-- script can be executed on any database
SELECT origin, SUM(nb_fans) AS total_fans
  FROM metal_bands
  GROUP BY origin
  ORDER BY total_fans DESC;
