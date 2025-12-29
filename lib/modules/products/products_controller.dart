import 'package:get/get.dart';
import '../../data/moles/category_model.dart';
import '../../data/moles/product_model.dart';
import '../../data/repositories/product_repository.dart';

class ProductsController extends GetxController {
  final productRepository = ProductRepository();

  var allProducts = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  var categories = <Category>[].obs;
  var selectedCategory = ''.obs;
  var searchQuery = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    try {
      categories.assignAll(productRepository.getAllCategories());
      allProducts.assignAll(productRepository.getAllProducts());
      filteredProducts.assignAll(allProducts);
    } finally {
      isLoading.value = false;
    }
  }

  void filterByCategory(String categoryId) {
    selectedCategory.value = categoryId;
    if (categoryId.isEmpty) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(
        productRepository.getProductsByCategory(categoryId),
      );
    }
  }

  void searchProducts(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filterByCategory(selectedCategory.value);
    } else {
      filteredProducts.assignAll(productRepository.searchProducts(query));
    }
  }

  void toggleFavorite(String productId) {
    productRepository.toggleFavorite(productId);
    loadData(); // إعادة تحميل البيانات
  }
}