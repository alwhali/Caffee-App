class DrinkModel {
  String? name;
  String? image;
  String? price;
  String? description;

  DrinkModel({this.name, this.image, this.price, this.description});
}

List<DrinkModel> drinks = [
  DrinkModel(
    name: 'Banana',
    image: 'assets/drinks/Banana.png',
    price: '\$4.50',
    description:
        'Creamy banana blended with rich milk and ice for a refreshing tropical treat.',
  ),
  DrinkModel(
    name: 'Brownie Island',
    image: 'assets/drinks/Brownie_Island.png',
    price: '\$6.75',
    description:
        'Decadent chocolate brownie blended into a thick and indulgent frappe.',
  ),
  DrinkModel(
    name: 'Caramel',
    image: 'assets/drinks/carmel.png',
    price: '\$5.25',
    description:
        'Smooth and buttery caramel swirled into your favorite coffee or milk base.',
  ),
  DrinkModel(
    name: 'Chocolate',
    image: 'assets/drinks/Chocolate.png',
    price: '\$5.00',
    description:
        'Rich and velvety chocolate drink made with premium cocoa and fresh milk.',
  ),
  DrinkModel(
    name: 'Peanut Butter',
    image: 'assets/drinks/Peanut_Butter.png',
    price: '\$5.50',
    description:
        'Nutty and creamy peanut butter blended to perfection for a protein-packed delight.',
  ),
  DrinkModel(
    name: 'Salted Caramel',
    image: 'assets/drinks/Salted_Caramel.png',
    price: '\$5.75',
    description:
        'Sweet and salty caramel indulgence with a hint of sea salt in every sip.',
  ),
  DrinkModel(
    name: 'Strawberry',
    image: 'assets/drinks/Strawberry.png',
    price: '\$4.75',
    description:
        'Fresh strawberries blended with creamy milk and ice for a fruity explosion.',
  ),
];
