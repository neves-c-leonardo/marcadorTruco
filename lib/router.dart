import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:truco2ponto0/login.dart';
import 'package:truco2ponto0/mesa.dart';


class NavigationRouter{
  static Router router = Router();
  static Handler _mainHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => Login());
  static Handler _mesa = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => Home());


  static void setupRouter(){
    router.define(
      'login',
      handler: _mainHandler,
    );
    router.define(
      'home/',
      handler: _mesa,
    );
  }
}