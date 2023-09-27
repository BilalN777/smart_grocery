import 'item.dart';

class Recipe {
  late final List<Item>? _ingredients ;
  late final int? _timeToCook ;
  late final String? _instructions ;

  Recipe(this._ingredients, this._timeToCook,this._instructions);

  Recipe.empty() {
    _ingredients = [] ;
    _timeToCook = 0 ;
    _instructions = '' ;
  }

  List<Item>? get ingredients => _ingredients;

  int? get timeToCook => _timeToCook;

  String? get instructions => _instructions;
}