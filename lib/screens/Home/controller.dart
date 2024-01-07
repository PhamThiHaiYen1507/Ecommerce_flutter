import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/models/login_data.dart';
import 'package:nws_yenpth1_ecommerce_flutter/models/product_data.dart';
import 'package:nws_yenpth1_ecommerce_flutter/providers/login_provider.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/CartPage/index.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/HomePage/index.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/ProfilePage/index.dart';

import '../../models/user_model.dart';
import '../../utils/types.dart';
import '../NotifiPage/index.dart';

enum TYPE_HOME { HOME, CART, NOTI, USER }

class HomeController extends GetxController {
  late final LoginProvider _loginProvider;
  late final Rxn<UesrModel> userModel;
  late final Rx<TYPE_HOME> typeHome;
  late final Rx<Widget> currentPage;
  late final Rx<List<ProductData>> myCart;
  late final Rx<List<ProductData>> myFavouties;
  late final RxInt total;

  @override
  void onInit() {
    _loginProvider = LoginProvider();
    userModel = Rxn();
    typeHome = Rx(TYPE_HOME.HOME);
    currentPage = Rx(const SizedBox());
    myCart = Rx([]);
    myFavouties = Rx([]);
    total = RxInt(0);

    getUserModel();
    onChangePage();
    super.onInit();
  }

  Future<void> getUserModel() async {
    if (Storage.get(KEY.LOGIN_DATA, LoginData.fromJson) != null) {
      userModel.value = await _loginProvider.getProfile();
    } else {
      userModel.value = Storage.get(KEY.USER_MODEL, UesrModel.fromJson);
    }
  }

  void onChangePage() {
    switch (typeHome.value) {
      case TYPE_HOME.HOME:
        currentPage.value = const HomePage();
        break;
      case TYPE_HOME.CART:
        currentPage.value = const CartPage();
        break;
      case TYPE_HOME.NOTI:
        currentPage.value = const NotifiPage();
        break;
      case TYPE_HOME.USER:
        currentPage.value = const ProfilePage();
        break;
      default:
    }
  }

  void onMinusQuantity(int id) {
    myCart.update((val) {
      // ignore: unused_local_variable
      int quantity =
          val?.firstWhereOrNull((element) => element.id == id)?.quantity ?? 0;
      quantity >= 1
          ? val?.firstWhereOrNull((element) => element.id == id)?.quantity =
              val.firstWhereOrNull((element) => element.id == id)!.quantity! - 1
          : quantity;
    });

    totalCacular();
  }

  void onAddQuantity(int id) {
    myCart.update((val) {
      // ignore: unused_local_variable
      int quantity =
          val?.firstWhereOrNull((element) => element.id == id)?.quantity ?? -1;
      quantity >= 0
          ? val?.firstWhereOrNull((element) => element.id == id)?.quantity =
              val.firstWhereOrNull((element) => element.id == id)!.quantity! + 1
          : quantity;
    });
    totalCacular();
  }

  void delete(int id) {
    myCart.update((val) {
      val?.remove(val.firstWhereOrNull((element) => element.id == id));
    });
    totalCacular();
  }

  void deleteFavourites(int id) {
    myFavouties.update((val) {
      val?.remove(val.firstWhereOrNull((element) => element.id == id));
    });
    totalCacular();
  }

  void totalCacular() {
    if (myCart.value.isNotEmpty) {
      total.value = myCart.value
          .map((e) => e.totalMoney)
          .reduce((value, element) => value + element);
    } else {
      total.value = 0;
    }
  }
}
