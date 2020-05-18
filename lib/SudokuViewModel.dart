
import 'package:countdown/countdown.dart';
import 'package:flutter/widgets.dart';
import 'package:sudoku/SudokuScreen.dart';
import 'package:collection/collection.dart';
import 'MyDialog.dart';

abstract class SudokuViewModel extends State<SudokuScreen>{

  List<List<int>> sudokuBoard = [
    [0, 0, 6, 0, 0, 0, 4, 1, 0],
    [0, 0, 1, 0, 7, 0, 0, 2, 9],
    [0, 9, 2, 3, 0, 1, 0, 0, 0],
    [6, 0, 5, 0, 3, 7, 0, 0, 2],
    [0, 0, 8, 2, 0, 5, 1, 0, 0],
    [4, 0, 0, 1, 6, 0, 5, 0, 7],
    [0, 0, 0, 9, 0, 3, 7, 6, 0],
    [9, 8, 0, 0, 1, 0, 3, 0, 0],
    [0, 6, 3, 0, 0, 0, 2, 0, 0]
  ];

  List<List<int>> manualSoal = new List.generate(9, (_) => new List(9));
//
//  List<List<int>> sudokuBoard = [
//    [0, 0, 3, 4],
//    [3, 4, 0, 0],
//    [0, 0, 4, 3],
//    [0, 3, 2, 0]
//  ];

  bool playButton = false;
  bool gridOnTap = false;
  var tappedX, tappedY;
  var sub;
  CountDown cd;
  String countDownText = "00:15:00";
  bool manualCheck = false;
  var totalSeconds;
  bool success = false;

  int rowcek;
  int colcek;

  static const int UNASSIGNED = 0;
  static const int N = 9;
  static const int SQN = 3;

//  static const int UNASSIGNED = 0;
//  static const int N = 4;
//  static const int SQN = 2;

  gridItemTapped(int x, int y){
    setState(() {
      this.gridOnTap = true;
      print(x.toString() + "," + y.toString());
      this.tappedX = x;
      this.tappedY = y;
      print(this.tappedX.toString() + "tap" + this.tappedY.toString());
    });
  }

  onTapInsertGrid(int v){
    setState(() {
      if (manualSoal[this.tappedX][this.tappedY] == UNASSIGNED){
        sudokuBoard[this.tappedX][this.tappedY] = v;
        print(manualSoal.toString());
        print(sudokuBoard.toString());
        if(!isSafe(sudokuBoard, this.tappedX, this.tappedY, v)){
          manualCheck = true;
        }else
          manualCheck = false;

      }
      print(manualCheck.toString());
    });
  }

  onStartStopPress() {

    if(this.sub == null){
      sub = cd.stream.listen(null);

      sub.onData((Duration d){
        setState((){
          totalSeconds = d.inSeconds;
          int m = totalSeconds ~/ 60;
          int s = totalSeconds - (60*m);
          this.countDownText = "00:" + m.toString() + ":" + s.toString();
        });

      });

      sub.onDone((){
        print("done");

        setState((){
          this.playButton = false;
          MyDialog(context, "Game Over", "Waktu Habis", Status.WARNING).build(() {
            Navigator.pop(context);
          });
        });
      });
    }else{
      if(!this.playButton){
        sub.resume();
      }else{
        sub.pause();
      }
    }

    setState((){
      this.playButton = !this.playButton;
    });

  }

  resetGame(){
    setState(() {
      this.countDownText = "00:15:00";
      cd = new CountDown(new Duration(minutes: 15));
      this.sudokuBoard = [
        [0, 0, 6, 0, 0, 0, 4, 1, 0],
        [0, 0, 1, 0, 7, 0, 0, 2, 9],
        [0, 9, 2, 3, 0, 1, 0, 0, 0],
        [6, 0, 5, 0, 3, 7, 0, 0, 2],
        [0, 0, 8, 2, 0, 5, 1, 0, 0],
        [4, 0, 0, 1, 6, 0, 5, 0, 7],
        [0, 0, 0, 9, 0, 3, 7, 6, 0],
        [9, 8, 0, 0, 1, 0, 3, 0, 0],
        [0, 6, 3, 0, 0, 0, 2, 0, 0]
      ];
      this.playButton = false;
      sub.pause();
      sub = null;
      onStartStopPress();
    });
  }

  bool SudokuSolver(List<List<int>> grid){
    int row = -1;
    int col = -1;
    bool isEmpty = true;

    //find empty location
    for (int i = 0; i < N; i++){
      for (int j = 0; j < N; j++){
        if (grid[i][j] == UNASSIGNED){
          row = i;
          col = j;
          isEmpty = false;
          break;
        }
      }
      if(!isEmpty){
        break;
      }

    }
//
    if(isEmpty){
      return true;
    }
    //selesai

//    if(!FindEmptyLocation(grid, row, col))
//      return true;

    // consider digits 1 to 9
    for (int num = 1; num <= N; num++)
    {
      // if looks promising
      if (isSafe(grid, row, col, num))
      {
        // make tentative assignment
        grid[row][col] = num;

        // return, if success, yay!
        if (SudokuSolver(grid))
          return true;
        else
          grid[row][col] = UNASSIGNED;
        // failure, unmake & try again

      }

    }

    return false;

  }


  bool isSafe(List<List<int>> grid, int row, int col, int num)
  {
    return !UsedInRow(grid, row, num) &&
    !UsedInCol(grid, col, num) &&
    !UsedInBox(grid, row - row%SQN , col - col%SQN, num);
  }

  bool UsedInBox(List<List<int>> grid, int boxStartRow, int boxStartCol, int num)
  {
    for (int row = boxStartRow; row < boxStartRow + SQN; row++){
      for (int col = boxStartCol; col < boxStartCol + SQN; col++){
        if (grid[row][col] == num)
          return true;
      }
    }
    return false;
  }

  bool UsedInCol(List<List<int>> grid, int col, int num)
  {
    for (int row = 0; row < N; row++){
      if (grid[row][col] == num)
        return true;
    }
    return false;
  }

  bool UsedInRow(List<List<int>> grid, int row, int num)
  {
    for (int col = 0; col < N; col++){
      if (grid[row][col] == num)
        return true;
    }
    return false;
  }

  bool cek(List<List<int>> grid){

    for(int i=0; i < N; i++){
      for(int j=0; j < N; j++){
        int num = grid[i][j];
        print(!isSafe(grid, i, j, num));
        if (isSafe(grid, i, j, num) == false)
        {
          // return, if success, yay!
//          if (cek(grid)){
//            return true;
//          }
//
//          else
//            grid[row][col] = UNASSIGNED;
          // failure, unmake & try again
          return false;
        }
      }
    }

    return true;

  }

  try_solving(){
    duplicateBoard(manualSoal, sudokuBoard);
    Function deepEq = const DeepCollectionEquality().equals;

    if (SudokuSolver(sudokuBoard) == true){
      print(sudokuBoard.toString());
      //ToDO: gambar ulang gridnya
      if(cek(sudokuBoard) == true){
        if(deepEq(manualSoal, sudokuBoard)){
          success = true;
          MyDialog(context, "SUCCESS", "Selamat anda berhasil menyelesaikan", Status.WARNING).build(() {
            Navigator.pop(context);

          });
        }else{
          success = false;
          MyDialog(context, "ERROR", "Anda Gagal. Permainan Telah Dselesaikan Otomatis", Status.WARNING).build(() {
            Navigator.pop(context);

          });
        }

      }else{
        if(deepEq(manualSoal, sudokuBoard)){
          success = true;
          MyDialog(context, "SALAH", "Solusi Tak DItemukan", Status.WARNING).build(() {
            Navigator.pop(context);

          });
        }
        setState(() {
          this.sudokuBoard = [
            [6, 0, 6, 0, 0, 0, 4, 1, 0],
            [0, 0, 1, 0, 7, 0, 0, 2, 9],
            [0, 9, 2, 3, 0, 1, 0, 0, 0],
            [6, 0, 5, 0, 3, 7, 0, 0, 2],
            [0, 0, 8, 2, 0, 5, 1, 0, 0],
            [4, 0, 0, 1, 6, 0, 5, 0, 7],
            [0, 0, 0, 9, 0, 3, 7, 6, 0],
            [9, 8, 0, 0, 1, 0, 3, 0, 0],
            [0, 6, 3, 0, 0, 0, 2, 0, 0]
          ];

        });
      }
      print("Status : " + cek(sudokuBoard).toString());


    }
    else{
      print("No solution exists");
    }

  }

  duplicateBoard(var from, var to){
    for(int i =0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        to[i][j] = from[i][j];
      }
    }
  }

  @override
  void initState() {
    print(sudokuBoard.toString());
    print(manualSoal.toString());
    duplicateBoard(sudokuBoard, manualSoal);
    print(manualSoal.toString());
    cd = new CountDown(new Duration(minutes: 15));
    onStartStopPress();
    // TODO: implement initState
    super.initState();
  }

}