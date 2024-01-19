import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomtom/src/features/auth/presentation/pages/signup_page.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../core/constants/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late WebSocketChannel channel;
  final TextEditingController messageController = TextEditingController();
  @override
  void initState() {
    super.initState();
    channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: StreamBuilder(
                    stream: channel.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return const Text('Connection closed');
                      }
                      if (snapshot.hasData) {
                        return MessageCard(text: snapshot.data);
                      }
                      return Container();
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(10.h),
                  child: TextField(
                    onSubmitted: (String text) {
                      channel.sink.add(text);
                      messageController.clear();
                    },
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.h),
                        borderSide: const BorderSide(
                          color: AppColors.darkGreen,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.all(5.h),
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.darkGreen,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13.h),
            bottomLeft: Radius.circular(13.h),
            bottomRight: Radius.circular(13.h),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
