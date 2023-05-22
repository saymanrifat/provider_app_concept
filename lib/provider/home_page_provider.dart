import 'package:flutter/widgets.dart';

class HomePageProvider with ChangeNotifier {
  bool? isEligable;
  String? eligablityMessage = "";

  void checkEligibity(int age) {
    if (age >= 18) {
      isEligable = true;
      eligablityMessage = "You are Eligable";
      notifyListeners();
    } else {
      isEligable = false;
      eligablityMessage = "You are not Eligable";
      notifyListeners();
    }
  }
}
