// lib/features/chatbot/screens/chatbot_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:campusbite/features/chatbot/services/chatbot_service.dart';
import 'package:campusbite/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addBotMessage(
      "Hi! I'm CampusBite AI. How can I help with your food needs today?",
    );
  }

  void _addBotMessage(String text) {
    _messages.add(
      ChatMessage(text: text, isUser: false, timestamp: DateTime.now()),
    );
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _isLoading) return;

    _controller.clear();
    _messages.add(
      ChatMessage(text: text, isUser: true, timestamp: DateTime.now()),
    );
    _setLoading(true);

    try {
      final response = await ChatbotService.sendMessage(
        text,
        _messages
            .map((m) => {'text': m.text, 'isUser': m.isUser.toString()})
            .toList(),
      );
      _addBotMessage(response);
    } catch (e) {
      _addBotMessage(
        "Sorry, I couldn't process your request. Please try again.",
      );
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    setState(() => _isLoading = loading);
    if (!loading) _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CampusBite Assistant', style: GoogleFonts.poppins()),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildMessage(ChatMessage message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isUser)
            CircleAvatar(
              backgroundColor: AppColors.primary.withOpacity(0.1),
              child: const Icon(Icons.smart_toy, color: AppColors.primary),
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment:
                  message.isUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color:
                        message.isUser
                            ? AppColors.primary.withOpacity(0.1)
                            : Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: MarkdownBody(
                    data: message.text,
                    styleSheet: MarkdownStyleSheet(
                      p: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('h:mm a').format(message.timestamp),
                  style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon:
                _isLoading
                    ? const CircularProgressIndicator()
                    : const Icon(Icons.send, color: AppColors.primary),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  const ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}
