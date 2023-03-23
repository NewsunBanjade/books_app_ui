import 'package:books_store/colors.dart';
import 'package:books_store/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:books_store/model/books_model.dart';

class BooksDetail extends StatefulWidget {
  const BooksDetail({
    Key? key,
    required this.book,
  }) : super(key: key);
  final Book book;
  @override
  State<BooksDetail> createState() => _BooksDetailState();
}

class _BooksDetailState extends State<BooksDetail>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late Animation<double> textAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Book book = widget.book;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.mediumBlack,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(CupertinoIcons.back),
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            children: [
              Hero(
                  tag: book.id,
                  flightShuttleBuilder: (flightContext, animation,
                      flightDirection, fromHeroContext, toHeroContext) {
                    return RotationTransition(
                      turns: animation,
                      child: Center(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            height: 200,
                            width: 200,
                            child: Image.network(
                              book.bookImg,
                              fit: BoxFit.contain,
                            )),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: 200,
                        width: 200,
                        child: Image.network(
                          book.bookImg,
                          fit: BoxFit.contain,
                        )),
                  )),
              80.ph,
              Expanded(
                  child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: const BoxDecoration(
                    color: AppColors.mediumBlack,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: FadeTransition(
                  opacity: textAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.bookName,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "by ${book.authorName}",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey.shade500),
                      ),
                      5.ph,
                      Text(
                        "\$ ${book.price}",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.blueColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              fixedSize: const Size(double.maxFinite, 20)),
                          onPressed: () {},
                          child: const Text("Buy",
                              style: TextStyle(color: Colors.white)))
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
