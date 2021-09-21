import 'package:flutter/material.dart';
import 'package:flutter_painting_tools/flutter_painting_tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Declare the controller
  late final PaintingBoardController controller;

  @override
  void initState() {
    // Init the controller
    controller = PaintingBoardController();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
        actions: [
          IconButton(
            // Delete everything inside the board when this button is pressed
            onPressed: () => controller.deletePainting(),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            // Use here the PaintingBoard
            child: PaintingBoard(
              boardHeight: 500,
              boardWidth: 300,
              boardBackgroundColor: Colors.grey[400],
              controller: controller,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                // Change the color of the "brush"
                onPressed: () => controller.changeBrushColor(Colors.blue),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: const Text('blue'),
              ),
              ElevatedButton(
                // Change the color of the "brush"
                onPressed: () => controller.changeBrushColor(Colors.black),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Text('black'),
              ),
              ElevatedButton(
                // Change the color of the "brush"
                onPressed: () => controller.changeBrushColor(Colors.red),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text('red'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
