import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/status_entity.dart';
import '../repositories/status_repository.dart';

class SaveStatus implements UseCase<Unit, StatusEntity> {
  final StatusRepository repository;

  SaveStatus(this.repository);

  @override
  Future<Either<Failure, Unit>> call(StatusEntity status) async {
    return await repository.saveStatus(status);
  }
}
