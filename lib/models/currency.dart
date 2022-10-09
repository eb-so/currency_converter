import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String name;
  final String abbrivation;

  const Currency({required this.name, required this.abbrivation});

  factory Currency.fromJson(Map<String, dynamic> json) =>
      Currency(name: json['name'], abbrivation: json['abbrivation']);

  @override
  List<Object?> get props => [name, abbrivation];
}
