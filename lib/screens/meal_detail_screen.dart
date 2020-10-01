import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MealDetailScreen extends StatefulWidget with ChangeNotifier {
  static const routeName = '/mealDetail';

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  bool isFavorit = false;
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final title = arguments['title'];
    final image = arguments['image'];
    final List ingredients = arguments['ingredient'];
    final List steps = arguments['steps'];
    final mealId = arguments['id'];
    final deviceSize = MediaQuery.of(context).size;
    print(mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
          child: isFavorit ? Icon(Icons.star) : Icon(Icons.star_border),
          onPressed: () {
            setState(() {
              isFavorit = !isFavorit;
              if (isFavorit == true) {}
            });
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 200,
                width: deviceSize.width,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              'Ingredient',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 170,
              width: 300,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(15)),
              child: ListView.builder(
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 30,
                      padding: EdgeInsets.only(top: 7, left: 10),
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.amber,
                      child: Text(ingredients[index]),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'steps',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),

            //elevation: 10,
            Container(
              height: 190,
              width: 300,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black26),
                  color: Colors.white),
              child: ListView.builder(
                  itemCount: steps.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text('#${index + 1}'),
                                backgroundColor: Colors.purple,
                              ),
                              title: Text(steps[index]),
                            )),
                        SizedBox(
                          child: Divider(),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
