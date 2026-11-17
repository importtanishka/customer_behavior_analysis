# Customer Behavior Analysis 📊

**A Data Analytics Project using Python, SQL, and an Interactive HTML Dashboard**

## 📌 About the Project

Customer Behavior Analysis is a data analytics project focused on understanding customer shopping patterns, purchasing preferences, spending habits, and product trends.

The project uses Python for data cleaning and preprocessing, SQL for business data analysis, and HTML, CSS, and JavaScript to create an interactive dashboard that presents meaningful insights through visualizations and KPIs.

The goal is to transform raw data into useful business insights that support better decision-making.

## 🎯 Project Objectives

- Understand customer shopping behavior and purchasing patterns.
- Analyze customer demographics and product preferences.
- Identify popular product categories and seasonal trends.
- Explore payment methods and shipping preferences.
- Calculate important business KPIs.
- Present analytical findings through an interactive dashboard.

## 🛠️ Tech Stack

| Technology | Usage |
|---|---|
| Python | Data cleaning and preprocessing |
| Pandas | Data manipulation and analysis |
| NumPy | Numerical operations |
| PostgreSQL | Database management |
| SQL | Business queries and KPI analysis |
| HTML | Dashboard structure |
| CSS | Dashboard styling |
| JavaScript | Interactive features |
| Chart.js | Data visualization |

## 🔄 Project Workflow

**1. Data Cleaning & Preprocessing (Python)**
- Loaded the customer shopping behavior dataset.
- Inspected dataset information and missing values.
- Handled missing review ratings using category-wise median values.
- Standardized column names.
- Created customer age groups using quartiles.
- Converted purchase frequency into days.
- Removed redundant columns.
- Prepared cleaned data for database storage.

**2. SQL Analysis**
Used SQL queries to perform business analysis, including:
- Executive KPI summary.
- Monthly sales and profit trends.
- Top 10 products by revenue.
- Lowest-margin products.
- Regional performance.
- Category contribution.
- Discount and profitability analysis.
- Customer repeat rate.
- Year-over-year revenue growth.
- Data quality checks.

**3. Interactive Dashboard Development**

Created an interactive HTML dashboard to explore customer shopping behavior and visualize analytical findings.

## 📊 Dashboard Features

- KPI summary cards.
- Revenue by product category.
- Revenue by season.
- Top 10 products by revenue.
- Top 10 states by revenue.
- Revenue by customer age group.
- Purchase frequency analysis.
- Review rating distribution.
- Payment method analysis.
- Shipping type analysis.
- Customer segment comparison.
- Searchable and sortable customer records.
- Interactive filters.
- Light and dark themes.
- Export filtered customer data to CSV.

## 🔍 Dashboard Filters

Users can filter the dashboard based on:

- Season
- Product Category
- Gender
- Age Group
- Subscription Status
- Discount Applied

## 💡 Business Value

The analysis helps businesses understand:

- Which products and categories generate more revenue.
- How customer preferences vary across seasons.
- Which customer segments contribute to purchases.
- How customers prefer to pay and receive products.
- Where businesses can improve their marketing and customer retention strategies.

## 📁 Project Structure

```text
Customer-Behavior-Analysis/
│
├── customer_data_cleaning.html
│
├── 02_analysis_queries.sql
│
├── Customer Shopping Behavior Dashboard.html
│
└── README.md
```

## 🚀 How to Run

**1. Clone the repository**

```bash
git clone YOUR_REPOSITORY_URL
```

**2. Install Python libraries**

```bash
pip install pandas numpy sqlalchemy psycopg2-binary
```

**3. Data Cleaning**

Open `customer_data_cleaning.html` in a browser to view the exported Jupyter Notebook.

For execution, use the original `.ipynb` notebook in Jupyter Notebook.

**4. SQL Analysis**

Open `02_analysis_queries.sql` in PostgreSQL-compatible software such as pgAdmin and execute the queries after setting up the required database and table.

**5. Interactive Dashboard**

Open `Customer Shopping Behavior Dashboard.html` in your browser to explore the dashboard.

Note: The dashboard uses Chart.js and Google Fonts through external CDN links.

## 📚 Skills Demonstrated

- Data Cleaning and Preprocessing
- Exploratory Data Analysis
- Python Programming
- SQL Query Writing
- PostgreSQL Database
- KPI Calculation
- Data Visualization
- Interactive Dashboard Development
- Business Insights Generation
- Analytical Thinking

## 👩‍💻 Author

**Tanishka Shinde**

BSc Computer Science Student | Aspiring Data Analyst & Data Scientist

GitHub: https://github.com/importtanishka

---

⭐ If you find this project useful, consider giving this repository a star!
