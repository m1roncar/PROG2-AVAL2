import 'dart:convert';
import 'dart:io';

  List<dynamic> chemicalData = jsonDecode(File('../elements.json').readAsStringSync());


  List<dynamic> get elements => chemicalData;


  List<String> get symbolCheck {
    List<String> symbolList = [];
    for (var i in chemicalData){
      symbolList.add(i['symbol']);
    }
    return symbolList;
  }

  List<String> get weightCheck {
    List<String> weightList = [];
    for (var i in chemicalData){
      weightList.add(i['weight']);
    }
    return weightList;
  }