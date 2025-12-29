import 'package:get/get.dart';
import '../../data/moles/product_model.dart';
import '../../data/repositories/product_repository.dart';

class WishlistController extends GetxController {
  final productRepository = ProductRepository();

  var wishlistProducts = <Product>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadWishlist();
  }

  void loadWishlist() {
    isLoading.value = true;
    try {
      wishlistProducts.assignAll(productRepository.getFavoriteProducts());
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavorite(String productId) {
    productRepository.toggleFavorite(productId);
    loadWishlist();
    update();
  }

  void removeFromWishlist(String productId) {
    productRepository.toggleFavorite(productId);
    wishlistProducts.removeWhere((product) => product.id == productId);
    Get.snackbar(
      'تمت الإزالة',
      'تمت إزالة المنتج من المفضلة',
      snackPosition: SnackPosition.BOTTOM,
    );
    update();
  }

  void clearWishlist() {
    for (var product in wishlistProducts) {
      if (product.isFavorite) {
        productRepository.toggleFavorite(product.id);
      }
    }
    wishlistProducts.clear();
    Get.snackbar(
      'تم المسح',
      'تم مسح جميع المنتجات من المفضلة',
      snackPosition: SnackPosition.BOTTOM,
    );
    update();
  }
}