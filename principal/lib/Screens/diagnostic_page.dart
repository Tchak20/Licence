import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Colors.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<String> _messages = [
    'Salut ! Comment ça va ?',
    'Ça va bien, merci ! Et toi ?',
    'Je vais bien aussi, merci !'
  ];

  final TextEditingController _textController = TextEditingController();

  void _sendMessage(String message) {
    setState(() {
      _messages.add(message);
    });
    _textController.clear();
  }

  Widget _buildMessage(String message, bool isMe) {
    final Container messageBox = Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0),
      decoration: BoxDecoration(
        color: isMe ? Colors.blueAccent : Colors.grey[300],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: isMe ? Colors.white : Colors.black,
          fontSize: 16.0,
        ),
      ),
    );

    if (isMe) {
      return messageBox;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: Image.asset("images/logo.jpeg"),
        ),
        SizedBox(width: 8.0),
        messageBox,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = _messages[index];
                return _buildMessage(message, index % 2 == 0);
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.photo_camera),
                  color: pColor,
                  onPressed: () {
                    // Code pour prendre une photo
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Envoyer un message',
                    ),
                    onSubmitted: (String message) {
                      _sendMessage(message);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: pColor,
                  onPressed: () {
                    _sendMessage(_textController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
