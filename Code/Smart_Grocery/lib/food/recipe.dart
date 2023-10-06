import 'item.dart';

class Recipe {
  late final int? _recipeId;
  late final String? _title;
  late final String? _ingredients ;

  late final String? _instructions ;

  Recipe(this._ingredients, this._recipeId,this._title,this._instructions);

  Recipe.empty() {
    _recipeId = null;
    _title = '';
    _ingredients = '';
    _instructions = '';
  }

  Map<String, dynamic> toMap() {
    return {
      'recipe_id' : _recipeId,
      'Recipe_title' : _title ,
      'instructions' : _instructions,
      'ingredients' : _ingredients
    };
  }

  static Recipe fromMap(Map<String, dynamic> map) {
    return Recipe(
        map['ingredients'],
        map['recipe_id'],
        map['Recipe_title'],
        map['instructions']
    );
  }

  String get title => _title!;

  String get ingredients => _ingredients!;

  String get instructions => _instructions!;

  int get recipeId => _recipeId!;

}