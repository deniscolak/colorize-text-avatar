import 'package:flutter/material.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auto Colorized Avatar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Auto Colorized Avatar')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Example Colorized Avatars',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            TextAvatar(
              shape: BoxShape.circle,
              text: "Ali Akalın",
              numberLetters: 2,
            ),
            SizedBox(width: 12),
            TextAvatar(
              shape: BoxShape.circle,
              text: "Bulut Peker",
              numberLetters: 2,
            ),
            SizedBox(width: 12),
            TextAvatar(
              shape: BoxShape.circle,
              text: "Ceylin Oztürk",
              numberLetters: 2,
            ),
            SizedBox(width: 12),
            Text('.....'),
            SizedBox(width: 12),
            TextAvatar(
              shape: BoxShape.circle,
              text: "Xantos Salvo",
              numberLetters: 2,
            ),
            SizedBox(width: 12),
            TextAvatar(
              shape: BoxShape.circle,
              text: "Yuval Noah",
              numberLetters: 2,
            ),
            SizedBox(width: 12),
            TextAvatar(
              shape: BoxShape.circle,
              text: "Zoey Gen",
              numberLetters: 2,
            ),
          ]),
          const SizedBox(height: 20),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: const [
            TextAvatar(
              text: "Ali Akalın",
              numberLetters: 2,
            ),
            SizedBox(width: 12),
            TextAvatar(
              text: "Bulut Peker",
              numberLetters: 2,
            ),
            SizedBox(width: 12),
            TextAvatar(
              text: "Ceylin Oztürk",
              numberLetters: 2,
            ),
            SizedBox(width: 12),
            Text('.....'),
            SizedBox(width: 12),
            TextAvatar(
              text: "Xantos Salvo",
              numberLetters: 2,
            ),
            SizedBox(width: 12),
            TextAvatar(
              text: "Yuval Noah",
              numberLetters: 2,
            ),
            SizedBox(width: 12),
            TextAvatar(
              text: "Zoey Gen",
              numberLetters: 2,
            ),
          ]),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextAvatar(
              text: "Ali Akalın",
              numberLetters: 1,
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(width: 12),
            TextAvatar(
              text: "Bulut Peker",
              numberLetters: 1,
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(width: 12),
            TextAvatar(
              text: "Ceylin Oztürk",
              numberLetters: 1,
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(width: 12),
            Text('.....'),
            SizedBox(width: 12),
            TextAvatar(
              text: "Xantos Salvo",
              numberLetters: 1,
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(width: 12),
            TextAvatar(
              text: "Yuval Noah",
              numberLetters: 1,
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(width: 12),
            TextAvatar(
              text: "Zoey Gen",
              numberLetters: 1,
              borderRadius: BorderRadius.circular(8),
            ),
          ]),
        ]),
      ),
    );
  }
}
