import 'package:equatable/equatable.dart';

import '../../1_domain/entities/advice_entity.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  //  AdviceModel({required String advice, required int id})
  //     : super(advice: advice, id: id);
  const AdviceModel({required super.advice, required super.id});

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(
      advice: json['advice'],
      id: json['advice_id'],
    );
  }
}
