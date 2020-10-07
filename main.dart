import 'dart:io';

class DebilException implements Exception {
}

class TicTacToe {
  var board;
  var turn;
  var win;

  void init() {
    board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ];
    turn = 'X';
  }

  void play() {
    print('let\'s play a tic-tac-toe!\n\n');
    while (win == null) {
      _print_board();
      _make_move();
      _check_win();
    }
    _print_board();
    if (win == '0') {
      print('0 wins!');
    }
    else if (win == 'X') {
      print('X wins!');
    }
    else if (win == 'D') {
      print('Draw!');
    }
  }

  void _check_win() {
    for (var i = 0; i <= 2; i++) {
      if (board[i] == ['X', 'X', 'X']) {
        win = 'X';
        return;
      }
      else if (board[i] == ['0', '0', '0']) {
        win = '0';
        return;
      }

      else if (board[0][i] + board[1][i] + board[2][i] == 'XXX') {
        win = 'X';
        return;
      }
      else if (board[0][i] + board[1][i] + board[2][i] == '000') {
        win = '0';
        return;
      }
    }

    if (board[0][0] + board[1][1] + board[2][2] == 'XXX') {
      win = 'X';
      return;
    }
    else if (board[0][2] + board[1][1] + board[2][0] == '000') {
      win = '0';
      return;
    }

    var cell_count = 0;
    for (var i = 0; i <= 2; i++) {
      for (var j = 0; j <= 2; j++) {
        if (board[i][j] != ' ') {
          cell_count++;
        }
      }
    }
    if (cell_count == 9) {
      win = 'D';
      return;
    }
  }

  void _make_move() {
    print('make a move, ${turn}');
    var move_str = stdin.readLineSync();
    try {
      var move_int = int.parse(move_str);

      if (move_int < 1 || move_int > 9) {
        throw FormatException;
      }

      var i;
      var j;

      switch (move_int) {
        case 1:
          {
            i = 0;
            j = 0;
          }
          break;
        case 2:
          {
            i = 0;
            j = 1;
          }
          break;
        case 3:
          {
            i = 0;
            j = 2;
          }
          break;
        case 4:
          {
            i = 1;
            j = 0;
          }
          break;
        case 5:
          {
            i = 1;
            j = 1;
          }
          break;
        case 6:
          {
            i = 1;
            j = 2;
          }
          break;
        case 7:
          {
            i = 2;
            j = 0;
          }
          break;
        case 8:
          {
            i = 2;
            j = 1;
          }
          break;
        case 9:
          {
            i = 2;
            j = 2;
          }
          break;
      }
      if (board[i][j] != ' ') {
        throw FormatException;
      }
      else {
        board[i][j] = turn;
        if (turn == 'X'){
          turn = '0';
        }
        else if (turn == '0') {
          turn = 'X';
        }
      }
    }
    catch (e) {
      if (e == FormatException) {
        print('send correct number, ${turn}');
      }
    }
}

  void _print_board() {
    /*
     0 | 0 | 0
    -----------
     0 | 0 | 0
    ----------
     X | X | 0
    */
    print(' ' + board[0][0] + ' | ' + board[0][1] + ' | ' + board[0][2]);
    print('-----------');
    print(' ' + board[1][0] + ' | ' + board[1][1] + ' | ' + board[1][2]);
    print('-----------');
    print(' ' + board[2][0] + ' | ' + board[2][1] + ' | ' + board[2][2]);
    print('');
  }
}

void main() {
  var new_game_1 = TicTacToe();
  new_game_1.init();
  new_game_1.play();

  var new_game_2 =  TicTacToe();
  new_game_2.init();
  new_game_2.play();

  print('the end');
  print('statistic:\n');
  print('Winner 1: ${new_game_1}');
  print('Winner 2: ${new_game_2}');
}