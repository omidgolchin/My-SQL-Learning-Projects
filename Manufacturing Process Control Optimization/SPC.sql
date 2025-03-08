SELECT 
    b.operator AS operator, 
    b.row_number AS row_number, 
    b.height AS height, 
    b.avg_height AS avg_height, 
    b.stddev_height AS stddev_height, 
    b.ucl AS ucl, 
    b.lcl AS lcl, 
    b.height NOT BETWEEN b.lcl AND b.ucl AS alert
FROM (
    SELECT 
        operator, 
        ROW_NUMBER() OVER (PARTITION BY operator ORDER BY item_no) AS row_number, 
        height, 
        AVG(height) OVER w AS avg_height, 
        STDDEV(height) OVER w AS stddev_height, 
        AVG(height) OVER w + 3 * STDDEV(height) OVER w / SQRT(5) AS ucl, 
        AVG(height) OVER w - 3 * STDDEV(height) OVER w / SQRT(5) AS lcl
    FROM manufacturing_parts
    WINDOW w AS (PARTITION BY operator ORDER BY item_no ROWS BETWEEN 4 PRECEDING AND CURRENT ROW)
) AS b
WHERE b.row_number >= 5
ORDER BY b.operator, b.row_number;
