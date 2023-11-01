import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_grocery/databaseHelper.dart';
import 'package:smart_grocery/pages/pantry_page.dart';
import 'package:smart_grocery/pages/recipe_page.dart';
import 'package:smart_grocery/recipe_builder.dart';

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
  late Widget FavoritesPage ;


  // TODO : change to get user pantry
  List<String> userPantry = ['ingredein', 'hello', 'bue'] ;

  @override
  void initState() {
    super.initState();
    WidgetRecipePage = RecipePage();
    HistoryPage = BuildHistoryPage();
    WidgetPantryPage = PantryPage();
    // PantryPage = BuildPantryPage();
    FavoritesPage = BuildFavouritesPage();
  }

  late Future<List<Map<String, dynamic>>> listOfRecipies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: null,
        backgroundColor: Colors.deepPurple,
        title: const Text('Smart Grocery'),
        actions: [
          if (currentPageIndex == 0)
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MySearchDelegate());
                },
                icon: Icon(Icons.search))
        ],
      ),
      body: <Widget>[
        WidgetRecipePage,
        HistoryPage,
        WidgetPantryPage,
        FavoritesPage,
      ][currentPageIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
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
                // exit(0);
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                // Navigator.pop(context);
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
            icon: Icon(Icons.history),
            label: 'History',
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

  Container BuildHistoryPage() {
    return Container(
      color: Colors.blue[200],
      alignment: Alignment.center,
      child: const Text('Page 3'),
    );
  }

  // StatelessWidget BuildPantryPage() {
  //   if (userPantry.length == 0)
  //     return Container(
  //       // color: Colors.green[200],
  //       alignment: Alignment.center,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const Text('Tap the "Plus Icon" on the top right or Add button below to add ingredients to your pantry.',
  //             style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
  //             textAlign: TextAlign.center,
  //           ),
  //           SizedBox(height: 20,),
  //           ElevatedButton(onPressed: () {} , child: Text("Add"))
  //         ],
  //       ),
  //     );
  //   return ListView.builder(
  //     itemCount: userPantry.length,
  //     itemBuilder: (context, index) {
  //       final ingredient = userPantry[index];
  //       return ListTile(
  //         title: Text(ingredient),
  //         trailing: IconButton(onPressed: () {
  //           userPantry.removeAt(index);
  //           setState(() {
  //             PantryPage = BuildPantryPage();
  //           });
  //         }, icon: Icon(Icons.delete)),
  //       ); // ListTile
  //     },
  //   );
  // }

  // Container pageOne(GetRecipes GR) {
  //   String searchKey = "page1" ;
  //   return Container(
  //     color: Colors.red[200],
  //     alignment: Alignment.center,
  //     child: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: SearchAnchor(
  //               builder: (BuildContext context, SearchController controller) {
  //             return SearchBar(
  //               controller: controller,
  //               padding: const MaterialStatePropertyAll<EdgeInsets>(
  //                   EdgeInsets.symmetric(horizontal: 16.0)),
  //               onTap: () {
  //                 // controller.openView();
  //
  //               },
  //               onChanged: (String s) {
  //                 // controller.openView();
  //                 setState(() {
  //
  //                 });
  //               },
  //               leading: const Icon(Icons.search),
  //             );
  //           }, suggestionsBuilder:
  //                   (BuildContext context, SearchController controller) {
  //             return List<ListTile>.generate(5, (int index) {
  //               final String item = 'item $index';
  //               return ListTile(
  //                 title: Text(item),
  //                 onTap: () {
  //                   setState(() {
  //                     controller.closeView(item);
  //                   });
  //                 },
  //               );
  //             });
  //           }),
  //         ),
  //          Text(searchKey),
  //        ListView(
  //          children: GR.getListTiles(),
  //        )
  //       ],
  //     ),
  //   );
  // }

  Container BuildFavouritesPage() {
    return Container(
      color: Colors.yellow[200],
      alignment: Alignment.center,
      child: const Text('Page 4'),
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
