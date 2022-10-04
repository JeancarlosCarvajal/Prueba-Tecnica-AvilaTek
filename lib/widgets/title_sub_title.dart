import 'package:flutter/material.dart';

// import '../models/popular_movies.dart';

class TitleSubTitle extends StatelessWidget {
  const TitleSubTitle({
    Key? key,
    required this.title, 
    required this.subTitle, 
    required this.isAverage,
    required this.sizeTitle, 
    required this.sizeSubTitle, 
    required this.maxLinesTitle, 
    required this.maxLinesSubTitle, 
    this.heightTitle = 1.5, 
    this.heightSubTitle = 1, 
    this.width = 120,
  }) : super(key: key);

  final String title;
  final dynamic subTitle;
  final bool isAverage;
  final double sizeTitle;
  final double sizeSubTitle;
  final int maxLinesTitle;
  final int maxLinesSubTitle;
  final double? heightTitle;
  final double? heightSubTitle;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: maxLinesTitle,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: sizeTitle, height: heightTitle), 
          ),
          Text(
            isAverage ? '${subTitle*10}% User Score' : subTitle, 
            maxLines: maxLinesSubTitle, 
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: sizeSubTitle, height: heightSubTitle) 
          )
        ],
      ),
    );
  }
}

