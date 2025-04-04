class OverloadingExample:
    def add(self, a, b=0, c=0):  # Default arguments used for overloading behavior
        return a + b + c

# Creating an object
obj = OverloadingExample()

# Calling the method with different numbers of arguments
print("Sum with 1 argument:", obj.add(10))         # Output: 10
print("Sum with 2 arguments:", obj.add(10, 20))    # Output: 30
print("Sum with 3 arguments:", obj.add(10, 20, 30)) # Output: 60
