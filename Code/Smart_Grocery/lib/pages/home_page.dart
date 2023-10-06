import 'package:flutter/material.dart';
import 'package:smart_grocery/pages/recipe_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: null,
        backgroundColor: Colors.deepPurple,
        title: const Text('Smart Grocery'),
      ),
      body: <Widget>[
        RecipePage(),
        pageTwo(),
        pageThree(),
        pageFour(),
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
                'Drawer Header',
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
                Navigator.pop(context);
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
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          NavigationDestination(
            icon: Icon(Icons.camera_alt),
            label: 'Scan',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }

  Container pageThree() {
    return Container(
      color: Colors.blue[200],
      alignment: Alignment.center,
      child: const Text('Page 3'),
    );
  }

  Container pageTwo() {
    return Container(
      color: Colors.green[200],
      alignment: Alignment.center,
      child: const Text('Page 2'),
    );
  }

  Container pageOne() {
    String searchKey = "page1" ;
    return Container(
      color: Colors.red[200],
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () {
                  // controller.openView();

                },
                onChanged: (String s) {
                  // controller.openView();
                  setState(() {

                  });
                },
                leading: const Icon(Icons.search),
              );
            }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            }),
          ),
           Text(searchKey),
        ],
      ),
    );
  }

  Container pageFour() {
    return Container(
      color: Colors.yellow[200],
      alignment: Alignment.center,
      child: const Text('Page 4'),
    );
  }
}
