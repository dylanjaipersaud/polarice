import 'package:flutter/foundation.dart';

final Product seasonSpecial = Product.second("Cozy Winter", "Candy Cane, Eggnog, Hot Chocolate, Snickerdoodle", "assets/images/CozyWinterPopsicle.jpg");

class Product{
  String name;
  String imagePath;
  String descrip;

  Product(){
    name = "name";
    descrip = "descrip";
    imagePath = "assets/images/PolariceLogo.png";
  }

  Product.second(this.name, this.descrip, this.imagePath);

  overloader(String name, String descrip, String imagePath){
    this.name = name;
    this.descrip = descrip;
    this.imagePath = imagePath;
  }
}

class Bundles{
  static final Product basicFlavor = Product.second("Basic Flavors", 'Vanilla, Chocolate, Strawberry Banana', 'assets/images/BundleImages/BasicFlavors.jpg');
  static final Product dessertedIsland = Product.second("Desserted Island", 'Tropical Powerhouse, Strawberry Orchid, Orange Cream', 'assets/images/BundleImages/DessertedIsland.jpg');
  static final Product grandmasHouse = Product.second("Grandma's House", 'Cookies and Cream, Baker\'s Dream, Ice Cream Cake', 'assets/images/BundleImages/GrandmaHouse.jpg');
  static final Product nutHouse = Product.second("Nut House", 'Butter Pecan, PBC Dream, Pistachio', 'assets/images/BundleImages/NutHouse.jpg');
  static final Product nycSpecialFlavor = Product.second("NYC Special Flavors", 'Cops Busy Day, Strawberry Cheesecake, The Big Apple', 'assets/images/BundleImages/NYCspecial.jpg');
  static final Product seasonalFlavors = Product.second("Seasonal Flavors", 'Candy Cane, Eggnog, Hot Chocolate, Snickerdoodle', 'assets/images/BundleImages/Seasonal.jpg');

  static List<Product> toList(){
    return [basicFlavor,dessertedIsland,grandmasHouse,nutHouse,nycSpecialFlavor,seasonalFlavors];
  }
}

class Box extends Product{
  List<Product> inside;

  Box(String name, String descrip, String imagePath, var inside){
    super.overloader(name, descrip, imagePath);
    this.inside = inside;
  }
}

class Boxes{
  static final Box basicFlavor = Box("Basic Flavors", "Vanilla, Chocolate, Strawberry Banana", "assets/images/BundleImages/BasicFlavors.jpg", [vanilla, chocolate, strawberryBanana]);

  static final Product vanilla = Product.second("Vanilla", "", "assets/images/BoxImages/BasicFlavors/Vanilla.png");
  static final Product chocolate = Product.second("Chocolate", "", "assets/images/BundleImages/BasicFlavors.jpg");
  static final Product strawberryBanana = Product.second("Strawberry Banana", "", "assets/images/BoxImages/BasicFlavors/StrawberryBanana.png");
  
  //Divider

  static final Box crunchTime = Box("Crunch Time", "Butter Pecan, PBC Dream, Pistachio", "assets/images/BundleImages/NutHouse.jpg", [butterPecan, pbcDream, pistachio]);

  static final Product butterPecan = Product.second("Butter Pecan", "", "assets/images/BoxImages/CrunchTime/ButterPecan.png");
  static final Product pbcDream = Product.second("PBC Dream", "", "assets/images/BoxImages/CrunchTime/PBC.png");
  static final Product pistachio = Product.second("Pistachio", "", "assets/images/BundleImages/NutHouse.jpg");
  
  //Divider
  
  static final Box dessertedIsland = Box("Desserted Island", "Tropical Powerhouse, Strawberry Orchid, Orange Cream", "assets/images/BundleImages/DessertedIsland.jpg", [tropicalPowerhouse, strawberryOrchid, orangeCream]);

  static final Product tropicalPowerhouse = Product.second("Tropical Powerhouse", "", "assets/images/BoxImages/DessertedIsland/Tropical.png");
  static final Product strawberryOrchid = Product.second("Strawberry", "", "assets/images/BundleImages/DessertedIsland.jpg");
  static final Product orangeCream = Product.second("Orange Cream", "", "assets/images/BoxImages/DessertedIsland/OrangeCream.png");
  
  //Divider
  
  static final Box nycSpecial = Box("NYC Special", "Cops Busy Day, Strawberry Cheesecake, The Big Apple", "assets/images/BoxImages/NYCSpecial/BigAppl.png", [copBusyDay, strawberryCheesecake, bigApple]);

  static final Product copBusyDay = Product.second("Cops Busy Day", "", "assets/images/BoxImages/NYCSpecial/Cops.png");
  static final Product strawberryCheesecake = Product.second("Strawberry Cheesecake", "", "assets/images/BoxImages/NYCSpecial/Strawberry.png");
  static final Product bigApple = Product.second("The Big Apple", "", "assets/images/BoxImages/NYCSpecial/BigAppl.png");
  
  //Divider

  static final Box grandmaHouse = Box("Grandma's House", "Cookies and Cream, Baker's Dream, Ice Cream Cake", "assets/images/BoxImages/GrandmaHouse/BakerDream.png", [cookieCream, bakerDream, iceCreamCake]);

  static final Product cookieCream = Product.second("Cookies and Cream", "", "assets/images/BoxImages/GrandmaHouse/CookieCream.png");
  static final Product bakerDream = Product.second("Baker's Dream", "", "assets/images/BoxImages/GrandmaHouse/BakerDream.png");
  static final Product iceCreamCake = Product.second("Ice Cream Cake", "", "assets/images/BoxImages/GrandmaHouse/CreamCake.png");
  
  //Divider

  static final Box seasonalFlavors = Box("Seasonal Flavors", "Candy Cane, Eggnog, Hot Chocolate, Snickerdoodle", "assets/images/BoxImages/Seasonal/img.png", [candyCane, eggnog, hotChocolate, snickerdoodle]);

  static final Product candyCane = Product.second("CandyCane", "", "assets/images/BoxImages/Seasonal/CandyCane.png");
  static final Product eggnog = Product.second("Eggnog", "", "assets/images/BoxImages/Seasonal/Eggnog.png");
  static final Product hotChocolate = Product.second("Hot Chocolate ", "", "assets/images/BoxImages/Seasonal/HotCoco.png");
  static final Product snickerdoodle = Product.second("Snickerdoodle", "", "assets/images/BoxImages/Seasonal/SnickerDoodle.png");
  



  static List<Box> toList(){
    return [basicFlavor, crunchTime, dessertedIsland, nycSpecial, grandmaHouse, seasonalFlavors];
  }
}