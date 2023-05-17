import 'package:example/constants/keys.dart';
import 'package:flutter/material.dart';

import 'package:acter_avatar/acter_avatar.dart';

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
  @override
  Widget build(BuildContext context) {
    final bold = ColorMaker.bold();
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
                    key: TestKeys.widgetKey,
                    mode: DisplayMode.User,
                    displayName: "Ali Akalın",
                    uniqueId: "Ali Akalın",
                    size: 36,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  ActerAvatar(
                    mode: DisplayMode.User,
                    displayName: "Bulut Peker",
                    uniqueId: "Bulut Peker",
                    size: 36,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  ActerAvatar(
                    mode: DisplayMode.User,
                    displayName: "Ceylin Oztürk",
                    uniqueId: "Ceylin Oztürk",
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
                    mode: DisplayMode.User,
                    displayName: "Xantos Salvo",
                    uniqueId: "Xantos Salvo",
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  ActerAvatar(
                    mode: DisplayMode.User,
                    displayName: "Yuval Noah",
                    uniqueId: "Yuval Noah",
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  ActerAvatar(
                    mode: DisplayMode.User,
                    displayName: "Zoey Gen",
                    uniqueId: "Zoey Gen",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Rectangular Acter Avatars ',
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
                        displayName: "Ali Akalın",
                        uniqueId: "Ali Akalın",
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ActerAvatar(
                        mode: DisplayMode.Space,
                        displayName: "Bulut Peker",
                        uniqueId: "Bulut Peker",
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ActerAvatar(
                        mode: DisplayMode.Space,
                        displayName: "Ceylin Oztürk",
                        uniqueId: "Ceylin Oztürk",
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
                        displayName: "OceanKan",
                        uniqueId: "OceanKan",
                        avatar: AssetImage('assets/images/oceankan.png'),
                        size: 46,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ActerAvatar(
                        mode: DisplayMode.Space,
                        displayName: "Denmark",
                        uniqueId: "Denmark",
                        avatar: AssetImage('assets/images/denmark.png'),
                        size: 46,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ActerAvatar(
                        mode: DisplayMode.Space,
                        displayName: "Amnesty",
                        uniqueId: "Amnesty",
                        avatar: AssetImage('assets/images/amnesty.png'),
                        size: 46,
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
                      mode: DisplayMode.User,
                      uniqueId: "Xantos Salvo",
                      displayName: 'Xantos Salvo',
                      size: 48,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    ActerAvatar(
                      mode: DisplayMode.User,
                      uniqueId: "Yuval Noah",
                      displayName: "Yuval Noah",
                      size: 48,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    ActerAvatar(
                      mode: DisplayMode.User,
                      uniqueId: "Zoey Gen",
                      displayName: 'Zoey Gen',
                      size: 48,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('.....'),
                    SizedBox(
                      width: 10,
                    ),
                    ActerAvatar(
                      uniqueId: 'Denmark',
                      displayName: "",
                      mode: DisplayMode.User,
                      avatar: AssetImage('assets/images/denmark.png'),
                      size: 26,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    ActerAvatar(
                      uniqueId: 'Ocean Kan',
                      mode: DisplayMode.User,
                      displayName: "Bulut Peker",
                      avatar: AssetImage('assets/images/oceankan.png'),
                      size: 26,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    ActerAvatar(
                      uniqueId: 'Ceylin Oztürk',
                      mode: DisplayMode.User,
                      displayName: "Ceylin Oztürk",
                      avatar: AssetImage('assets/images/tortoga.jpg'),
                      size: 26,
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
    );
  }
}
