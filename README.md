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

<img src="https://user-images.githubusercontent.com/90468540/134409076-50f3fd96-8e7d-4921-9f9c-af94a2f849cb.gif" height="500" />

## Getting started

* [Basic usage](#basic-usage)
* [Advanced usage](#advanced-usage) 
  * [setting up a controller](#setting-up-the-controller)
  * [paint with multiple colors](#paint-with-multiple-colors)
  * [delete the painting](#delete-the-painting)
  * [delete last line painted](#delete-last-line-painted)


<h2 id="basic-usage">Basic Usage</h2>

This package is very easy to use.

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
| ```boardDecoration```      | ```BoxDecoration?```           | The decoration of the ```PaintingBoard```                                                  | ```null```            |
| ```controller```           | ```PaintingBoardController?``` | The controller used to manage advanced task of the ```PaintingBoard``` (explained further) | ```null```            |

<h2 id="advanced-usage">Advanced Usage</h2>

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

<img src="https://user-images.githubusercontent.com/90468540/136088559-856f0e03-1821-4430-9675-f9aeeaef0f9a.gif
" height="500" />


<h3 id="save-the-painting-to-gallery">Save the painting to gallery</h3>

This feature converts the content of the ```PaintingBoard``` into a .png which is saved in the gallery of the device.

NOTE: this method only works on Android and IOS.

#### Setup

* Android: add permission for usage of external storage on Manifest file located at ```<project root>/android/app/src/main/AndroidManifest.xml```:
  
  ```xml
    ...
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <application>
    ...
    </application>
  ```

* IOS: Add the following keys to your <i>Info.plist</i> file, located in `<project root>/ios/Runner/Info.plist`:
    * `NSPhotoLibraryUsageDescription` - describe why your app needs permission for the photo library. This is called <i>Privacy - Photo Library Usage Description</i> in the visual editor.  
    

* Update the version of the `minSdkVersion` in the `<project root>/android/app/build.gradle` file, which must be at least `21`.


* Update the version of `ext.kotlin_version` located at `<project root>/android/build.gradle`, which must be at least `1.5.21`.

#### Usage
Simply call the `savePaintingToGallery()` method of the `PaintingBoardController`.

Example:

```dart
IconButton(
    onPressed: () => controller.deleteLastLine(),
    icon: const Icon(Icons.file_download),
)
```



 
