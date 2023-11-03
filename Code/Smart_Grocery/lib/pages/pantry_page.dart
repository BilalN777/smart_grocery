import 'package:flutter/material.dart';
import 'package:smart_grocery/models/ingredients_tile.dart';

class PantryPage extends StatefulWidget {
  const PantryPage({super.key});



  @override
  State<PantryPage> createState() => _PantryPageState();
}

class _PantryPageState extends State<PantryPage> {

  static List<String>userPantry = [] ;

  late TextEditingController tController ;

  @override
  void initState() {
    super.initState();
    tController = TextEditingController();
  }

  @override
  void dispose() {
    tController.dispose();
    super.dispose();
  }

  void deleteIngredentFromPantry () {
    
  }


  @override
  Widget build(BuildContext context) {
    if (userPantry.length == 0)
      return Scaffold(
        appBar: AppBar(
          title: Text("Pantry"),
          actions: [
            IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => IngredientsAddPage()));
            }, icon: Icon(Icons.add))


          ],
        ),
        body : Container(
          // color: Colors.green[200],
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Tap the "Plus Icon" on the top right or Add button below to add ingredients to your pantry.',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => IngredientsAddPage()));
              } , child: Text("Add"))
            ],
          ),
        ),
      );

    userPantry.sort();
    ListView myList = ListView.builder(
      itemCount: userPantry.length,
      itemBuilder: (context, index) {
        // final ingredient = userPantry[index];
        // todo: code to check if the count is not 1 for data base
        return IngredientTile(
          name: userPantry[index], 
          cost: 0.0, 
          deleteIngrident: () => setState(() {
            userPantry.removeAt(index); 
          })
        );
      },
    );



    return Scaffold(
      appBar: AppBar(
        title: Text('Pantry'),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => IngredientsAddPage()));
          }, icon: Icon(Icons.add))
        ],
      ),
      body:myList,
    );
  }

  IngredientsAddPage(){
    String newIngredient = "" ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Ingredient"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 8.0, right: 8.0)
                ),
                autofocus: true,
                controller: tController,
                onChanged: (text) {
                  newIngredient = text;
                },
                onSubmitted: (text) {
                  if (text.isNotEmpty){
                    setState(() {
                      userPantry.add(newIngredient);
                    });
                    tController.clear() ; 
                    Navigator.pop(context);
                  }
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                if (newIngredient.isNotEmpty)
                  setState(() {
                    userPantry.add(newIngredient);
                  });
                tController.clear(); 
                Navigator.pop(context);
              }, child: Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
}
