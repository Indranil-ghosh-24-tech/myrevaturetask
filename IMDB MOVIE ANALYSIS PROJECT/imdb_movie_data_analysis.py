import pandas as pd
import mysql.connector
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

df = pd.read_csv("C:/Users/91743/Downloads/IMDB.csv")

df_cleaned = df.drop(columns=[col for col in df.columns if "Unnamed" in col or col == "Rank"])

df_cleaned['Revenue (Millions)'] = df_cleaned['Revenue (Millions)'].replace({np.nan: None})
df_cleaned['Metascore'] = df_cleaned['Metascore'].replace({np.nan: None})

try:
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="7439450596@",
        database="imdb_movies"
    )
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM imdb_movies LIMIT 5000")  # You can adjust the number of records

    for row in cursor.fetchall():
        print("="*50)
        print(f"id: {row[0]}")
        print(f"title: {row[1]}")
        print(f"genre: {row[2]}")
        print(f"description: {row[3]}")
        print(f"director: {row[4]}")
        print(f"actors: {row[5]}")
        print(f"year: {row[6]}")
        print(f"runtime: {row[7]}")
        print(f"rating: {row[8]}")
        print(f"votes: {row[9]}")
        print(f"revenue: {row[10]}")
        print(f"metascore: {row[11]}")
        print("="*50)

    plt.figure(figsize=(12, 6))
    avg_rating_by_genre = df_cleaned.groupby('Genre')['Rating'].mean()
    sns.barplot(x=avg_rating_by_genre.index, y=avg_rating_by_genre.values, palette="viridis")
    plt.title("Average Rating by Genre")
    plt.xlabel("Genre")
    plt.ylabel("Average Rating")
    plt.xticks(rotation=45)
    plt.tight_layout()

    plt.figure(figsize=(12, 6))
    sns.boxplot(data=df_cleaned, x="Genre", y="Rating", palette="Set2")
    plt.title("Boxplot of Ratings by Genre")
    plt.xlabel("Genre")
    plt.ylabel("Rating")
    plt.xticks(rotation=45)
    plt.tight_layout()

    plt.figure(figsize=(12, 6))
    sns.histplot(df_cleaned['Rating'], bins=20, kde=True, color='blue')
    plt.title("Rating Distribution")
    plt.xlabel("Rating")
    plt.ylabel("Frequency")
    plt.tight_layout()

    plt.figure(figsize=(12, 6))
    sns.scatterplot(x=df_cleaned['Revenue (Millions)'], y=df_cleaned['Metascore'], color='green')
    plt.title("Revenue vs Metascore")
    plt.xlabel("Revenue (Millions)")
    plt.ylabel("Metascore")
    plt.tight_layout()

    plt.show()

except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    if cursor:
        cursor.close()
    if conn:
        conn.close()
