import 'package:flutter/material.dart';

import 'package:chess_game/models/piece.dart';
import 'package:chess_game/values/colors.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final bool isValidMove;
  final void Function()? onTap;

  const Square({
    super.key,
    required this.isWhite,
    required this.piece,
    required this.isSelected,
    required this.isValidMove,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color? selectColor;

    if (isSelected) {
      selectColor = Colors.green;
    } else if (isValidMove) {
      selectColor = Colors.green[300];
    } else {
      selectColor = isWhite ? foregroundColor : backgroundColor;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: selectColor,
        margin: EdgeInsets.all(isValidMove ? 8 : 0),
        child: piece != null ? Image.asset(piece!.imagePath) : null,
      ),
    );
  }
}
