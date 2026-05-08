# 🚂 IRCTC Train Network — Operations Analytics Dashboard

## 📘 Project Overview
Indian Railways operates one of the world’s largest railway networks, connecting thousands of stations and transporting millions of passengers daily. However, challenges such as overcrowded hubs, underserved routes, scheduling inefficiencies, and uneven service distribution continue to impact operational performance and passenger experience.

This project presents a data-driven railway operations analytics solution using **Python, SQL, and Power BI** to analyze train schedules, route efficiency, station activity, service frequency, class availability, and departure congestion across the Indian Railways network.

The dashboard transforms raw railway data into actionable insights that can support operational planning, infrastructure improvements, and strategic decision-making.

---

## 🎯 Objectives
- Identify major railway hubs and high-traffic stations.
- Analyze route efficiency based on distance and operations.
- Detect underserved routes with low train frequency.
- Evaluate passenger class availability across routes.
- Study stop complexity and journey patterns.
- Analyze peak departure congestion trends.
- Build an interactive Power BI dashboard for railway analytics.

---

## 📊 Dataset Details

| Attribute | Details |
|-----------|----------|
| Total Trains | 8,366+ |
| Stations Covered | 1,000+ |
| Features | 10 |
| Domain | Railway Operations & Scheduling |

### Key Features
- Train Number & Train Name
- Source & Destination Stations
- Departure & Arrival Time
- Distance (KM)
- Days of Operation
- Train Classes Available
- Intermediate Stops

---

## 🛠️ Tech Stack

### Programming & Analysis
- Python
- SQL

### Python Libraries
- Pandas
- NumPy
- Matplotlib
- Seaborn

### Visualization & Reporting
- Power BI

### Development Environment
- Jupyter Notebook

---

## ⚙️ Workflow

### 1️⃣ Data Collection & Cleaning
- Imported railway schedule and route datasets.
- Handled missing values and inconsistent records.
- Standardized station names and train attributes.

### 2️⃣ Feature Engineering
- Created route categories based on travel distance.
- Extracted departure hour and journey-related metrics.
- Categorized train operations by frequency.

### 3️⃣ Exploratory Data Analysis (EDA)
Performed comprehensive analysis on:
- Station activity
- Route efficiency
- Train frequency
- Class availability
- Stop complexity
- Departure trends

### 4️⃣ SQL-Based Analysis
Used SQL queries for:
- Data validation
- Aggregation
- Operational business analysis
- Route-level insights

### 5️⃣ Dashboard Development
Built an interactive Power BI dashboard for:
- KPI monitoring
- Trend analysis
- Operational insights
- Route visualization

---

## 🔍 Key Analysis Performed

### 🚉 1. Network Hub Analysis
Identified the busiest railway stations based on:
- Train originations
- Train terminations

#### Key Insight
- **Howrah Junction** emerged as the largest railway hub with approximately **259 trains**.

---

### 🛤️ 2. Route Efficiency Analysis
Routes were categorized into:
- Short Distance (<100 KM)
- Medium Distance (100–499 KM)
- Long Distance (500–1499 KM)
- Very Long Distance (1500+ KM)

#### Key Insight
- Average train journey distance was approximately **599 KM**.

---

### 📅 3. Service Frequency Analysis
- Approximately **94%** of trains operate daily.
- Identified low-frequency routes operating less than three times per week.

#### Business Impact
- Helps identify underserved regions requiring additional railway services.

---

### 🎟️ 4. Class Availability Analysis

| Class | Availability |
|-------|---------------|
| General (GN) | ~97% |
| Sleeper (SL) | ~87% |
| AC Classes | ~80%+ |
| Executive Class (EC) | ~2.7% |

#### Key Insight
- Premium train classes are concentrated mainly on long-distance routes.

---

### ⏰ 5. Departure Time Analysis
Peak departure congestion observed during:
- Morning: **7 AM – 10 AM**
- Evening: **5 PM – 8 PM**

#### Business Impact
- Indicates scheduling pressure and infrastructure load during peak hours.

---

### 🚏 6. Stop Complexity Analysis
- Average stops per train: **21**
- Maximum stops observed: **119**

#### Key Insight
- Longer-distance trains generally include significantly more stops, increasing total journey time.

---

## 📈 Power BI Dashboard Features

### Key KPIs
- Total Trains: **8K+**
- Unique Stations: **1K+**
- Average Distance: **599 KM**
- Daily Operating Trains: **~94%**

### Dashboard Visualizations
- Train Category Distribution
- Top 10 Busiest Stations
- Distance Distribution Analysis
- Departure Hour Trends
- Source → Destination Route Matrix
- Stops Analysis by Train Category
- Passenger Class Availability
- Daily vs Partial-Week Operations

---

## 💡 Key Business Insights
- Indian Railways network is highly **hub-centric**, dominated by stations like Delhi, Mumbai, and Howrah.
- Several regions remain underserved with limited weekly train operations.
- Peak-hour congestion impacts scheduling efficiency and operational flow.
- Premium classes are unevenly distributed across the network.
- High-stop trains significantly increase travel duration and reduce route efficiency.

---

## 🚀 Recommendations
- Expand infrastructure at high-traffic railway hubs.
- Introduce additional services for underserved routes.
- Optimize peak-hour train scheduling to reduce congestion.
- Improve equitable distribution of premium passenger classes.
- Launch express variants for high-stop routes to improve travel efficiency.
- Address missing and inconsistent operational data for improved analytics accuracy.

---

## 📁 Project Structure

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

## 📌 Results
- Successfully analyzed 8,366+ train operations across 1,000+ stations.
- Identified major railway congestion hubs and underserved routes.
- Developed an interactive Power BI dashboard for operational monitoring.
- Generated actionable insights for improving railway efficiency and passenger experience.

---

## 👨‍💻 Author
**Deepak Malviya**  
📧 Email: Deepakmalviya7604@gmail.com  
💼 LinkedIn:https://www.linkedin.com/in/deepak102825/

---

## ⭐ Conclusion
This project demonstrates how data analytics and visualization can transform railway operations by uncovering hidden operational inefficiencies, optimizing scheduling strategies, improving route planning, and enhancing passenger experience through data-driven insights and interactive reporting.
