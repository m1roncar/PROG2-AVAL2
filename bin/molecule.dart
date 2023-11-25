
import 'symbol_check.dart';

extension Compare<T> on Comparable<T> {
  bool operator <=(T other) => compareTo(other) <= 0;
  bool operator >=(T other) => compareTo(other) >= 0;
  bool operator <(T other) => compareTo(other) < 0;
  bool operator >(T other) => compareTo(other) > 0;

  int get weight => this.weight;

}



class Molecule implements Comparable<Molecule>{

  String name;
  String formula;

  int weightIndicator2 = 0;

  Molecule({required this.name, required this.formula}){

    if (RegExp(r'\b[2-9 1-9]').hasMatch(formula) == true) {
      throw Exception('${formula} is not a valid molecular formula!');
    }

    Iterable<RegExpMatch> elementSeparator = RegExp('''
    r'\b[A-Z][a-z]|[A-Z][a-z]|\B[A-Z][a-z]\b|\b[A-Z]|[A-Z]|\B[A-Z]\b'
    ''').allMatches(formula);

    RegExp atomNumber = RegExp(r'[^2-9 1-9]');

    List<String> numberOfAtoms = formula.split(atomNumber);
    List<int> numberOfAtoms2 = [];

    for (String i in numberOfAtoms){
      if (i.isEmpty == false){
        numberOfAtoms2.add(int.parse(i));
      } else;
    }

    List<String> elementsList = [];

    for (Match m in elementSeparator){
      elementsList.add(m[0]!);
    }

    // atomTesting
    for (String atom in elementsList){
      if ((symbolCheck.contains(atom) == false)){
        throw Exception('$atom is not a valid chemical type!');
      }
    }
    if (elementsList.isEmpty == true){
      throw Exception('The chemical compound is invalid!');
    }
    //
    } 



    int get weight{
      Iterable<RegExpMatch> elementSeparator = RegExp('''
      r'\b[A-Z][a-z]|[A-Z][a-z]|\B[A-Z][a-z]\b|\b[A-Z]|[A-Z]|\B[A-Z]\b'
      ''').allMatches(formula);

      RegExp atomNumber = RegExp(r'[^2-9 1-9]');

      List<String> numberOfAtoms = formula.split(atomNumber);
      List<int> numberOfAtoms2 = [];

      for (String i in numberOfAtoms){
        if (i.isEmpty == false){
          numberOfAtoms2.add(int.parse(i));
        } else;
      }

      List<String> elementsList = [];

      for (Match m in elementSeparator){
        elementsList.add(m[0]!);
      }

        List <int> elementWeight = [];

        for (String atom in elementsList){
          elementWeight.add(int.parse(chemicalData[symbolCheck.indexOf(atom)]['weight']));

        }

        List elementSum = [];
        int index = 0;
        int difference = 1;
        int weightIndicator = 0;

        if (numberOfAtoms2.length > difference){
          elementSum.add((numberOfAtoms2[index] * elementWeight[index]));
          ++index;
          ++difference;
        }

        else if (numberOfAtoms2.length == difference){
          if (elementsList.length == 1){
          elementSum.add((numberOfAtoms2[index] * elementWeight[index]));
          } else{
          elementSum.add((numberOfAtoms2[index] * elementWeight[index]));
          elementSum.add(elementWeight[index + 1]);
          }
        }

        else if (numberOfAtoms2.length < difference)  {
          elementSum.addAll(elementWeight);
        }

        for (int number in elementSum){
          weightIndicator += number;
        }
      
        return(weightIndicator);
    }


  @override
  int compareTo(Comparable other) => weight.compareTo(other.weight);

  

}