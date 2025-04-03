# Python program to get user details and display them

def get_user_details():
    user_details = {}
    user_details["name"] = input("Enter your name: ")
    user_details["age"] = input("Enter your age: ")
    user_details["city"] = input("Enter your city: ")
    user_details["profession"] = input("Enter your profession: ")
    return user_details

def display_user_details(details):
    print("\nUser Details:")
    for key, value in details.items():
        print(f"{key.capitalize()}: {value}")

# Get user input
details = get_user_details()

# Display user details
display_user_details(details)