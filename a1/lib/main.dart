import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int r1 = 0, r2 = 0, r3 = 0;

  @override
  void initState() {
    super.initState();
    arr.shuffle();
    r1 = arr[0];
    r2 = arr[1];
    r3 = arr[2];
  }

  int currScore = 0;
  //int bestScore = 0;

  int n1 = 1;
  int n2 = 1;
  int n3 = 1;

  int b = 0, c = 0, i, j;

  var guesses = '';

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.9,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Row(
                  children: <Widget>[
                    Container( //spacing container
                      width: 48.0,
                      height: 10.0,
                      color: Colors.white,
                    ),
                    Text('TURNS', style: TextStyle(fontStyle: FontStyle.normal, fontSize: 30),),
                    Container( //spacing container
                      width: 10.0,
                      height: 10.0,
                      color: Colors.white,
                    ),
                    Container( //box for text display
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text('$currScore', textAlign: TextAlign.center, style: TextStyle(fontSize: 35),),
                      ),
                    ),
                    // Container( //spacing container
                    //   width: 55.0,
                    //   height: 10.0,
                    //   color: Colors.white,
                    // ),
                    // Text('BEST', style: TextStyle(fontStyle: FontStyle.normal, fontSize: 30),),
                    // Container( //spacing container
                    //   width: 10.0,
                    //   height: 10.0,
                    //   color: Colors.white,
                    // ),
                    // Container( //box for text display
                    //   height: 60.0,
                    //   width: 60.0,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.black),
                    //   ),
                    //   child: Center(
                    //     child: Text('$currScore', textAlign: TextAlign.center, style: TextStyle(fontSize: 35),),
                    //   ), 
                    // ),
                  ],
                ),
              ),
              Container( //spacing container
                width: 10.0,
                height: 10.0,
                color: Colors.white,
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ButtonTheme(
                      minWidth: 360.0,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          currScore = 0;
                          n1 = 1;
                          n2 = 1;
                          n3 = 1;
                          b = 0;
                          c = 0;
                          arr.shuffle();
                          r1 = arr[0];
                          r2 = arr[1];
                          r3 = arr[2];
                          guesses = '';
                          setState(() {});
                          debugPrint('$r1\t$r2\t$r3\n');
                        },
                        child: Text('PLAY AGAIN', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0),),
                      ),
                    ),
                  ),
                ],
              ),
              Container( //spacing container
                width: 10.0,
                height: 10.0,
                color: Colors.white,
              ),
              Container( //box for text display
                height: 200.0,
                width: 360.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: SingleChildScrollView(
                  child: Text('$guesses'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row( 
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_up
                          ), 
                          iconSize: 50, 
                          onPressed: () {
                            if(n1 < 9) {
                              n1++;
                              setState(() {});
                            }
                          },
                        ),
                        Container( //box for text display
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text('$n1', textAlign: TextAlign.center, style: TextStyle(fontSize: 35),),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down
                          ), 
                          iconSize: 50, 
                          onPressed: () {
                            if(n1 > 1) {
                              n1--;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                    Container( //spacing container
                      width: 75.0,
                      height: 10.0,
                      color: Colors.white,
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_up
                          ), 
                          iconSize: 50, 
                          onPressed: () {
                            if(n2 < 9) {
                              n2++;
                              setState(() {});
                            }
                          },
                        ),
                        Container( //box for text display
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text('$n2', textAlign: TextAlign.center, style: TextStyle(fontSize: 35),),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down
                          ), 
                          iconSize: 50, 
                          onPressed: () {
                            if(n2 > 1) {
                              n2--;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                    Container( //spacing container
                      width: 75.0,
                      height: 10.0,
                      color: Colors.white,
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_up
                          ), 
                          iconSize: 50, 
                          onPressed: () {
                            if(n3 < 9) {
                              n3++;
                              setState(() {});
                            }
                          },
                        ),
                        Container( //box for text display
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text('$n3', textAlign: TextAlign.center, style: TextStyle(fontSize: 35),),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down
                          ), 
                          iconSize: 50, 
                          onPressed: () {
                            if(n3 > 1) {
                              n3--;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: ButtonTheme(
                  minWidth: 360.0,
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      if(n1 == n2 || n2 == n3 || n1 == n3) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text('Every digit has to be UNIQUE'),
                            );
                          }
                        );
                      }
                      else {
                        List<int> req = [0, 0, 0];
                        req[0] = r1;
                        req[1] = r2;
                        req[2] = r3;
                        List<int> ans = [0, 0, 0];
                        ans[0] = n1;
                        ans[1] = n2;
                        ans[2] = n3;
                        for(i = 0; i < 3; i++) {
                          for(j = 0; j < 3; j++) {
                            if(req[i] == ans[j]) {
                              if(i != j) c++;
                              else {
                                b++;
                                if(b == 3) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Text('You GUESSED the number in $currScore turn(s)!'),
                                      );
                                    }
                                  );
                                }
                              }
                            }
                          }
                        }
                        currScore++;
                        guesses += '\n$n1$n2$n3: $b B, $c C';
                        setState(() {});
                        debugPrint('Req:$r1$r2$r3');
                        debugPrint('Guess:$n1$n2$n3');
                        debugPrint('Turn #: $currScore\n');
                        b = 0;
                        c = 0;
                      }
                    },
                    child: Text('SUBMIT GUESS', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
