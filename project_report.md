# Project Report — IBM HR Employee Attrition Analysis

**Author:** Hassan Ali
**Date:** June 2026
**Tools:** Excel, SQL, Python, Power BI

---

## 1. Objective

Identify the main factors driving employee attrition and the highest-risk employee groups, so HR can take targeted, cost-effective retention action.

## 2. Dataset

- 1,470 employee records, 35 columns
- IBM HR Analytics dataset (public, Kaggle)
- Target column: `Attrition` (Yes / No)

## 3. Data Cleaning

| Check | Action |
|-------|--------|
| Constant columns (EmployeeCount, Over18, StandardHours) | Dropped — no analytical value |
| ID column (EmployeeNumber) | Dropped — unique identifier |
| Missing values | None found |
| Data types | Verified correct |

## 4. Key Results

**Overall attrition:** 16.1% (237 of 1,470 employees left)

**Attrition by Overtime (strongest driver):**
- Works overtime: 30.5%
- No overtime: 10.4%
- → 3x higher with overtime

**Attrition by Job Role (top 3):**
- Sales Representative: 39.8%
- Laboratory Technician: 23.9%
- Human Resources: 23.1%

**Attrition by Age Group:**
- 18–25: 35.8% (highest)
- 26–35: 19.1%
- 36–45: 9.2%
- 46–60: 12.5%

**Other drivers:**
- Single employees: 25.5% vs Married: 12.5%
- Travel Frequently: 24.9% vs Non-Travel: 8.0%
- Leavers earn ~30% less on average

## 5. Recommendations

1. Reduce mandatory overtime (biggest, cheapest lever)
2. Targeted retention for young (18–25) employees
3. Review Sales Representative pay and workload
4. Flag high-risk profile (single + under 35 + overtime)
5. Address the 30% pay gap for at-risk groups

---

# Power BI Dashboard — Build Guide

## Step 1 — Load Data
- Get Data → Text/CSV → WA_Fn-UseC_-HR-Employee-Attrition.csv → Load

## Step 2 — Create Measures
```
Total Employees = COUNTROWS(hr_employees)
Attrition Count = CALCULATE(COUNTROWS(hr_employees), hr_employees[Attrition]="Yes")
Attrition Rate % = DIVIDE([Attrition Count], [Total Employees]) * 100
```

## Step 3 — Build Visuals

**Row 1 — KPI Cards:**
- Total Employees (1,470)
- Attrition Rate % (16.1%)
- Employees Left (237)

**Row 2 — Charts:**
- Clustered Column: Axis = OverTime, Value = Attrition Rate %
- Bar Chart: Axis = JobRole, Value = Attrition Rate % (sorted)
- Column: Axis = Age Group, Value = Attrition Rate %
- Donut: Department split

**Row 3 — Slicers:**
- Department, OverTime, MaritalStatus (so viewer can filter)

## Step 4 — Format
- Title: "HR Employee Attrition Dashboard"
- Highlight overtime/high-attrition bars in RED
- Primary color navy (#1F3A5F)

## Step 5 — Save & Export
- Save as hr_attrition_dashboard.pbix
- Export screenshot for GitHub README and LinkedIn
