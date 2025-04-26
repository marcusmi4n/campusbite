import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:campusbite/models/food_item.dart';
import 'package:campusbite/models/order.dart';
import 'package:campusbite/models/user.dart' as app_user;

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // User Management
  Future<void> createUserData(app_user.User user) async {
    await _db.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<app_user.User?> getUserData(String uid) async {
    DocumentSnapshot doc = await _db.collection('users').doc(uid).get();
    return doc.exists ? app_user.User.fromFirestore(doc) : null;
  }

  // Food Items
  Stream<List<FoodItem>> getFoodItems() {
    return _db
        .collection('foodItems')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => FoodItem.fromFirestore(doc)).toList(),
        );
  }

  // Orders
  Future<void> addOrder(Order order) async {
    await _db.collection('orders').add(order.toMap());
  }

  Stream<List<Order>> getUserOrders(String userId) {
    return _db
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Order.fromFirestore(doc)).toList(),
        );
  }

  // Cart
  Future<void> updateCart(String userId, List<Map<String, dynamic>> cartItems) {
    return _db.collection('users').doc(userId).update({'cart': cartItems});
  }

  // Favorites
  Future<void> toggleFavorite(String userId, String foodItemId) async {
    DocumentReference userRef = _db.collection('users').doc(userId);
    DocumentSnapshot userDoc = await userRef.get();

    List<dynamic> favorites = userDoc['favorites'] ?? [];
    if (favorites.contains(foodItemId)) {
      favorites.remove(foodItemId);
    } else {
      favorites.add(foodItemId);
    }

    await userRef.update({'favorites': favorites});
  }
}
