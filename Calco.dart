import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'font.dart';

class MyCalco extends StatefulWidget {
  @override
  _MyCalcoState createState() => _MyCalcoState();
}

class _MyCalcoState extends State<MyCalco> {
  double collaps ;
  bool verif=false;
  _fonct(texte, coultext, coulbout) {
    return GestureDetector(
      onTap: (){
        setState(() {
          buttonPressed(texte);
        });

      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width / 4,
        color: coulbout,
        child: Center(
          child: Text(
            texte,
            style: TextStyle(color: coultext, fontSize: 20),
          ),
        ),
      ),
    );
  }

  _cont(texte, coultext, coulbout) {
    return GestureDetector(
      onTap: () {
        setState(() {

          if(collaps==-290){
            buttonPressed(texte);
          }else{
            collaps = -290;
          }
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width / 4,
        color: coulbout,
        child: Center(
          child: Text(
            texte,
            style: TextStyle(color: coultext, fontSize: 30),
          ),
        ),
      ),
    );
  }
  
  _sfonct(texte,coultext){

    return GestureDetector(
      onTap: (){
        setState(() {
          buttonPressed(texte);
        });

      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width / 4,
        color: Colors.transparent,
        child: Center(
          child: Text(
            texte,
            style: TextStyle(color: coultext, fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(
                  equation,
                  style: TextStyle(fontSize: equationFontSize,color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Text(
                  result,
                  style: TextStyle(fontSize: resultFontSize,color: Colors.white),
                ),
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      _cont("7", Colors.white, Color.fromRGBO(22, 22, 22, 1)),
                      _cont("4", Colors.white, Color.fromRGBO(22, 22, 22, 1)),
                      _cont("1", Colors.white, Color.fromRGBO(22, 22, 22, 1)),
                      _cont(".", Colors.white, Color.fromRGBO(22, 22, 22, 1)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      _cont("8", Colors.white, Color.fromRGBO(22, 22, 22, 1)),
                      _cont("5", Colors.white, Color.fromRGBO(22, 22, 22, 1)),
                      _cont("2", Colors.white, Color.fromRGBO(22, 22, 22, 1)),
                      _cont("0", Colors.white, Color.fromRGBO(22, 22, 22, 1)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      _cont("9", Colors.white, Color.fromRGBO(22, 22, 22, 1)),
                      _cont("6", Colors.white, Color.fromRGBO(22, 22, 22, 1)),
                      _cont("3", Colors.white, Color.fromRGBO(22, 22, 22, 1)),
                      _cont("=", Colors.white, Color.fromRGBO(22, 22, 22, 1)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      _fonct(
                          "Del", Colors.orange, Color.fromRGBO(32, 32, 32, 1)),
                      _fonct("÷", Colors.orange, Color.fromRGBO(32, 32, 32, 1)),
                      _fonct("x", Colors.orange, Color.fromRGBO(32, 32, 32, 1)),
                      _fonct("-", Colors.orange, Color.fromRGBO(32, 32, 32, 1)),
                      _fonct("+", Colors.orange, Color.fromRGBO(32, 32, 32, 1)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.decelerate,
            bottom: 0.0,
            right: collaps,
            child: Container(
              color: Colors.orange,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        collaps = verif ? -290 : 0;
                        verif=!verif;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: 10.0,
                    ),
                  ),
                  Container(
                    width: 290,
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            _sfonct("x²", Colors.white),
                            _sfonct("V", Colors.white),
                            _sfonct("%", Colors.white)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
