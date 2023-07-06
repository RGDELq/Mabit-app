import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mabitt/screens/rating_screen.dart';
import 'package:mabitt/screens/widgets/propertyinfor_card.dart';
import 'package:provider/provider.dart';
import '../models/property_model.dart';
import '../provider/favorite_provider.dart';
import '../provider/property_provider.dart';
import '../utils/my_string.dart';
import 'favorites_screen.dart';

class DetailsPage extends StatefulWidget {
  final PropertyModel propertyModel;

  // final bool isfav;
  const DetailsPage({
    Key? key,
    required this.propertyModel,

    // required this.isfav,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Provider.of<PropertyProvider>(context, listen: false).getProperties();

    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        baseUrl + '/img/' + widget.propertyModel.image,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        child: IconButton(
                          color: const Color.fromARGB(255, 44, 73, 121),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            color: Color.fromARGB(255, 44, 73, 121),
                            Icons.arrow_back_ios,
                          ),
                        ),
                      )
                    ],
                  ),
                  ////// والسيب تايتل العنوان والريت
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.propertyModel.name,
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
                            // Text(
                            //   widget.propertyModel.rating.toString(),
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .titleMedium!
                            //       .copyWith(
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          widget.propertyModel.name.toString(),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                        ),
                        ////////////////////////////////////////////////////////////////////////////
                        const SizedBox(
                          height: 32,
                        ),
                        //-----------------spacer widget which called propertyinfo ----------------
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              specWidget(
                                context,
                                LineIcons.moneyBill,
                                "${widget.propertyModel.price} LD",
                              ),
                              specWidget(
                                context,
                                LineIcons.home,
                                "${widget.propertyModel.rooms} Rooms",
                              ),
                              specWidget(
                                context,
                                LineIcons.areaChart,
                                "${widget.propertyModel.rooms} Sqft",
                              ),
                              specWidget(
                                context,
                                LineIcons.building,
                                "${widget.propertyModel.floor} Floors",
                              ),
                            ],
                          ),
                        ),
                        ///////////////////////////////////////////////////////////////////////////////
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
                          widget.propertyModel.detail,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
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
            ///////////////////Rating dialog///////////////////////////
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeView()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 219, 232, 216),
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
                        ///////////////////////////////////////////////////////////////////////
                        height: 55,
                        width: 55,
                        child: const Icon(
                          LineIcons.comment,
                        ),
                      ),
                    ),
                    //-
                    //-------------------------FAV & Rate & contact --------------------------------

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavoritesScreen()));
                        // setState(() {
                        //   _isFavorite = !_isFavorite;
                        //   widget.propertyModel.isFavorite = _isFavorite;
                        // });

                        if (_isFavorite) {
                          // Add to favorite
                          Provider.of<FavoriteProvider>(context, listen: false)
                              .addFavoriteProperty(widget.propertyModel);
                        } else {
                          // Remove from favorite
                          Provider.of<FavoriteProvider>(context, listen: false)
                              .removeFavoriteProperty(widget.propertyModel);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 219, 232, 216),
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
                        child: Icon(
                          _isFavorite ? Ionicons.heart : Ionicons.heart_outline,
                          color: _isFavorite ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          FlutterPhoneDirectCaller.callNumber(
                              widget.propertyModel.phonenumber as String);
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
                                    color: const Color.fromARGB(
                                        255, 219, 232, 216),
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
      ),
    );
  }
}
