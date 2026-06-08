"""
IBM HR Analytics — Employee Attrition Analysis
Author: Hassan Ali
Goal: Identify the main drivers of employee attrition so HR can take
      targeted action to retain staff.

Tools: Python (pandas, matplotlib)
Data:  WA_Fn-UseC_-HR-Employee-Attrition.csv (1,470 employees, IBM dataset)
"""

import pandas as pd
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

NAVY="#1F3A5F"; RED="#E74C3C"; GREEN="#27AE60"; TEAL="#2E86AB"; GREY="#95A5A6"
plt.rcParams["font.family"]="DejaVu Sans"
plt.rcParams["axes.spines.top"]=False
plt.rcParams["axes.spines.right"]=False

# ---------- LOAD ----------
df = pd.read_csv("../data/WA_Fn-UseC_-HR-Employee-Attrition.csv")
print(f"Loaded {df.shape[0]} employees, {df.shape[1]} columns")

# ---------- CLEAN ----------
# Drop columns with no analytical value (constant or unique IDs)
df.drop(columns=['EmployeeCount','EmployeeNumber','Over18','StandardHours'],
        inplace=True, errors='ignore')
print("Dropped constant/ID columns")

def attrition_rate(col):
    return df.groupby(col)['Attrition'].apply(lambda x: (x=='Yes').mean()*100).round(1)

# ---------- ANALYSIS ----------
overall = (df['Attrition']=='Yes').mean()*100
print(f"\nOverall attrition rate: {overall:.1f}%")

print("\n--- By Overtime (KEY DRIVER) ---")
print(attrition_rate('OverTime'))

print("\n--- By Job Role ---")
print(attrition_rate('JobRole').sort_values(ascending=False))

print("\n--- By Age Group ---")
df['AgeGroup'] = pd.cut(df['Age'], bins=[17,25,35,45,60], labels=['18-25','26-35','36-45','46-60'])
print(attrition_rate('AgeGroup'))

print("\n--- By Marital Status ---")
print(attrition_rate('MaritalStatus'))

print("\n--- Income comparison ---")
left = df[df['Attrition']=='Yes']['MonthlyIncome'].mean()
stayed = df[df['Attrition']=='No']['MonthlyIncome'].mean()
print(f"Avg income (left):   {left:,.0f}")
print(f"Avg income (stayed): {stayed:,.0f}")
print(f"Leavers earn {(1-left/stayed)*100:.0f}% less on average")

# ---------- CHARTS ----------
# Chart 1: Overall
fig,ax=plt.subplots(figsize=(6,5))
c=df['Attrition'].value_counts()
ax.bar(['Stayed','Left'],[c['No'],c['Yes']],color=[GREY,RED],width=0.5)
ax.set_title('Overall Employee Attrition',fontsize=14,fontweight='bold',color=NAVY)
ax.set_ylabel('Number of employees')
for i,v in enumerate([c['No'],c['Yes']]):
    ax.text(i,v+15,str(v),ha='center',fontweight='bold')
plt.tight_layout();plt.savefig('../visuals/01_overall_attrition.png',dpi=130,bbox_inches='tight');plt.close()

# Chart 2: Overtime
ot=attrition_rate('OverTime')
fig,ax=plt.subplots(figsize=(6,5))
ax.bar(['No Overtime','Works Overtime'],[ot['No'],ot['Yes']],color=[TEAL,RED],width=0.5)
ax.set_title('Attrition Rate: Overtime Impact',fontsize=14,fontweight='bold',color=NAVY)
ax.set_ylabel('Attrition rate (%)')
for i,v in enumerate([ot['No'],ot['Yes']]):
    ax.text(i,v+0.8,f'{v}%',ha='center',fontweight='bold')
plt.tight_layout();plt.savefig('../visuals/02_overtime_attrition.png',dpi=130,bbox_inches='tight');plt.close()

print("\nCharts saved. Analysis complete.")
