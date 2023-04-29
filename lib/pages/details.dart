import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:pet_adoption_hn/widgets/custom_card.dart';
import 'package:pet_adoption_hn/widgets/custom_text.dart';

import '../model/pet.dart';
import '../utils/colors.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late ConfettiController _controllerCenter;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DetailsPageArguments;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: CustomText(
                    args.petDetails.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  background: Hero(
                    tag: args.heroTag,
                    child: Image.network(
                      args.petDetails.photos[0].full,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCard(
                        shadowColor: args.shadowColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                args.petDetails.description,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    'Type: ${args.petDetails.type}',
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  CustomText('Gender: ${args.petDetails.gender}',
                                      style:
                                      Theme.of(context).textTheme.titleLarge),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText('Age: ${args.petDetails.age}',
                                      style:
                                      Theme.of(context).textTheme.titleLarge),
                                  CustomText(
                                    'Price: ${args.petDetails.price}',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.green),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Wrap(
                                children: args.petDetails.tags
                                    .map((e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Chip(
                                          label: Text(e),
                                        )))
                                    .toList(),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const Divider(),
                              const CustomText(
                                ' Contact:',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.email),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  CustomText(
                                    args.petDetails.contact.email,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.phone),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Flexible(
                                      child: CustomText(
                                          args.petDetails.contact.phone,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge)),
                                ],
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.pin_drop),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  CustomText(
                                      '${args.petDetails.contact.address.address1}, ${args.petDetails.contact.address.city}, ${args.petDetails.contact.address.state}, ${args.petDetails.contact.address.country}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                ],
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 48.0,)
                    ],
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ValueListenableBuilder(
                  valueListenable: Hive.box('adopted_pets').listenable(),
                  builder: (context, box, child) {
                    final List adoptedPetsList =
                        box.get('adoptedPetsList', defaultValue: []);
                    return NeoPopTiltedButton(
                      isFloating: true,
                      enabled: !adoptedPetsList.contains(args.petDetails),
                      onTapUp: () {
                        HapticFeedback.lightImpact();
                      },
                      onTapDown: () {
                        HapticFeedback.lightImpact();
                        adoptedPetsList.add(args.petDetails);
                        box.put('adoptedPetsList', adoptedPetsList);
                        _controllerCenter.play();
                        _showDialog(context, args.petDetails.name);
                      },
                      decoration: const NeoPopTiltedButtonDecoration(
                        color: kPopYellowColor,
                        plunkColor: kPlunkColorYellow,
                        shadowColor: kTiltedButtonShadowColor,
                        showShimmer: true,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 70.0,
                          vertical: 15,
                        ),
                        child: CustomText(
                          adoptedPetsList.contains(args.petDetails) ? 'Already Adopted': 'Adopt me',
                          style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  void _showDialog(BuildContext context, String petName) {
    showDialog(context: context, builder: (BuildContext context){
      return  Dialog(
        elevation: 0,
        child: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                "You've now adopted $petName",
                style: Theme.of(context).textTheme.headlineSmall
              ),
              NeoPopButton(color: kPlunkColorYellow,
              onTapUp: (){},
                  onTapDown: (){
                Navigator.pop(context);
                  },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                child: Text('Close'),
              )),
            ],
          ),
        ),
      );
    });
  }
}

class DetailsPageArguments {
  final Pet petDetails;
  final String heroTag;
  final Color shadowColor;
  DetailsPageArguments({
    required this.petDetails,
    required this.heroTag,
    required this.shadowColor,
  });
}
