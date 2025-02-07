import 'package:adviser_clean_arch/0_data/datasources/remote_datasource/advice_remote_datasource.dart';
import 'package:adviser_clean_arch/0_data/exceptions/exceptions.dart';
import 'package:adviser_clean_arch/1_domain/entities/advice_entity.dart';
import 'package:adviser_clean_arch/1_domain/failures/failures.dart';
import 'package:adviser_clean_arch/1_domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource ;

  AdviceRepoImpl({required this.adviceRemoteDatasource});
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
      return Right(result);
    } on ServerExceptions catch (_) {
      return left(ServerFailure());
    } catch (e) {
      //handle exception
      return Left(GeneralFailure());
    }
  }
}
