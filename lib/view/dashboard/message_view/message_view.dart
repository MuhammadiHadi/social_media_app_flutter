import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app_flutter/utils/utils/utils.dart';
import 'package:social_media_app_flutter/view_model/services/session_mangar.dart';

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
  TextEditingController messageConttroller = TextEditingController();

  DatabaseReference reference = FirebaseDatabase.instance.ref().child('chat');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: reference,
                itemBuilder: (context, snapshot, index, animation) {
                  if (SessionConttroller().userId.toString() ==
                      snapshot.child('chat').value.toString()) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.child('message').value.toString()),
                      ],
                    );
                  } else {
                    return Container();
                  }
                }),
            // ListView.builder(
            //     itemCount: 50,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text([index].toString()),
            //       );
            //     }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(10),
                hintText: "Enter Message",
                suffixIcon: InkWell(
                  onTap: () {
                    sendMessage();
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
              ),
              controller: messageConttroller,
            ),
          ),
        ],
      ),
    );
  }

  sendMessage() {
    if (messageConttroller.text.isEmpty) {
      Utils.toastMessage("Write Message");
    } else {
      final Timesremp = DateTime.now().microsecondsSinceEpoch.toString();

      reference.child(Timesremp).set({
        'onSeen': false,
        'message': messageConttroller.text.toString(),
        'sender': SessionConttroller().userId.toString(),
        'receiver': widget.receiverId,
        'type': 'text',
        'time': Timesremp.toString(),
      }).then((value) {
        messageConttroller.clear();
      });
    }
  }
}
