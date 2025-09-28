# plsql-window-functions-Ushindi-Victoire

## Course
Database Development with PL/SQL (INSY 8311) — Mastery Project

## Business Problem 
Identify top products and customers, quantify monthly trends, and segment customer value to drive marketing and inventory decisions.

## Contents
- `schema_and_sample_data.sql` — create tables and insert sample data
- `queries/` — SQL files for each window-function query (ranking, aggregate, navigation, distribution, moving averages)
- `screenshots/` — 20+ screenshots showing query results and execution in pgAdmin 4
- `README.md` (this file)
- `analysis.md` — descriptive/diagnostic/prescriptive analysis
- `references.md` — bibliographic sources and academic integrity statement

## How to run (pgAdmin 4 code)
1. Create database `plsql_window_db`.
2. Open Query Tool, run `schema_and_sample_data.sql`.
3. Run the SQL files in `queries/` to reproduce results.
4. Saved screenshots are in `screenshots/` and their commited to my repo.

## Key queries included
- Ranking: top customers using ROW_NUMBER(), RANK(), DENSE_RANK(), PERCENT_RANK()
- Aggregate: monthly sales with running totals (ROWS vs RANGE)
- Navigation: MoM growth using LAG()
- Distribution: NTILE(4), CUME_DIST()
- Moving averages: 3-month AVG() OVER() rolling

## Key findings (short)
1. Top customers (top quartile) produce 53% of revenue — loyalty program recommended.
2. Seasonal spikes observed in April and June; 3-month moving average showed upward trend — order more inventory ahead.

## Academic Integrity Statement
All sources are cited in `references.md`. Implementations and analysis are original work. No AI-generated content was copied without attribution.

## 🧰 How to contribute
Follow coding standards and keep the codebase consistent.
Update documentation for any new features or changes.
Add tests for new functionality when applicable.
Respect the license and attribution requirements.

## 🚀 Ready-to-clone snippet
If you’re ready to contribute or just want to explore locally, clone the repository and enter the project directory:


## If you may want to contribute or clone

```
git clone https://github.com/ub-victor/plsql-window-functions-ushindi-Victoire.git
cd plsql-window-functions-ushindi-Vic

```
## Credits

- Assignment given by Lecture [Eric Maniraguha](https://www.linkedin.com/in/ericmaniraguha/?originalSubdomain=rw)
- Developed by [Ushindi Bihame](https://www.linkedin.com/in/ushindi-bihame-7a4a3a1b4/)
- GitHub: [ub-victor](https://github.com/ub-victor)

## License

This project is open-source and available under the MIT License.

