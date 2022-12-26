import 'package:flutter/material.dart';

class MessageView extends StatefulWidget {
  String? name;
  String? image;
  String? receiverId;
  String? email;
  MessageView({
    Key? key,
    this.image,
    this.name,
    this.receiverId,
    this.email,
  }) : super(key: key);

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name!),
        centerTitle: true,
      ),
    );
  }
}
