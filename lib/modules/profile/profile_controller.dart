import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var user = User(
    name: 'أحمد محمد',
    email: 'ahmed@example.com',
    phone: '+966500000000',
    address: 'مكة المكرمة، المملكة العربية السعودية',
  ).obs;

  var isLoading = false.obs;

  void updateProfile(User newUser) {
    user.value = newUser;
    Get.snackbar(
      'تم التحديث',
      'تم تحديث بيانات الملف الشخصي',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void logout() {
    Get.defaultDialog(
      title: 'تسجيل الخروج',
      middleText: 'هل تريد تسجيل الخروج من التطبيق؟',
      textConfirm: 'نعم',
      textCancel: 'لا',
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.offAllNamed('/home');
        Get.snackbar(
          'تم تسجيل الخروج',
          'تم تسجيل الخروج بنجاح',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }
}

class User {
  String name;
  String email;
  String phone;
  String address;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  User copyWith({
    String? name,
    String? email,
    String? phone,
    String? address,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}