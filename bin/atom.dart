import 'symbol_check.dart';

class Atom {
  final String symbol;

  Atom(this.symbol){
      if (symbolCheck.contains(symbol) == false){
        throw Exception('The given symbol is not a valid chemical type!');
    }
  }

  @override
  String toString(){
    return symbol;
  }
}
