import 'package:flutter/material.dart';
import 'package:worldapp/pages/home.dart';
import 'package:worldapp/pages/load.dart';
import 'package:worldapp/pages/location.dart';



void main() => runApp(MaterialApp(
  routes: {
  '/':(context) => Load(),
    '/home':(context)=>Home(),
    '/location':(context)=>Loc()
  },
  ));


