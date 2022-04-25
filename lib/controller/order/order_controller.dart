
import 'package:get/get.dart';

class OrderController extends GetxController{
  RxInt posTab = 0.obs;
  RxBool checkAllItem = false.obs;

  changePosTab(int val){
    posTab.value = val;
  }
}