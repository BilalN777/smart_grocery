import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_grocery/pages/pantry_page.dart';
import 'package:smart_grocery/pages/recipe_page.dart';
import 'package:smart_grocery/pages/store_page.dart';
import 'package:smart_grocery/pages/favorites_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  late Widget WidgetRecipePage;
  late Widget HistoryPage ;
  late Widget WidgetPantryPage ;
  late Widget WidgetFavoritesPage ;


  // TODO : change to get user pantry
  List<String> userPantry = ['ingredein', 'hello', 'bue'] ;

  @override
  void initState() {
    super.initState();
    WidgetRecipePage = RecipePage();
    HistoryPage = StorePage();
    WidgetPantryPage = PantryPage();
    WidgetFavoritesPage = FavoritesPage();
  }

  late Future<List<Map<String, dynamic>>> listOfRecipies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Smart Grocery'),
      ),
      body: <Widget>[
        WidgetRecipePage,
        HistoryPage,
        WidgetPantryPage,
        WidgetFavoritesPage,
      ][currentPageIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(
                'Smart Grocery',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('GOTO'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.explore),
              title: const Text('EXPLORE'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.remove_red_eye_rounded),
              title: const Text('LOOK AROUND'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Exit'),
              onTap: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Recipes',
          ),
          NavigationDestination(
            icon: Icon(Icons.store_mall_directory),
            label: 'Stores',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_circle_outline),
            label: 'Pantry',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }

}

class MySearchDelegate extends SearchDelegate {
  static List<String> _previousSearchKeywords = [];
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
    return Center(
        child: Text (
          query,
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold), // Text
        )
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
}
