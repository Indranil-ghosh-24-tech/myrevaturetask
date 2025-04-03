# Python program to retrieve keys from a dictionary and display the corresponding value

def display_value():
    # Sample dictionary
    my_dict = {
        "name": "Alice",
        "age": 25,
        "city": "New York",
        "profession": "Engineer"
    }
    
    print("Dictionary Keys:", list(my_dict.keys()))
    
    # Get key input from user
    key = input("Enter a key to retrieve the value: ")
    
    # Display the corresponding value
    if key in my_dict:
        print(f"The value for '{key}' is: {my_dict[key]}")
    else:
        print("Key not found in dictionary.")

# Run the function
display_value()
