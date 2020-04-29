
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sudoku/SudokuViewModel.dart';

import 'MyDialog.dart';

class SudokuView extends SudokuViewModel{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _body(),
    );
  }

  Widget _buildGameBody(){
    int gridStateLength = sudokuBoard.length;
    return Column(
    children: <Widget>[
      AspectRatio(
        aspectRatio: 0.98,
        child: SizedBox.expand(
          child: Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),

            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridStateLength,
              ),
              itemBuilder: _buildGridItems,
              itemCount: gridStateLength * gridStateLength,
            ),
          ),
        )
      ),
    ]);
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int gridStateLength = sudokuBoard.length;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    return GestureDetector(
      onTap: () => gridItemTapped(x, y),
      child: GridTile(
        child: Container(

          child: Center(
            child: _buildGridItem(x, y),
          ),
        ),
      ),
    );
  }


  Widget _buildGridItem(int x, int y) {
    switch (sudokuBoard[x][y]) {
      case 0:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: this.gridOnTap && x == this.tappedX && y == this.tappedY ? Colors.orange : Colors.black,
                  width: this.gridOnTap && x == this.tappedX && y == this.tappedY ? 2.0 : 0.0),
              color: (x+y)%2 == 0 ? Colors.blueGrey : Colors.grey,
            ),
            foregroundDecoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: x == 0 ? 2.0 : 0.0, color: x == 0 ? Colors.orange : Colors.black),
                left: BorderSide(width: y == 0 ? 2.0: 0.0, color: y == 0 ? Colors.orange : Colors.black),
                  bottom: BorderSide(width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0, color: x == 2 || x == 5 || x == 8 ? Colors.orange : Colors.black),
                right: BorderSide(width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0, color: y == 2 || y == 5 || y == 8 ? Colors.orange : Colors.black)
              )
            ),
            child: Center(
              child: Text(''),
            ),
          ),
        );
        break;
      case 1:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: this.gridOnTap && x == this.tappedX && y == this.tappedY ? Colors.orange : Colors.black,
                  width: this.gridOnTap && x == this.tappedX && y == this.tappedY ? 2.0 : 0.0),
              color: (x+y)%2 == 0 ? Colors.blueGrey : Colors.grey,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: x == 0 ? 2.0 : 0.0, color: x == 0 ? Colors.orange : Colors.black),
                    left: BorderSide(width: y == 0 ? 2.0: 0.0, color: y == 0 ? Colors.orange : Colors.black),
                    bottom: BorderSide(width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0, color: x == 2 || x == 5 || x == 8 ? Colors.orange : Colors.black),
                    right: BorderSide(width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0, color: y == 2 || y == 5 || y == 8 ? Colors.orange : Colors.black)
                )
            ),
            child: Center(
              child: Text('1', style: TextStyle(fontSize: 20, color: this.gridOnTap && x == this.tappedX && y == this.tappedY && manualCheck ? Colors.red : Colors.black),),
            ),
          ),
        );
        break;
      case 2:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: this.gridOnTap && x == this.tappedX && y == this.tappedY ? Colors.orange : Colors.black,
                  width: this.gridOnTap && x == this.tappedX && y == this.tappedY ? 2.0 : 0.0),
              color: (x+y)%2 == 0 ? Colors.blueGrey : Colors.grey,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: x == 0 ? 2.0 : 0.0, color: x == 0 ? Colors.orange : Colors.black),
                    left: BorderSide(width: y == 0 ? 2.0: 0.0, color: y == 0 ? Colors.orange : Colors.black),
                    bottom: BorderSide(width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0, color: x == 2 || x == 5 || x == 8 ? Colors.orange : Colors.black),
                    right : BorderSide(width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0, color: y == 2 || y == 5 || y == 8 ? Colors.orange : Colors.black)
                )
            ),
            child: Center(
              child: Text('2', style: TextStyle(fontSize: 20, color: this.gridOnTap && x == this.tappedX && y == this.tappedY && manualCheck ? Colors.red : Colors.black),),
            ),
          ),
        );
        break;
      case 3:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: this.gridOnTap && x == this.tappedX && y == this.tappedY ? Colors.orange : Colors.black,
                  width: this.gridOnTap && x == this.tappedX && y == this.tappedY ? 2.0 : 0.0),
              color: (x+y)%2 == 0 ? Colors.blueGrey : Colors.grey,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: x == 0 ? 2.0 : 0.0, color: x == 0 ? Colors.orange : Colors.black),
                    left: BorderSide(width: y == 0 ? 2.0: 0.0, color: y == 0 ? Colors.orange : Colors.black),
                    bottom: BorderSide(width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0, color: x == 2 || x == 5 || x == 8 ? Colors.orange : Colors.black),
                    right : BorderSide(width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0, color: y == 2 || y == 5 || y == 8 ? Colors.orange : Colors.black)
                )
            ),
            child: Center(
              child: Text('3', style: TextStyle(fontSize: 20, color: this.gridOnTap && x == this.tappedX && y == this.tappedY && manualCheck ? Colors.red : Colors.black),),
            ),
          ),
        );
        break;
      case 4:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: this.gridOnTap && x == this.tappedX && y == this.tappedY ? Colors.orange : Colors.black,
                  width: this.gridOnTap && x == this.tappedX && y == this.tappedY ? 2.0 : 0.0),
              color: (x+y)%2 == 0 ? Colors.blueGrey : Colors.grey,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: x == 0 ? 2.0 : 0.0, color: x == 0 ? Colors.orange : Colors.black),
                    left: BorderSide(width: y == 0 ? 2.0: 0.0, color: y == 0 ? Colors.orange : Colors.black),
                    bottom: BorderSide(width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0, color: x == 2 || x == 5 || x == 8 ? Colors.orange : Colors.black),
                    right : BorderSide(width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0, color: y == 2 || y == 5 || y == 8 ? Colors.orange : Colors.black)
                )
            ),
            child: Center(
              child: Text('4', style: TextStyle(fontSize: 20, color: this.gridOnTap && x == this.tappedX && y == this.tappedY && manualCheck ? Colors.red : Colors.black),),
            ),
          ),
        );
        break;
      case 5:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: this.gridOnTap && x == this.tappedX && y == this.tappedY ? Colors.orange : Colors.black,
                  width: this.gridOnTap && x == this.tappedX && y == this.tappedY ? 2.0 : 0.0),
              color: (x+y)%2 == 0 ? Colors.blueGrey : Colors.grey,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: x == 0 ? 2.0 : 0.0, color: x == 0 ? Colors.orange : Colors.black),
                    left: BorderSide(width: y == 0 ? 2.0: 0.0, color: y == 0 ? Colors.orange : Colors.black),
                    bottom: BorderSide(width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0, color: x == 2 || x == 5 || x == 8 ? Colors.orange : Colors.black),
                    right : BorderSide(width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0, color: y == 2 || y == 5 || y == 8 ? Colors.orange : Colors.black)
                )
            ),
            child: Center(
              child: Text('5', style: TextStyle(fontSize: 20, color: this.gridOnTap && x == this.tappedX && y == this.tappedY && manualCheck ? Colors.red : Colors.black),),
            ),
          ),
        );
        break;
      case 6:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: this.gridOnTap && x == this.tappedX && y == this.tappedY ? Colors.orange : Colors.black,
                  width: this.gridOnTap && x == this.tappedX && y == this.tappedY ? 2.0 : 0.0),
              color: (x+y)%2 == 0 ? Colors.blueGrey : Colors.grey,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: x == 0 ? 2.0 : 0.0, color: x == 0 ? Colors.orange : Colors.black),
                    left: BorderSide(width: y == 0 ? 2.0: 0.0, color: y == 0 ? Colors.orange : Colors.black),
                    bottom: BorderSide(width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0, color: x == 2 || x == 5 || x == 8 ? Colors.orange : Colors.black),
                    right : BorderSide(width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0, color: y == 2 || y == 5 || y == 8 ? Colors.orange : Colors.black)
                )
            ),
            child: Center(
              child: Text('6', style: TextStyle(fontSize: 20, color: this.gridOnTap && x == this.tappedX && y == this.tappedY && manualCheck ? Colors.red : Colors.black),),
            ),
          ),
        );
        break;
      case 7:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: this.gridOnTap && x == this.tappedX && y == this.tappedY ? Colors.orange : Colors.black,
                  width: this.gridOnTap && x == this.tappedX && y == this.tappedY ? 2.0 : 0.0),
              color: (x+y)%2 == 0 ? Colors.blueGrey : Colors.grey,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: x == 0 ? 2.0 : 0.0, color: x == 0 ? Colors.orange : Colors.black),
                    left: BorderSide(width: y == 0 ? 2.0: 0.0, color: y == 0 ? Colors.orange : Colors.black),
                    bottom: BorderSide(width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0, color: x == 2 || x == 5 || x == 8 ? Colors.orange : Colors.black),
                    right : BorderSide(width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0, color: y == 2 || y == 5 || y == 8 ? Colors.orange : Colors.black)
                )
            ),
            child: Center(
              child: Text('7', style: TextStyle(fontSize: 20, color: this.gridOnTap && x == this.tappedX && y == this.tappedY && manualCheck ? Colors.red : Colors.black),),
            ),
          ),
        );
        break;
      case 8:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: this.gridOnTap && x == this.tappedX && y == this.tappedY ? Colors.orange : Colors.black,
                  width: this.gridOnTap && x == this.tappedX && y == this.tappedY ? 2.0 : 0.0),
              color: (x+y)%2 == 0 ? Colors.blueGrey : Colors.grey,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: x == 0 ? 2.0 : 0.0, color: x == 0 ? Colors.orange : Colors.black),
                    left: BorderSide(width: y == 0 ? 2.0: 0.0, color: y == 0 ? Colors.orange : Colors.black),
                    bottom: BorderSide(width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0, color: x == 2 || x == 5 || x == 8 ? Colors.orange : Colors.black),
                    right : BorderSide(width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0, color: y == 2 || y == 5 || y == 8 ? Colors.orange : Colors.black)
                )
            ),
            child: Center(
              child: Text('8', style: TextStyle(fontSize: 20, color: this.gridOnTap && x == this.tappedX && y == this.tappedY && manualCheck ? Colors.red : Colors.black),),
            ),
          ),
        );
        break;
      case 9:
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: this.gridOnTap && x == this.tappedX && y == this.tappedY ? Colors.orange : Colors.black,
                  width: this.gridOnTap && x == this.tappedX && y == this.tappedY ? 2.0 : 0.0),
              color: (x+y)%2 == 0 ? Colors.blueGrey : Colors.grey,
            ),
            foregroundDecoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: x == 0 ? 2.0 : 0.0, color: x == 0 ? Colors.orange : Colors.black),
                    left: BorderSide(width: y == 0 ? 2.0 : 0.0, color: y == 0 ? Colors.orange : Colors.black),
                    bottom: BorderSide(width: x == 2 || x == 5 || x == 8 ? 2.0 : 0.0, color: x == 2 || x == 5 || x == 8 ? Colors.orange : Colors.black),
                    right : BorderSide(width: y == 2 || y == 5 || y == 8 ? 2.0 : 0.0, color: y == 2 || y == 5 || y == 8 ? Colors.orange : Colors.black)
                )
            ),
            child: Center(
              child: Text('9', style: TextStyle(fontSize: 20, color: this.gridOnTap && x == this.tappedX && y == this.tappedY && manualCheck ? Colors.red : Colors.black),),
            ),
          ),
        );
        break;
      default:
        return Text(sudokuBoard[x][y].toString());
    }
  }

  _body(){

    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Container(
          //bot stack
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                color: Colors.blueGrey,
              ),
              Container(
                color: Colors.white,
              )
            ],
          ),
        ),
        Container(
          //top stack
          margin: EdgeInsets.only(top: 35.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Text("Sudoku"),
                margin: EdgeInsets.only(bottom: 30.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      MyDialog(context, "WARNING", "Permainan ini akan direset", Status.WARNING).build(() {
                        resetGame();
                        Navigator.pop(context);
                      }, cancel: (){
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 20.0),
                      color: Colors.orange,
                      child: new Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: resetGame,
                          ),
                          Text("NEW GAME", style: TextStyle(color: Colors.white))
                        ],
                      ),
                    )
                  ),
                  Column(
                    children: <Widget>[
                      Text("Time Remaining", style: TextStyle(color: Colors.white),),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              onStartStopPress();
                            },
                            child: new Icon(playButton ? Icons.pause : Icons.play_arrow, color: Colors.orange,),
                          ),
                          new Text(countDownText, style: TextStyle(color: Colors.white),)
                        ],
                      )
                    ],
                  )
                ],
              ),
              _buildGameBody(),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      child: Text("1", style: TextStyle(fontSize: 20),),
                      onTap: (){
                        //panggil method insert
                        onTapInsertGrid(1);
                        //ToDO: buat method insert untuk pengerjaan manual
                      },
                    ),
                    GestureDetector(
                      child: Text("2", style: TextStyle(fontSize: 20),),
                      onTap: (){
                        //panggil method insert
                        onTapInsertGrid(2);
                        //ToDO: buat method insert untuk pengerjaan manual
                      },
                    ),
                    GestureDetector(
                      child: Text("3", style: TextStyle(fontSize: 20),),
                      onTap: (){
                        onTapInsertGrid(3);
                        //panggil method insert
                        //ToDO: buat method insert untuk pengerjaan manual
                      },
                    ),
                    GestureDetector(
                      child: Text("4", style: TextStyle(fontSize: 20),),
                      onTap: (){
                        onTapInsertGrid(4);
                        //panggil method insert
                        //ToDO: buat method insert untuk pengerjaan manual
                      },
                    ),
                    GestureDetector(
                      child: Text("5", style: TextStyle(fontSize: 20),),
                      onTap: (){
                        onTapInsertGrid(5);
                        //panggil method insert
                        //ToDO: buat method insert untuk pengerjaan manual
                      },
                    ),
                    GestureDetector(
                      child: Text("6", style: TextStyle(fontSize: 20),),
                      onTap: (){
                        onTapInsertGrid(6);
                        //panggil method insert
                        //ToDO: buat method insert untuk pengerjaan manual
                      },
                    ),
                    GestureDetector(
                      child: Text("7", style: TextStyle(fontSize: 20),),
                      onTap: (){
                        onTapInsertGrid(7);
                        //panggil method insert
                        //ToDO: buat method insert untuk pengerjaan manual
                      },
                    ),
                    GestureDetector(
                      child: Text("8", style: TextStyle(fontSize: 20),),
                      onTap: (){
                        onTapInsertGrid(8);
                        //panggil method insert
                        //ToDO: buat method insert untuk pengerjaan manual
                      },
                    ),
                    GestureDetector(
                      child: Text("9", style: TextStyle(fontSize: 20),),
                      onTap: (){
                        onTapInsertGrid(9);
                        //panggil method insert
                        //ToDO: buat method insert untuk pengerjaan manual
                      },
                    )

                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AspectRatio(
                    aspectRatio: 6.0,
                    child: GestureDetector(
                        onTap: (){
                          MyDialog(context, "WARNING", "Apakah Anda mengaku selesai ?", Status.WARNING).build(() {
                            Navigator.pop(context);
                            setState(() {
                              try_solving();
                            });
                          }, cancel: (){
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          color: Colors.green,
                          child: new Center(
                            child: Text("SOLVE ME!", style: TextStyle(fontSize: 20, color: Colors.white)),
                          )
                        )
                    ),
                  ),
                )
              )

            ],
          ),
        )
      ],
    );
  }
}