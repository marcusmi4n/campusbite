// lib/features/chatbot/services/chatbot_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:campusbite/core/config/api_config.dart';

class ChatbotService {
  static Future<String> sendMessage(
    String message,
    List<Map<String, String>> chatHistory,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConfig.deepSeekBaseUrl}/chat/completions'),
        headers: ApiConfig.headers,
        body: jsonEncode({
          'model': 'deepseek-chat',
          'messages': [
            {
              'role': 'system',
              'content': '''
              You are CampusBite AI, a food assistant for university students.
              Help with: meal recommendations, nutrition info, order tracking, 
              and campus dining locations. Keep responses concise (1-2 sentences).
              Current campus food options: 
              - Burgers, Pizza, African Dishes, Salads, Smoothies
              - Dietary options: Vegan, Gluten-free, Halal
              ''',
            },
            ...chatHistory.map(
              (msg) => {
                'role': msg['isUser'] == 'true' ? 'user' : 'assistant',
                'content': msg['text'],
              },
            ),
            {'role': 'user', 'content': message},
          ],
          'temperature': 0.7,
          'max_tokens': 500,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      }
      throw Exception('API Error: ${response.statusCode}');
    } catch (e) {
      throw Exception('Failed to get response: ${e.toString()}');
    }
  }

  static Future<List<String>> getMoodSuggestions(String mood) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConfig.deepSeekBaseUrl}/chat/completions'),
        headers: ApiConfig.headers,
        body: jsonEncode({
          'model': 'deepseek-chat',
          'messages': [
            {
              'role': 'system',
              'content': '''
              Suggest 3 meal options from these categories:
              Breakfast: Rolex, Pancakes, Fruit Bowl
              Lunch: Burgers, Pizza, African Dishes
              Dinner: Pasta, Grilled Chicken, Vegan Bowls
              Respond ONLY with a JSON array: ["Suggestion 1", "Suggestion 2", "Suggestion 3"]
              ''',
            },
            {
              'role': 'user',
              'content': 'Suggest meals for someone feeling: $mood',
            },
          ],
          'temperature': 0.7,
          'max_tokens': 150,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['choices'][0]['message']['content'];
        return List<String>.from(jsonDecode(content));
      }
      throw Exception('API Error: ${response.statusCode}');
    } catch (e) {
      throw Exception('Failed to get suggestions: ${e.toString()}');
    }
  }
}
