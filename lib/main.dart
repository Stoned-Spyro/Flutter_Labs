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
      title: 'Layout Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Layout'),
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,

          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
            color: Colors.black,
          ),
          actions: navBar(),
        ),

        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Discover",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            liveChannelsBar(),
                            categoriesBlock(),
                          ],
                        ),
                      )
                  ),
              ),
              bottomBar(),
            ],
          )
        )
    );
  }




  Column categoriesBlock(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleText("Categories you would like"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: createCategoriesCardBlock(),
          )
        ],
    );
  }

  Padding createCategoryCard(String gameName, dynamic viewers, String genre){
    

    
    return Padding(
      padding: EdgeInsets.all(5),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage('assets/Dota_2.jpg'), height: 200),
          Text(
            gameName,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "$viewers k. viewers",
          ),
          genreBlock(genre)
        ],
      ),
    );
  }

  Container genreBlock(String genre){
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
          genre,
          style: TextStyle(
            fontSize: 10,
          ),
      ),
    );
  }

  Row createCategoriesCardBlock(){
    return Row(
        children: [
          createCategoryCard("Dota 2", 450, "MOBA"),
          createCategoryCard("League of Legends", 400, "MOBA"),
          createCategoryCard("CS:GO", 350, "FPS"),
          createCategoryCard("World of Warcraft", 150, "RPG"),
          createCategoryCard("Valorant", 50, "FPS"),
        ],
    );
  }

  List<Widget> navBar(){
    return <Widget>[
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add_a_photo),
        color: Colors.black,
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add_chart),
        color: Colors.black,
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.comment),
        color: Colors.black,
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
        color: Colors.black,
      ),
    ];
  }

  Column liveChannelsBar(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleText("Live channels you would like"),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:  Row(
              children: [
                createLiveChannelCard("Streamer 1"),
                createLiveChannelCard("Streamer 2"),
                createLiveChannelCard("Streamer 3"),
                createLiveChannelCard("Streamer 4"),
              ],
            ),
        ),

      ],
    );
  }



  Padding createLiveChannelCard(String streamerName){
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           const Image(image: AssetImage('assets/stream.jpg'),
            height: 150,
            width: 300,
          ),
          SizedBox(
            width: 250,
            height: 75,
            child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                  title: Text(
                    streamerName,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(Icons.more_vert, color: Colors.black,),
                  subtitle: const Text(
                      "Stream desctipion "
                        "Some mooooore decriptiondsadsadsadsd",
                     style: TextStyle(fontSize: 10
                    ),
                  ),

              ),
            )
        ],
      ),
    );
  }

  Container bottomBar(){
    return Container(

      margin: const EdgeInsets.symmetric(horizontal: 7),
      padding: const EdgeInsets.only(top: 4),

      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 5,
            blurRadius: 7,
          )
        ]
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildBottomBarItem(Icons.handshake,"Following"),
          buildBottomBarItem(Icons.compass_calibration, "Discover"),
          buildBottomBarItem(Icons.library_add_check_sharp, "Browse")
        ],
      ),
    );
  }

  Column buildBottomBarItem(IconData icon, String title){
    return Column(
      children: [
        Icon(icon),
        Text(title)
      ],
    );
  }

  Padding titleText(String title){
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

