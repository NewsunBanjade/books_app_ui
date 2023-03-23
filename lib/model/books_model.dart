class Book {
  final int id;
  final String bookName;
  final String authorName;
  final String bookImg;
  final double price;
  Book({
    required this.id,
    required this.bookName,
    required this.authorName,
    required this.bookImg,
    required this.price,
  });
}

final List<Book> popularBooks = [
  Book(
    id: 0,
    bookName: "IT STARTS WITH US",
    authorName: "Colleen Hoover",
    bookImg:
        "https://storage.googleapis.com/du-prd/books/images/9781668001226.jpg",
    price: 10,
  ),
  Book(
    id: 1,
    bookName: "ATOMIC HABITS",
    authorName: "James Clear",
    price: 10,
    bookImg:
        "https://storage.googleapis.com/du-prd/books/images/9780735211292.jpg",
  ),
  Book(
    id: 2,
    bookName: "I WILL FIND YOU",
    authorName: "Harlan Coben",
    price: 10,
    bookImg:
        "https://storage.googleapis.com/du-prd/books/images/9781538748367.jpg",
  ),
  Book(
    id: 3,
    bookName: "THE SUBTLE ART OF NOT GIVING A F*CK",
    authorName: "Mark Manson",
    price: 10,
    bookImg:
        "https://storage.googleapis.com/du-prd/books/images/9780062457714.jpg",
  ),
];
final List<Book> trendingBooks = [
  Book(
    id: 4,
    bookName: "The Courage To Be Disliked: ",
    authorName: "Ichiro Kishimi",
    price: 10,
    bookImg:
        "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1545421684i/43306206.jpg",
  ),
  Book(
    id: 5,
    bookName: "THE SUBTLE ART OF NOT GIVING A F*CK",
    authorName: "Mark Manson",
    price: 10,
    bookImg:
        "https://storage.googleapis.com/du-prd/books/images/9780062457714.jpg",
  ),
  Book(
    id: 6,
    bookName: "Ikigai",
    authorName: "Hector",
    price: 10,
    bookImg:
        "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71tbalAHYCL.jpg",
  )
];
final List<Book> newBooks = [
  Book(
    id: 7,
    bookName: "ATOMIC HABITS",
    authorName: "James Clear",
    price: 10,
    bookImg:
        "https://storage.googleapis.com/du-prd/books/images/9780735211292.jpg",
  ),
  Book(
    id: 8,
    bookName: "I WILL FIND YOU",
    authorName: "Harlan Coben",
    price: 10,
    bookImg:
        "https://storage.googleapis.com/du-prd/books/images/9781538748367.jpg",
  ),
];
final List<Book> bestSeller = [
  Book(
    id: 9,
    bookName: "THE SUBTLE ART OF NOT GIVING A F*CK",
    authorName: "Mark Manson",
    price: 10,
    bookImg:
        "https://storage.googleapis.com/du-prd/books/images/9780062457714.jpg",
  ),
  Book(
    id: 10,
    bookName: "Ikigai",
    authorName: "Hector",
    price: 10,
    bookImg:
        "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71tbalAHYCL.jpg",
  ),
  Book(
    id: 11,
    bookName: "I WILL FIND YOU",
    authorName: "Harlan Coben",
    price: 10,
    bookImg:
        "https://storage.googleapis.com/du-prd/books/images/9781538748367.jpg",
  ),
];
