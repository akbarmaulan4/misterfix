
import 'package:get/get.dart';

class MainController extends GetxController{

  RxInt posMenu = 0.obs;

  changePosMenu(int val){
    posMenu.value = val;
  }

}