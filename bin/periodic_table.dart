import 'dart:convert';
import 'dart:io';

class PeriodicTable {
  static final PeriodicTable _instance = PeriodicTable._internal();
  factory PeriodicTable() {
    return _instance;
  }

  PeriodicTable._internal() {
  }

  static final Map<dynamic, dynamic> elements = jsonDecode((jsonDecode(File('../elements.json').readAsStringSync())).toString());

}