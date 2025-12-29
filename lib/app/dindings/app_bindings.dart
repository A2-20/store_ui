import 'package:get/get.dart';
import '../../modules/home/home_controller.dart';
import '../../modules/products/products_controller.dart';
import '../../modules/cart/cart_controller.dart';
import '../../modules/products_delail/product_detail_controller.dart';
import '../../modules/wishlist/wishlist_controller.dart';
import '../../modules/orders/orders_controller.dart';
import '../../modules/profile/profile_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProductsController(), fenix: true);
    Get.lazyPut(() => ProductDetailController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => WishlistController(), fenix: true);
    Get.lazyPut(() => OrdersController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}