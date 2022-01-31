// ignore_for_file: prefer_null_aware_method_calls

import 'package:flutter/material.dart';
import 'package:flutter_painting_tools/src/logic/painting_board_controller/painting_board_controller.dart';
import 'package:flutter_painting_tools/src/logic/painting_board_controller/painting_color_bar_provider.dart';
import 'package:flutter_painting_tools/src/presentation/constants/constants.dart';
import 'package:provider/provider.dart';

class PaintingColorBar extends StatelessWidget {
  PaintingColorBar({
    required this.controller,
    Key? key,
    this.itemSize = 40,
    this.backGroundColor = Colors.black12,
    this.itemMargin = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.colorsType = ColorsType.material,
    this.customColors,
    this.itemShape = ItemShape.circle,
    this.onTap,
    this.itemBoxShadow,
    this.unselectedItemBorder,
    this.selectedItemBorder = const Border.fromBorderSide(
      BorderSide(
        width: 2,
        color: Colors.black38,
      ),
    ),
    this.paintingColorBarMargin,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.reverseColorList = false,
    this.paintingColorBarBorderRadius,
    this.useIntelligentBorderRadius = true,
  }) : super(key: key) {
    if (colorsType == ColorsType.custom) {
      if (customColors == null) {
        throw Exception(
          'If you selected colorsType: ColorsType.custom, '
          'You must provide a non null list of colors (PaintingColorBar.customColors)',
        );
      } else if (customColors!.isEmpty) {
        throw Exception(
          'If you selected colorsType: ColorsType.custom, '
          'You must provide a non empty list of colors (PaintingColorBar.customColors)',
        );
      }
    }

    _colorsToDisplay = _determineColors();
    controller.changeBrushColor(_colorsToDisplay.first);
    intelligentBorderRadius = BorderRadius.all(
      Radius.circular(itemSize),
    );
  }

  /// The size of each color item.
  final double itemSize;

  /// The color of the background of the [PaintingColorBar].
  final Color backGroundColor;

  /// The margin applied at every item.
  final EdgeInsets itemMargin;

  /// The types of colors to use.
  ///
  /// Note that if this property is set to [ColorsType.custom], [customColors] must be provided.
  final ColorsType colorsType;

  /// The colors displayed in the [PaintingColorBar].
  ///
  /// Note that if [colorsType] is not set to [ColorsType.custom], this property is useless.
  final List<Color>? customColors;

  /// The [ItemShape] applied to each item.
  final ItemShape itemShape;

  /// The callback that is called every time an item color is tapped.
  ///
  /// It takes the color tapped as an argument.
  final Function(Color)? onTap;

  /// The [BoxShadow] applied to each item.
  final List<BoxShadow>? itemBoxShadow;

  /// The [BoxBorder] applied to each item that is unselected.
  final BoxBorder? unselectedItemBorder;

  /// The [BoxBorder] applied to the item that is selected.
  final BoxBorder? selectedItemBorder;

  /// The margin of the entire [PaintingColorBar].
  final EdgeInsets? paintingColorBarMargin;

  /// The [ScrollPhysics] applied to the list of items.
  final ScrollPhysics scrollPhysics;

  /// This property, if set to [true], allows to display the colors reversed.
  final bool reverseColorList;

  /// The [PaintingBoardController] used to manage the [PaintingBoard] and the [PaintingColorBar].
  final PaintingBoardController controller;

  /// The [BorderRadius] applied to the [PaintingColorBar].
  final BorderRadius? paintingColorBarBorderRadius;

  /// This property, if set to [true], automatically calculates the [BorderRadius] based on
  /// the item size.
  final bool useIntelligentBorderRadius;

  late final List<Color> _colorsToDisplay;
  late final BorderRadius intelligentBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: paintingColorBarMargin,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: paintingColorBarBorderRadius ??
            (useIntelligentBorderRadius ? intelligentBorderRadius : null),
      ),
      child: ClipRRect(
        borderRadius: paintingColorBarBorderRadius ??
            (useIntelligentBorderRadius
                ? intelligentBorderRadius
                : BorderRadius.zero),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: scrollPhysics,
          padding: EdgeInsets.zero,
          child: ChangeNotifierProvider<PaintingColorBarProvider>(
            create: (_) => PaintingColorBarProvider(_colorsToDisplay.first),
            builder: (BuildContext context, _) {
              return Row(
                children: _generateItems(context),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Color> _determineColors() {
    List<Color> colors;
    switch (colorsType) {
      case ColorsType.material:
        colors = materialColors;
        break;
      case ColorsType.materialWithBlackAndWhite:
        colors = materialColorsWithBlackAndWhite;
        break;
      case ColorsType.materialAccent:
        colors = materialAccentColors;
        break;
      case ColorsType.materialAaccentWithBlackAndWhite:
        colors = materialAccentColorsWithBlackAndWhite;
        break;
      default:
        colors = customColors!;
        break;
    }

    if (reverseColorList)
      return colors.reversed.toList();
    else
      return colors;
  }

  List<Widget> _generateItems(BuildContext context) {
    final List<Widget> items = <Widget>[];
    for (final Color color in _colorsToDisplay) {
      items.add(
        GestureDetector(
          onTap: () {
            if (onTap != null) onTap!(color);

            // set new selected color
            context.read<PaintingColorBarProvider>().selectedColor = color;
          },
          child: Container(
            height: itemSize,
            width: itemSize,
            margin: itemMargin,
            decoration: BoxDecoration(
              color: color,
              border: context
                      .watch<PaintingColorBarProvider>()
                      .isColorSelected(color)
                  ? selectedItemBorder
                  : unselectedItemBorder,
              boxShadow: itemBoxShadow,
              borderRadius: itemShape == ItemShape.circle
                  ? BorderRadius.all(Radius.circular(itemSize))
                  : null,
            ),
          ),
        ),
      );
    }
    return items;
  }
}
