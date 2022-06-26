import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungryman/modles/food_categories_modle.dart';
import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  //pizza
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  FoodCategoriesModle pizzaCategoriesModle;

  Future<void> getPizzaCategoriesList() async {
    List<FoodCategoriesModle> newPizzaCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('Hlaoh8kl1tI3IQV883mG')
        .collection('pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaCategoriesModle = FoodCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
      );
      newPizzaCategoriesList.add(pizzaCategoriesModle);
      pizzaCategoriesList = newPizzaCategoriesList;
    });
  }

  get throwPizzaCategoriesList {
    return pizzaCategoriesList;
  }

//burger

  List<FoodCategoriesModle> burgerCategoriesList = [];
  FoodCategoriesModle burgerCategoriesModle;
  Future<void> getBurgerCategoriesList() async {
    List<FoodCategoriesModle> newBurgerCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('Hlaoh8kl1tI3IQV883mG')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerCategoriesModle = FoodCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
      );
      newBurgerCategoriesList.add(burgerCategoriesModle);
      burgerCategoriesList = newBurgerCategoriesList;
    });
  }

  get throwBurgerCategoriesList {
    return burgerCategoriesList;
  }

//bbq
  List<FoodCategoriesModle> bbqCategoriesList = [];
  FoodCategoriesModle bbqCategoriesModle;
  Future<void> getBbqCategoriesList() async {
    List<FoodCategoriesModle> newBbqCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('Hlaoh8kl1tI3IQV883mG')
        .collection('bbq')
        .get();
    querySnapshot.docs.forEach((element) {
      bbqCategoriesModle = FoodCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
      );
      newBbqCategoriesList.add(bbqCategoriesModle);
      bbqCategoriesList = newBbqCategoriesList;
    });
  }

  get throwBbqCategoriesList {
    return bbqCategoriesList;
  }

//sandwich
  List<FoodCategoriesModle> sandwichCategoriesList = [];
  FoodCategoriesModle sandwichCategoriesModle;
  Future<void> getSandwichCategoriesList() async {
    List<FoodCategoriesModle> newSandwichCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('Hlaoh8kl1tI3IQV883mG')
        .collection('sandwich')
        .get();
    querySnapshot.docs.forEach((element) {
      sandwichCategoriesModle = FoodCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
      );
      newSandwichCategoriesList.add(sandwichCategoriesModle);
      sandwichCategoriesList = newSandwichCategoriesList;
    });
  }

  get throwSandwichCategoriesList {
    return sandwichCategoriesList;
  }

//icecream
  List<FoodCategoriesModle> icecreamCategoriesList = [];
  FoodCategoriesModle icecreamCategoriesModle;
  Future<void> getIcecreamCategoriesList() async {
    List<FoodCategoriesModle> newIcecreamCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('Hlaoh8kl1tI3IQV883mG')
        .collection('icecream')
        .get();
    querySnapshot.docs.forEach((element) {
      icecreamCategoriesModle = FoodCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
      );
      newIcecreamCategoriesList.add(icecreamCategoriesModle);
      icecreamCategoriesList = newIcecreamCategoriesList;
    });
  }

  get throwIcecreamCategoriesList {
    return icecreamCategoriesList;
  }

  //coffee

  List<FoodCategoriesModle> coffeeCategoriesList = [];
  FoodCategoriesModle coffeeCategoriesModle;
  Future<void> getCoffeeCategoriesList() async {
    List<FoodCategoriesModle> newCoffeeCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('Hlaoh8kl1tI3IQV883mG')
        .collection('coffee')
        .get();
    querySnapshot.docs.forEach((element) {
      coffeeCategoriesModle = FoodCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
      );
      newCoffeeCategoriesList.add(coffeeCategoriesModle);
      coffeeCategoriesList = newCoffeeCategoriesList;
    });
  }

  get throwCoffeeCategoriesList {
    return coffeeCategoriesList;
  }

  // juice

  List<FoodCategoriesModle> juiceCategoriesList = [];
  FoodCategoriesModle juiceCategoriesModle;
  Future<void> getJuiceCategoriesList() async {
    List<FoodCategoriesModle> newJuiceCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('Hlaoh8kl1tI3IQV883mG')
        .collection('juices')
        .get();
    querySnapshot.docs.forEach((element) {
      juiceCategoriesModle = FoodCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
      );
      newJuiceCategoriesList.add(juiceCategoriesModle);
      juiceCategoriesList = newJuiceCategoriesList;
    });
  }

  get throwJuiceCategoriesList {
    return juiceCategoriesList;
  }
  //dessert

  List<FoodCategoriesModle> dessertCategoriesList = [];
  FoodCategoriesModle dessertCategoriesModle;
  Future<void> getDessertCategoriesList() async {
    List<FoodCategoriesModle> newDessertCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('Hlaoh8kl1tI3IQV883mG')
        .collection('dessert')
        .get();
    querySnapshot.docs.forEach((element) {
      dessertCategoriesModle = FoodCategoriesModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
      );
      newDessertCategoriesList.add(dessertCategoriesModle);
      dessertCategoriesList = newDessertCategoriesList;
    });
  }

  get throwDessertCategoriesList {
    return dessertCategoriesList;
  }

// home card

  List<ItemModle> homeList = [];
  ItemModle homeModle;

  Future<void> getHomeList() async {
    List<ItemModle> newHomeList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('card').get();
    querySnapshot.docs.forEach((element) {
      homeModle = ItemModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
        des: element.data()['descript'],
      );
      newHomeList.add(homeModle);
      homeList = newHomeList;
    });
  }

  get throwHomeList {
    return homeList;
  }
}
