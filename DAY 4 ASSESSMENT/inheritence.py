#Single Inheritance 

class Parent:
    def show(self):
        print("This is the Parent class")

class Child(Parent):  # Single inheritance
    def display(self):
        print("This is the Child class")

# Creating an object of Child
obj = Child()
obj.show()    # Inherited from Parent
obj.display()  # Defined in Child


#Multiple Inheritance

class Father:
    def father_info(self):
        print("Father's property")

class Mother:
    def mother_info(self):
        print("Mother's property")

class Child(Father, Mother):  # Multiple inheritance
    def child_info(self):
        print("Child's property")

# Creating an object of Child
obj = Child()
obj.father_info()  # Inherited from Father
obj.mother_info()  # Inherited from Mother
obj.child_info()   # Defined in Child






#Multilevel Inheritance

class Grandparent:
    def grandparent_info(self):
        print("This is the Grandparent class")

class Parent(Grandparent):
    def parent_info(self):
        print("This is the Parent class")

class Child(Parent):  # Multilevel inheritance
    def child_info(self):
        print("This is the Child class")

# Creating an object of Child
obj = Child()
obj.grandparent_info()  # Inherited from Grandparent
obj.parent_info()       # Inherited from Parent
obj.child_info()        # Defined in Child








#Hierarchical Inheritance

class Parent:
    def parent_info(self):
        print("This is the Parent class")

class Child1(Parent):  # Hierarchical inheritance
    def child1_info(self):
        print("This is Child1 class")

class Child2(Parent):
    def child2_info(self):
        print("This is Child2 class")

# Creating objects
obj1 = Child1()
obj2 = Child2()

obj1.parent_info()  # Inherited from Parent
obj1.child1_info()  # Defined in Child1

obj2.parent_info()  # Inherited from Parent
obj2.child2_info()  # Defined in Child2


#Hybrid Inheritance

class Base:
    def base_info(self):
        print("This is the Base class")

class Derived1(Base):  # Single Inheritance
    def derived1_info(self):
        print("This is Derived1 class")

class Derived2(Base):  # Single Inheritance
    def derived2_info(self):
        print("This is Derived2 class")

class Hybrid(Derived1, Derived2):  # Multiple Inheritance
    def hybrid_info(self):
        print("This is Hybrid class")

# Creating an object of Hybrid class
obj = Hybrid()
obj.base_info()     # Inherited from Base
obj.derived1_info() # Inherited from Derived1
obj.derived2_info() # Inherited from Derived2
obj.hybrid_info()   # Defined in Hybrid
