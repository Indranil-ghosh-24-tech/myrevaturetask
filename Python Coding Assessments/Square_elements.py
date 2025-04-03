# Python program to iterate through a collection and square each element

def square_elements(collection):
    squared_collection = [x ** 2 for x in collection]
    return squared_collection

# Example list
numbers = [1, 2, 3, 4, 5, 10, 20 ,45]

# Squaring each element
squared_numbers = square_elements(numbers)

# Display results
print("Original Collection:", numbers)
print("Squared Collection:", squared_numbers)
