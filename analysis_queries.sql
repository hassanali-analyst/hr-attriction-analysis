-- =====================================================================
-- IBM HR Analytics — Employee Attrition Analysis (SQL)
-- Author: Hassan Ali
-- Table assumed: hr_employees  (1,470 rows)
-- =====================================================================

-- -------------------------------------------------------------------
-- 1. OVERALL ATTRITION RATE
-- -------------------------------------------------------------------
SELECT
    COUNT(*)                                                AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)        AS employees_left,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
          * 100.0 / COUNT(*), 1)                            AS attrition_rate_pct
FROM hr_employees;
-- Result: 16.1% overall attrition


-- -------------------------------------------------------------------
-- 2. ATTRITION BY OVERTIME  (STRONGEST DRIVER)
-- -------------------------------------------------------------------
SELECT
    OverTime,
    COUNT(*)                                          AS employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)  AS left_count,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
          * 100.0 / COUNT(*), 1)                      AS attrition_rate_pct
FROM hr_employees
GROUP BY OverTime
ORDER BY attrition_rate_pct DESC;
-- Result: Overtime = 30.5% vs No Overtime = 10.4% (3x higher)


-- -------------------------------------------------------------------
-- 3. ATTRITION BY JOB ROLE
-- -------------------------------------------------------------------
SELECT
    JobRole,
    COUNT(*)                                          AS employees,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
          * 100.0 / COUNT(*), 1)                      AS attrition_rate_pct
FROM hr_employees
GROUP BY JobRole
ORDER BY attrition_rate_pct DESC;
-- Result: Sales Representative highest at 39.8%


-- -------------------------------------------------------------------
-- 4. ATTRITION BY DEPARTMENT
-- -------------------------------------------------------------------
SELECT
    Department,
    COUNT(*)                                          AS employees,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
          * 100.0 / COUNT(*), 1)                      AS attrition_rate_pct
FROM hr_employees
GROUP BY Department
ORDER BY attrition_rate_pct DESC;


-- -------------------------------------------------------------------
-- 5. INCOME COMPARISON: LEFT vs STAYED
-- -------------------------------------------------------------------
SELECT
    Attrition,
    COUNT(*)                          AS employees,
    ROUND(AVG(MonthlyIncome), 0)      AS avg_monthly_income,
    ROUND(AVG(YearsAtCompany), 1)     AS avg_years_at_company
FROM hr_employees
GROUP BY Attrition;
-- Result: leavers earn ~30% less and have shorter tenure


-- -------------------------------------------------------------------
-- 6. ATTRITION BY BUSINESS TRAVEL
-- -------------------------------------------------------------------
SELECT
    BusinessTravel,
    COUNT(*)                                          AS employees,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
          * 100.0 / COUNT(*), 1)                      AS attrition_rate_pct
FROM hr_employees
GROUP BY BusinessTravel
ORDER BY attrition_rate_pct DESC;
-- Result: Travel Frequently = 24.9% (highest)


-- -------------------------------------------------------------------
-- 7. HIGH-RISK PROFILE  (combining top risk factors)
-- -------------------------------------------------------------------
SELECT
    COUNT(*)                                          AS at_risk_employees,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
          * 100.0 / COUNT(*), 1)                      AS attrition_rate_pct
FROM hr_employees
WHERE OverTime = 'Yes'
  AND MaritalStatus = 'Single'
  AND Age < 35;
-- Identifies the highest-risk employee segment for targeted retention
