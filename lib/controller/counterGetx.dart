import 'package:get/get.dart';

class Countergetx extends GetxController{
  RxInt counter=0.obs;

  void increment()
  {
    counter++;
  }
  void decrement()
  {
    if(counter>0)
      {
        counter--;
      }
  }
}