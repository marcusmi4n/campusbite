class User {
  final String uid;
  final String email;
  final String? name;
  final String? phone;
  final String? studentNumber;
  final List<String>? favoriteFoods;
  final List<Map<String, dynamic>>? cart;

  User({
    required this.uid,
    required this.email,
    this.name,
    this.phone,
    this.studentNumber,
    this.favoriteFoods,
    this.cart,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return User(
      uid: doc.id,
      email: data['email'] ?? '',
      name: data['name'],
      phone: data['phone'],
      studentNumber: data['studentNumber'],
      favoriteFoods: List<String>.from(data['favorites'] ?? []),
      cart: List<Map<String, dynamic>>.from(data['cart'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'studentNumber': studentNumber,
      'favorites': favoriteFoods ?? [],
      'cart': cart ?? [],
    };
  }
}
