import 'package:adviser_clean_arch/1_domain/entities/advice_entity.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

class AdviceUsecases {
  Future<Either<Failure, AdviceEntity>  > getAdvice() async {
    //call a repository to get data(failure or data(advice))
    //proceed with business logic(manipulate the data)
    await Future.delayed(const Duration(seconds: 2));
    //call repo went good 
    //return right (const AdviceEntity(advice: 'Test Entity', id: 1));
    //call repo went bad
    return Left(CacheFailure());
  }
}