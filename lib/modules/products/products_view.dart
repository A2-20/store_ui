import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'products_controller.dart';
import '../../app/widgets/product_card.dart';
import '../../app/widgets/responsive_grid.dart';

class ProductsView extends GetView<ProductsController> {
  ProductsView({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;
    final isMediumScreen = size.width >= 360 && size.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          // AppBar مخصص
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: isSmallScreen ? 80.0 :
            isMediumScreen ? 100.0 : 120.0,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Container(
                width: isSmallScreen ? 36.0 :
                isMediumScreen ? 40.0 : 44.0,
                height: isSmallScreen ? 36.0 :
                isMediumScreen ? 40.0 : 44.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(
                    isSmallScreen ? 10.0 : 12.0,
                  ),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: const Color(0xFF6C63FF),
                  size: isSmallScreen ? 20.0 : 22.0,
                ),
              ),
              onPressed: () => Get.back(),
            ),
            title: Text(
              'جميع المنتجات',
              style: TextStyle(
                fontSize: isSmallScreen ? 18.0 :
                isMediumScreen ? 20.0 : 22.0,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2D2B5C),
              ),
            ),
          ),

          // شريط البحث
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(
                isSmallScreen ? 12.0 :
                isMediumScreen ? 16.0 : 20.0,
              ),
              child: Container(
                height: isSmallScreen ? 48.0 :
                isMediumScreen ? 54.0 : 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    isSmallScreen ? 14.0 : 18.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'ابحث عن منتج...',
                    hintStyle: TextStyle(
                      color: const Color(0xFF8A879F),
                      fontSize: isSmallScreen ? 14.0 :
                      isMediumScreen ? 15.0 : 16.0,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color(0xFF6C63FF),
                      size: isSmallScreen ? 20.0 : 22.0,
                    ),
                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: const Color(0xFFFF6584),
                        size: isSmallScreen ? 18.0 : 20.0,
                      ),
                      onPressed: () {
                        searchController.clear();
                        controller.searchProducts('');
                      },
                    )
                        : null,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen ? 16.0 : 20.0,
                      vertical: isSmallScreen ? 14.0 : 16.0,
                    ),
                  ),
                  onChanged: controller.searchProducts,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14.0 :
                    isMediumScreen ? 15.0 : 16.0,
                    color: const Color(0xFF2D2B5C),
                  ),
                ),
              ),
            ),
          ),

          // عدد النتائج
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 16.0 :
                isMediumScreen ? 20.0 : 24.0,
                vertical: isSmallScreen ? 12.0 : 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${controller.filteredProducts.length} منتج',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12.0 :
                      isMediumScreen ? 14.0 : 16.0,
                      color: const Color(0xFF5D5A7C),
                    ),
                  ),
                  if (controller.selectedCategory.isNotEmpty)
                    ElevatedButton(
                      onPressed: () => controller.filterByCategory(''),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF6C63FF),
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 12.0 : 16.0,
                          vertical: isSmallScreen ? 6.0 : 8.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            isSmallScreen ? 8.0 : 10.0,
                          ),
                          side: const BorderSide(
                            color: Color(0xFF6C63FF),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Text(
                        'إلغاء الفلتر',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 10.0 :
                          isMediumScreen ? 12.0 : 14.0,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // قائمة المنتجات
          Obx(() {
            if (controller.isLoading.value) {
              return SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: const Color(0xFF6C63FF),
                        backgroundColor: Colors.grey.shade200,
                      ),
                      SizedBox(height: isSmallScreen ? 16.0 : 20.0),
                      Text(
                        'جاري تحميل المنتجات...',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 14.0 :
                          isMediumScreen ? 16.0 : 18.0,
                          color: const Color(0xFF5D5A7C),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (controller.filteredProducts.isEmpty) {
              return SliverFillRemaining(
                child: _buildEmptyState(context),
              );
            }

            return SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 12.0 :
                isMediumScreen ? 16.0 : 20.0,
              ),
              sliver: ResponsiveGrid(
                items: controller.filteredProducts,
                itemBuilder: (context, product) => ProductCard(
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
                ),
              ),
            );
          }),

          SliverToBoxAdapter(
            child: SizedBox(
              height: isSmallScreen ? 20.0 : 30.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;
    final isMediumScreen = size.width >= 360 && size.width < 600;

    return SingleChildScrollView(
      padding: EdgeInsets.all(
        isSmallScreen ? 20.0 :
        isMediumScreen ? 24.0 : 30.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: isSmallScreen ? 150.0 :
            isMediumScreen ? 180.0 : 200.0,
            height: isSmallScreen ? 150.0 :
            isMediumScreen ? 180.0 : 200.0,
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
            child: Icon(
              Icons.search_off_rounded,
              size: isSmallScreen ? 60.0 :
              isMediumScreen ? 80.0 : 100.0,
              color: const Color(0xFF6C63FF),
            ),
          ),
          SizedBox(height: isSmallScreen ? 20.0 : 30.0),
          Text(
            'لا توجد منتجات',
            style: TextStyle(
              fontSize: isSmallScreen ? 20.0 :
              isMediumScreen ? 24.0 : 28.0,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D2B5C),
            ),
          ),
          SizedBox(height: isSmallScreen ? 10.0 : 15.0),
          Obx(() {
            return Text(
              controller.searchQuery.isNotEmpty
                  ? 'لم يتم العثور على "${controller.searchQuery.value}"'
                  : controller.selectedCategory.isNotEmpty
                  ? 'لا توجد منتجات في هذا التصنيف'
                  : 'جرب تغيير فلاتر البحث',
              style: TextStyle(
                fontSize: isSmallScreen ? 14.0 :
                isMediumScreen ? 16.0 : 18.0,
                color: const Color(0xFF5D5A7C),
              ),
              textAlign: TextAlign.center,
            );
          }),
          SizedBox(height: isSmallScreen ? 25.0 : 35.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (controller.searchQuery.isNotEmpty)
                ElevatedButton(
                  onPressed: () {
                    searchController.clear();
                    controller.searchProducts('');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6C63FF),
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen ? 20.0 : 25.0,
                      vertical: isSmallScreen ? 12.0 : 14.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        isSmallScreen ? 12.0 : 15.0,
                      ),
                      side: const BorderSide(
                        color: Color(0xFF6C63FF),
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    'إعادة تعيين',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12.0 :
                      isMediumScreen ? 14.0 : 16.0,
                    ),
                  ),
                ),
              if (controller.selectedCategory.isNotEmpty)
                SizedBox(width: isSmallScreen ? 10.0 : 15.0),
              if (controller.selectedCategory.isNotEmpty)
                ElevatedButton(
                  onPressed: () {
                    controller.filterByCategory('');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C63FF),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen ? 20.0 : 25.0,
                      vertical: isSmallScreen ? 12.0 : 14.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        isSmallScreen ? 12.0 : 15.0,
                      ),
                    ),
                  ),
                  child: Text(
                    'إظهار الكل',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12.0 :
                      isMediumScreen ? 14.0 : 16.0,
                    ),
                  ),
                ),
            ].whereType<Widget>().toList(),
          ),
        ],
      ),
    );
  }
}