import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../model/books_model.dart';

class BookSelectPage extends StatelessWidget {
  const BookSelectPage({Key? key, required this.book}) : super(key: key);
  final Books book;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      
      child: Stack(
        children: [
          Image.network(book.cover!,
              width: size.width, height: size.height, fit: BoxFit.fill),
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: size.height *0.4),
              decoration:const  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(32))
              ),
            ),
          ),
        ],
      ),
    );
  }
}
