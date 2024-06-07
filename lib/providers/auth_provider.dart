import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  String _errorMessage = '';
  bool _isLoading = false;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      await AuthService().signup(
        email: email,
        name: name,
        password: password,
        confirmPassword: confirmPassword,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signIn({required String email, required String password}) async {
    try {
      _isLoading = true;
      notifyListeners();

      AuthService().signIn(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signOut() async {
    try {
      _isLoading = true;
      notifyListeners();

      await AuthService().signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
