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
            // delete last line when this button is pressed
            onPressed: () => controller.deleteLastLine(),
            icon: const Icon(Icons.undo_rounded),
          ),
          IconButton(
            // Delete everything inside the board when this button is pressed
            onPressed: () => controller.deletePainting(),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 25),
          PaintingColorBar(
            controller: controller, // use here the controller defined before
            paintingColorBarMargin: const EdgeInsets.symmetric(horizontal: 6),
            colorsType: ColorsType.material,
            onTap: (Color color) {
              // do your logic here with the pressed color, for example change the color of the brush
              print('tapped color: $color');
              controller.changeBrushColor(color);
            },
          ),
          const SizedBox(height: 50),
          Center(
            // Use here the PaintingBoard
            child: PaintingBoard(
              boardHeight: 500,
              boardWidth: 300,
              controller: controller, // use here the controller
            ),
          ),
        ],
      ),
    );
  }
}
