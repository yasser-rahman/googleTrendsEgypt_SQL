SELECT
 term,
 ARRAY_AGG(STRUCT(rank,week) ORDER BY week DESC LIMIT 1) x, 
 score,
 region_code
FROM
 `excellent-setup-376411.google_trends.international_top_terms`
WHERE
 refresh_date = (SELECT MAX(refresh_date)FROM `excellent-setup-376411.google_trends.international_top_terms`) and
 country_name = 'Egypt'
GROUP BY
 term, score, region_code
ORDER BY
 (SELECT rank FROM UNNEST(x))
