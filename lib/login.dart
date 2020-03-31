import 'package:flutter/material.dart';
import 'package:truco2ponto0/mesa.dart';

void main() {
  runApp(MaterialApp(
      home: Login() ,debugShowCheckedModeBanner: false
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController timeAController = TextEditingController();
  TextEditingController timeBController = TextEditingController();

  var _pontos = ['Padrão','12','15'];
  var pontosItemSelect = "Padrão";

  var _sujo = ['Padrão','Sujo','Limpo'];
  var imagemItemSelect = "Padrão";

  var _tipo = ['Padrão','Mineiro','Paulista'];
  var tipoItemSelect = "Padrão";

  void _navegar(pontosItemSelect, imagemItemSelect, tipoItemSelect){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(pontoReferencia: pontosItemSelect, imagemReferencia: imagemItemSelect, tipoItemSelect: tipoItemSelect)));
  }

  void _iniciar() {
    if(pontosItemSelect == 'Padrão' && imagemItemSelect == "Padrão" && tipoItemSelect == "Padrão"){
      int pontosItemSelect = 15;
      imagemItemSelect = "images/sequenciaMineiraSuja.png";
      tipoItemSelect = 'Truco Mineiro de 15 pontos Baralho Sujo';
      _navegar(pontosItemSelect, imagemItemSelect, tipoItemSelect);

    } else if(pontosItemSelect == '12' && imagemItemSelect == "Sujo" && tipoItemSelect == "Mineiro"){
      int pontosItemSelect = 12;
      imagemItemSelect = "images/sequenciaMineiraSuja.png";
      tipoItemSelect = 'Truco Mineiro de 12 pontos Baralho Sujo';
      _navegar(pontosItemSelect, imagemItemSelect, tipoItemSelect);

    } else if(pontosItemSelect == '12' && imagemItemSelect == "Limpo" && tipoItemSelect == "Mineiro"){
      int pontosItemSelect = 12;
      imagemItemSelect = "images/sequenciaMineiraLimpa.png";
      tipoItemSelect = 'Truco Mineiro de 12 pontos Baralho Limpo';
      _navegar(pontosItemSelect, imagemItemSelect, tipoItemSelect);

    } else if(pontosItemSelect == '12' && imagemItemSelect == "Sujo" && tipoItemSelect == "Paulista"){
      int pontosItemSelect = 12;
      imagemItemSelect = "images/sequenciaPaulistaSuja.png";
      tipoItemSelect = 'Truco Paulista de 12 pontos Baralho Sujo';
      _navegar(pontosItemSelect, imagemItemSelect, tipoItemSelect);

    } else if(pontosItemSelect == '12' && imagemItemSelect == "Limpo" && tipoItemSelect == "Paulista"){
      int pontosItemSelect = 12;
      imagemItemSelect = "images/sequenciaPaulistaLimpa.png";
      tipoItemSelect = 'Truco Paulista de 12 pontos Baralho Limpo';
      _navegar(pontosItemSelect, imagemItemSelect, tipoItemSelect);

    } else if(pontosItemSelect == '15' && imagemItemSelect == "Sujo" && tipoItemSelect == "Mineiro"){
      int pontosItemSelect = 15;
      imagemItemSelect = "images/sequenciaMineiraSuja.png";
      tipoItemSelect = 'Truco Mineiro de 15 pontos Baralho Sujo';
      _navegar(pontosItemSelect, imagemItemSelect, tipoItemSelect);

    } else if(pontosItemSelect == '15' && imagemItemSelect == "Limpo" && tipoItemSelect == "Mineiro"){
      int pontosItemSelect = 15;
      imagemItemSelect = "images/sequenciaMineiraLimpa.png";
      tipoItemSelect = 'Truco Mineiro de 15 pontos Baralho Limpo';
      _navegar(pontosItemSelect, imagemItemSelect, tipoItemSelect);

    } else if(pontosItemSelect == '15' && imagemItemSelect == "Sujo" && tipoItemSelect == "Paulista"){
      int pontosItemSelect = 15;
      imagemItemSelect = "images/sequenciaMineiraSuja.png";
      tipoItemSelect = 'Truco Paulista de 15 pontos Baralho Sujo';
      _navegar(pontosItemSelect, imagemItemSelect, tipoItemSelect);

    } else if(pontosItemSelect == '15' && imagemItemSelect == "Limpo" && tipoItemSelect == "Paulista"){
      int pontosItemSelect = 15;
      imagemItemSelect = "images/sequenciaMineiraLimpa.png";
      tipoItemSelect = 'Truco Paulista de 15 pontos Baralho Limpo';
      _navegar(pontosItemSelect, imagemItemSelect, tipoItemSelect);
    } else{
      _showDialog();
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text("Combinação não aceita!", textAlign: TextAlign.center,),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
             Center(
               child: Padding(
                 padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                 child: Image.asset('images/truco_logo.png',
                 height: 150,),
               ),
             ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                child: Center(
                  child: Text(
                    "Quantos Pontos?",
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0),
                  ),
                ),
              ),
              Center(
                child: DropdownButton<String>(
                  items: _pontos.map((String pontos){
                    return DropdownMenuItem<String>(
                      value: pontos,
                      child: Text(pontos),
                    );
                  }).toList(),
                  onChanged: (String pontosSelecao){
                    _pontosDropDawn(pontosSelecao);
                  },
                  value: pontosItemSelect,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                child: Center(
                  child: Text(
                    "Baralho Limpo ou Sujo??",
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0),
                  ),
                ),
              ),
              Center(
                child: DropdownButton<String>(
                  items: _sujo.map((String sujo){
                    return DropdownMenuItem<String>(
                      value: sujo,
                      child: Text(sujo),
                    );
                  }).toList(),
                  onChanged: (String sujoSelecao){
                    _sujoDropDawn(sujoSelecao);
                  },
                  value: imagemItemSelect,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                child: Center(
                  child: Text(
                    "Qual tipo de jogo?",
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0),
                  ),
                ),
              ),
              Center(
                child: DropdownButton<String>(
                  items: _tipo.map((String tipo){
                    return DropdownMenuItem<String>(
                      value: tipo,
                      child: Text(tipo),
                    );
                  }).toList(),
                  onChanged: (String tipoSelecao){
                    _tipoDropDawn(tipoSelecao);
                  },
                  value: tipoItemSelect,
                ),
              ),


              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 25.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      _iniciar();
                    },
                    child: Text(
                      "Iniciar",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _pontosDropDawn(String pontosSelecao){
    setState(() {
      this.pontosItemSelect = pontosSelecao;
    });
  }
  void _sujoDropDawn(String sujoSelecao){
    setState(() {
      this.imagemItemSelect = sujoSelecao;
    });
  }
  void _tipoDropDawn(String tipoSelecao){
    setState(() {
      this.tipoItemSelect = tipoSelecao;
    });
  }
}