import 'package:flutter/material.dart';
import 'package:truco2ponto0/login.dart';

class Home extends StatefulWidget {
  int _pontoReferencia;
  String _imagemReferencia;
  String _tipoItemSelect;

  Home({pontoReferencia, imagemReferencia, tipoItemSelect}) {
    this._pontoReferencia = pontoReferencia;
    this._imagemReferencia = imagemReferencia;
    this._tipoItemSelect = tipoItemSelect;
  }

  @override
  _HomeState createState() => _HomeState(pontoReferencia: _pontoReferencia, imagemReferencia: _imagemReferencia, tipoItemSelect: _tipoItemSelect);
}

class _HomeState extends State<Home> {
  int _pontoReferencia;
  String _imagemReferencia;
  String _tipoItemSelect;

  _HomeState({pontoReferencia, imagemReferencia, tipoItemSelect}) {
    this._pontoReferencia = pontoReferencia;
    this._imagemReferencia = imagemReferencia;
    this._tipoItemSelect = tipoItemSelect;
  }

  int _people = 0;
  int _people2 = 0;
  int _pontoA = 0;
  int _pontoB = 0;
  String _infoText = "Jogo Pausado!";

  void _adicionaPontoA(int delta) {
    setState(() {
      _people += delta;

      if(_people >= _pontoReferencia || _people == _pontoReferencia && _people2 != _pontoReferencia){
        _pontoA += 1;
      }

      if (_people == -1) {
        _recomecar();
      }

      if (delta == 1 && _people != _pontoReferencia && _people != 0) {
        _infoText = "Time A fez 1 ponto";
      } else if (delta == 3 && _people != _pontoReferencia && _people != 0) {
        _infoText = "Time A fez 3 pontos";
      } else if (delta == -1) {
        _infoText = "Time A foi Penalizado";
      } else if(_people > 16){
        _recomecar();
      }

      if (_people >= _pontoReferencia || _people == _pontoReferencia && _people2 != _pontoReferencia) {
        var ganhador = "A";
        _ganhou(ganhador);
      } else if (_people == 0) {
        _infoText = "Jogo Pausado!";
      }
    });
  }
  void _adicionaPontoB(int delta) {
    setState(() {
      _people2 += delta;

      if(_people2 >= _pontoReferencia || _people2 == _pontoReferencia && _people != _pontoReferencia){
        _pontoB += 1;
      }

      if (_people2 == -1) {
        _recomecar();
      }

      if (delta == 1 && _people2 != _pontoReferencia && _people2 != 0) {
        _infoText = "Time B fez 1 ponto";
      } else if (delta == 3 && _people2 != _pontoReferencia && _people2 != 0) {
        _infoText = "Time B fez 3 pontos";
      } else if (delta == -1 && _people2 != _pontoReferencia && _people2 != 0) {
        _infoText = "Time B foi Penalizado";
      } else if (_people2 > 16){
        _recomecar();
      }

      if (_people2 >= _pontoReferencia || _people2 == _pontoReferencia && _people != _pontoReferencia) {
        var ganhador = "B";
        _ganhou(ganhador);
      } else if (_people2 == 0) {
        _infoText = "Jogo Pausado!";
      }
    });
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Verifique a sequência de cartas aqui", textAlign: TextAlign.center,),
          content: new Image.asset('$_imagemReferencia'),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Fechar", textAlign: TextAlign.center,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _ganhou(ganhador) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text("Time $ganhador ganhou!", textAlign: TextAlign.center,),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
                _recomecar();
              },
            ),
          ],
        );
      },
    );
  }

  void _recomecar(){
    setState(() {
      _people = 0;
      _people2 = 0;

      if (_people == 0 && _people2 == 0) {
        _infoText = "Jogo Pausado";
      }
    });
  }

  void _changeZerar() {
    setState(() {
      _people = 0;
      _people2 = 0;
      _pontoA = 0;
      _pontoB = 0;

      if (_people == 0 && _people2 == 0) {
        _infoText = "Jogo Pausado";
      }
    });
  }

  void penalizar1(){
    setState(() {
      if(_people < 15){
        _adicionaPontoA(-1);
      }
    });
  }

  void penalizar2(){
    setState(() {
      if(_people2 < 15){
        _adicionaPontoB(-1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.teal, Colors.green],
              ),
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // alinha o texto no centro
            children: <Widget>[

              Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "Voltar",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                      },
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0, bottom: 1.0, left: 20.0),
                        child: Image.asset('images/truco_logo.png', height: 150,),
                      ),
                    ),
                  ]),

              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 0.0),
                child: Center(
                  child: Text(
                    _tipoItemSelect,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0),
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "Time A: ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                        child: Text(
                          "Time B:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          "$_people",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(70, 5, 0, 0),
                        child: Text(
                          "$_people2",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ]),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.center, // alinha o texto no centro
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: RaisedButton(
                      child: Text("- 1",
                          style:
                          TextStyle(fontSize: 20.0, color: Colors.white)),
                      color: Colors.green,
                      onPressed: () {
                        penalizar1();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: RaisedButton(
                      child: Text("- 1",
                          style:
                          TextStyle(fontSize: 20.0, color: Colors.white)),
                      color: Colors.green,
                      onPressed: () {
                        penalizar2();
                      },
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.center, // alinha o texto no centro
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: RaisedButton(
                      child: Text(
                          "+ 1",
                          style: TextStyle(fontSize: 25.0, color: Colors.white)),
                      color: Colors.green,
                      onPressed: () {
                        _adicionaPontoA(1);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: RaisedButton(
                      child: Text("+ 1",
                          style:
                          TextStyle(fontSize: 25.0, color: Colors.white)),
                      color: Colors.green,
                      onPressed: () {
                        _adicionaPontoB(1);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center, // alinha o texto no centro
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: RaisedButton(
                      child: Text("+ 3",
                          style:
                          TextStyle(fontSize: 25.0, color: Colors.white)),
                      color: Colors.green,
                      onPressed: () {
                        _adicionaPontoA(3);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: RaisedButton(
                      child: Text("+ 3",
                          style:
                          TextStyle(fontSize: 25.0, color: Colors.white)),
                      color: Colors.green,
                      onPressed: () {
                        _adicionaPontoB(3);
                      },
                    ),
                  ),
                ],
              ),
              RaisedButton(
                child: Text(
                  "ZERAR",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.green,
                onPressed: () {
                  _changeZerar();
                },
              ),
              Text(
                _infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0),
              ),
              IconButton(
                icon: Icon(Icons.info),
                color: Colors.indigo,
                onPressed: () {
                  setState(() {
                    _showDialog();
                  });
                },
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        "N° VITORIAS A: ($_pontoA)",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: Text(
                        "N° VITORIAS B: ($_pontoB)",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            ],
          )),
    );
  }
}