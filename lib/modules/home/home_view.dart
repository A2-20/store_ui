import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../cart/cart_controller.dart';
import 'home_controller.dart';
import '../cart/cart_view.dart';
import '../../app/widgets/product_card_modern.dart';
import '../../app/widgets/animated_category_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          // AppBar
          SliverAppBar(
            expandedHeight: 100,
            pinned: true,
            floating: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'متجر إلكتروني',
              style: TextStyle(
                color: Color(0xFF2D2B5C),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            actions: [
              IconButton(
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Obx(() {
                    return Stack(
                      children: [
                        const Center(
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Color(0xFF6C63FF),
                            size: 22,
                          ),
                        ),
                        if (cartController.totalItems > 0)
                          Positioned(
                            top: 5,
                            right: 5,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF6584),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  cartController.totalItems > 9
                                      ? '9+'
                                      : '${cartController.totalItems}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  }),
                ),
                onPressed: () => Get.to(() => CartView()),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF6C63FF).withOpacity(0.1),
                      const Color(0xFFFF6584).withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6C63FF), Color(0xFFFF6584)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6C63FF).withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'أهلاً بك 👋',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'اكتشف أفضل المنتجات بأسعار مميزة',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),


                  GestureDetector(
                    onTap: () => Get.toNamed('/products'),
                    child: Container(
                      height: 55,
                      margin: const EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          const Icon(
                            Icons.search,
                            color: Color(0xFF6C63FF),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            'ابحث عن منتج...',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF6C63FF), Color(0xFFFF6584)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.filter_list,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'التصنيفات',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D2B5C),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed('/products'),
                        child: const Text(
                          'عرض الكل',
                          style: TextStyle(
                            color: Color(0xFF6C63FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),


          SliverToBoxAdapter(
            child: Obx(() {
              return SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index == controller.categories.length - 1 ? 16 : 8,
                        left: index == 0 ? 0 : 8,
                      ),
                      child: AnimatedCategoryCard(
                        category: category,
                        isSelected: false,
                        onTap: () {
                          Get.toNamed(
                            '/products',
                            arguments: {'categoryId': category.id},
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            }),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'المنتجات المميزة',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D2B5C),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.toNamed('/products'),
                    child: const Text(
                      'عرض الكل',
                      style: TextStyle(
                        color: Color(0xFF6C63FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Obx(() {
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: _calculateChildAspectRatio(context),
                ),
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final product = controller.featuredProducts[index];
                    return ProductCardModern(
                      product: product,
                      onTap: () {
                        Get.toNamed(
                          '/product_detail',
                          parameters: {'id': product.id},
                        );
                      },
                      onFavoriteTap: () {
                        controller.toggleFavorite(product.id);
                      },
                    );
                  },
                  childCount: controller.featuredProducts.length,
                ),
              ),
            );
          }),

          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/cart'),
        backgroundColor: const Color(0xFF6C63FF),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(
          Icons.shopping_cart_checkout,
          color: Colors.white,
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  double _calculateChildAspectRatio(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 400) {
      return 0.75; // للشاشات الصغيرة
    } else if (width < 600) {
      return 0.85; // للشاشات المتوسطة
    } else {
      return 0.9; // للشاشات الكبيرة
    }
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomAppBar(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(
                icon: Icons.home_filled,
                label: 'الرئيسية',
                isActive: true,
                onTap: () {},
              ),
              _buildBottomNavItem(
                icon: Icons.category,
                label: 'الأقسام',
                isActive: false,
                onTap: () => Get.toNamed('/products'),
              ),

              _buildBottomNavItem(
                icon: Icons.favorite,
                label: 'المفضلة',
                isActive: false,
                onTap: () => Get.toNamed('/wishlist'),
              ),
              _buildBottomNavItem(
                icon: Icons.person,
                label: 'حسابي',
                isActive: false,
                onTap: () => Get.toNamed('/profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFF6C63FF).withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                icon,
                color: isActive
                    ? const Color(0xFF6C63FF)
                    : const Color(0xFF8A879F),
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isActive
                  ? const Color(0xFF6C63FF)
                  : const Color(0xFF8A879F),
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}