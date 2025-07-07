import psycopg2

conn = psycopg2.connect(
    dbname="pipeline_project",
    user="postgres",
    password="postgres",
    host="localhost",
    port="5432"
)
print("Connexion réussie")
