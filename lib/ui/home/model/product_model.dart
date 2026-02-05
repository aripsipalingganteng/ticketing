class ProductModel {
  final String productName;
  final String type;
  final int price;
  int quantity;

  ProductModel({
    required this.productName,
    required this.type,
    required this.price,
    this.quantity = 4,
  });
}

final dummyProducts = [
  ProductModel(productName: 'Ticketing Dewasa', type: 'Domesti', price: 100000),
  ProductModel(
    productName: 'Ticketing Anak Kecil',
    type: 'Domesti',
    price: 100000,
  ),
  ProductModel(
    productName: 'Ticketing Dewasa',
    type: 'Internasional',
    price: 150000,
  ),
  ProductModel(
    productName: 'Ticketing Anak Kecil',
    type: 'Internasional',
    price: 150000,
  ),
  ProductModel(
    productName: 'Ticketing Dewasa',
    type: 'Manca Negara',
    price: 200000,
  ),
  ProductModel(
    productName: 'Ticketing Anak Kecil',
    type: 'Manca Negara',
    price: 200000,
  ),
  ProductModel(
    productName: 'Ticketing Dewasa',
    type: 'Manca Negara',
    price: 200000,
    
  ),
  ProductModel(
    productName: 'Ticketing Anak Kecil',
    type: 'Manca Negara',
    price: 200000,
  ),
  ProductModel(
    productName: 'Ticketing Dewasa',
    type: 'Manca Negara',
    price: 200000,
  ),
  ProductModel(
    productName: 'Ticketing Anak Kecil',
    type: 'Manca Negara',
    price: 200000,
  ),
];