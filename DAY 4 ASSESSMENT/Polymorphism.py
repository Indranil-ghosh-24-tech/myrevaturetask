class Vehicle:
    def fuel_type(self):
        return "Petrol or Diesel"

class ElectricCar(Vehicle):
    def fuel_type(self):
        return "Electric"

car1 = Vehicle()
car2 = ElectricCar()

print("Vehicle fuel:", car1.fuel_type())
print("ElectricCar fuel:", car2.fuel_type())  
