import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/moles/product_model.dart';
import '../../data/repositories/product_repository.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var isLoading = false.obs;
  final productRepository = ProductRepository();

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  int get totalItems {
    return cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  void addToCart(Product product, int quantity) {
    final existingIndex = cartItems.indexWhere((item) => item.product.id == product.id);

    if (existingIndex != -1) {
      cartItems[existingIndex] = CartItem(
        product: product,
        quantity: cartItems[existingIndex].quantity + quantity,
      );
    } else {
      cartItems.add(CartItem(product: product, quantity: quantity));
    }

    update();
  }

  void removeFromCart(String productId) {
    cartItems.removeWhere((item) => item.product.id == productId);
    update();
  }

  void updateQuantity(String productId, int newQuantity) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      if (newQuantity > 0) {
        cartItems[index] = CartItem(
          product: cartItems[index].product,
          quantity: newQuantity,
        );
      } else {
        removeFromCart(productId);
      }
    }
    update();
  }

  void clearCart() {
    cartItems.clear();
    update();
  }

  void checkout() {
    if (cartItems.isEmpty) {
      Get.snackbar(
        'خطأ',
        'السلة فارغة',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.defaultDialog(
      title: 'تأكيد الطلب',
      middleText: 'إجمالي الطلب: ${totalPrice.toStringAsFixed(2)} ر.س\nعدد المنتجات: $totalItems',
      textConfirm: 'تأكيد',
      textCancel: 'إلغاء',
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
        _processOrder();
      },
    );
  }

  void _processOrder() {
    isLoading.value = true;

    // محاكاة عملية الدفع
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;

      // هنا يمكن إضافة الطلب إلى قائمة الطلبات
      Get.snackbar(
        'نجاح',
        'تم تأكيد طلبك بنجاح! رقم الطلب: #${DateTime.now().millisecondsSinceEpoch}',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );

      clearCart();

      // الانتقال إلى صفحة الطلبات
      Get.toNamed('/orders');
    });
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  double get totalPrice => product.price * quantity;
}