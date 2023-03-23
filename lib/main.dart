import 'package:books_store/books_detail.dart';
import 'package:books_store/colors.dart';
import 'package:books_store/image_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:books_store/model/books_model.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: ThemeMode.dark,
      title: 'Books UI',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final GlobalKey<ScaffoldState> _scafflodKey = GlobalKey<ScaffoldState>();
  bool theme = false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scafflodKey,
        endDrawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Switch(
                    value: theme,
                    onChanged: (va) {
                      setState(() {
                        theme = va;
                      });
                    })
              ],
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi, Newsun",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    IconButton(
                      onPressed: () {
                        _scafflodKey.currentState?.openEndDrawer();
                      },
                      icon: const Icon(AntDesign.menufold),
                    )
                  ],
                ),
                Text(
                  "Search Your Book",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                5.ph,
                TextField(
                  onSubmitted: (value) {},
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Feather.search,
                      color: Colors.grey.shade700,
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    isDense: true,
                    fillColor: Colors.grey.shade300,
                    filled: true,
                  ),
                ),
                5.ph,
                TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: AppColors.blueColor,
                    labelColor: AppColors.blueColor,
                    unselectedLabelColor: Colors.grey,
                    controller: tabController,
                    tabs: const [
                      Tab(
                        child: Text("New"),
                      ),
                      Tab(
                        child: Text("Trending"),
                      ),
                      Tab(
                        child: Text("Best Seller"),
                      )
                    ]),
                10.ph,
                SizedBox(
                  height: 190,
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: [
                        BookListWidget(books: newBooks),
                        BookListWidget(books: trendingBooks),
                        BookListWidget(books: bestSeller)
                      ]),
                ),
                20.ph,
                Text(
                  "Popular",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => 15.ph,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: popularBooks.length,
                    itemBuilder: (context, index) =>
                        BooksListTile(book: popularBooks[index]),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}

class BooksListTile extends StatelessWidget {
  const BooksListTile({
    Key? key,
    required this.book,
  }) : super(key: key);
  final Book book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BooksDetail(book: book),
            ));
      },
      child: Row(
        children: [
          Hero(
            tag: book.id,
            child: SizedBox(
              height: 100,
              width: 80,
              child: Image.network(book.bookImg,
                  height: 100,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : const ImagePlaceHolder()),
            ),
          ),
          10.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.bookName,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                5.ph,
                Text(
                  book.authorName,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.grey.shade600),
                ),
                5.ph,
                Text(
                  "\$ ${book.price}",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BookListWidget extends StatelessWidget {
  const BookListWidget({
    required this.books,
    super.key,
  });
  final List<Book> books;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => 5.pw,
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BooksDetail(book: books[index]),
                    ));
              },
              child: Hero(
                tag: books[index].id,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                    books[index].bookImg,
                  ))),
                  height: 50,
                  width: 150,
                ),
              ),
            ));
  }
}

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}
