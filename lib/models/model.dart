class Model {
  String? img;
  String? name;
  String? description;
  double? price;

  Model({
    this.name,
    this.img,
    this.price,
    this.description,
  });
}

List<Model> pizzaList = [
  Model(
    name: 'Pizza',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500",
    price: 19.00,
    img: "assets/pizzaimg1.png",
  ),
  Model(
    name: 'Mini Pizza',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500",
    price: 20.00,
    img: "assets/pizzaimg2.png",
  )
];

List<Model> burgerList = [
  Model(
    name: 'Chiken Burger',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500",
    price: 5.6,
    img: "assets/burgerimg1.png",
  ),
  Model(
    name: 'Beef Burger',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500",
    price: 7.2,
    img: "assets/burgerimg2.png",
  )
];

List<Model> drinkstList = [
  Model(
    name: 'Juice',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500",
    price: 7.2,
    img: "assets/juiceimg1.png",
  ),
];

List<Model> snacksList = [
  Model(
    name: 'Snacks',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500",
    price: 2.2,
    img: "assets/snacksimg1.png",
  ),
];

List<Model> comboList = [
  Model(
    name: 'Combo Pack',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500",
    price: 4,
    img: "assets/comboimg1.png",
  ),
];
