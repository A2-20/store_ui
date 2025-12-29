import 'package:get/get.dart';
import '../../modules/home/home_view.dart';
import '../../modules/products/products_view.dart';
import '../../modules/cart/cart_view.dart';
import '../../modules/products_delail/product_detail_view.dart';
import '../../modules/wishlist/wishlist_view.dart';
import '../../modules/orders/orders_view.dart';
import '../../modules/profile/profile_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomeView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/products',
      page: () => ProductsView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/product_detail',
      page: () => ProductDetailView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/cart',
      page: () => CartView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/wishlist',
      page: () => WishlistView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/orders',
      page: () => OrdersView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/profile',
      page: () => ProfileView(),
      transition: Transition.rightToLeft,
    ),
  ];
}