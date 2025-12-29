
import '../moles/category_model.dart';
import '../moles/product_model.dart';

class ProductRepository {
  // بيانات التصنيفات
  static final List<Category> categories = [
    Category(
        id: '1',
        name: 'إلكترونيات',
        imageUrl: 'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=200&fit=crop'
    ),
    Category(
        id: '2',
        name: 'ملابس',
        imageUrl: 'https://images.unsplash.com/photo-1445205170230-053b83016050?w=200&fit=crop'
    ),
    Category(
        id: '3',
        name: 'منزلية',
        imageUrl: 'https://images.unsplash.com/photo-1484101403633-562f891dc89a?w=200&fit=crop'
    ),
    Category(
        id: '4',
        name: 'كتب',
        imageUrl: 'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=200&fit=crop'
    ),
    Category(
        id: '5',
        name: 'ألعاب',
        imageUrl: 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=200&fit=crop'
    ),
    Category(
        id: '6',
        name: 'رياضة',
        imageUrl: 'https://images.unsplash.com/photo-1517649763962-0c623066013b?w=200&fit=crop'
    ),
    Category(
        id: '7',
        name: 'جوالات',
        imageUrl: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=200&fit=crop'
    ),
    Category(
        id: '8',
        name: 'حواسيب',
        imageUrl: 'https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?w=200&fit=crop'
    ),
    Category(
        id: '9',
        name: 'ساعات',
        imageUrl: 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?w=200&fit=crop'
    ),
    Category(
        id: '10',
        name: 'أحذية',
        imageUrl: 'https://images.unsplash.com/photo-1560343090-f0409e92791a?w=200&fit=crop'
    ),
  ];

  // بيانات المنتجات (باستخدام صور من الإنترنت)
  static final List<Product> products = [
    Product(
      id: '1',
      name: ' سامسونج S23',
      description: 'هاتف ذكي بمواصفات عالية، شاشة 6.1 بوصة، كاميرا 50 ميجابكسل',
      price: 3299.99,
      imageUrl: 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400',
      images: [
        'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400',
        'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=400',
      ],
      categoryId: '1',
      rating: 4.5,
      reviews: 128,
      stock: 15,
    ),
    Product(
      id: '2',
      name: 'لابتوب  XPS 13',
      description: 'لابتوب محمول بشاشة لامعة 13.3 بوصة، معالج Core i7',
      price: 4599.99,
      imageUrl: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400',
      images: [
        'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400',
        'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400',
      ],
      categoryId: '1',
      rating: 4.7,
      reviews: 89,
      stock: 8,
    ),
    Product(
      id: '3',
      name: 'تيشيرت قطني',
      description: 'تيشيرت مصنوع من القطن بنسبة 100%، متوفر بعدة ألوان',
      price: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400',
      images: [
        'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400',
        'https://images.unsplash.com/photo-1586790170083-2f9ceadc732d?w=400',
      ],
      categoryId: '2',
      rating: 4.2,
      reviews: 256,
      stock: 50,
    ),
    Product(
      id: '4',
      name: 'ساعة أبل ',
      description: 'ساعة ذكية بتقنيات متقدمة لمراقبة الصحة واللياقة',
      price: 1899.99,
      imageUrl: 'https://images.unsplash.com/photo-1434493650001-5d43a6fea0b1?w=400',
      images: [
        'https://images.unsplash.com/photo-1434493650001-5d43a6fea0b1?w=400',
        'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=400',
      ],
      categoryId: '1',
      rating: 4.8,
      reviews: 342,
      stock: 12,
    ),
    Product(
      id: '5',
      name: 'سماعات لاسلكية',
      description: 'سماعات بلوتوث مع عزل صوت ممتاز',
      price: 299.99,
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
      images: [
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
      ],
      categoryId: '1',
      rating: 4.3,
      reviews: 156,
      stock: 25,
    ),
    Product(
      id: '6',
      name: 'طاولة مكتب',
      description: 'طاولة مكتب خشبية مع مساحة تخزين',
      price: 599.99,
      imageUrl: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
      images: [
        'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
      ],
      categoryId: '3',
      rating: 4.6,
      reviews: 78,
      stock: 10,
    ),
    Product(
      id: '7',
      name: 'كتاب برمجة',
      description: 'كتاب شامل لتعلم برمجة التطبيقات',
      price: 129.99,
      imageUrl: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=400',
      images: [
        'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=400',
      ],
      categoryId: '4',
      rating: 4.4,
      reviews: 45,
      stock: 30,
    ),
    Product(
      id: '8',
      name: 'كرة',
      description: 'كرة قدم رسمية للمباريات',
      price: 149.99,
      imageUrl: 'https://images.unsplash.com/photo-1575361204480-aadea25e6e68?w=400',
      images: [
        'https://images.unsplash.com/photo-1575361204480-aadea25e6e68?w=400',
      ],
      categoryId: '6',
      rating: 4.5,
      reviews: 92,
      stock: 40,
    ),
    Product(
      id: '9',
      name: 'تابلت ',
      description: 'تابلت بشاشة 10.4 بوصة، 64 جيجابايت',
      price: 1899.99,
      imageUrl: 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400',
      images: [
        'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400',
      ],
      categoryId: '1',
      rating: 4.4,
      reviews: 67,
      stock: 15,
    ),
    Product(
      id: '10',
      name: 'حقيبة ',
      description: 'حقيبة ظهر للمدرسة والجامعة',
      price: 199.99,
      imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
      images: [
        'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
      ],
      categoryId: '2',
      rating: 4.2,
      reviews: 89,
      stock: 35,
    ),
    Product(
      id: '11',
      name: 'إبريق شاي',
      description: 'إبريق شاي زجاجي بسعة 1 لتر',
      price: 89.99,
      imageUrl: 'https://images.unsplash.com/photo-1594736797933-d038e0e74f5b?w=400',
      images: [
        'https://images.unsplash.com/photo-1594736797933-d038e0e74f5b?w=400',
      ],
      categoryId: '3',
      rating: 4.3,
      reviews: 34,
      stock: 25,
    ),
    Product(
      id: '12',
      name: 'لعبة بلايستيشن',
      description: 'لعبة فيديو لأجهزة بلايستيشن',
      price: 249.99,
      imageUrl: 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400',
      images: [
        'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400',
      ],
      categoryId: '5',
      rating: 4.7,
      reviews: 156,
      stock: 20,
    ),
  ];

  // الحصول على جميع المنتجات
  List<Product> getAllProducts() {
    return products;
  }

  // الحصول على المنتجات حسب التصنيف
  List<Product> getProductsByCategory(String categoryId) {
    return products.where((product) => product.categoryId == categoryId).toList();
  }

  // الحصول على منتج بواسطة ID
  Product getProductById(String id) {
    return products.firstWhere((product) => product.id == id);
  }

  // الحصول على جميع التصنيفات
  List<Category> getAllCategories() {
    return categories;
  }

  // البحث في المنتجات
  List<Product> searchProducts(String query) {
    if (query.isEmpty) return products;

    return products
        .where((product) =>
    product.name.toLowerCase().contains(query.toLowerCase()) ||
        product.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // المنتجات المفضلة
  List<Product> getFavoriteProducts() {
    return products.where((product) => product.isFavorite).toList();
  }

  // تحديث حالة المفضلة لمنتج
  void toggleFavorite(String productId) {
    final index = products.indexWhere((p) => p.id == productId);
    if (index != -1) {
      products[index] = products[index].copyWith(
        isFavorite: !products[index].isFavorite,
      );
    }
  }

  // الحصول على منتجات مميزة (أعلى تقييم)
  List<Product> getFeaturedProducts() {
    return products
        .where((product) => product.rating >= 4.5)
        .take(8)
        .toList();
  }

  // الحصول على منتجات جديدة (آخر 6 منتجات)
  List<Product> getNewProducts() {
    return products.reversed.take(6).toList();
  }

  // الحصول على المنتجات الأكثر مبيعاً
  List<Product> getBestSellingProducts() {
    return products
        .where((product) => product.reviews > 100)
        .take(6)
        .toList();
  }
}