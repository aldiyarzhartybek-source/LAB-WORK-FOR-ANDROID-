// ===== LW3: Library Book Management System =====

class Book {
  String title;
  String author;
  double price;
  bool isBorrowed;

  Book({
    required this.title,
    required this.author,
    required this.price,
    this.isBorrowed = false,
  });
}

class Library {
  final List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  List<Book> getAvailableBooks() {
    return _books.where((book) => book.isBorrowed == false).toList();
  }

  double getTotalValue() {
    return _books.fold(0.0, (sum, book) => sum + book.price);
  }
}

// ===== Homework 3: Digital E-Commerce Media Store =====

abstract class MediaItem {
  String id;
  String title;
  double price;

  MediaItem({required this.id, required this.title, required this.price});

  String getDetails();
}

mixin Downloadable {
  void download(String title) {
    print('   -> Downloading "$title"...');
  }
}

class Audiobook extends MediaItem with Downloadable {
  double durationHours;
  String narrator;

  Audiobook({
    required String id,
    required String title,
    required double price,
    required this.durationHours,
    required this.narrator,
  }) : super(id: id, title: title, price: price);

  @override
  String getDetails() {
    return 'Audiobook [$id] "$title" — narrated by $narrator, '
        '$durationHours h, ${price.toStringAsFixed(2)} KZT';
  }
}

class EBook extends MediaItem with Downloadable {
  double fileSizeMB;
  String author;

  EBook({
    required String id,
    required String title,
    required double price,
    required this.fileSizeMB,
    required this.author,
  }) : super(id: id, title: title, price: price);

  @override
  String getDetails() {
    return 'EBook [$id] "$title" — by $author, '
        '$fileSizeMB MB, ${price.toStringAsFixed(2)} KZT';
  }
}

class ShoppingCart {
  final List<MediaItem> _items = [];

  void addItem(MediaItem item) {
    _items.add(item);
  }

  double calculateTotalWithTax({double taxRate = 0.12}) {
    double subtotal = _items.fold(0.0, (sum, item) => sum + item.price);
    return subtotal + subtotal * taxRate;
  }

  List<MediaItem> filterByMaxPrice(double maxPrice) {
    return _items.where((item) => item.price <= maxPrice).toList();
  }

  void printReceipt() {
    print('=== RECEIPT ===');
    for (MediaItem item in _items) {
      print(item.getDetails());
      if (item is Downloadable) {
        item.download(item.title);
      }
    }
    print('');
    print('TOTAL with 12% tax: '
        '${calculateTotalWithTax().toStringAsFixed(2)} KZT');
  }
}

void main() {
  // ----- LW3 -----
  Library library = Library();

  library.addBook(Book(
    title: 'Clean Code',
    author: 'Robert Martin',
    price: 12500.0,
  ));

  library.addBook(Book(
    title: 'The Pragmatic Programmer',
    author: 'Andrew Hunt',
    price: 14000.0,
    isBorrowed: true,
  ));

  library.addBook(Book(
    title: 'Code Complete',
    author: 'Steve McConnell',
    price: 11000.0,
  ));

  library.addBook(Book(
    title: 'Refactoring',
    author: 'Martin Fowler',
    price: 16000.0,
  ));

  print('=== Available books ===');
  for (Book book in library.getAvailableBooks()) {
    print('${book.title} — ${book.author} — '
        '${book.price.toStringAsFixed(2)} KZT');
  }

  print('');
  print('Total collection value: '
      '${library.getTotalValue().toStringAsFixed(2)} KZT');

  // ----- Homework 3 -----
  print('');
  print('');

  ShoppingCart cart = ShoppingCart();

  cart.addItem(Audiobook(
    id: 'A-01',
    title: 'Atomic Habits',
    price: 5500.0,
    durationHours: 5.5,
    narrator: 'James Clear',
  ));

  cart.addItem(EBook(
    id: 'E-01',
    title: 'Clean Architecture',
    price: 9000.0,
    fileSizeMB: 12.4,
    author: 'Robert Martin',
  ));

  cart.addItem(EBook(
    id: 'E-02',
    title: 'Dart in Action',
    price: 3200.0,
    fileSizeMB: 8.1,
    author: 'Chris Buckett',
  ));

  cart.printReceipt();

  print('');
  print('=== Items cheaper than 6000 KZT ===');
  for (MediaItem item in cart.filterByMaxPrice(6000.0)) {
    print(item.getDetails());
  }
}
