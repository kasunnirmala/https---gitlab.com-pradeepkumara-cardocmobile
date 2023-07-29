import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SizedBox(
        height: 350,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: ImageSlideshow(
                width: double.infinity,
                initialPage: 0,
                indicatorColor: Colors.red,
                indicatorBackgroundColor: Colors.grey,
                isLoop: true,
                children: [
                  Image.network(
                    "https://wallpaperaccess.com/full/123224.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    "https://marketingweek.imgix.net/content/uploads/2019/07/24134541/car.jpg",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: ListTile(
                      title: Text(
                        "Car Doc Service Center",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Car service, Body Wash, Spare Parts"),
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                  FontAwesomeIcons.solidStar,
                                  size: 15,
                                ),
                              )),
                          TextSpan(
                            text: '4.8',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
