import 'package:flutter/material.dart';
import 'package:mawy_app/constants/constants.dart';
import 'package:mawy_app/functions/getMessages.dart';
import 'package:mawy_app/functions/work_with_api/messages.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String message;
  List<String> listOfMessages = [];
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    getMessages().then((value) => listOfMessages = value);
    super.initState();
  }

  @override
  void dispose() {
    listedMessages(list: listOfMessages);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: MAIN_COLOR,
      body: Column(
        children: [
          Container(
            height: statusBarHeight,
            color: Colors.grey,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                      itemCount: listOfMessages.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.teal,
                            backgroundImage:
                                AssetImage("images/businessman.png"),
                          ),
                          title: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MAIN_COLOR,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(listOfMessages[index]),
                            ),
                          ),
                        );
                      }),
                )),
          )),
          Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Container(
                color: MAIN_COLOR,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: TextFormField(
                              controller: messageController,
                              onChanged: (value) {
                                message = value;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "enter message",
                                  hintStyle: TextStyle(
                                      fontSize: 18, color: MAIN_COLOR),
                                  labelStyle: TextStyle(
                                      color: MAIN_COLOR, fontSize: 18)),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          sendMessage(message: message);
                          setState(() {
                            listOfMessages.add(message);
                          });
                          messageController.clear();
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.send),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
