import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_card.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key, required this.onChanged}) : super(key: key);
  final void Function(String value) onChanged;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late CancelableOperation<void> cancellableOperation;

  final _delayTime = const Duration(milliseconds: 300);
  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    cancellableOperation = CancelableOperation.fromFuture(
      Future.delayed(_delayTime),
      onCancel: () {
        debugPrint('Cancelled operation');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search with name or type etc..',
            hintStyle: GoogleFonts.caveat(fontSize: 20.0),
            prefixIcon: const Icon(Icons.search),
          ),
          onChanged: _onItemChanged,
        ),
      ),
    );
  }

  void _onItemChanged(String value) {
    cancellableOperation.cancel();
    _start();
    cancellableOperation.value.whenComplete(() {
      widget.onChanged(value);
    });
  }
}
