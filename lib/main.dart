import 'package:flutter/material.dart';
import 'package:truco2ponto0/router.dart';

void main(){
  NavigationRouter.setupRouter();
  runApp(MyApp());

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contador de Truco",

      // fazendo a rota automatica para tela Login
      initialRoute: 'login',
      onGenerateRoute: NavigationRouter.router.generator,

      // tirando o banner do flutter das telas
      debugShowCheckedModeBanner: false,
    );
  }
}
