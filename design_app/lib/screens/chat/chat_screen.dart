// lib/screens/chat/chat_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_viewmodel.dart';
import '../../models/expert.dart';
import 'widgets/chat_app_bar.dart';
import 'widgets/message_list.dart';
import 'widgets/message_input.dart';

class ChatScreen extends StatefulWidget {
  final Expert? expert;

  const ChatScreen({super.key, this.expert});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatViewModel>().initializeChat(expert: widget.expert);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Consumer<ChatViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                ChatAppBar(
                  title: viewModel.chatTitle,
                  subtitle: viewModel.chatSubtitle,
                  onBackPressed: () => Navigator.of(context).pop(),
                ),

                Expanded(
                  child: MessageList(
                    messages: viewModel.messages,
                    scrollController: viewModel.scrollController,
                  ),
                ),

                MessageInput(
                  controller: viewModel.messageController,
                  onSend: viewModel.sendMessage,
                  onChanged: viewModel.onMessageChanged,
                  canSend: viewModel.canSend,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
