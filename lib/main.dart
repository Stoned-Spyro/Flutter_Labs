import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8CDC72),
      appBar: AppBar(
        title: const Center(
            child: Text("Перша лаба")
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          const Padding(
            padding: EdgeInsets.all(5.0),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.all(3.0)),
              Image.asset(
                'assets/me.JPG',
                width: 150,
                height: 150,
              ),
              const Padding(padding: EdgeInsets.all(3.0)),
              Container(
                width: 245,
                height: 150,
                padding: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 6.0,
                        spreadRadius: 2.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ]
                ),
                child: Column(
                  children: [
                    const Text(
                      "About me: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Name: Oleksii"),
                              Text("Surname: Slavich"),
                              Text("Age: 22"),
                              Text("City: Drogobych")
                            ],
                          )),
                          const VerticalDivider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          Expanded(child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Email: alexseeko15@gmail.com"),
                              Text("Phone: 0636308676"),
                            ],
                          ))
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(3.0)),
                    const Expanded(
                        child: Text(
                          "Steam: https://steamcommunity.com/id/lebowski666",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(3.0)),
          const Text(
            "Hobby: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/controller.jpg')),
              title: Text("Video Games"),
              subtitle: Text("DotA 2, Dark Souls, Overwatch,Witcher ,Hearthstone"),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/film.jpg')),
              title: Text("Anime"),
              subtitle: Text("Serial Experiments Lain, Naruto, Made in abyss, Ergo Proxy"),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/music.png'), width: 60, height: 50),
              title: Text("Music"),
              subtitle: Text("Indie, Post Punk, EDM"),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/film.jpg')),
              title: Text("Movies"),
              subtitle: Text("Fight Club, Marvel/DC, Pulp Fiction, Filth"),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/book.jpg'), width: 60, height: 60),
              title: Text("Books"),
              subtitle: Text("Clockwerk orange, Metro 2033, The Hitchhiker's Guide to the Galaxy"),
            ),
          )
        ],
      ),
    );
  }
}