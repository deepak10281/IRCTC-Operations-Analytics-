# 🚂 IRCTC Train Network — Operations Analytics Dashboard

India’s Railway Schedule & Route Analysis | 8,366+ Trains | 1,000+ Stations

---

## 📌 Project Overview

Indian Railways operates one of the world’s largest rail networks, yet faces challenges like:
- Overcrowded hubs
- Underserved routes
- Inefficient scheduling

This project provides a **data-driven analytics solution** using **Python, SQL, and Power BI** to uncover insights and optimize railway operations.

📄 Problem Statements Source: :contentReference[oaicite:0]{index=0}  

---

## 🎯 Objectives

- Identify major railway hubs
- Analyze route efficiency (distance vs performance)
- Detect service gaps in train frequency
- Evaluate passenger class availability
- Study stop complexity and journey patterns
- Analyze peak departure congestion

---

## 📊 Dataset Details

- **Rows:** 8,366 trains  
- **Columns:** 10 features  
- **Key Fields:**
  - Train Number & Name
  - Source & Destination Stations
  - Departure & Arrival Time
  - Distance (km)
  - Days of Operation
  - Classes Available
  - Intermediate Stops  

📄 Dataset Analysis Notebook: :contentReference[oaicite:1]{index=1}  

---

## 🛠️ Tech Stack

- **Python (Pandas, Matplotlib, Seaborn)** → EDA & Feature Engineering  
- **SQL** → Data validation & business queries  
- **Power BI** → Interactive Dashboard & Visualization  

📄 SQL Queries: :contentReference[oaicite:2]{index=2}  

---

## 🔍 Key Analysis Performed

### 1. Network Hub Analysis
- Identified top stations based on:
  - Train origination
  - Train termination
- Example Insight:
  - **Howrah Jn** is the largest hub (259 trains)

---

### 2. Route Efficiency Analysis
- Categorized routes:
  - Short (<100 km)
  - Medium (100–499 km)
  - Long (500–1499 km)
  - Very Long (1500+ km)
- Average distance: **~600 km**

---

### 3. Service Frequency Analysis
- 94% trains run daily
- Identified routes with low weekly frequency (<3 trains)

---

### 4. Class Availability Analysis
- General (GN): ~97%
- Sleeper (SL): ~87%
- AC Classes: ~80%+
- Executive Class (EC): very limited (~2.7%)

---

### 5. Departure Time Analysis
- Peak hours:
  - Morning (7–10 AM)
  - Evening (5–8 PM)
- Indicates scheduling congestion

---

### 6. Stop Complexity Analysis
- Avg stops per train: **21**
- Max stops: **119**
- Longer routes → more stops

---

## 📈 Power BI Dashboard Features

📄 Dashboard File: :contentReference[oaicite:3]{index=3}  

### Key KPIs
- Total Trains: **8K+**
- Unique Source Stations: **1K+**
- Avg Distance: **599 km**
- Daily Trains: **~94%**

### Visuals Included
- Train Category Distribution
- Top 10 Busiest Stations
- Distance Distribution
- Departure Hour Trends
- Route Matrix (Source → Destination)
- Stops Analysis by Category
- Class Availability Insights
- Daily vs Partial Week Operations

---

## 💡 Key Insights

- Railway network is **hub-heavy** (Delhi, Howrah, Mumbai dominate)
- Several routes are **underserved**
- **Peak-hour congestion** affects scheduling efficiency
- **Premium classes concentrated** on long-distance routes
- High-stop trains increase travel time significantly

---

## 🚀 Recommendations

- Expand infrastructure at top hubs
- Introduce trains for underserved routes
- Balance peak-hour scheduling
- Improve class distribution equity
- Optimize high-stop routes with express variants
- Improve missing data quality (~1.2% class data missing)

---

## 📂 Project Structure
IRCTC-Operations-Analytics/
│
├── data/
│ └── Train_Data.csv
│
├── notebooks/
│ └── EDA_Analysis.ipynb
│
├── sql/
│ └── queries.sql
│
├── powerbi/
│ └── IRCTC_Dashboard.pbix
│
├── assets/
│ └── dashboard_screenshots.png
│
└── README.md


---

## 📌 Conclusion

This project demonstrates how **data analytics + visualization** can transform railway operations by:
- Improving efficiency
- Enhing passenger experience
- Supporting policy decisions

---

## ⭐ If you like this project

Give it a ⭐ on GitHub and feel free to fork & enhance!

---
