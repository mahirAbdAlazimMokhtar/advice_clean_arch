import 'package:adviser_clean_arch/1_domain/entities/advice_entity.dart';
import 'package:dartz/dartz.dart';


import '../failures/failures.dart';
import '../repositories/advice_repo.dart';

class AdviceUsecases {
  final AdviceRepo adviceRepo ;

  AdviceUsecases({required this.adviceRepo});
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
  }
}
