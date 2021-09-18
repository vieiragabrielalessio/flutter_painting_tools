import 'package:flutter/material.dart';
import 'package:flutter_painting_tools/presentation/widgets/painting_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: PaintingBoard(
            boardHeight: 500,
            boardWidth: 300,
          ),
        ),
      ),
    );
  }
}
