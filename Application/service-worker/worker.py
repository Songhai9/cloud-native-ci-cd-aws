import time

def main():
    print("Worker started. Press Ctrl+C to stop.")
    while True:
        print("Worker is doing some background task...")
        time.sleep(5)

if __name__ == "__main__":
    main()
