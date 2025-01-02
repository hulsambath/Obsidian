import 'package:vendor_app/http/base_app_api.dart';
import 'package:vendor_app/models/product_model.dart';

class ProductsApi extends BaseAppApi<ProductModel> {
  @override
  String get path => '/api/v2/storefront/products';

  @override
  ProductModel? jsonToObject(Map<String, dynamic> json) {
    return ProductModel.fromJson(json);
  }
}
