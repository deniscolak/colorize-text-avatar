import 'package:flutter/material.dart';

import 'package:acter_avatar/acter_avatar.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Acter Avatar',
      debugShowCheckedModeBanner: false,
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
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Flutter Acter Avatar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<ImageProvider<Object>> getFutureImage;
  var uuid = Uuid();

  @override
  void initState() {
    super.initState();
    getFutureImage = getImage('assets/images/avatar-1.jpg');
  }

  // An example of loading future image with bytes.
  Future<ImageProvider<Object>> getImage(String path) async {
    late var bytes;
    await Future.delayed(Duration(seconds: 3), () async {
      ByteData imageData = await rootBundle.load(path);
      bytes = imageData.buffer.asUint8List();
    });
    return MemoryImage(bytes);
  }

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Example Acter Avatars',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Avatar with size specified',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ActerAvatar(
                      mode: DisplayMode.DM,
                      avatarInfo: AvatarInfo(
                          uniqueId: '@aliKah:lorem.org',
                          displayName: 'Ali Akalın',
                          avatarFuture: getFutureImage),
                      size: 36,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    ActerAvatar(
                      mode: DisplayMode.DM,
                      avatarInfo: AvatarInfo(
                        uniqueId: '@belut:ipsum.org',
                        displayName: 'Bulut Peker',
                        avatar: AssetImage('assets/images/avatar-2.jpg'),
                      ),
                      size: 36,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    ActerAvatar(
                      mode: DisplayMode.DM,
                      avatarInfo: AvatarInfo(
                        uniqueId: '@ceylin:lipsum.org',
                        displayName: 'Ceylin Oztürk',
                        avatar: AssetImage('assets/images/avatar-3.jpg'),
                      ),
                      size: 36,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Avatar with default size',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActerAvatar(
                      mode: DisplayMode.DM,
                      avatarInfo: AvatarInfo(
                        displayName: "Ali Akalın",
                        uniqueId: "@aliKah:lorem.org",
                        avatarFuture: getFutureImage,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    ActerAvatar(
                      mode: DisplayMode.DM,
                      avatarInfo: AvatarInfo(
                        displayName: "Bulut Peker",
                        uniqueId: "@belut:ipsum.org",
                        avatar: AssetImage('assets/images/avatar-2.jpg'),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    ActerAvatar(
                      mode: DisplayMode.DM,
                      avatarInfo: AvatarInfo(
                        displayName: "Ceylin Oztürk",
                        uniqueId: "@ceylin:lipsum.org",
                        avatar: AssetImage('assets/images/avatar-3.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Space Acter Avatars ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ActerAvatar(
                          mode: DisplayMode.Space,
                          avatarInfo: AvatarInfo(
                            displayName: "A-Space",
                            uniqueId: uuid.v4(),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ActerAvatar(
                          mode: DisplayMode.Space,
                          avatarInfo: AvatarInfo(
                            displayName: "B-Space",
                            uniqueId: uuid.v4(),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ActerAvatar(
                          mode: DisplayMode.Space,
                          avatarInfo: AvatarInfo(
                            displayName: "C-Space",
                            uniqueId: uuid.v4(),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text('.....'),
                        SizedBox(
                          width: 12,
                        ),
                        ActerAvatar(
                          mode: DisplayMode.Space,
                          avatarInfo: AvatarInfo(
                            displayName: "Lorem",
                            uniqueId: uuid.v4(),
                            avatar: AssetImage('assets/images/space-1.jpg'),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ActerAvatar(
                          mode: DisplayMode.Space,
                          avatarInfo: AvatarInfo(
                            displayName: "Ipsum",
                            uniqueId: uuid.v4(),
                            avatar: AssetImage('assets/images/space-2.jpg'),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ActerAvatar(
                          mode: DisplayMode.Space,
                          avatarInfo: AvatarInfo(
                            displayName: "Lipsum",
                            uniqueId: uuid.v4(),
                            avatar: AssetImage('assets/images/space-3.jpg'),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Fallback',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                          const SizedBox(width: 145),
                          Text('Avatar',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Space Acter Avatars With Parent Badge',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ActerAvatar(
                          mode: DisplayMode.Space,
                          avatarInfo: AvatarInfo(
                            displayName: "A-Space",
                            uniqueId: uuid.v4(),
                          ),
                          avatarsInfo: [
                            AvatarInfo(
                                uniqueId: uuid.v4(), displayName: 'Lorem Ipsum')
                          ],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ActerAvatar(
                          mode: DisplayMode.Space,
                          avatarInfo: AvatarInfo(
                            displayName: "B-Space",
                            uniqueId: uuid.v4(),
                          ),
                          avatarsInfo: [
                            AvatarInfo(
                                uniqueId: uuid.v4(), displayName: 'Ipsum Lorem')
                          ],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ActerAvatar(
                          mode: DisplayMode.Space,
                          avatarInfo: AvatarInfo(
                            displayName: "C-Space",
                            uniqueId: uuid.v4(),
                          ),
                          avatarsInfo: [
                            AvatarInfo(
                              displayName: "C-Space",
                              uniqueId: uuid.v4(),
                              avatar: AssetImage('assets/images/space-3.jpg'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text('.....'),
                        SizedBox(
                          width: 12,
                        ),
                        ActerAvatar(
                          mode: DisplayMode.Space,
                          avatarInfo: AvatarInfo(
                            displayName: 'A-Space',
                            uniqueId: uuid.v4(),
                            avatar: AssetImage('assets/images/space-1.jpg'),
                          ),
                          avatarsInfo: [
                            AvatarInfo(
                              displayName: "B-Space",
                              uniqueId: uuid.v4(),
                              avatar: AssetImage('assets/images/space-2.jpg'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ActerAvatar(
                          mode: DisplayMode.Space,
                          avatarInfo: AvatarInfo(
                            displayName: "B-Space",
                            uniqueId: uuid.v4(),
                            avatar: AssetImage('assets/images/space-2.jpg'),
                          ),
                          avatarsInfo: [
                            AvatarInfo(
                              displayName: "C-Space",
                              uniqueId: uuid.v4(),
                              avatar: AssetImage('assets/images/space-3.jpg'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ActerAvatar(
                          mode: DisplayMode.Space,
                          avatarInfo: AvatarInfo(
                            displayName: "C-Space",
                            uniqueId: uuid.v4(),
                            avatar: AssetImage('assets/images/space-3.jpg'),
                          ),
                          avatarsInfo: [
                            AvatarInfo(
                              displayName: "C-Space",
                              uniqueId: uuid.v4(),
                              avatar: AssetImage('assets/images/space-3.jpg'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Fallback',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                          const SizedBox(width: 145),
                          Text('Avatar',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Circular Acter Avatars',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActerAvatar(
                        mode: DisplayMode.DM,
                        avatarInfo: AvatarInfo(
                          displayName: "Ali Akalın",
                          uniqueId: "@aliKah:lorem.org",
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ActerAvatar(
                        mode: DisplayMode.DM,
                        avatarInfo: AvatarInfo(
                          uniqueId: '@belut:ipsum.org',
                          displayName: 'Bulut Peker',
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ActerAvatar(
                        mode: DisplayMode.DM,
                        avatarInfo: AvatarInfo(
                          displayName: "Ceylin Oztürk",
                          uniqueId: "@ceylin:lipsum.org",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('.....'),
                      SizedBox(
                        width: 10,
                      ),
                      ActerAvatar(
                        key: UniqueKey(),
                        mode: DisplayMode.DM,
                        avatarInfo: AvatarInfo(
                          displayName: "Ali Akalın",
                          uniqueId: "@aliKah:lorem.org",
                          avatarFuture: getFutureImage,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ActerAvatar(
                        key: UniqueKey(),
                        mode: DisplayMode.DM,
                        avatarInfo: AvatarInfo(
                          uniqueId: '@belut:ipsum.org',
                          displayName: 'Bulut Peker',
                          avatar: AssetImage('assets/images/avatar-2.jpg'),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ActerAvatar(
                        key: UniqueKey(),
                        mode: DisplayMode.DM,
                        avatarInfo: AvatarInfo(
                          displayName: "Ceylin Oztürk",
                          uniqueId: "@ceylin:lipsum.org",
                          avatar: AssetImage('assets/images/avatar-3.jpg'),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Fallback',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        const SizedBox(width: 145),
                        Text('Avatar',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Circular Stacked Acter Avatars',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActerAvatar(
                        mode: DisplayMode.GroupDM,
                        avatarInfo: AvatarInfo(
                          uniqueId: "@xantos:lipsum.org",
                          displayName: 'Xantos Salvo',
                        ),
                        avatarsInfo: [
                          AvatarInfo(
                            uniqueId: "@yuval:lorem.org",
                            displayName: "Yuval Noah",
                          ),
                          AvatarInfo(
                            uniqueId: "@yuval:lorem.org",
                            displayName: "Yuval Noah",
                          ),
                          AvatarInfo(
                            uniqueId: "@yuval:lorem.org",
                            displayName: "Yuval Noah",
                          ),
                          AvatarInfo(
                            uniqueId: "@yuval:lorem.org",
                            displayName: "Yuval Noah",
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ActerAvatar(
                        mode: DisplayMode.GroupDM,
                        avatarInfo: AvatarInfo(
                          uniqueId: "@yuval:lorem.org",
                          displayName: "Yuval Noah",
                        ),
                        avatarsInfo: [
                          AvatarInfo(
                            uniqueId: "@zoey:ipsum.org",
                            displayName: 'Zoey Gen',
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ActerAvatar(
                        mode: DisplayMode.GroupDM,
                        avatarInfo: AvatarInfo(
                          uniqueId: "@zoey:ipsum.org",
                          displayName: 'Zoey Gen',
                        ),
                        avatarsInfo: [
                          AvatarInfo(
                            uniqueId: "@yuval:lorem.org",
                            displayName: "Yuval Noah",
                          ),
                          AvatarInfo(
                            uniqueId: "@yuval:lorem.org",
                            displayName: "Yuval Noah",
                          ),
                          AvatarInfo(
                            uniqueId: "@yuval:lorem.org",
                            displayName: "Yuval Noah",
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('.....'),
                      SizedBox(
                        width: 10,
                      ),
                      ActerAvatar(
                        mode: DisplayMode.GroupDM,
                        avatarInfo: AvatarInfo(
                          uniqueId: "@aliKah:lorem.org",
                          displayName: "",
                          avatar: AssetImage('assets/images/avatar-1.jpg'),
                        ),
                        avatarsInfo: [
                          AvatarInfo(
                            uniqueId: "@bulut:ipsum.org",
                            displayName: "Bulut Peker",
                            avatar: AssetImage('assets/images/avatar-2.jpg'),
                          ),
                          AvatarInfo(
                            uniqueId: "@bulut:ipsum.org",
                            displayName: "Bulut Peker",
                            avatar: AssetImage('assets/images/avatar-2.jpg'),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ActerAvatar(
                        mode: DisplayMode.GroupDM,
                        avatarInfo: AvatarInfo(
                          uniqueId: "@bulut:ipsum.org",
                          displayName: "Bulut Peker",
                          avatar: AssetImage('assets/images/avatar-2.jpg'),
                        ),
                        avatarsInfo: [
                          AvatarInfo(
                            uniqueId: "@aliKah:lorem.org",
                            displayName: "Ali Akalin",
                            avatar: AssetImage('assets/images/avatar-1.jpg'),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ActerAvatar(
                        mode: DisplayMode.GroupDM,
                        avatarInfo: AvatarInfo(
                          uniqueId: '@ceylin:lipsum.org',
                          displayName: "Ceylin Oztürk",
                          avatar: AssetImage('assets/images/avatar-3.jpg'),
                        ),
                        avatarsInfo: [
                          AvatarInfo(
                            uniqueId: "@aliKah:lorem.org",
                            displayName: "Ali Akalin",
                            avatar: AssetImage('assets/images/avatar-1.jpg'),
                          ),
                          AvatarInfo(
                            uniqueId: "@aliKah:lorem.org",
                            displayName: "Ali Akalin",
                            avatar: AssetImage('assets/images/avatar-1.jpg'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Fallback',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        const SizedBox(width: 145),
                        Text('Avatar',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
