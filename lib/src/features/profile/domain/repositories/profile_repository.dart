import 'package:flutter/material.dart';

abstract class ProfileRepository {
  Future<void> updateProfile({
    required BuildContext context,
    String? name,
    String? password,
  });
}
