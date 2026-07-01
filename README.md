# 👥 HR – Employee Attrition Analysis

Analyzing 1,470 employee records to find the main reasons staff leave — and which groups are most at risk.

**Tools:** Python · SQL · Excel · Power BI

---

## 📌 Problem
Losing employees is expensive. The company needed to know: **who is most likely to leave, and why?** — so it could act before good people quit.

## 📊 Dataset
- 1,470 employee records
- Fields: age, department, job role, overtime, salary, years at company, attrition (yes / no)

## 🔍 Process
1. **Cleaned** the data in Python (pandas) — handled missing values and standardized categories.
2. **Queried** with SQL to compare attrition rates across different employee groups.
3. **Analyzed** which factors (overtime, salary, role) linked most strongly to leaving.
4. **Visualized** the high-risk groups in a Power BI dashboard.

## 💡 Key Findings
- Employees working **overtime were 3x more likely to leave** (30.5% vs 10.4%).
- Overtime was the **strongest single driver** of attrition in the data.

## ✅ Recommendation
Reduce or better manage **overtime**, especially in high-risk teams, and monitor overworked staff closely. This targets the biggest cause of attrition directly.

---

## 📷 Dashboard
<!-- Dashboard screenshot upload karke neeche link add karo -->
![Dashboard](dashboard.png)

## 📁 Files
- `analysis.ipynb` — Python cleaning & analysis
- `queries.sql` — SQL queries
- `dashboard.pbix` — Power BI dashboard
