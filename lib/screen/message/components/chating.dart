import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/services/database.dart';
import 'package:shop_app/size_config.dart';

class Chatting extends StatefulWidget {
  final String cUsername, chatroomId;

  const Chatting({Key key, this.cUsername, this.chatroomId}) : super(key: key);

  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  Database database = Database();

  TextEditingController messagecontrol = TextEditingController();

  Stream chatStream;

  int hour = DateTime.now().hour;
  int min = DateTime.now().minute;

  String time =
      "${DateTime.now().hour > 12 ? DateTime.now().hour - 12 : DateTime.now().hour}:${DateTime.now().minute < 10 ? '0${DateTime.now().minute}' : DateTime.now().minute} ${DateTime.now().hour < 12 ? 'am' : 'pm'}";

  Widget ChatMessage() {
    return StreamBuilder(
      stream: chatStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                    message: snapshot.data.docs[index].data()["message"],
                    mysend: snapshot.data.docs[index].data()["sendbyemail"] ==
                        gmail,
                    time: snapshot.data.docs[index].data()["time"],
                  );
                })
            : Container();
      },
    );
  }

  sendMessage() {
    if (messagecontrol.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messagecontrol.text,
        "sendby": myName,
        "sendbyemail": gmail,
        "unitime": DateTime.now().millisecondsSinceEpoch,
        "time": time,
      };

      database.addMessage(widget.chatroomId, messageMap);

      messagecontrol.text = "";
    }
  }

  @override
  void initState() {
    print(time);
    database.getChatMessage(widget.chatroomId).then((v) {
      setState(() {
        chatStream = v;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          widget.cUsername != null ? widget.cUsername : "username",
          style: TextStyle(
              color: kprimaryc,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.79,
            child: ChatMessage(),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: kprimaryc.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Message...",
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 16),
                      controller: messagecontrol,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      sendMessage();
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(13, 10, 10, 10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0x46ffffff),
                            Color(0x1fffffff),
                          ]),
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.send,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message, time;
  final bool mysend;

  const MessageTile({
    Key key,
    this.message,
    this.mysend,
    this.time,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: mysend ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: mysend
                  ? kprimaryc.withOpacity(0.7)
                  : Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: mysend ? Radius.circular(15) : Radius.circular(0),
                bottomRight: mysend ? Radius.circular(0) : Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message,
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  time,
                  style: TextStyle(color: Colors.black38, fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
