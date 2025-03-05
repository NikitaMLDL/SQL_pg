-- General select
SELECT 
    DATE(v.time_check) AS violation_date,
    COUNT(*) AS total_violations,
    COUNT(CASE WHEN v.refuse_code = 0 THEN 1 END) AS violations_with_refuse_0,
    COUNT(DISTINCT CASE WHEN o.oper_code = 29 THEN v.tr_viol_id END) AS violations_with_oper_29,
    COUNT(DISTINCT CASE 
        WHEN o.oper_code IS NULL AND v.refuse_code = 0 THEN v.tr_viol_id 
    END) AS violations_without_oper_29_and_refuse_0
FROM viols as v
LEFT JOIN opers o ON v.tr_viol_id = o.tr_viol_id AND o.oper_code = 29
WHERE v.time_check BETWEEN '2018-04-01' AND '2018-04-20'
GROUP BY DATE(v.time_check)
ORDER BY violation_date;

-- CTE
WITH violations AS (
    SELECT 
        DATE(time_check) AS violation_date, 
        tr_viol_id, 
        refuse_code 
    FROM viols 
    WHERE time_check BETWEEN '2018-04-01' AND '2018-04-20'
),
oper_29 AS (
    SELECT DISTINCT tr_viol_id 
    FROM opers 
    WHERE oper_code = 29
)
SELECT 
    v.violation_date,
    COUNT(*) AS total_violations,
    COUNT(CASE WHEN v.refuse_code = 0 THEN 1 END) AS violations_with_refuse_0,
    COUNT(DISTINCT o.tr_viol_id) AS violations_with_oper_29,
    COUNT(DISTINCT CASE 
        WHEN o.tr_viol_id IS NULL AND v.refuse_code = 0 THEN v.tr_viol_id 
    END) AS violations_without_oper_29_and_refuse_0
FROM violations as v
LEFT JOIN oper_29 as o ON v.tr_viol_id = o.tr_viol_id
GROUP BY v.violation_date
ORDER BY v.violation_date;
