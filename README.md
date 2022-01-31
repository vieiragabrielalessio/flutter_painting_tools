<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Flutter Painting Tools

A simple flutter library that allows the user to paint on the screen.

<img src="https://user-images.githubusercontent.com/90468540/151828678-1732d14a-4932-4470-a591-96d834c71efe.gif" height="500" />

## Getting started

* [Painting Board](#PaintingBoard)
* [Painting Board Controller](#PaintingBoardController) 
  * [setting up the controller](#setting-up-the-controller)
  * [paint with multiple colors](#paint-with-multiple-colors)
  * [delete the painting](#delete-the-painting)
  * [delete last line painted](#delete-last-line-painted)
* [Painting Color Bar](#PaintingColorBar)


<h2 id="PaintingBoard">Painting Board</h2>

For a basic usage you can just show a simple board on the screen where the user can paint, by displaying a ```PaintingBoard``` in your code.

For example:

```dart
Center(
    child: PaintingBoard(
        boardHeight: 500,
        boardWidth: 300,
    ),
)
```

Which will produce an output like this:

<img src="https://user-images.githubusercontent.com/90468540/134409207-3d036ef4-10fb-4729-a4b0-8dcd93329dc9.png" height="500" />

You can customize your ```PaintingBoard``` how much do you want by changing its parameters 

| Parameter                  | Type                           | Meaning                                                                                    | Default Value         |
| -------------------------- | ------------------------------ | ------------------------------------------------------------------------------------------ | --------------------- |
| ```boardHeight```          | ```double```                   | The height of the ```PaintingBoard```                                                      | ```double.infinity``` |
| ```boardWidth```           | ```double```                   | The width of the ```PaintingBoard```                                                       | ```double.infinity``` |
| ```boardbackgroundColor``` | ```Color?```                   | The background color of the ```PaintingBoard```                                            | ```Colors.grey```     |
| ```boardDecoration```      | ```BoxDecoration?```           | The decoration of the ```PaintingBoard```                                                  | ``````null``````            |
| ```controller```           | ```PaintingBoardController?``` | The controller used to manage advanced task of the ```PaintingBoard``` (explained further) | ``````null``````            |

<h2 id="PaintingBoardController">Painting Board Controller</h2>

<h3 id="setting-up-the-controller">Setting up the controller</h3>


If you want do perform advanced task, such as paint with different colors, delete the painting, ecc. you need to set up a ```PaintingBoardController```.  
Follow these steps to do it properly:

1. Declare the ```PaintingBoardController``` inside the state of your ```StatefulWidget```

    ```dart
    late final PaintingBoardController controller;
    ```
2. Allocate the ```PaintingBoardController``` inside the ```initState()``` method of your ```StatefulWidget```

    ```dart
    @override
    void initState() {
        controller = PaintingBoardController();
        super.initState();
    }
    ```
3. Remember to dispose the  ```PaintingBoardController``` inside the ```dispose()``` method of your ```StatefulWidget```

    ```dart
    @override
    void dispose() {
        controller.dispose();
        super.dispose();
    }
    ```
4. Pass the  ```PaintingBoardController``` to the ```controller``` property of the ```PaintingBoard```

    ```dart
    PaintingBoard(
        controller: controller,
    )
    ```

<h3 id="paint-with-multiple-colors">Paint with multiple colors</h3>

The default color of the "brush" used to paint inside the board is ```Colors.black```. If you want to paint with different colors you can use the ```changeBrushColor()``` method of the ```PaintingBoardController``` and pass to it the color you want.  

Suppose for example you want to change the color of the "brush" when a button is tapped. You may do something like this:

```dart
ElevatedButton(
    onPressed: () {
        controller.changeBrushColor(Colors.blue);
    }
)
```

<h3 id="delete-the-painting">Delete the painting</h3>

If you want to delete everything inside your ```PaintingBoard``` you can simply call the ```deletePainting()``` method of the ```PaintingBoardController```.

Example:
```dart
IconButton(
    onPressed: () => controller.deletePainting(),
    icon: const Icon(Icons.delete),
)
```

<h3 id="delete-last-line-painted">Delete last line painted</h3>

It is very simple to delete the last line painted. You just need to call the ```deleteLastLine()``` method of the ```PaintingBoardController```.


Example: 
```dart
IconButton(
    onPressed: () => controller.deleteLastLine(),
    icon: const Icon(Icons.delete),
)
```

<h2 id="PaintingColorBar">Painting Color Bar</h2>

If you want to use a simple default bar to select the color, you can use the ```PaintingColorBar``` widget.

<br>

<img src="https://user-images.githubusercontent.com/90468540/151828678-1732d14a-4932-4470-a591-96d834c71efe.gif" height="500" />

You can play with different properties to style this widget how much do you want:
| Property                     | Type                    | Meaning                                                                                                                              | Default Value                                                                 |
| ---------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------- |
| itemSize                     | ```double ```                 | The size of each color item                                                                                                          | ```40```                                                                            |
| backGroundColor              | ```Color ```                  | The color of the background of the ```PaintingColorBar```                                                                                | ```Colors.black12  ```                                                              |
| itemMargin                   | ```EdgeInsets ```             | The margin applied at every item                                                                                                     | ```const EdgeInsets.symmetric(horizontal: 10, vertical: 5)```                       |
| colorsType                   | ```ColorsType```              | The types of colors to use Note that if this property is set to ```ColorsType.custom```, ```customColors``` must be provided                 | ```ColorsType.material```                                                           |
| customColors                 | ```List<Color>? ```           | The colors displayed in the ```PaintingColorBar``` Note that if ```colorsType``` is not set to ```ColorsType.custom```, this property is useless | ```null```                                                                          |
| itemShape                    | ```ItemShape```               | The ```ItemShape``` applied to each item                                                                                                 | ```ItemShape.circle```                                                              |
| onTap                        | ```Function(Color)? ```       | The callback that is called every time an item color is tapped It takes the color tapped as an argument                              | ```null```                                                                          |
| itemBoxShadow                | ```List<BoxShadow>? ```       | The ```BoxShadow``` applied to each item                                                                                                 | ```null```                                                                          |
| unselectedItemBorder         | ```BoxBorder?```              | The ```BoxBorder``` applied to each item that is unselected                                                                              | ```null```                                                                          |
| selectedItemBorder           | ```BoxBorder? ```             | The ```BoxBorder``` applied to the item that is selected                                                                                 | ```const Border.fromBorderSide( BorderSide(width: 2, color: Colors.black38, ), )``` |
| paintingColorBarMargin       | ```EdgeInsets? ```            | The margin of the entire ```PaintingColorBar```                                                                                          | ```null```                                                                          |
| scrollPhysics                | ```ScrollPhysics ```          | The ```ScrollPhysics``` applied to the list of items                                                                                     | ```const BouncingScrollPhysics() ```                                                |
| reverseColorList             | ```bool```                    | This property, if set to ```true```, allows to display the colors reversed                                                               | ```false```                                                                         |
| controller                   | ```PaintingBoardController``` | The ```PaintingBoardController``` used to manage the ```PaintingBoard``` and the ```PaintingColorBar```                                          | no default value, is required                                                 |
| paintingColorBarBorderRadius | ```BorderRadius? ```          | The ```BorderRadius``` applied to the ```PaintingColorBar```                                                                                 | ```null```                                                                          |
| useIntelligentBorderRadius   | ```bool```                    | This property, if set to ```true```, automatically calculates the ```BorderRadius``` based on the item size                                  | ```true```                                                                          |
