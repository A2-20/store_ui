import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'wishlist_controller.dart';
import '../../app/widgets/product_card_modern.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'المفضلة',
          style: TextStyle(
            color: Color(0xFF2D2B5C),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF6C63FF),
            ),
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          Obx(() {
            if (controller.wishlistProducts.isNotEmpty) {
              return IconButton(
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.delete_sweep,
                    color: Color(0xFFFF6584),
                  ),
                ),
                onPressed: () {
                  Get.defaultDialog(
                    title: 'تأكيد المسح',
                    middleText: 'هل تريد مسح جميع المنتجات من المفضلة؟',
                    textConfirm: 'نعم',
                    textCancel: 'لا',
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      controller.clearWishlist();
                      Get.back();
                    },
                  );
                },
              );
            }
            return const SizedBox();
          }),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF6C63FF)),
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'جاري التحميل...',
                  style: TextStyle(
                    color: Color(0xFF5D5A7C),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }

        if (controller.wishlistProducts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite_border_rounded,
                    size: 80,
                    color: Color(0xFF6C63FF),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'المفضلة فارغة',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D2B5C),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'أضف منتجات إلى المفضلة لتظهر هنا',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF5D5A7C),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => Get.offAllNamed('/home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C63FF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('تصفح المنتجات'),
                ),
              ],
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.7,
          ),
          itemCount: controller.wishlistProducts.length,
          itemBuilder: (context, index) {
            final product = controller.wishlistProducts[index];
            return ProductCardModern(
              product: product,
              onTap: () {
                Get.toNamed(
                  '/product_detail',
                  parameters: {'id': product.id},
                );
              },
              onFavoriteTap: () {
                controller.removeFromWishlist(product.id);
              },
            );
          },
        );
      }),
    );
  }
}