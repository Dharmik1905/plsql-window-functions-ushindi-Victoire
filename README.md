# plsql-window-functions-Ushindi-Victoire

## Course Information
- **Course:** Database Development with PL/SQL (INSY 8311) — Mastery Project  
- **Student:** Ushindi Bihame Victoire  
- **Instructor:** Eric Maniraguha  
- **Date:** 25 Sep - 29 Sep 2025  

---

## 📌 Business Problem  
The goal of this project is to **analyze customer and product performance using PL/SQL window functions**.  
Specifically:  
- Identify top products and customers.  
- Quantify monthly sales trends and running totals.  
- Measure period-over-period growth.  
- Segment customers into quartiles to support marketing.  
- Compute moving averages for forecasting inventory needs.  

This helps the business make better **marketing** and **inventory management decisions**.  

---

## 📂 Repository Contents
- `schema/schema.sql` — create tables (`customers`, `products`, `transactions`) and insert sample data.  
- `queries/window_functions.sql` — all window function queries (ranking, aggregate, navigation, distribution, moving averages).  
- `queries/revenue_analysis.sql` — revenue analysis queries:
  - Total revenue across all customers  
  - Revenue per customer  
  - Quartile segmentation with `NTILE`  
  - Top quartile revenue and percentage of total  
- `screenshots/` — 20+ screenshots of queries and results in pgAdmin 4/Vs code.  
- `analysis/analysis.md` — descriptive, diagnostic, prescriptive insights.  
- `references.md` — sources and academic integrity statement.
- `README.md` (this file).  

---

## ⚙️ How to Run (pgAdmin 4)
1. Create database **`plsql_window_db`** in pgAdmin 4 if you want you can also code the db created in your Vs code but it need some Extension Installation.  
2. Open **Query Tool**, run `schema/schema.sql` to create tables and load sample data.  
3. Run the SQL files in `queries/` to reproduce results.  
4. Screenshots of executions are available in `screenshots/` for verification.  

---

## 🔑 Key Queries
- **Ranking:** `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `PERCENT_RANK()` → identify top customers by revenue.  
- **Aggregate:** `SUM()`, `AVG()`, `MIN()`, `MAX()` with frames (`ROWS`, `RANGE`) → running totals & trends.  
- **Navigation:** `LAG()`, `LEAD()` → month-over-month growth analysis.  
- **Distribution:** `NTILE(4)`, `CUME_DIST()` → customer segmentation.  
- **Moving averages:** `AVG() OVER()` → 3-month rolling sales average.  
- **Revenue analysis:** total revenue, per-customer revenue, quartiles, and top-quartile % contribution.  

---

## 📊 Key Findings
1. **Top customers (top quartile) generated 52.94% of all revenue** → recommend introducing a loyalty program to retain them.  
2. **Seasonal spikes observed in April and June** → confirmed by 3-month moving average trend → suggests ordering more inventory ahead of peak demand.  

---

## 📜 Academic Integrity Statement
All sources are properly cited in `references.md`.  
All implementations and analysis are original work.  
No AI-generated content was copied without attribution or adaptation.  

---

## 🧰 Contribution Guidelines
- Follow coding standards for SQL (uppercase keywords, consistent indentation).  
- Keep documentation updated when adding/changing queries.  
- Add screenshots when new queries are introduced.  
- Respect licensing and attribution requirements.  

---

## 🚀 Clone and Explore
Clone the repository and enter the project directory:  

```bash
git clone https://github.com/ub-victor/plsql-window-functions-ushindi-Victoire.git
cd plsql-window-functions-ushindi-Victoire


```
## Credits

- Assignment given by Lecture [Eric Maniraguha](https://www.linkedin.com/in/ericmaniraguha/?originalSubdomain=rw)
- Developed by [Ushindi Bihame](https://www.linkedin.com/in/ushindi-bihame-7a4a3a1b4/)
- My GitHub: [ub-victor](https://github.com/ub-victor)

## License

This project is open-source and available under the MIT License. 

