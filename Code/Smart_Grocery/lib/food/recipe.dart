import 'dart:convert';

class Recipe {

  // ordered according to json
  String? Recipe_title;

  List? instructions;

  List? ingredients;

  int? recipe_id;

  int isFavorite = 0;
  String? image_name;

  Map<String, dynamic> toMap() {
    return {

      'Recipe_title': Recipe_title,
      'instructions': instructions,
      // 'instructions': json.encode(instructions),
      'ingredients': ingredients,
      // 'ingredients': json.encode(ingredients),
      'recipe_id': recipe_id,
      'isFavorite': isFavorite,
      'image_name': image_name

    };
    }



  Recipe({
    required this.Recipe_title,
    required this.instructions,
    required this.ingredients,
    this.recipe_id,
    this.isFavorite = 0,
    this.image_name

});

  // factory Recipe.fromMap(Map<String, dynamic> map){
  //   return Recipe(
  //       Recipe_title: map['Recipe_title'],
  //       instructions: map['instructions'],
  //       ingredients: map['ingredients'],
  //       recipe_id: map['recipe_id'],

  //   );
  // }


    factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      Recipe_title: map['Recipe_title'],
      instructions: List<String>.from(json.decode(map['instructions'])), // Decoding the JSON string to a List
      ingredients: List<String>.from(json.decode(map['ingredients'])), // Decoding the JSON string to a List
      recipe_id: map['recipe_id'],
      isFavorite: 0,
      image_name: map['image_name']
    );
  }


  String toString() {
    return 'Recipe{Recipe_title: $Recipe_title, instructions: $instructions, '
        'ingredients: $ingredients, recipe_id: $recipe_id, '
        'Favorite: $isFavorite}'
        'image_name: $image_name\n';
  }

}



