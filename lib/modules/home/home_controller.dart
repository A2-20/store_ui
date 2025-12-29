import 'package:get/get.dart';
import '../../data/moles/category_model.dart';
import '../../data/moles/product_model.dart';
import '../../data/repositories/product_repository.dart';

class HomeController extends GetxController {
  final productRepository = ProductRepository();

  var featuredProducts = <Product>[].obs;
  var categories = <Category>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    try {
      // تحميل التصنيفات
      categories.assignAll(productRepository.getAllCategories());

      // تحميل المنتجات المميزة (خذ أول 4 منتجات)
      featuredProducts.assignAll(productRepository.getAllProducts().take(8).toList());
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavorite(String productId) {
    productRepository.toggleFavorite(productId);
    loadData(); // إعادة تحميل البيانات لتحديث القائمة
  }
}