# Python program to demonstrate all list functions

def list_functions_demo():
    lst = [3, 1, 4, 1, 5, 9, 2, 6]
    
    print("Original List:", lst)
    
    # List Methods
    lst.append(7)
    print("append(7):", lst)
    
    lst_copy = lst.copy()
    print("copy():", lst_copy)
    
    print("count(1):", lst.count(1))
    
    lst.extend([8, 9])
    print("extend([8, 9]):", lst)
    
    print("index(5):", lst.index(5))
    
    lst.insert(2, 10)
    print("insert(2, 10):", lst)
    
    lst.pop()
    print("pop():", lst)
    
    lst.remove(1)
    print("remove(1):", lst)
    
    lst.reverse()
    print("reverse():", lst)
    
    lst.sort()
    print("sort():", lst)
    
    lst.clear()
    print("clear():", lst)
    
# Run the function
list_functions_demo()
