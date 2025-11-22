📊 Netflix Content Analytics – Data Analytics Project

A complete end-to-end data analytics workflow using Python, MySQL, and Power BI.

🔍 Overview

This project analyzes a Netflix-style content dataset to uncover insights about content performance, genre popularity, Originals vs Non-Originals strategy, and user engagement patterns.
It demonstrates a full data analytics workflow including:

Data loading & cleaning (Python)

Exploratory Data Analysis (EDA)

SQL analytics (MySQL Server)

Dashboard development (Power BI)

Report creation & presentation (PDF/PPT)

The goal is to showcase end-to-end analytical skills used in real-world media & entertainment analytics.

📁 Dataset

The project uses a dataset containing 5,000 Netflix titles, each with:

Metadata: title, type, release year, age rating, genre, country

Performance: views, completion rate, IMDb rating, user rating, likes

Engineered features: engagement score, content age, release decade, kids flag

Dataset file (example):
netflix_content_dataset.csv

🛠 Tools & Technologies

Python → Pandas, NumPy, Matplotlib, Seaborn

MySQL Server → Data storage & analytical queries

Power BI → Interactive dashboard

Excel/CSV → Initial data handling

PowerPoint (PPT) → Final presentation

Jupyter Notebook → Development environment

🧩 Project Steps
1. Load the Dataset (Python)

Import CSV using Pandas

Inspect missing values, column types, duplicates

Convert dates, categories, numeric fields

2. Data Cleaning

Handle missing values for numeric & categorical columns

Fix inconsistent genres, ratings, and types

Create new fields like:

content_age

release_decade

duration_bucket

kids_flag

3. Exploratory Data Analysis (EDA)

Distribution of genres, ratings, types

Trend analysis by year & decade

Correlation between views, ratings, completion

Comparison of Originals vs Non-Originals

Identify top-performing titles

4. SQL Analysis (MySQL Server)

Create database & table structure

Import cleaned dataset

Run analytical queries:

Top 10 titles by views

Average rating by genre

Originals vs Non-Originals performance

Country-level trends

Ranking using window functions

5. Dashboard Development (Power BI)

3-page Netflix-themed dashboard:

Page 1 – Overview

Page 2 – Originals vs Non-Originals

Page 3 – Engagement Analysis

Includes KPIs, bar charts, line charts, scatter plots, heatmaps.

6. Report & Presentation

Summary of findings & recommendations

Visual insights with screenshots

PPT presentation for stakeholders

📈 Dashboard Pages
Page 1 – Overview

Total Titles, Movies, TV Shows

Genre view distribution

Release year trends

Top performing titles table

Page 2 – Originals & Genre Performance

Originals vs Non-Originals KPIs

Views by genre & type

Completion rate heatmap

Country-level engagement

Page 3 – Engagement Analysis

Engagement score scatter plot

High engagement titles

Kids-friendly content donut chart

Genre-level engagement

🧠 Results & Insights

Key insights delivered by the analysis:

Netflix Originals outperform Non-Originals in both views & completion rate.

Action, Mystery, Drama, and Crime genres dominate engagement.

Kids content has high completion but contributes fewer total views.

A small number of top-performing titles generate the majority of total watch time.

Several “hidden gems” with high ratings but low views represent opportunities for promotion.

▶️ How to Run the Project
1. Clone the Repository
git clone https://github.com/Harshitverma816/Netflix-Content-Analysis.git
cd netflix-content-analysis

2. Install Python Dependencies
pip install pandas numpy matplotlib seaborn mysql-connector-python

3. Run Python Scripts / Notebook

Open notebooks/ folder or run scripts in scripts/

4. Set Up MySQL Server

Create database

Import CSV

Run SQL queries from /sql/queries.sql

5. Open Power BI Dashboard

Load Netflix_Content_Analytics.pbix

Refresh data

6. Open the PPT Presentation

View Netflix_Analytics_Presentation.pptx

🙌 Author

Harshit Verma : Data Analyst | Python | SQL | Power BI 
LinkedIn: Harshit Verma 
Github: Harshitverma816
