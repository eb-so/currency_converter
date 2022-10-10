import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String currencyAbbrivation;
  final String? rate;
  final String? name;
  final VoidCallback onPressed;
  final VoidCallback? onRemove;
  final bool showRemoveIcon;
  const CurrencyCard(
      {Key? key,
      required this.currencyAbbrivation,
      this.rate,
      this.name,
      required this.onPressed,
      this.showRemoveIcon = false,
      this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: Center(child: Text(currencyAbbrivation))),
              if (rate != null) Expanded(child: Center(child: Text(rate!))),
              if (name != null) Expanded(child: Center(child: Text(name!))),
              if (showRemoveIcon)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: IconButton(
                      onPressed: onRemove,
                      icon: const Icon(Icons.remove_circle_outline_rounded)),
                )
            ],
          ),
        ),
      ),
    );
  }
}
