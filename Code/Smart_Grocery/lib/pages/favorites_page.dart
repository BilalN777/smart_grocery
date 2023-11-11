import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:smart_grocery/databaseHelper.dart';
import 'package:smart_grocery/food/recipe.dart';
import 'package:smart_grocery/models/recipe_tile.dart';
import 'package:smart_grocery/pages/recipe_details_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  String searchRecipe = "" ;

  late Future<List<Map<String, dynamic>>>  listOfRecipies;

  DatabaseHelper _dbHelper = DatabaseHelper.instance;

  List <Recipe> recipes = [] ; 

  Future<void> initDatabase() async {
    List <Recipe>  tempRecipes = await _dbHelper.getAllRecipes();
    setState(() {
      recipes = tempRecipes;
    });
    print('Recipes form recipes page: ${recipes.length}');
  }

  List<Map<dynamic, dynamic>> recipeData = [
    {
        "Recipe_title": "A Vegetarian\u2019s Dream Sweet Potato Dinner",
        "instructions": [
            "Preheat oven to 400\u00b0F. Toss potatoes",
            "1 Tbsp. oil",
            "1/2 tsp. salt",
            "and 1/2 tsp. pepper on a rimmed baking sheet. Arrange potatoes cut side down in an even layer and roast until beginning to soften and golden brown on the cut sides",
            "15\u201320 minutes.\nWhile potatoes roast",
            "cook lentils in a medium pot of simmering salted water until lentils are tender but still retain their shape",
            "15\u201320 minutes. Drain and transfer to a medium bowl.\nToss mushrooms",
            "1 Tbsp. oil",
            "and 1/2 tsp. pepper in another medium bowl. Arrange around potatoes on hot baking sheet and continue to roast until mushrooms are browned and crisped and potatoes are well browned on cut sides",
            "12\u201315 minutes.\nMeanwhile",
            "pulse feta",
            "tahini",
            "garlic",
            "2 Tbsp. lemon juice",
            "half of the dill",
            "3 Tbsp. oil",
            "and 1/4 cup water in a food processor until a smooth sauce forms. Add more water",
            "1 Tbsp. at a time",
            "and pulse to combine until sauce is just thin enough to pour.\nAdd scallions and remaining dill",
            "2 Tbsp. oil",
            "2 Tbsp. lemon juice",
            "1/2 tsp. salt",
            "and 1/4 tsp. pepper to bowl with lentils and stir to combine. Stir in roasted mushrooms.\nDivide feta sauce among plates. Top with potato halves. Spoon lentil salad over and drizzle with oil."
        ],
        "ingredients": [
            "6 small sweet potatoes (garnet yams)",
            "halved lengthwise",
            "7 Tbsp. extra-virgin olive oil",
            "divided",
            "plus more for drizzling",
            "1 tsp. kosher salt",
            "divided",
            "plus more",
            "1 1/4 tsp. freshly ground black pepper",
            "divided",
            "1/2 cup black or green lentils",
            "1/2 lb. maitake mushrooms",
            "trimmed",
            "torn into pieces",
            "6 oz. feta",
            "crumbled (about 1 cup)",
            "1/4 cup tahini",
            "1 small garlic clove",
            "crushed",
            "1/4 cup fresh lemon juice",
            "divided",
            "1 bunch dill",
            "coarsely chopped (about 1 1/2 cups)",
            "divided",
            "2 scallions",
            "finely chopped"
        ],
        "recipe_id": 1
    },
    {
        "Recipe_title": "Ackee Tacos with Island Guacamole",
        "instructions": [
            "Dice or mash the avocado depending on your preference; it can have a more salsa-like texture if preferred. Add the remaining guacamole ingredients",
            "gently stirring to combine. Refrigerate until you are ready to assemble the tacos.\nHeat the oil in a saut\u00e9 pan over medium-high heat. Add the onion",
            "tomato",
            "garlic",
            "bell pepper",
            "Scotch bonnet pepper",
            "and scallion",
            "and cook until the ingredients are soft",
            "about 3 minutes. Add the ackee",
            "thyme",
            "chili powder",
            "salt",
            "and pepper",
            "gently folding the ingredients together. Cook for 5 to 8 minutes or until the mixture is heated through; remove from heat.\nServe assembly-line style",
            "with the ackee mixture",
            "guacamole",
            "grated cheese",
            "shredded lettuce or cabbage",
            "cilantro",
            "salsa",
            "and sour cream (if using) in colorful bowls next to a basket of soft or hard taco shells. Alternately",
            "serve a large platter of already assembled tacos: fill each shell with a few tablespoons of ackee",
            "layer with lettuce",
            "guacamole",
            "and cheese",
            "and top with a mound of fresh cilantro for a mouthful of exotic flavor. Serve with salsa and/or sour cream if you wish."
        ],
        "ingredients": [
            "3 medium avocados",
            "peeled",
            "pitted",
            "and sliced",
            "1 to 2 plum tomatoes",
            "seeded and diced",
            "3 tablespoons diced red onion",
            "1/2 cup diced pineapple or mango",
            "1 tablespoon lime juice",
            "1 tablespoon orange juice",
            "1 teaspoon orange zest",
            "1 teaspoon minced Scotch bonnet pepper",
            "2 tablespoons olive oil",
            "3 to 4 tablespoons chopped cilantro",
            "Salt and freshly cracked black pepper to taste",
            "2 to 3 tablespoons coconut oil or other vegetable oil",
            "1 small yellow onion",
            "diced",
            "1 plum tomato",
            "diced",
            "2 cloves garlic",
            "diced",
            "4 tablespoons diced bell pepper",
            "1/4 teaspoon seeded and minced Scotch bonnet pepper",
            "1 stalk scallion",
            "2 dozen frozen ackee or 2 cans ackee",
            "drained (or 2 cups ackee",
            "cooked from fresh)",
            "1 teaspoon thyme leaves",
            "1/2 teaspoon chili powder",
            "Salt and freshly cracked black pepper to taste",
            "12 taco shells (either soft or crunchy)",
            "2/3 cup grated sharp cheddar cheese",
            "1 cup shredded lettuce or purple cabbage",
            "1 large handful chopped fresh cilantro",
            "Salsa (optional)",
            "Sour cream (optional)"
        ],
        "recipe_id": 2
    },
    {
        "Recipe_title": "Agua de Lim\u00f3n con Ch\u00eda (Limeade With Chia Seeds)",
        "instructions": [
            "Put the limes",
            "water",
            "and sugar in a blender and pulse 3 to 4 times",
            "just enough to extract the juice from the limes but not crush the skins (which would make the drink too bitter). Strain through a fi ne-mesh sieve into a pitcher. Taste and add more sugar if you like.\nWhisk in the chia seeds and refrigerate for at least 30 minutes",
            "until completely chilled. Stir before serving",
            "then serve over ice."
        ],
        "ingredients": [
            "3 large limes",
            "quartered",
            "4 cups water",
            "1/2 cup sugar",
            "or more if needed",
            "1/4 cup chia seeds"
        ],
        "recipe_id": 3
    },
    {
        "Recipe_title": "Aguas Frescas (Mexican Fruit Coolers)",
        "instructions": [
            "Stir the sugar and water together in a large pitcher until the sugar dissolves. Measure out 1 cup. Puree the fruit and the 1 cup sugar water in a blender. Pour the mixture through a fine-mesh strainer back into the pitcher with the sugar water",
            "mashing with a whisk or wooden spoon to eliminate any pulp.\nTaste and add more sugar",
            "if desired. Serve over ice",
            "with a lemon or lime wedge",
            "if desired."
        ],
        "ingredients": [
            "\u00bd cup sugar",
            "4 cups water",
            "4 cups chopped fruit (watermelon",
            "cantaloupe",
            "pineapple",
            "papaya",
            "strawberries",
            "oranges",
            "peaches",
            "mangoes",
            "or any combination)",
            "Ice cubes",
            "Lemon or lime wedges (optional)"
        ],
        "recipe_id": 4
    },
    {
        "Recipe_title": "Alfajores With Coconut Dulce de Leche",
        "instructions": [
            "Place a rack in middle of oven; preheat to 375\u00b0F. Bring condensed milk",
            "coconut milk",
            "and \u00bd tsp. salt to a boil in a small saucepan over medium-high heat. Scrape mixture into a 13x9\" baking dish and bake",
            "stirring every 15 minutes or so",
            "until very thick and a light caramel color",
            "40\u201350 minutes. Mixture will look lumpy",
            "broken",
            "and very pasty\u2014that\u2019s exactly what you want. Let cool in dish 1 hour",
            "then transfer to a food processor and process until smooth. Set dulce de leche aside for serving.\nMeanwhile",
            "whisk almond flour and 2\u00bc cups all-purpose flour in a medium bowl to combine. Using an electric mixer on medium-high speed",
            "beat butter",
            "sugar",
            "and 1\u00bd tsp. salt in a large bowl",
            "scraping down sides and bottom of bowl as needed",
            "until pale and creamy",
            "about 3 minutes. Add egg yolk",
            "vanilla",
            "and \u00bc cup honey and beat until combined",
            "about 2 minutes. Reduce speed to low",
            "add dry ingredients",
            "and mix",
            "scraping down sides and bottom of bowl",
            "until incorporated. Divide dough in half and pat each piece into a 1\"-thick disk. Wrap in plastic and chill until firm",
            "at least 2 hours.\nPreheat oven to 350\u00b0F. Roll out 1 disk of dough on a lightly floured sheet of parchment paper",
            "dusting with more flour as needed to keep dough from sticking",
            "to about \u215b\" thick. Punch out shapes with lightly floured cookie cutters and transfer to 2 parchment-lined baking sheets",
            "spacing 1\" apart. Pat scraps into a 1\"-thick disk",
            "wrap with plastic",
            "and chill 10 minutes if soft.\nBake a sheet of cookies",
            "rotating halfway through",
            "until edges are lightly browned",
            "7\u20139 minutes. Let cool 10 minutes on baking sheet",
            "then transfer to a wire rack and let cool completely. Bake remaining sheet of cookies. Line baking sheets with fresh sheets of parchment paper and repeat process with remaining disk of dough.\nDivide coconut evenly among 3 bowls. Add 1 Tbsp. food-coloring powder (sift if needed) to a bowl of coconut and toss until coconut is coated; add more powder if a more intense color is desired. Repeat with remaining food-coloring powder and another bowl of coconut. Leave 1 bowl of coconut white. If using",
            "add some luster dust to all 3 bowls and toss to combine.\nTurn half of the cookies over to expose flat side; spread 1 tsp. dulce de leche over (this will be the inside of the sandwiches); set aside.\nHeat remaining 2 Tbsp. honey in a small bowl in the microwave just until warm (you want it to be loose)",
            "then stir in 2 tsp. warm water. Working one at a time",
            "lightly brush honey over the top of remaining cookies (the ones that have not been filled with dulce de leche). Immediately dip tops into a bowl of coconut; press additional coconut onto cookie to cover any bald spots. Close up cookie sandwiches",
            "coconut side up.\nDo Ahead: Dulce de leche can be made 1 month ahead; place in an airtight container and freeze. Thaw in refrigerator overnight before using. Dough can be made 3 days ahead; keep chilled. Cookies can be baked (but not assembled) 2 days ahead; store airtight at room temperature."
        ],
        "ingredients": [
            "1 (14-oz.) can sweetened condensed milk",
            "1 (13.5-oz.) can unsweetened coconut milk",
            "2 tsp. kosher salt",
            "divided",
            "\u00bd cup (50 g) almond flour or meal",
            "2\u00bc cups (288 g) all-purpose flour",
            "plus more for dusting",
            "1 cup (2 sticks) unsalted butter",
            "room temperature",
            "\u2153 cup (133 g) granulated sugar",
            "1 large egg yolk",
            "1 tsp. vanilla extract",
            "\u00bc cup plus 2 Tbsp. honey",
            "1\u00bd cups (125 g) unsweetened shredded coconut",
            "1 Tbsp. (or more) any color plant-based food-coloring powder",
            "1 Tbsp. (or more) second color plant-based food-coloring powder",
            "Luster dust (optional)",
            "Special Equipment: Assorted (2\" or smaller) cookie cutters"
        ],
        "recipe_id": 5
    },
    {
        "Recipe_title": "All Day Every Day Sauce",
        "instructions": [
            "Mix yogurt",
            "lemon juice",
            "and salt in a small bowl to combine. Cover and chill until ready to use."
        ],
        "ingredients": [
            "1 1/2 cups plain whole-milk Greek yogurt",
            "1 Tbsp. fresh lemon juice",
            "1 tsp. kosher salt"
        ],
        "recipe_id": 6
    },
    {
        "Recipe_title": "All-The-Seeds Hamantaschen",
        "instructions": [
            "Whisk baking powder",
            "salt",
            "and 1\u00bd cups (188 g) flour in a medium bowl to combine. Set aside. Beat butter",
            "cream cheese",
            "and sugar in the bowl of a stand mixer fitted with the paddle attachment on medium-high until pale and fluffy",
            "about 5 minutes. Add egg and orange zest and beat",
            "scraping down sides of bowl as needed",
            "just until combined. Reduce speed to low and with motor running",
            "gradually add dry ingredients. Beat until dough comes together and no streaks of dry flour remain.\nDivide dough in half and place each half on a piece of beeswax or plastic wrap. Pat into a 1\"-thick disk. Wrap tightly and chill until firm",
            "at least 2 hours and up to 12 hours.\nPreheat oven to 325\u00b0F. Mix pumpkin seeds",
            "sunflower seeds",
            "\u00bc cup poppy seeds",
            "and \u00bc cup sesame seeds in a medium heatproof bowl. Heat honey in a small saucepan over medium",
            "stirring occasionally with a heatproof rubber spatula",
            "until it bubbles and foams and turns dark amber (an instant read thermometer should register 300\u00b0F)",
            "about 5 minutes. Remove from heat and stir in tahini and \u00be tsp. salt. Pour over seeds and stir to coat. Let cool slightly (you want the mixture to be as hot as possible since it hardens as it cools",
            "but not so hot you could burn your hands). Working quickly",
            "scoop out heaping teaspoonfuls of filling and roll into 24 balls.\nRoll out dough on a lightly floured surface to a scant \u00bc\" thick. Punch out cookies with cutter. Transfer to 2 parchment-lined baking sheets. (You should ideally have 12 cookies per baking sheet.) They won\u2019t spread",
            "so don\u2019t worry about getting them close. Gather up and reroll any scraps.\nBeat egg with 1 Tbsp. water and a pinch of salt in a small bowl. Working one at a time",
            "brush rounds with egg wash and place a ball of filling in the center. Fold sides of dough up to make a triangle",
            "pinching corners to seal. Brush sides of dough with egg wash and sprinkle with more sesame seeds and poppy seeds.\nBake hamantaschen",
            "rotating pans top to bottom and front to back halfway through",
            "until crust is golden brown and filling is puffed",
            "18\u201322 minutes. Let cool on baking sheets.\nDo ahead: Cookies can be baked 3 days ahead. Store airtight at room temperature."
        ],
        "ingredients": [
            "\u00be tsp. baking powder",
            "\u00bd tsp. kosher salt",
            "1\u00bd cups (188 g) all-purpose flour",
            "plus more for dusting",
            "\u00bd cup (1 stick) unsalted butter",
            "room temperature",
            "2 oz. cream cheese",
            "room temperature",
            "\u00bd cup (100 g) sugar",
            "1 large egg",
            "1 tsp. finely grated orange zest",
            "\u00bc cup (36 g) raw pumpkin seeds (pepitas)",
            "\u00bc cup (34 g) raw sunflower seeds",
            "\u00bc cup (39 g) poppy seeds",
            "plus more for sprinkling",
            "\u00bc cup (34 g) sesame seeds",
            "plus more for sprinkling",
            "\u00bd cup honey",
            "2 Tbsp. tahini",
            "\u00be tsp. kosher salt",
            "plus more",
            "1 large egg",
            "A 3\"-diameter cookie cutter"
        ],
        "recipe_id": 7
    },
    {
        "Recipe_title": "Allies Cocktail",
        "instructions": [
            "Combine the ingredients in a mixing glass filled with ice and stir until chilled",
            "about 30 seconds. Strain into a chilled cocktail glass."
        ],
        "ingredients": [
            "1 ounce dry gin",
            "1 ounce dry vermouth",
            "2 dashes k\u00fcmmel"
        ],
        "recipe_id": 8
    },
  ];
  

  @override
  void initState () {
    super.initState();
    initDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MySearchDelegate(recipes));
                },
                icon: Icon(Icons.search))
      ]),
      body:  getRecipelist(),
    );
  }

  Widget getRecipelist(){
    if (recipes.isEmpty)
      return Center(
        child: CircularProgressIndicator(), // The loading indicator
      ); 
    return ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            if (recipes[index].isFavorite == 1)
            return RecipeTile(
              recipeName: recipes[index].toMap()["Recipe_title"],
                recipeImage: recipes[index].toMap()["image_path"],
              // recipeName: recipeData[index].toMap()["Recipe_title"],
              onTap: ()  {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return RecipeDetailPage(
                    title: recipes[index].toMap()["Recipe_title"], 
                    instruction: recipes[index].toMap()["instructions"], 
                    ingredient: recipes[index].toMap()["ingredients"]
                  );
                }));
              },
              onPressed: () {
                // TODO add logic for add to favours and modify the data base
                // todo update database 
                _dbHelper.toggleFavoriteStatus(recipes[index].recipe_id!, 0); 
                // todo update local variable using setStatea
                initDatabase();
              },
            );
          }, 
        );
  }

}


class MySearchDelegate extends SearchDelegate {
  List<Recipe> recipes;
  List<Map<String, dynamic>> recipesResults = [];
  MySearchDelegate(this.recipes);
  // MySearchDelegate({required this.})
  static List<String> _previousSearchKeywords = [];

  List<Map<String, dynamic>> listOfMaps = []; 

  // void getSearch () (
  //   for(var recipeObj in recipes){
  //     listOfMap.a
  //   }
  // //   recipesResults = recipes.where((map) {
  // //   // Assuming you want a case-insensitive search
  // //   String name = map['name']?.toLowerCase() ?? '';
  // //   return name.contains(query.toLowerCase());
  // // }).toList();
  // )

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty)
              close(context, null);
            else
              query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: Return a list view that contains all the recipes matching the result
    // TODO: use the same class used to build the recommendation page which is a list
    // TODO: of cards i.e. listview
    if (!_previousSearchKeywords.contains(query))
      _previousSearchKeywords.add(query);
    return ListView.builder(
      itemCount: recipesResults.length,
      itemBuilder: (context, index) {
        return RecipeTile(
              recipeName: recipesResults[index]["Recipe_title"],
            recipeImage: recipes[index].toMap()["image_path"],
              // recipeName: recipeData[index].toMap()["Recipe_title"],
              onTap: ()  {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return RecipeDetailPage(
                    title: recipesResults[index]["Recipe_title"], 
                    instruction: recipesResults[index]["instructions"], 
                    ingredient: recipesResults[index]["ingredients"]
                  );
                }));
              },
              onPressed: () {},
            );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = _previousSearchKeywords.where((element) {
      final result = element.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    if (suggestions.length == 0 && query.length == 0)
      suggestions = _previousSearchKeywords ;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context) ;
          },
        ); // ListTile
      },
    ); // ListView.builder I
  }

  void doSearch () {
    for (var r in recipes){
      listOfMaps.add(r.toMap()); 
    }

    recipesResults = listOfMaps.where((map) {
      String name = map['Recipe_title']?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList() ;
    
  }
}
