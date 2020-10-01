import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/models/meal.dart';
import 'package:restaurant_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final item;

  String get complixityText {
    switch (item.complexity) {
      case Complexity.Simple:
        return 'simple';
        break;
      case Complexity.Hard:
        return 'hard';
        break;
      case Complexity.Challenging:
        return 'challenging';
      default:
        return 'unKnown';
    }
  }

  // ignore: missing_return
  String get affordabilityText {
    switch (item.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  MealItem({
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(item.isFavorit);
        Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: {
          'title': item.title,
          'image': item.imageUrl,
          'ingredient': item.ingredients,
          'steps': item.steps,
          'id': item.id,
          'isFavorit': item.isFavorit
        });
        // print(item.ingredients);
      },
      child: Card(
        margin: EdgeInsets.all(10),
        shadowColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: 500,
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      height: 200,
                      width: 500,
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.only(left: 15, top: 8),
                      width: 280,
                      height: 80,
                      color: Colors.black26,
                      child: Text(
                        item.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.query_builder,
                ),
                Text('${item.duration} time'),
                Icon(Icons.work),
                Text('$complixityText'),
                Icon(Icons.attach_money),
                Text('$affordabilityText')
              ],
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
