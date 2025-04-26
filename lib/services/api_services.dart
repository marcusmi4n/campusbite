import 'package:firebase_functions/firebase_functions.dart';

class ApiService {
  static Future<String> getFoodSuggestion(String mood) async {
    try {
      final result = await FirebaseFunctions.instance
          .httpsCallable('getFoodSuggestion')
          .call({'mood': mood});
      return result.data['suggestion'];
    } catch (e) {
      debugPrint('API Error: $e');
      return "Our chef is busy. Try again later!";
    }
  }
}
