5 realistic business questions** that data analysts actually solve using **subqueries and CTEs\*\*.

Each includes:

- Business goal
- Hint (how to think)
- SQL structure (for practice)

---

### **1. Find customers who never placed an order**

**Goal:** Identify inactive customers.
**Hint:** Compare customers table with orders table using a subquery in `WHERE NOT IN`.

```sql
SELECT customer_name
FROM customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM orders
);
```

👉 Used by sales teams to target inactive customers.

---

### **2. Find customers who spent more than the average payment amount**

**Goal:** Identify high-value customers.
**Hint:** Use subquery in `WHERE` to get average amount first.

```sql
SELECT customer_id, SUM(amount) AS total_spent
FROM payments
GROUP BY customer_id
HAVING SUM(amount) > (
    SELECT AVG(amount)
    FROM payments
);
```

👉 Used for customer segmentation and loyalty programs.

---

### **3. Find top 3 most expensive products**

**Goal:** Product price ranking.
**Hint:** Use subquery with `ORDER BY` + `LIMIT`.

```sql
SELECT product_id, product_name, price
FROM products
WHERE price IN (
    SELECT price
    FROM products
    ORDER BY price DESC
    LIMIT 3
);
```

👉 Used in inventory and marketing insights.

---

### **4. Show customers and their total payment using CTE**

**Goal:** Simplify multi-step aggregation.
**Hint:** Use `WITH` to define a temp table of totals.

```sql
WITH total_payments AS (
    SELECT customer_id, SUM(amount) AS total_amount
    FROM payments
    GROUP BY customer_id
)
SELECT c.customer_name, t.total_amount
FROM customers c
JOIN total_payments t ON c.customer_id = t.customer_id;
```

👉 Makes queries easier to read and debug.

---

### **5. Find the average total order value per customer**

**Goal:** Analyze spending pattern.
**Hint:** Aggregate inside a subquery first, then average outside.

```sql
SELECT AVG(total_order_value) AS avg_customer_spend
FROM (
    SELECT customer_id, SUM(amount) AS total_order_value
    FROM payments
    GROUP BY customer_id
) AS sub;
```

👉 Common in sales and financial reporting.

---

### 🧠 Practice tip

For each query:

1. Write it from scratch.
2. Predict the result before running it.
3. Run it.
4. Explain **why** it worked.

That’s how your SQL reasoning becomes strong.
