void test() {
  // Duration threeSeconds = Duration(seconds: 3);
  // sleep(threeSeconds);
  //
  // Future.delayed(threeSeconds, () => {print("test")});

  String myStr = "abc";

  try {
    double myStrAsDbl = double.parse(myStr);
    print("THis is that: ${myStrAsDbl + 5}");
  } catch (e) {
    print("this is error: $e");
  }

  try {
    checkNumber(2);
  } catch (e) {
    print("no good");
  }
}

int checkNumber(int num) {
  if (num < 3) throw "no good";

  return num;
}
