WITH top_industries AS (
    SELECT i.industry, COUNT(*) AS num_unicorns
    FROM industries i
    JOIN dates d ON i.company_id = d.company_id
    WHERE EXTRACT(year FROM d.date_joined) IN (2019, 2020, 2021)
    GROUP BY i.industry
    ORDER BY num_unicorns DESC
    LIMIT 3
),
yearly_rankings AS (
    SELECT 
        COUNT(*) AS num_unicorns,
        i.industry,
        EXTRACT(year FROM d.date_joined) AS year,
        AVG(f.valuation) / 1000000000 AS avg_valuation_billions
    FROM industries i
    JOIN dates d ON i.company_id = d.company_id
    JOIN funding f ON d.company_id = f.company_id
    GROUP BY i.industry, year
)
SELECT 
    industry,
    year,
    num_unicorns,
    ROUND(avg_valuation_billions, 2) AS average_valuation_billions
FROM yearly_rankings
WHERE year IN (2019, 2020, 2021)
  AND industry IN (SELECT industry FROM top_industries)
ORDER BY year DESC, num_unicorns DESC;
