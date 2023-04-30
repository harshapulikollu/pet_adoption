import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_hn/widgets/custom_text.dart';

import '../model/pet.dart';
import '../widgets/adopt_button.dart';
import '../widgets/confetti_ui.dart';
import '../widgets/description_card.dart';
import '../widgets/hero_image.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late ConfettiController _confettiController;

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
                  background: HeroImage(
                    heroTag: args.heroTag,
                    imageUrl: args.petDetails.photos[0].full,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: DescriptionCard(petDetails: args.petDetails, shadowColor: args.shadowColor),
              ),
            ],
          ),
          AdoptButton(
            petDetails: args.petDetails,
            confettiController: _confettiController,
          ),
          ConfettiUI(
            confettiController: _confettiController,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
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
