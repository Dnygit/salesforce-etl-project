import pandas as pd
import mysql.connector

# Extract
data = pd.read_csv("salesforce_sales_data_100_records.csv")

# Transform
data = data.dropna()

# Connect to MySQL
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="1234",
    database="salesforce_pipeline"
)

cursor = connection.cursor()

# Load data into table
for index, row in data.iterrows():
    cursor.execute(
        "INSERT INTO opportunities VALUES (%s,%s,%s,%s,%s,%s,%s,%s)",
        tuple(row)
    )

connection.commit()

print("ETL process completed successfully")