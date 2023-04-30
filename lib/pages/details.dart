import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import '../model/pet.dart';
import '../widgets/adopt_button.dart';
import '../widgets/confetti_ui.dart';
import '../widgets/description_card.dart';
import '../widgets/hero_image.dart';
import '../widgets/navigate_back_button.dart';
import '../widgets/pet_name_with_shadow.dart';

/// Page to show details of the [Pet] user selected on [HomePage]
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
                leading: const NavigateBackButton(),
                flexibleSpace: FlexibleSpaceBar(
                  title: PetNameWithShadow(
                    name: args.petDetails.name,
                  ),
                  background: HeroImage(
                    heroTag: args.heroTag,
                    imageUrl: args.petDetails.photos[0].full,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: DescriptionCard(
                    petDetails: args.petDetails, shadowColor: args.shadowColor),
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

/// class for the arguments required to [DetailsPage] passed through [Navigator.pushNamed]
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
