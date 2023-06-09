import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mabitt/screens/rating_scrren.dart';

import '../models/property_model.dart';

class DetailsPage extends StatelessWidget {
  final PropertyModel propertyModel;

  // final bool isfav;
  const DetailsPage({
    Key? key,
    required this.propertyModel,

    // required this.isfav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                IconButton(
                  color: const Color.fromARGB(255, 44, 73, 121),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    color: const Color.fromARGB(255, 44, 73, 121),
                    Icons.arrow_back_ios,
                  ),
                ),
                CarouselwithIndicatorDemo(
                  propertyModel: propertyModel,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            propertyModel.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const Spacer(),
                          const Icon(
                            LineIcons.starAlt,
                            color: Color.fromARGB(255, 246, 195, 11),
                          ),
                          Text(
                            propertyModel.rating.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        propertyModel.subTitle.toString(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.black.withOpacity(0.5),
                            ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            specWidget(
                              context,
                              LineIcons.moneyBill,
                              "${propertyModel.price} LD",
                            ),
                            specWidget(
                              context,
                              LineIcons.home,
                              "${propertyModel.rooms} Rooms",
                            ),
                            specWidget(
                              context,
                              LineIcons.areaChart,
                              "${propertyModel.area} Sqft",
                            ),
                            specWidget(
                              context,
                              LineIcons.building,
                              "${propertyModel.floors} Floors",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        "Descriptions",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        propertyModel.details,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.black.withOpacity(0.5),
                              letterSpacing: 1.1,
                              height: 1.4,
                            ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomeView()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xffF9EEc8),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 4,
                          )
                        ],
                      ),
                      height: 55,
                      width: 55,
                      child: const Icon(
                        LineIcons.comment,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Icon(Ionicons.heart);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xffF9EEc8),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 4,
                          )
                        ],
                      ),
                      height: 55,
                      width: 55,
                      child: const Icon(Ionicons.heart_outline,
                          color: Colors.redAccent),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // launchUrl('tel:+218928468779' as Uri);
                        FlutterPhoneDirectCaller.callNumber('+218928468779');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xff114E60),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.3),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xff114E60),
                              offset: Offset(4, 4),
                              blurRadius: 20,
                              spreadRadius: 4,
                            )
                          ],
                        ),
                        height: 55,
                        width: 55,
                        child: Center(
                          child: Text(
                            "Contact  owner",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: const Color(0xffF9EEc8),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget specWidget(BuildContext context, IconData iconData, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xffF9EEc8),
              shape: BoxShape.circle,
            ),
            child: Icon(iconData),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class CarouselwithIndicatorDemo extends StatefulWidget {
  final PropertyModel propertyModel;
  const CarouselwithIndicatorDemo({
    Key? key,
    required this.propertyModel,
  }) : super(key: key);

  @override
  _CarouselwithIndicatorDemoState createState() =>
      _CarouselwithIndicatorDemoState();
}

class _CarouselwithIndicatorDemoState extends State<CarouselwithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: widget.propertyModel.images
              .map((item) => Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: 1000,
                  ))
              .toList(),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 1.7,
            autoPlay: true,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.propertyModel.images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                width: 12,
                height: _current == entry.key ? 6 : 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xff114E60))
                      .withOpacity(
                    _current == entry.key ? 0.5 : 0.2,
                  ),
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
