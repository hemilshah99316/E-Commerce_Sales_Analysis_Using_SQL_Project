
# 🛒 E-Commerce Data Analysis With SQL Server

This repository contains SQL scripts designed to analyze E-commerce sales data stored in a Microsoft SQL Server database. The analysis includes queries to gain insights into customer behavior, sales trends, and payment patterns.

## 🗂 Database Schema

The database consists of seven main tables: **CUSTOMERS**, **GEOLOCATION**, **ORDER_ITEMS**, **ORDERS**, **PAYMENTS**, **PRODUCTS**, and **SELLERS**. Below is the schema structure:

### **CUSTOMERS**

This table contains details about the customers.

| Column                   | Type           | Description                              |
|---------------------------|----------------|------------------------------------------|
| customer_id               | `int`          | Primary key (Unique identifier for each customer) |
| customer_unique_id        | `varchar(50)`  | Unique identifier across orders for the same customer |
| customer_zip_code_prefix   | `varchar(5)`   | Zip code prefix of the customer |
| customer_city             | `varchar(100)` | City where the customer resides |
| customer_state            | `varchar(2)`   | State where the customer resides |

### **GEOLOCATION**

This table contains geolocation data, useful for mapping customer and seller locations.

| Column                   | Type           | Description                              |
|---------------------------|----------------|------------------------------------------|
| geolocation_zip_code_prefix | `varchar(5)`  | Zip code prefix of the location |
| geolocation_lat           | `decimal(10,6)`| Latitude of the location                |
| geolocation_lng           | `decimal(10,6)`| Longitude of the location               |
| geolocation_city          | `varchar(100)` | City of the location                    |
| geolocation_state         | `varchar(2)`   | State of the location                   |

### **ORDER_ITEMS**

This table records individual items within each order.

| Column           | Type           | Description                              |
|------------------|----------------|------------------------------------------|
| order_id         | `int`          | Foreign key referencing `ORDERS(order_id)` |
| order_item_id    | `int`          | Unique identifier for each order item    |
| product_id       | `int`          | Foreign key referencing `PRODUCTS(product_id)` |
| seller_id        | `int`          | Foreign key referencing `SELLERS(seller_id)` |
| shipping_limit_date | `datetime`  | Latest date the item should be shipped   |
| price            | `decimal(10,2)`| Price of the item                        |
| freight_value    | `decimal(10,2)`| Shipping cost associated with the item   |

### **ORDERS**

This table contains details of all orders placed by customers.

| Column                   | Type           | Description                              |
|---------------------------|----------------|------------------------------------------|
| order_id                 | `int`           | Primary key (Unique identifier for each order) |
| customer_id              | `int`           | Foreign key referencing `CUSTOMERS(customer_id)` |
| order_status             | `varchar(50)`   | Status of the order (e.g., shipped, delivered, canceled) |
| order_purchase_timestamp | `datetime`      | Timestamp when the order was placed      |
| order_approved_at        | `datetime`      | Timestamp when the order was approved    |
| order_delivered_carrier_date | `datetime`  | Date when the order was delivered to the carrier |
| order_delivered_customer_date | `datetime` | Date when the order was delivered to the customer |
| order_estimated_delivery_date | `datetime` | Estimated delivery date for the order    |

### **PAYMENTS**

This table contains payment information for each order.

| Column             | Type           | Description                              |
|---------------------|----------------|------------------------------------------|
| order_id           | `int`           | Foreign key referencing `ORDERS(order_id)` |
| payment_sequential | `int`           | Payment sequence number within the order |
| payment_type       | `varchar(50)`   | Payment method (e.g., credit card, UPI)  |
| payment_installments | `int`         | Number of installments used for the payment |
| payment_value      | `decimal(10,2)` | Total value of the payment               |

### **PRODUCTS**

This table contains details about the products available in the store.

| Column                   | Type           | Description                              |
|---------------------------|----------------|------------------------------------------|
| product_id                | `int`          | Primary key (Unique identifier for each product) |
| product_category          | `varchar(50)`  | Category of the product (e.g., electronics, furniture) |
| product_name_length       | `int`          | Length of the product name               |
| product_description_length | `int`         | Length of the product description        |
| product_photos_qty        | `int`          | Number of product photos available       |
| product_weight_g          | `int`          | Weight of the product in grams           |
| product_length_cm         | `int`          | Length of the product in centimeters     |
| product_height_cm         | `int`          | Height of the product in centimeters     |
| product_width_cm          | `int`          | Width of the product in centimeters      |

### **SELLERS**

This table contains information about the sellers in the marketplace.

| Column                   | Type           | Description                              |
|---------------------------|----------------|------------------------------------------|
| seller_id                | `int`           | Primary key (Unique identifier for each seller) |
| seller_zip_code_prefix    | `varchar(5)`    | Zip code prefix for the seller's location |
| seller_city              | `varchar(100)`  | City where the seller is located         |
| seller_state             | `varchar(2)`    | State where the seller is located        |

## 🔍 Analysis Overview

The SQL scripts included in this repository focus on the following areas of analysis:

- **Customer Insights**: Analyze customer data based on geographic location, preferences, and total customer count.
- **Order and Payment Analysis**: Identify trends in order statuses, payment methods, and installment patterns.
- **Sales Trends**: Analyze daily, monthly, and yearly trends in sales and payments.
- **Product Analysis**: Explore product categories, dimensions, and their performance in sales.
- **Seller Insights**: Understand seller locations, city trends, and seller state performance.
  
### Example Queries:

1. **Customers not in Specific States**  
   Query to find customers located in states other than MG, SP, and SC.

2. **Canceled Orders**  
   Query to retrieve orders with the status `'canceled'`.

3. **Payments with Specific Criteria**  
   Query to find payments made using UPI, with a value of at least 500, and completed in one installment.

4. **Top 5 Product Categories by Payment**  
   Query to find the top 5 product categories by total payment value.

## 🚀 Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/hemilshah99316/E-Commerce_Sales_Analysis_Using_SQL_Project.git
   ```
   OR
   
   Download ZIP File

3. Set up the SQL Server database using the provided schema.

4. Execute the SQL scripts in the appropriate order to generate insights from the E-Commerce data.

## 📄 Requirements

- **Microsoft SQL Server** (or any SQL Server-compatible environment)
- A database with the above schema set up and populated with data.

