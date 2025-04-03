# Python program to demonstrate all string functions

def string_functions_demo():
    s = " Hello, World! "
    
    # String Methods
    print("Original String:", s)
    print("capitalize():", s.capitalize())
    print("casefold():", s.casefold())
    print("center(20, '*'):", s.center(20, '*'))
    print("count('o'):", s.count('o'))
    print("encode():", s.encode())
    print("endswith('!'):", s.endswith('!'))
    print("expandtabs(4):", "Hello\tWorld".expandtabs(4))
    print("find('World'):", s.find('World'))
    print("format():", "Hello, {}".format("Python"))
    print("index('World'):", s.index('World'))
    print("isalnum():", s.isalnum())
    print("isalpha():", s.isalpha())
    print("isdigit():", s.isdigit())
    print("islower():", s.islower())
    print("isspace():", s.isspace())
    print("istitle():", s.istitle())
    print("isupper():", s.isupper())
    print("join(['Hello', 'World']):", "-".join(['Hello', 'World']))
    print("lower():", s.lower())
    print("lstrip():", s.lstrip())
    print("replace('Hello', 'Hi'):", s.replace("Hello", "Hi"))
    print("rfind('o'):", s.rfind('o'))
    print("split():", s.split())
    print("startswith('Hello'):", s.startswith('Hello'))
    print("strip():", s.strip())
    print("swapcase():", s.swapcase())
    print("title():", s.title())
    print("upper():", s.upper())
    print("zfill(20):", s.zfill(20))
    
# Run the function
string_functions_demo()
