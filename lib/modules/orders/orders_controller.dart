import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/moles/product_model.dart';
import '../cart/cart_controller.dart';

class OrdersController extends GetxController {
  var orders = <Order>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadOrders();
  }

  void loadOrders() {
    // بيانات وهمية للطلبات
    orders.assignAll([
      Order(
        id: 'ORD-001',
        date: DateTime.now().subtract(const Duration(days: 2)),
        items: [
          CartItem(
            product: Product(
              id: '1',
              name: 'هاتف سامسونج جلاكسي S23',
              description: 'هاتف ذكي',
              price: 3299.99,
              imageUrl: 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=500',
              images: [],
              categoryId: '1',
            ),
            quantity: 1,
          ),
        ],
        totalAmount: 3299.99,
        status: OrderStatus.delivered,
      ),
      Order(
        id: 'ORD-002',
        date: DateTime.now().subtract(const Duration(days: 5)),
        items: [
          CartItem(
            product: Product(
              id: '3',
              name: 'تيشيرت قطني',
              description: 'تيشيرت مصنوع من القطن',
              price: 79.99,
              imageUrl: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500',
              images: [],
              categoryId: '2',
            ),
            quantity: 2,
          ),
        ],
        totalAmount: 159.98,
        status: OrderStatus.processing,
      ),
      Order(
        id: 'ORD-003',
        date: DateTime.now().subtract(const Duration(days: 10)),
        items: [
          CartItem(
            product: Product(
              id: '4',
              name: 'ساعة أبل الذكية',
              description: 'ساعة ذكية',
              price: 1899.99,
              imageUrl: 'https://images.unsplash.com/photo-1434493650001-5d43a6fea0b1?w=500',
              images: [],
              categoryId: '1',
            ),
            quantity: 1,
          ),
        ],
        totalAmount: 1899.99,
        status: OrderStatus.shipped,
      ),
    ]);
  }

  void reorder(String orderId) {
    final order = orders.firstWhere((order) => order.id == orderId);

    // إضافة منتجات الطلب إلى السلة
    final cartController = Get.find<CartController>();
    for (var item in order.items) {
      cartController.addToCart(item.product, item.quantity);
    }

    Get.snackbar(
      'تمت إعادة الطلب',
      'تمت إضافة ${order.items.length} منتجات إلى السلة',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void trackOrder(String orderId) {
    Get.snackbar(
      'تتبع الطلب',
      'سيتم تفعيل خاصية تتبع الطلب قريباً',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled,
}

class Order {
  final String id;
  final DateTime date;
  final List<CartItem> items;
  final double totalAmount;
  final OrderStatus status;

  Order({
    required this.id,
    required this.date,
    required this.items,
    required this.totalAmount,
    required this.status,
  });

  String get statusText {
    switch (status) {
      case OrderStatus.pending:
        return 'قيد الانتظار';
      case OrderStatus.processing:
        return 'قيد المعالجة';
      case OrderStatus.shipped:
        return 'تم الشحن';
      case OrderStatus.delivered:
        return 'تم التوصيل';
      case OrderStatus.cancelled:
        return 'ملغي';
    }
  }

  Color get statusColor {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.processing:
        return Colors.blue;
      case OrderStatus.shipped:
        return Colors.purple;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.red;
    }
  }
}