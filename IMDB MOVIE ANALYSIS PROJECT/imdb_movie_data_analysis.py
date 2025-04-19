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

    while True:
        print("\n🎬 Welcome to IMDB Movie Database CRUD Interface")
        print("1. Create (Add Movie)")
        print("2. Read (View Movies)")
        print("3. Update (Edit Rating)")
        print("4. Delete (Remove Movie)")
        print("5. Visualize Data")
        print("6. Exit\n")

        choice = input("Enter your choice (1/2/3/4/5/6): ")

        if choice == "1":
            print("\n-- Insert New Movie --")
            title = input("Title: ")
            genre = input("Genre: ")
            description = input("Description: ")
            director = input("Director: ")
            actors = input("Actors: ")
            year = int(input("Year: "))
            runtime = int(input("Runtime (in mins): "))
            rating = float(input("Rating: "))
            votes = int(input("Votes: "))
            revenue = float(input("Revenue (Millions): "))
            metascore = int(input("Metascore: "))

            cursor.execute("""
                INSERT INTO imdb_movies 
                (title, genre, description, director, actors, year, runtime, rating, votes, revenue, metascore)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """, (title, genre, description, director, actors, year, runtime, rating, votes, revenue, metascore))
            conn.commit()
            print(f"\n✅ Movie '{title}' inserted successfully.\n")

        elif choice == "2":
            print("\n-- Reading Movie Records --")
            cursor.execute("SELECT * FROM imdb_movies LIMIT 5000")
            for row in cursor.fetchall():
                print("="*50)
                for col, val in zip(["id", "title", "genre", "description", "director", "actors",
                                    "year", "runtime", "rating", "votes", "revenue", "metascore"], row):
                    print(f"{col}: {val}")
                print("="*50)

        elif choice == "3":
            print("\n-- Update Movie Rating --")
            title = input("Enter the movie title to update: ")
            new_rating = float(input("Enter new rating: "))
            cursor.execute("UPDATE imdb_movies SET rating = %s WHERE title = %s", (new_rating, title))
            conn.commit()
            print(f"\n✅ Rating of '{title}' updated to {new_rating}.\n")

        elif choice == "4":
            print("\n-- Delete a Movie --")
            title = input("Enter the movie title to delete: ")
            cursor.execute("DELETE FROM imdb_movies WHERE title = %s", (title,))
            conn.commit()
            print(f"\n🗑️ Movie '{title}' deleted successfully.\n")

        elif choice == "5":
            print("\n📊 Generating Visualizations...\n")


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
            sns.histplot(df_cleaned['Rating'].dropna(), bins=20, kde=True, color='blue')
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

        elif choice == "6":
            print("\n👋 Exiting the program. Thank you!")
            break

        else:
            print("❌ Invalid option. Please enter a number from 1 to 6.")

except mysql.connector.Error as err:
    print(f"❗ MySQL Error: {err}")

finally:
    if cursor:
        cursor.close()
    if conn:
        conn.close()
