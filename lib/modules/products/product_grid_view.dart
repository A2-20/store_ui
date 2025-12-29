import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/widgets/product_card_modern.dart';
import '../../data/moles/product_model.dart';

import '../../modules/products/products_controller.dart';

class ProductGridView extends StatelessWidget {
  final List<Product> products;
  final VoidCallback? onLoadMore;
  final bool isLoading;

  const ProductGridView({
    Key? key,
    required this.products,
    this.onLoadMore,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = _calculateCrossAxisCount(constraints.maxWidth);

        return Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: _calculateChildAspectRatio(crossAxisCount),
                mainAxisExtent: _calculateMainAxisExtent(crossAxisCount),
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCardModern(
                  product: product,
                  onTap: () {
                    Get.toNamed(
                      '/product_detail',
                      parameters: {'id': product.id},
                    );
                  },
                  onFavoriteTap: () {
                    final controller = Get.find<ProductsController>();
                    controller.toggleFavorite(product.id);
                  },
                );
              },
            ),

            if (isLoading)
              const Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF6C63FF),
                  ),
                ),
              ),

            if (onLoadMore != null && products.length % 12 == 0 && products.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: onLoadMore,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6C63FF),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Color(0xFF6C63FF)),
                    ),
                  ),
                  child: const Text('تحميل المزيد'),
                ),
              ),
          ],
        );
      },
    );
  }

  int _calculateCrossAxisCount(double width) {
    if (width > 900) return 4;
    if (width > 600) return 3;
    if (width > 400) return 2;
    return 2;
  }

  double _calculateChildAspectRatio(int crossAxisCount) {
    switch (crossAxisCount) {
      case 1:
        return 1.2;
      case 2:
        return 0.8;
      case 3:
        return 0.85;
      case 4:
        return 0.9;
      default:
        return 0.8;
    }
  }

  double? _calculateMainAxisExtent(int crossAxisCount) {
    switch (crossAxisCount) {
      case 1:
        return 300;
      case 2:
        return 280;
      case 3:
        return 260;
      case 4:
        return 250;
      default:
        return 280;
    }
  }
}