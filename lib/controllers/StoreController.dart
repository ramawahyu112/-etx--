import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  final storeName = 'Rey Store'.obs;
  final followerCount = 0.obs;
  final storeStatus = true.obs;
  final followerList = [].obs;
  final storeNameEditingController = TextEditingController().obs;
  final reviewEditingController = TextEditingController().obs;
  final followerController = TextEditingController().obs;
  final reviewNameController = TextEditingController().obs;

  updateStoreName(String name) {
    storeName(name);
  }

  updateFollowerCount() {
    followerCount(followerCount.value + 1);
  }

  void storeStatusOpen(bool isOpen) {
    storeStatus(isOpen);
  }
}
