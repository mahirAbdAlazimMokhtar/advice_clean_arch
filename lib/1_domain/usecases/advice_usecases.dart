import 'package:adviser_clean_arch/1_domain/entities/advice_entity.dart';
import 'package:dartz/dartz.dart';

import '../../0_data/repositories/advice_repo_impl.dart';
import '../failures/failures.dart';

class AdviceUsecases {
  final adviceRepo = AdviceRepoImpl();
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
  }
}
