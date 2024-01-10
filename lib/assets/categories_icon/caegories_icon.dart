class CustomIcon{
  static String pizzaIcon = 'assets/categories_icon/pizza.png';
  static String burgerIcon = 'assets/categories_icon/burger.png';
  static String nonVegIcon = 'assets/categories_icon/roasted-chicken.png';
  static String vegIcon = 'assets/categories_icon/salad.png';
}

var categories = [
  {
    'category_name' : 'All',
    'icon' : ''
  },
  {
    'category_name' : 'Pizza',
    'icon' : CustomIcon.pizzaIcon
  },
  {
    'category_name' : 'NonVeg',
    'icon' : CustomIcon.nonVegIcon
  },
  {
    'category_name' : 'Veg',
    'icon' : CustomIcon.vegIcon
  },
  {
    'category_name' : 'Burger',
    'icon' : CustomIcon.burgerIcon
  },
];