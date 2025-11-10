import supabase
import random
import time

url = [
    {
        "url": "https://dnlnxpjjgvpakflezakg.supabase.co",
        "key": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRubG54cGpqZ3ZwYWtmbGV6YWtnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODA3OTUwNjIsImV4cCI6MTk5NjM3MTA2Mn0.9LysqNyXcK2qA5-Af5jlbxnB4k9yzx8omwk-ujh_ajY",
        "table": "trash_type",
    }
]

for it in url:
    sleep = random.randrange(0, 3600, 60)
    time.sleep(sleep)

    client = supabase.create_client(it["url"], it["key"])

    print(client.table(it['table']).select("*").execute())
