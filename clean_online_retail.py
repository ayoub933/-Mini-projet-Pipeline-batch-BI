import pandas as pd

# Lecture du fichier Excel
df = pd.read_excel("data/Online Retail.xlsx")

# Suppression des lignes sans client
df = df.dropna(subset=["CustomerID"])

# Suppression des retours produits
df = df[df["Quantity"] > 0]

# Conversion des dates
df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"])

# Renommer les colonnes pour les adapter au projet
df = df.rename(columns={
    "InvoiceNo": "order_id",
    "StockCode": "product_id",
    "Description": "product_name",
    "Quantity": "quantity",
    "InvoiceDate": "order_date",
    "UnitPrice": "unit_price",
    "CustomerID": "customer_id",
    "Country": "country"
})

# Sauvegarde en CSV nettoyé
df.to_csv("data/clean_orders.csv", index=False)
print("✅ Fichier clean_orders.csv généré")
