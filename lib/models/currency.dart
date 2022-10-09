import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String? name;
  final String abbrivation;
  final double? rate;
  const Currency({
    required this.abbrivation,
    this.name,
    this.rate,
  });

  // factory Currency.fromJson(Map<String, dynamic> json) => Currency(
  //       name: json['name'],
  //       rate: json['rate'],
  //       abbrivation: json['abbrivation'],
  //     );

  @override
  List<Object?> get props => [name, abbrivation, rate];
}
