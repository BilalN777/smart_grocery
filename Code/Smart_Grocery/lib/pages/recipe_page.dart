import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  String searchRecipe = "" ;
  @override
  Widget build(BuildContext context) {
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
                      controller.openView();

                    },
                    onChanged: (String s) {
                      controller.openView();
                      setState(() {
                        searchRecipe = s ;
                      });
                    },
                    onSubmitted: (String s) {
                      controller.closeView(s);

                      setState(() {
                        searchRecipe = s ;
                        controller.closeView(s);
                      });
                    },
                    leading: const Icon(Icons.search),
                  );
                },
                suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'recent search ${index+1}';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                      searchRecipe = item ;
                    });
                  },
                );
              });
              }
            ),
          ),
          Text(searchRecipe),
          ListView(
            children: [
              Card(
                child: ListTile(
                  title :Text(""),
                  leading: Icon(Icons.restaurant_rounded),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
