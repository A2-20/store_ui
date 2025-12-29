import 'package:get/get.dart';
import '../../data/moles/product_model.dart';
import '../../data/repositories/product_repository.dart';
import '../cart/cart_controller.dart';

class ProductDetailController extends GetxController {
  final productRepository = ProductRepository();

  var product = Product(
    id: '',
    name: '',
    description: '',
    price: 0,
    imageUrl: '',
    images: [],
    categoryId: '',
  ).obs;

  var selectedImageIndex = 0.obs;
  var quantity = 1.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    final productId = Get.parameters['id'];
    if (productId != null) {
      loadProduct(productId);
    }
  }

  void loadProduct(String productId) {
    try {
      isLoading.value = true;
      final loadedProduct = productRepository.getProductById(productId);
      product.value = loadedProduct;
    } catch (e) {
      Get.back();
      Get.snackbar('خطأ', 'المنتج غير موجود');
    } finally {
      isLoading.value = false;
    }
  }

  void changeImage(int index) {
    selectedImageIndex.value = index;
  }

  void increaseQuantity() {
    if (quantity.value < product.value.stock) {
      quantity.value++;
    }
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void toggleFavorite() {
    productRepository.toggleFavorite(product.value.id);
    product.value = product.value.copyWith(
      isFavorite: !product.value.isFavorite,
    );
  }

  void addToCart() {
    final cartController = Get.find<CartController>();
    cartController.addToCart(product.value, quantity.value);

    Get.snackbar(
      'تمت الإضافة',
      'تم إضافة ${quantity.value} من ${product.value.name} إلى السلة',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }
}