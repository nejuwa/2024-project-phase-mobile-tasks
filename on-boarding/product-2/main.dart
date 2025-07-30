import 'dart:io';

// Product Class

class Product {
  String names;
  String descriptions;
  double prices;

  Product(this.names, this.descriptions, this.prices);

  // Getters
  String get name => names;
  String get description => descriptions;
  double get price => prices;

  // Setters
  set name(String name) => names = name;
  set description(String description) => descriptions = description;
  set price(double price) => prices = price;

  void display() {
    print('Name: $names');
    print('Description: $descriptions');
    print('Price: \$$prices');
  }
}

// ProductManager Class

class ProductManager {
  List<Product> myproducts = [];

  void addProduct() {
    print('\nEnter product name:');
    String name = stdin.readLineSync()!;
    print('Enter product description:');
    String description = stdin.readLineSync()!;
    print('Enter product price:');
    double? price = double.tryParse(stdin.readLineSync()!);

    if (price == null) {
      print(' Invalid price. Product not added.');
      return;
    }

    Product product = Product(name, description, price);
    myproducts.add(product);
    print(' Product added successfully.');
  }

  void viewAllProducts() {
    if (myproducts.isEmpty) {
      print(' No products available.');
      return;
    }

    print('\nAll Products:');
    for (int i = 0; i < myproducts.length; i++) {
      print('\nProduct #${i + 1}');
      myproducts[i].display();
    }
  }

  void viewProduct() {
    print('\nEnter product number to view:');
    int? index = int.tryParse(stdin.readLineSync()!);
    if (index == null || index < 1 || index > myproducts.length) {
      print(' Invalid product number.');
      return;
    }

    myproducts[index - 1].display();
  }

  void editProduct() {
    print('\nEnter product number to edit:');
    int? index = int.tryParse(stdin.readLineSync()!);
    if (index == null || index < 1 || index > myproducts.length) {
      print(' Invalid product number.');
      return;
    }

    Product product = myproducts[index - 1];

    print('Enter new name (current: ${product.name}):');
    String name = stdin.readLineSync()!;
    print('Enter new description (current: ${product.description}):');
    String description = stdin.readLineSync()!;
    print('Enter new price (current: \$${product.price}):');
    double? price = double.tryParse(stdin.readLineSync()!);

    if (price == null) {
      print(' Invalid price. Product not updated.');
      return;
    }

    product.name = name;
    product.description = description;
    product.price = price;
    print(' Product updated successfully.');
  }

  void deleteProduct() {
    print('\nEnter product number to delete:');
    int? index = int.tryParse(stdin.readLineSync()!);
    if (index == null || index < 1 || index > myproducts.length) {
      print(' Invalid product number.');
      return;
    }

    myproducts.removeAt(index - 1);
    print(' Product deleted successfully.');
  }
}

// Main Function
void main() {
  ProductManager manager = ProductManager();

  while (true) {
    print('\n eCommerce Product Manager');
    print('1. Add Product');
    print('2. View All Products');
    print('3. View a Product');
    print('4. Edit Product');
    print('5. Delete Product');
    print('6. Exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        manager.addProduct();
        break;
      case '2':
        manager.viewAllProducts();
        break;
      case '3':
        manager.viewProduct();
        break;
      case '4':
        manager.editProduct();
        break;
      case '5':
        manager.deleteProduct();
        break;
      case '6':
        print(' Exiting the app.');
        return;
      default:
        print(' Invalid choice. Try again.');
    }
  }
}
