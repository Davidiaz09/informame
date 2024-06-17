import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/write_articles/write_articles.dart';


class ControlScreens extends StatefulWidget {
  const ControlScreens({ Key? key }) : super(key: key);

  @override
  State<ControlScreens> createState() => _ControlScreensState();
}

class _ControlScreensState extends State<ControlScreens> {
  int _actualPage = 0;

  final _pages = [
    const DailyNews(),
    const WriteArticle()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _actualPage,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _actualPage,
        onTap: (index) {
          setState(() {
             _actualPage = index;
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home), 
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box), 
              label: "Write Article")
        ],
      ),
    );
  }


  

  //  void _onMyArticlesPressed(BuildContext context) {
  //   Navigator.pushNamed(context, '/MyArticles');
  // }
}