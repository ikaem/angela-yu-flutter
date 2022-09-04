typedef Adder = int Function(int a, int b);

void tester() {
  // this is defined at compile time - value should be known at compile time
  // const int meh = 3;
  //
  // // this can be assigned just once, but even after compile time - it is not known at compile time
  // final hem = DateTime.now();
  // print("test");

  int calculator(int a, int b, Adder add) {
    return add(a, b);
  }

  final result = calculator(2, 3, (a, b) {
    return a + b;
  });

  final variableAsAFunction = () {
    print("variable as a function");
  };

  variableAsAFunction();

  print(result);

  oldCar.drive();
  oldCar.drive = fastDrive;

  oldCar.drive();

  final Map<String, int> someMap = {
    "what": 3,
  };
  print(someMap["what"]);
}

class Car {
  Function drive;

  Car({required this.drive});
}

void slowDrive() {
  print("Slow drive");
}

void fastDrive() {
  print("Fast drive");
}

Car oldCar = Car(drive: slowDrive);
Car newCar = Car(drive: fastDrive);
