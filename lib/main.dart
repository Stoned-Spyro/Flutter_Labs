import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        title: const Text("Demo"),
      ),
      body: createSeveralVariants()
    );
  }


  Column createSeveralVariants(){
    return Column(
      children: [
        ChatCell(
          model: ChatCellModel(
            'IT Step Flutter Course',
            lastMessage:
            'Як мене пофіксати щоб це не було по центру. О тепер все працює норм і я задоволентй! Але чи весь текст вміститься?',
            lastMessageSendDate: '12:38',
            userName: "Samira",
            isMuted: true,
            isPremium: true,
            isUserOnline: true ,
            isChannelApproved: true,
            unreadedMessages: 15,
          ),
        ),
        ChatCell(
          model: ChatCellModel(
            'Чат з дуууууууууууууууже довгою назвою',
            lastMessage:
            'Як мене пофіксати щоб це не було по центру. О тепер все працює норм і я задоволентй! Але чи весь текст вміститься?',
            lastMessageSendDate: '7:40',
            userName: "Samira",
            isUserOnline: true ,
            isChannelApproved: true,
            unreadedMessages: 130,
          ),
        ),
        ChatCell(
          model: ChatCellModel(
            'IT Step Flutter Course',
            lastMessage: null,
            lastMessageSendDate: null,
            userName: "Samira",
            isMuted: true,
            isPremium: true,
            isChannelApproved: true,
          ),
        ),
        ChatCell(
          model: ChatCellModel(
            'IT Step Flutter Course',
            lastMessage:
            'Як мене пофіксати щоб це не було по центру. О тепер все працює норм і я задоволентй! Але чи весь текст вміститься?',
            lastMessageSendDate: '9:48',
            userName: "Samira",
            isUserOnline: true ,
            isChannelApproved: true,
          ),
        ),
        ChatCell(
          model: ChatCellModel(
            'IT Step Flutter Course',
            lastMessage:
            'Як мене пофіксати щоб це не було по центру. О тепер все працює норм і я задоволентй! Але чи весь текст вміститься?',
            lastMessageSendDate: '11:45',
            userName: "Samira",
            isMuted: true,
            unreadedMessages: 1500,
          ),
        ),
      ],
    );
  }
}



class ChatCellModel {

  final String name;
  final String? imageUrl;
  final String? lastMessage;
  final String? lastMessageSendDate;
  final String? userName;

  final bool isMuted;
  final bool isPremium;
  final bool isChannelApproved;
  final bool isUserOnline;
  final bool isMessageReaded;

  final int unreadedMessages;

  ChatCellModel(
      this.name, {
        this.imageUrl,
        required this.lastMessage,
        required this.lastMessageSendDate,
        required this.userName,
        this.isMuted = false,
        this.isPremium = false,
        this.isUserOnline = false,
        this.isMessageReaded = false,
        this.isChannelApproved = false,
        this.unreadedMessages = 0,
      });
}


class ChatCell extends StatelessWidget {
  const ChatCell({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ChatCellModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade800,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if(!model.isUserOnline)
              const CircleAvatar(
                radius: 30,
              ),
            if(model.isUserOnline)
              const CircleAvatar(
              radius: 30.0,
              child:Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.green,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                           Flexible(
                               child: Text(
                                 model.name,
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                 style: const TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold,
                                 ),
                               )
                           ),
                            if(model.isPremium)
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            if(model.isChannelApproved)
                              const Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                              ),
                            if (model.isMuted)
                              const Icon(
                                Icons.volume_mute,
                                color: Colors.grey,
                              ),
                          ],
                        ),
                      ),
                      if (model.lastMessageSendDate != null)
                        Text(
                          model.lastMessageSendDate!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if(model.userName != null && model.lastMessage != null)
                        Flexible(
                            child: RichText(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    children: textValidator()
                                )
                            ),
                        ),
                      if(model.unreadedMessages > 0)
                      Container(
                        padding: const EdgeInsets.all(1),
                        decoration: unreadMessagesStyle(),
                        child: Text(model.unreadedMessages.toString()),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration unreadMessagesStyle(){
    if(!model.isMuted){
      return BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      );
    }
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    );
  }

  List<TextSpan> textValidator(){
    if(model.userName != null && model.lastMessage != null){
      return
      [
        TextSpan(text: model.userName, style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: ": ", style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: model.lastMessage)
      ];
    }
    return [const TextSpan(text: "No messages yet")];
  }
}
