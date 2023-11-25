import 'symbol_check.dart';

class Element {


  final String symbol;
  final String name;
  final String latinName;
  final int weight;

  Element (this.symbol, this.name, this.latinName, this.weight){
    if (symbolCheck.contains(symbol) == false){
      throw Exception('The given symbol is not a valid chemical type!');
    }
  }

}