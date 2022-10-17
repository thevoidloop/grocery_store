class GroceryProduct {
  const GroceryProduct(
      {required this.price,
      required this.name,
      required this.description,
      required this.image,
      required this.weight});
  final double price;
  final String name;
  final String description;
  final String image;
  final String weight;
}

const groceryProducts = <GroceryProduct>[
  GroceryProduct(
      price: 8.30,
      name: 'Avocado',
      description:
          'Consectetur sunt officia est excepteur. Nostrud laboris officia non occaecat reprehenderit ullamco ex laborum voluptate adipisicing. Ullamco dolor elit Lorem consequat voluptate ut qui id. Do voluptate aliqua veniam amet cupidatat velit laboris sunt. Fugiat tempor sint anim veniam ullamco enim ad veniam ipsum.',
      image: '',
      weight: '500g'),
  GroceryProduct(
      price: 11.00,
      name: 'Banana',
      description:
          'Minim reprehenderit eu magna officia. Do nostrud ad occaecat incididunt sit pariatur aliquip consequat nisi enim do anim nostrud irure. Pariatur labore id quis fugiat. Officia eiusmod minim cupidatat reprehenderit qui commodo elit esse. Proident laboris tempor quis qui quis laborum ad excepteur amet labore est. Voluptate duis cillum consequat velit cillum non exercitation consequat.',
      image: '',
      weight: '100g'),
  GroceryProduct(
      price: 15.40,
      name: 'Mango',
      description:
          'Anim aliqua id anim fugiat minim dolor elit magna sint Lorem sit tempor nisi reprehenderit. Duis ex pariatur eu adipisicing commodo nulla aliqua et mollit deserunt. Ipsum cupidatat sunt laboris esse veniam esse elit sint consequat sint. Elit laborum eiusmod ex officia consequat ea veniam qui duis dolor ullamco veniam anim amet.',
      image: '',
      weight: '500g'),
  GroceryProduct(
      price: 4.15,
      name: 'Pineapple',
      description:
          'Consectetur do cillum anim magna esse culpa sint excepteur cupidatat. Dolor nulla magna pariatur sint ullamco cupidatat exercitation. Ullamco commodo veniam sit deserunt laborum labore esse esse veniam consectetur et aute aute. Nulla voluptate ea nulla dolore elit nulla eu elit id. Esse amet excepteur laboris aliqua eiusmod fugiat laborum laborum magna dolore in. In occaecat aute laborum occaecat consectetur. Est elit aute tempor dolor labore enim sunt excepteur adipisicing id anim aliqua.',
      image: '',
      weight: '1000g'),
  GroceryProduct(
      price: 24.5,
      name: 'Cherry',
      description:
          'Ex cillum tempor proident cupidatat aliquip. Ipsum enim eiusmod consectetur adipisicing incididunt labore magna. Dolor aute pariatur laborum aliquip. Consectetur dolore labore aute incididunt mollit adipisicing. Incididunt esse nulla ipsum non elit culpa proident minim occaecat.',
      image: '',
      weight: '500g'),
  GroceryProduct(
      price: 18.30,
      name: 'Orange',
      description:
          'Sint ea adipisicing anim consectetur amet ullamco do reprehenderit duis excepteur amet pariatur cupidatat. Laboris aliqua amet consequat voluptate officia cupidatat nisi nostrud consectetur culpa mollit id. Qui labore adipisicing nulla ipsum et sit commodo nostrud consectetur. Eu irure cupidatat dolore pariatur sunt pariatur. Id nulla esse proident culpa amet sint. Adipisicing sit veniam officia eu exercitation nulla esse mollit sunt quis ea quis. Elit ut id reprehenderit eu excepteur eu.',
      image: '',
      weight: '1000g')
];
