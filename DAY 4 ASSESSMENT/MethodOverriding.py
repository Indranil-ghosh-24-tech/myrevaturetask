class Parent:
    def show(self):
        print("This is the Parent class")

class Child(Parent):
    def show(self):  # Overriding the parent class method
        print("This is the Child class")

# Creating objects
parent_obj = Parent()
child_obj = Child()

# Calling methods
parent_obj.show()  # Output: This is the Parent class
child_obj.show()   # Output: This is the Child class (Overridden)
