import 'package:chess_game/models/piece.dart';

List<List<ChessPiece?>> initBoard() {
  List<List<ChessPiece?>> newBoard =
      List.generate(8, (index) => List.generate(8, (index) => null));

  //Peones
  for (int i = 0; i < 8; i++) {
    newBoard[1][i] = ChessPiece(
      type: ChessPieceType.pawn,
      isWhite: false,
      imagePath: 'assets/pieces/black-pawn.png',
    );
    newBoard[6][i] = ChessPiece(
      type: ChessPieceType.pawn,
      isWhite: true,
      imagePath: 'assets/pieces/white-pawn.png',
    );
  }

  //Torres
  newBoard[0][0] = ChessPiece(
    type: ChessPieceType.rook,
    isWhite: false,
    imagePath: 'assets/pieces/black-rook.png',
  );
  newBoard[0][7] = ChessPiece(
    type: ChessPieceType.rook,
    isWhite: false,
    imagePath: 'assets/pieces/black-rook.png',
  );
  newBoard[7][0] = ChessPiece(
    type: ChessPieceType.rook,
    isWhite: true,
    imagePath: 'assets/pieces/white-rook.png',
  );
  newBoard[7][7] = ChessPiece(
    type: ChessPieceType.rook,
    isWhite: true,
    imagePath: 'assets/pieces/white-rook.png',
  );

  //Caballos
  newBoard[0][1] = ChessPiece(
    type: ChessPieceType.knight,
    isWhite: false,
    imagePath: 'assets/pieces/black-knight.png',
  );
  newBoard[0][6] = ChessPiece(
    type: ChessPieceType.knight,
    isWhite: false,
    imagePath: 'assets/pieces/black-knight.png',
  );
  newBoard[7][1] = ChessPiece(
    type: ChessPieceType.knight,
    isWhite: true,
    imagePath: 'assets/pieces/white-knight.png',
  );
  newBoard[7][6] = ChessPiece(
    type: ChessPieceType.knight,
    isWhite: true,
    imagePath: 'assets/pieces/white-knight.png',
  );

  //alfiles
  newBoard[0][2] = ChessPiece(
    type: ChessPieceType.bishop,
    isWhite: false,
    imagePath: 'assets/pieces/black-bishop.png',
  );
  newBoard[0][5] = ChessPiece(
    type: ChessPieceType.bishop,
    isWhite: false,
    imagePath: 'assets/pieces/black-bishop.png',
  );
  newBoard[7][2] = ChessPiece(
    type: ChessPieceType.bishop,
    isWhite: true,
    imagePath: 'assets/pieces/white-bishop.png',
  );
  newBoard[7][5] = ChessPiece(
    type: ChessPieceType.bishop,
    isWhite: true,
    imagePath: 'assets/pieces/white-bishop.png',
  );

  //Reinas
  newBoard[0][3] = ChessPiece(
    type: ChessPieceType.queen,
    isWhite: false,
    imagePath: 'assets/pieces/black-queen.png',
  );
  newBoard[7][4] = ChessPiece(
    type: ChessPieceType.queen,
    isWhite: true,
    imagePath: 'assets/pieces/white-queen.png',
  );

  //Reyes
  newBoard[0][4] = ChessPiece(
    type: ChessPieceType.king,
    isWhite: false,
    imagePath: 'assets/pieces/black-king.png',
  );
  newBoard[7][3] = ChessPiece(
    type: ChessPieceType.king,
    isWhite: true,
    imagePath: 'assets/pieces/white-king.png',
  );

  return newBoard;
}
