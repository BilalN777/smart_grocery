
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:smart_grocery/databaseHelper.dart';
import 'package:smart_grocery/models/recipe_tile.dart';

class GetRecipes {
  late DatabaseHelper dbHelper;
  late Future<List<Map<String, dynamic>>> listOfRecipies;
  late BuildContext context;

  GetRecipes(BuildContext context) {
    dbHelper = DatabaseHelper.instance;
    dbHelper.loadRecipesFromJSON();
    listOfRecipies = dbHelper.queryAllRecipes();
    this.context = context;
  }

  // Future<void> _readfiles() async {
  //   var file = File('assets/data/consolidated_data.csv');
  //
  //   if (await file.exists()) {
  //   // Read the file as a single string
  //   var contents = await file.readAsString();
  //
  //   // Parse the CSV string
  //   var rows = CsvToListConverter().convert(contents);
  //
  //   // Create a Map to store the title and instruction
  //   Map<String, String> recipeMap = {};
  //
  //   // Skipping the first line (headers)
  //   for (var i = 1; i < rows.length; i++) {
  //   var row = rows[i];
  //   recipeMap[row[0]] = row[1];
  //   }
  // }

  Future<List<List<dynamic>>> processCsv() async {
    var result = await DefaultAssetBundle.of(context).loadString(
      "assets/data/test.csv",
    );
    return const CsvToListConverter().convert(result, eol: "\n");
  }

  List<ListTile> getListTiles(BuildContext context)  {

    List<ListTile> l = [];
    l.add(ListTile(
      leading: Icon(Icons.restaurant_rounded),
      title: Text('A Vegetarian’s Dream Sweet Potato Dinner'),
      subtitle: Text('6 small sweet potatoes (garnet yams),'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const rInfo(t:'A Vegetarian’s Dream Sweet Potato Dinner', inst: 'instructions',ing: '6 small sweet potatoes (garnet yams), halved lengthwise, 7 Tbsp. extra-virgin olive oil, divided, plus more for drizzling, 1 tsp. kosher salt, divided, plus more, 1 1/4 tsp. freshly ground black pepper, divided, 1/2 cup black or green lentils, 1/2 lb. maitake mushrooms, trimmed, torn into pieces, 6 oz. feta, crumbled (about 1 cup), 1/4 cup tahini, 1 small garlic clove, crushed, 1/4 cup fresh lemon juice, divided, 1 bunch dill, coarsely chopped (about 1 1/2 cups), divided, 2 scallions, finely chopped',)));
      },
    ));
    l.add(ListTile(
      leading: Icon(Icons.restaurant_rounded),
      title: Text('Big Beans and Tomato Vinaigrette'),
      subtitle: Text('Handful of oregano sprigs,'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const rInfo(t:'Recipe', inst: 'instructions',ing: 'Handful of oregano sprigs, Handful of thyme sprigs, 2 bay leaves, 8 oz. dried butter beans, rinsed, soaked overnight if possible, 1 medium onion, halved, 1 large carrot, scrubbed, coarsely chopped, Kosher salt, 1/4 cup extra-virgin olive oil, 10 oz. cherry tomatoes or 1 1/2 cups chopped heirloom or beefsteak tomatoes, 1 garlic clove, smashed, 3 Tbsp. red wine vinegar, 1/3 cup extra-virgin olive oil, plus more for drizzling, Kosher salt, 2 lb. assorted heirloom, beefsteak and/or cherry tomatoes, Freshly ground black pepper, Handful of basil leaves, Mild red pepper flakes (such as Aleppo-style or Maras)',)));
      },
    ));
    l.add(ListTile(
      leading: Icon(Icons.restaurant_rounded),
      title: Text('CBD Caramel Sauce'),
      subtitle: Text('1 cup sugar, 1/2 cup heavy cream,'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const rInfo(t:'CBD Caramel Sauce', inst: 'instructions',ing: '1 cup sugar, 1/2 cup heavy cream, 3 Tbsp. unsalted butter, cut into pieces, 1 tsp. vanilla extract, 1/2 tsp. kosher salt, 180 mg CBD oil',)));
      },
    ));
    l.add(ListTile(
      leading: Icon(Icons.restaurant_rounded),
      title: Text('Honey-Glazed Pepper Chicken'),
      subtitle: Text('2 Tbsp. black peppercorns, 4 Tbsp. pink peppercorns'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const rInfo(t:'Honey-Glazed Pepper Chicken', inst: 'instructions',ing: '2 Tbsp. black peppercorns, 4 Tbsp. pink peppercorns, divided, 6 tsp. Diamond Crystal or 3Â¼ tsp. Morton kosher salt, divided, 1 (3Â½â€“4-lb.) whole chicken, 1 Tbsp. vegetable oil, plus more for grill, 2 medium Fresno chiles, thinly sliced, Â½ cup fermented garlic honey, honey, or pure maple syrup, 3 Tbsp. Champagne vinegar or white wine vinegar, Special Equipment: A spice mill or mortar and pestle',)));
      },
    ));
    l.add(ListTile(
      leading: Icon(Icons.restaurant_rounded),
      title: Text('Tomato Pie With Sour Cream Crust'),
      subtitle: Text('2 cups all-purpose flour, plus a little extra for dusting,'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const rInfo(t:'Tomato Pie With Sour Cream Crust', inst: 'instructions',ing: '2 cups all-purpose flour, plus a little extra for dusting, Â½ teaspoon salt, 2 teaspoons dried parsley, 13 tablespoons (1 stick plus 5 tablespoons) cold unsalted butter, diced, 6 tablespoons sour cream or plain full-fat yogurt, 1 tablespoon white wine vinegar, Â¼ cup ice water, 2 tablespoons cooking fat, 1 large onion, thinly sliced, 2Â¼ pounds mixed heirloom tomatoes (mix of full size and cherries), Â¾ cup hard salty cheese, such as Manchego or Parmesan, Â¾ cup shredded mozzarella cheese, Â¼ cup mayonnaise, 3 tablespoons chopped basil leaves, 3 tablespoons chopped parsley, 1 teaspoon chopped thyme, Salt and freshly ground black pepper, 1 egg, beaten, 1 tablespoon milk, cream, or water',)));
      },
    ));
    l.add(ListTile(
      leading: Icon(Icons.restaurant_rounded),
      title: Text('Skillet-Charred Summer Beans with Miso Butter'),
      subtitle: Text('2 Tbsp. vegetable or other neutral oil, '),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const rInfo(t:'Skillet-Charred Summer Beans with Miso Butter', inst: 'instructions',ing: '3 lb. skin-on, bone-in chicken legs (thigh and drumstick) or a mix of thighs and drumsticks, Kosher salt, 2 Tbsp. vegetable or other neutral oil, 1 medium onion, finely chopped, 4 garlic cloves, thinly sliced, Â½ cup dried barberries or dried tart cherries, rinsed, Â½ tsp. ground turmeric, Â¼ tsp. crushed red pepper flakes, â…“ cup white wine vinegar, 1 medium orange, halved',)));
      },
    ));
    l.add(ListTile(
      leading: Icon(Icons.restaurant_rounded),
      title: Text('Ti\' Punch'),
      subtitle: Text('1 lime, 1 bar spoon cane or simple syrup'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const rInfo(t:'Ti\' Punch', inst: 'instructions',ing: '1 lime, 1 bar spoon cane or simple syrup, 2 ounces rhum agricole blanc, preferably 50 percent ABV or above, such as Damoiseau 110 Proof Rhum Agricole Blanc',)));
      },
    ));
    l.add(ListTile(
      leading: Icon(Icons.restaurant_rounded),
      title: Text('Trail Mix Cookies'),
      subtitle: Text('1Â½ cups assorted raw nuts and seeds,'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const rInfo(t:'Trail Mix Cookies', inst: 'instructions',ing: '1Â½ cups assorted raw nuts and seeds, Â½ cup (60 g) old-fashioned oats, 1 large egg, 4 Tbsp. unsalted butter, melted, Â¼ cup (packed; 50 g) dark brown sugar, 2 Tbsp. (25 g) granulated sugar, 1Â½ tsp. vanilla extract, 1 tsp. kosher salt, Â½ tsp. baking soda, Â¾ cup assorted dried fruit (cut into Â½" pieces if large), Â¾ cup chopped bittersweetchocolate bars or chips or disks, Â½ cup (63 g) all-purpose flour, Flaky sea salt',)));
      },
    ));



    return l;
  }
}

class rInfo extends StatelessWidget {
  final String t, inst , ing;
  const rInfo({super.key,required this.t, required this.inst, required this.ing});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text(t),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text(ing),
            SizedBox(height: 19),
            Text(inst)
          ],
        ),
      ),
    );
  }
}

