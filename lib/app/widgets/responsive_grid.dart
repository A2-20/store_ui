import 'package:flutter/material.dart';

class ResponsiveGrid<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  const ResponsiveGrid({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.crossAxisSpacing = 12.0,
    this.mainAxisSpacing = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(size),
        crossAxisSpacing: _getSpacing(size, crossAxisSpacing),
        mainAxisSpacing: _getSpacing(size, mainAxisSpacing),
        childAspectRatio: _getAspectRatio(size),
      ),
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return itemBuilder(context, items[index]);
        },
        childCount: items.length,
      ),
    );
  }

  int _getCrossAxisCount(Size size) {
    if (size.width > 1200) return 4;  // كمبيوتر مكتبي
    if (size.width > 900) return 4;   // كمبيوتر لوحي كبير
    if (size.width > 600) return 3;   // كمبيوتر لوحي
    if (size.width > 400) return 2;   // هاتف كبير
    if (size.width > 320) return 2;   // هاتف متوسط
    return 2;                         // هاتف صغير
  }

  double _getSpacing(Size size, double baseSpacing) {
    if (size.width < 360) return baseSpacing * 0.7;
    if (size.width < 600) return baseSpacing * 0.9;
    return baseSpacing;
  }

  double _getAspectRatio(Size size) {
    if (size.width > 1200) return 0.9;   // كمبيوتر مكتبي
    if (size.width > 900) return 0.85;   // كمبيوتر لوحي كبير
    if (size.width > 600) return 0.8;    // كمبيوتر لوحي
    if (size.width > 400) return 0.75;   // هاتف كبير
    if (size.width > 320) return 0.7;    // هاتف متوسط
    return 0.65;                         // هاتف صغير
  }
}