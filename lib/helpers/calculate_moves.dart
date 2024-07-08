import 'package:chess_game/models/piece.dart';

bool isInBoard(int row, int col) {
  return row >= 0 && row < 8 && col >= 0 && col < 8;
}

List<List<int>> calculateValidMoves({
  required int row,
  required int col,
  required ChessPiece? piece,
  required List<List<ChessPiece?>> board,
}) {
  List<List<int>> moves = [];

  if (piece == null) return [];

  //Diferentes direcciones basadas en el color
  int direction = piece.isWhite ? -1 : 1;

  switch (piece.type) {
    case ChessPieceType.pawn:
      //El peon puede moverse hacia adelante si el siguinte cuadro no está tomado.
      if (isInBoard(row + direction, col) &&
          board[row + direction][col] == null) {
        moves.add([row + direction, col]);
      }

      //El peon puede moverse 2 cuadros si es la 1era vez que se mueve
      if ((row == 1 && !piece.isWhite) || (row == 6 && piece.isWhite)) {
        if (isInBoard(row + 2 * direction, col) &&
            board[row + 2 * direction][col] == null &&
            board[row + direction][col] == null) {
          moves.add([row + 2 * direction, col]);
        }
      }

      //El peon puede tomar en diagonal
      if (isInBoard(row + direction, col - 1) &&
          board[row + direction][col - 1] != null &&
          board[row + direction][col - 1]!.isWhite != piece.isWhite) {
        moves.add([row + direction, col - 1]);
      }
      if (isInBoard(row + direction, col + 1) &&
          board[row + direction][col + 1] != null &&
          board[row + direction][col + 1]!.isWhite != piece.isWhite) {
        moves.add([row + direction, col + 1]);
      }

      break;
    case ChessPieceType.rook:
      var directions = [
        [-1, 0], //up
        [1, 0], // down
        [0, -1], //left
        [0, 1], // right
      ];

      for (var direction in directions) {
        var i = 1;
        while (true) {
          var newRow = row + i * direction[0];
          var newCol = col + i * direction[1];
          if (!isInBoard(newRow, newCol)) break;
          if (board[newRow][newCol] != null) {
            if (board[newRow][newCol]!.isWhite != piece.isWhite) {
              moves.add([newRow, newCol]); //kill
            }
            break; //Camino bloqueado
          }
          moves.add([newRow, newCol]);
          i++;
        }
      }

      break;
    case ChessPieceType.knight:
      // Los movimientos posibles son en L
      var knightMoves = [
        [-2, -1], // up 2 left 1
        [-2, 1], // up 2 right 1
        [-1, -2], // up 1 left 2
        [-1, 2], // up 1 right 2
        [1, -2], // down 1 left 2
        [1, 2], // down 1 right 2
        [2, -1], // down 2 left 1
        [2, 1], // down 2 right 1
      ];

      for (var move in knightMoves) {
        var newRow = row + move[0];
        var newCol = col + move[1];
        if (!isInBoard(newRow, newCol)) continue;
        if (board[newRow][newCol] != null) {
          if (board[newRow][newCol]!.isWhite != piece.isWhite) {
            moves.add([newRow, newCol]); //kill
          }
          continue; //Camino bloqueado
        }
        moves.add([newRow, newCol]);
      }
      break;
    case ChessPieceType.bishop:
      //Los posibles movimientos son en diagonal.
      var directions = [
        [-1, -1], // up left
        [-1, 1], // up right
        [1, -1], // down left
        [1, 1], // down right
      ];

      for (var direction in directions) {
        var i = 1;
        while (true) {
          var newRow = row + i * direction[0];
          var newCol = col + i * direction[1];
          if (!isInBoard(newRow, newCol)) break;
          if (board[newRow][newCol] != null) {
            if (board[newRow][newCol]!.isWhite != piece.isWhite) {
              moves.add([newRow, newCol]); //kill
            }
            break; // Camino bloqueado
          }
          moves.add([newRow, newCol]);
          i++;
        }
      }
      break;
    case ChessPieceType.queen:
      // Los posibles movimientos son en todas direcciones
      var directions = [
        [-1, 0], // up
        [1, 0], // down
        [0, -1], // left
        [0, 1], // right
        [-1, -1], // up left
        [-1, 1], // up right
        [1, -1], // down left
        [1, 1], // down right
      ];

      for (var direction in directions) {
        var i = 1;
        while (true) {
          var newRow = row + i * direction[0];
          var newCol = col + i * direction[1];
          if (!isInBoard(newRow, newCol)) break;
          if (board[newRow][newCol] != null) {
            if (board[newRow][newCol]!.isWhite != piece.isWhite) {
              moves.add([newRow, newCol]); // kill
            }
            break; // Camino bloqueado
          }
          moves.add([newRow, newCol]);
          i++;
        }
      }
      break;
    case ChessPieceType.king:
      // Los posibles movimientos son en todas direcciones un solo cuadro
      var directions = [
        [-1, 0], // up
        [1, 0], // down
        [0, -1], // left
        [0, 1], // right
        [-1, -1], // up left
        [-1, 1], // up right
        [1, -1], // down left
        [1, 1], // down right
      ];

      for (var direction in directions) {
        var newRow = row + direction[0];
        var newCol = col + direction[1];
        if (!isInBoard(newRow, newCol)) break;
        if (board[newRow][newCol] != null) {
          if (board[newRow][newCol]!.isWhite != piece.isWhite) {
            moves.add([newRow, newCol]); //kill
          }
          continue; //Camino bloqueado
        }
        moves.add([newRow, newCol]);
      }
      break;
    default:
  }
  return moves;
}
