import 'package:flutter/material.dart';

class CustomSlidingHomePageItems extends StatelessWidget {
  const CustomSlidingHomePageItems(
      {Key? key,
        required this.imageUrl,
        required this.titleText,
        })
      : super(key: key);

  final String imageUrl;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          Card(
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.black45,
                BlendMode.darken,
              ),
              child: Ink.image(
                image: AssetImage(imageUrl, ),
                height: MediaQuery.of(context).size.height * 0.35,
                width: 250,
                fit: BoxFit.fill,
                child: const InkWell(
                ),
              ),
            ),
          ),
          const SizedBox(height: 2,),
          Text(
            titleText,
            style: const TextStyle(
                color: Color(0xff02475E),
                fontSize: 28,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
