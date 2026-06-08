# 👥 IBM HR Analytics — Employee Attrition Analysis

**Analyzing 1,470 employee records to find why people quit — and what HR can do to keep them.**

*By Hassan Ali | Tools: Excel · SQL · Python · Power BI*

---

## 📌 Business Problem

Employee attrition is expensive — companies lose money on recruitment, training, and lost experience. HR needs to know:

> **Which factors drive employees to leave, and which groups are at highest risk — so we can take action before they quit?**

This project analyzes IBM's HR dataset to answer that question with clear, actionable insights.

---

## 📊 The Dataset

- **1,470 employee records**, 35 columns
- Source: IBM HR Analytics Employee Attrition dataset (Kaggle, public)
- Key fields: `Attrition`, `OverTime`, `JobRole`, `Department`, `MonthlyIncome`, `Age`, `MaritalStatus`, `BusinessTravel`, `YearsAtCompany`

---

## 🔍 Key Findings

| # | Question | Finding |
|---|----------|---------|
| 1 | Overall attrition rate? | **16.1%** (237 of 1,470 left) |
| 2 | Biggest driver? | ⭐ **Overtime — 30.5% vs 10.4% (3x higher)** |
| 3 | Highest-risk role? | Sales Representative (39.8%) |
| 4 | Highest-risk age? | 18–25 year olds (35.8%) |
| 5 | Does pay matter? | Leavers earn ~30% less on average |
| 6 | Marital status? | Single employees leave 2x more than married |

### ⭐ Headline Insight

**Employees who work overtime are 3x more likely to leave (30.5% vs 10.4%). Combined with younger age, single status, and lower pay, overtime is the single strongest predictor of attrition.**

![Overtime Impact](visuals/02_overtime_attrition.png)

### Attrition by Job Role

![Job Role Attrition](visuals/03_jobrole_attrition.png)

---

## 💡 Recommendations

1. **Reduce mandatory overtime** — especially in Sales and Lab roles where it's highest. This is the #1 lever.
2. **Targeted retention for young employees (18–25)** — mentorship, clear career paths, faster promotions.
3. **Review Sales Representative compensation** — 39.8% attrition signals a structural pay or workload problem.
4. **Flag the high-risk profile** — single + under 35 + works overtime — for proactive HR check-ins.
5. **Close the pay gap** — leavers earn 30% less; review salaries for at-risk groups.

---

## 🛠️ How I Built It

| Step | Tool | What I did |
|------|------|-----------|
| Data cleaning | Python (pandas) | Dropped constant/ID columns, checked data quality |
| Analysis | SQL | 7 queries: attrition by overtime, role, department, income |
| Visualization | Python (matplotlib) | 4 charts highlighting key drivers |
| Dashboard | Power BI | Interactive HR dashboard (see `/docs` for build steps) |

---

## 📁 Repository Structure

```
hr-attrition-analysis/
├── data/        # IBM HR dataset (CSV)
├── python/      # analysis.py — full analysis + charts
├── sql/         # analysis_queries.sql — 7 SQL queries
├── visuals/     # 4 charts (PNG)
├── docs/        # Project report + Power BI build guide
└── README.md    # this file
```

## ▶️ How to Run

```bash
cd python
pip install pandas matplotlib
python analysis.py
```

---

## 🎓 What I Learned

- Identifying attrition drivers through segmentation analysis
- Comparing groups using attrition rates (not just counts)
- Translating HR data into retention recommendations
- Recognising that the strongest insight (overtime) leads to a clear, low-cost action

---

*Open to Data Analyst / MIS Analyst / HR Analyst / Reporting Analyst roles in Saudi Arabia. Feedback welcome!*
