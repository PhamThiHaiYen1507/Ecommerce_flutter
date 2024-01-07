import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/models/product_data.dart';
import 'package:nws_yenpth1_ecommerce_flutter/providers/product_provider.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/Home/controller.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/styles.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/utils.dart';

List<String> sizeList = ['S', 'M', 'L'];
List<Color> colorList = [neutral08, neutral03, neutral00, neutral10];

class ProductDetailController extends GetxController {
  final HomeController homeController = Get.find();
  late final ProductProvider _productProvider;
  late final Rxn<ProductData> productData;
  late final RxBool loading;
  late final RxInt quantity, total;
  late final Rx<String> selectSize;
  late final Rx<Color> selectColor;

  final int productId;

  ProductDetailController(this.productId);
  @override
  void onInit() {
    _productProvider = ProductProvider();
    productData = Rxn();
    loading = RxBool(false);
    quantity = RxInt(1);
    total = RxInt(0);
    selectSize = RxString(sizeList.first);
    selectColor = Rx<Color>(colorList.first);
    getProductDetail();
    super.onInit();
  }

  Future<void> getProductDetail() async {
    loading(true);
    productData.value =
        await _productProvider.getProductDetail(productId: productId);
    loading(false);
    total.value = productData.value?.price ?? 0;
  }

  void totalCacular() {
    total.value = quantity.value * (productData.value?.price ?? 0).toInt();
  }

  void onMinusQuantity() {
    if (quantity > 1) {
      quantity.value--;
      totalCacular();
    }
  }

  void onAddQuantity() {
    quantity.value++;
    totalCacular();
  }

  void onFavourite(BuildContext context) {
    if (productData.value?.favourite != true) {
      homeController.myFavouties.update((val) {
        val?.add(productData.value ?? ProductData());
      });
      productData.value?.favourite = true;
      update();
      Utils.showNotiBotom(context, NOTIFICATION_TYPE.SUCCESS,
          'Add products to my favorite successfully');
    } else {
      homeController.myFavouties.update((val) {
        val?.remove(productData.value ?? ProductData());
      });

      productData.value?.favourite = false;
      update();
      Utils.showNotiBotom(context, NOTIFICATION_TYPE.SUCCESS,
          'Remove the product from my favorite successfully');
    }
  }

  void addMyCart(BuildContext context) {
    productData.value?.quantity = quantity.value;
    homeController.myCart.update((val) {
      val?.add(productData.value ?? ProductData());
    });
    homeController.totalCacular();
    Utils.showNotiBotom(context, NOTIFICATION_TYPE.SUCCESS,
        'Add products to My Cart successfully');
  }
}
