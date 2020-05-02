import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIOverlays([]);
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List<Widget>.generate(
                  7,
                  (index) => _buildKey(index),
                ),
              ),
              ButtonBar(
                buttonPadding: EdgeInsets.symmetric(vertical: 16),
                children: <Widget>[
                  IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: Icon(Icons.settings),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildKey(int index) {
    return Expanded(
      child: GestureDetector(
        onTapDown: (_) {
          // HapticFeedback.mediumImpact();
          player.play('note${index + 1}.wav');
        },
        child: Container(
          color: Colors.primaries[index + 5],
        ),
      ),
    );
  }
}
