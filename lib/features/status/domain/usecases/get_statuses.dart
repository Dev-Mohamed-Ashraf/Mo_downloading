import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/status_entity.dart';
import '../repositories/status_repository.dart';

class GetStatuses implements UseCase<List<StatusEntity>, NoParams> {
  final StatusRepository repository;

  GetStatuses(this.repository);

  @override
  Future<Either<Failure, List<StatusEntity>>> call(NoParams params) async {
    return await repository.getStatuses();
  }
}
