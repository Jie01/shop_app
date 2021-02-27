import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screen/message/components/chating.dart';
import 'package:shop_app/services/database.dart';
import 'package:shop_app/services/helper.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Database database = Database();

  Stream chatroomStream;

  Widget chatroomList() {
    return StreamBuilder(
      stream: chatroomStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return ChatroomTile(
                    chatroom: snapshot.data.docs[index].data()["chatroomId"],
                    username: snapshot.data.docs[index]
                                .data()["chatroomId"]
                                .toString()
                                .replaceAll("_", "")
                                .replaceAll(myName, "") !=
                            ""
                        ? snapshot.data.docs[index]
                            .data()["chatroomId"]
                            .toString()
                            .replaceAll("_", "")
                            .replaceAll(myName, "")
                        : myName,
                    email: snapshot.data.docs[index]
                        .data()["useremail"]
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(gmail, ""),
                  );
                })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getInfo();

    database.getChatroom(gmail).then((v) {
      setState(() {
        chatroomStream = v;
      });
      setState(() {});
    });

    super.initState();
  }

  getInfo() async {
    myName = await HelperFunc.getusername();
    gmail = await HelperFunc.getuseremail();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return chatroomList();
  }
}

class ChatroomTile extends StatelessWidget {
  final String username, email, chatroom;

  const ChatroomTile({Key key, this.username, this.email, this.chatroom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Chatting(
                  chatroomId: chatroom,
                  cUsername: username,
                ),
              ));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.grey[300])),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  username.substring(0, 1).toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(email),
                ],
              ),
            ],
          ),
        ));
  }
}
