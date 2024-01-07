import 'package:nws_yenpth1_ecommerce_flutter/base/base.dart';
import 'package:nws_yenpth1_ecommerce_flutter/models/product_data.dart';

import 'api_path.dart';

class ProductProvider extends BaseNetWork {
  Future<List<ProductData>> getFilterProduct(
      {required int categoryId, String? title, String? price}) async {
    final Map<String, String?> params = {
      'categoryId': categoryId.toString(),
      'title': title,
      'price': price
    };
    final ApiRequest req = ApiRequest(
        path: ApiPath.product, method: METHOD.GET, auth: false, query: params);

    final res = await sendRequest(
      req,
      decoder: ProductData.fromJson,
    );

    if (res.success) {
      return res.items;
    } else {
      return [];
    }
  }

  Future<ProductData?> getProductDetail({required int productId}) async {
    final ApiRequest req = ApiRequest(
        path: '${ApiPath.product}$productId', method: METHOD.GET, auth: false);

    final res = await sendRequest(
      req,
      decoder: ProductData.fromJson,
    );

    if (res.success) {
      return res.body;
    } else {
      return null;
    }
  }
}
