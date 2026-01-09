import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/status_entity.dart';
import '../../domain/repositories/status_repository.dart';
import '../datasources/status_local_data_source.dart';
import '../models/status_model.dart';

class StatusRepositoryImpl implements StatusRepository {
  final StatusLocalDataSource localDataSource;

  StatusRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<StatusEntity>>> getStatuses() async {
    try {
      final statuses = await localDataSource.getStatuses();
      return Right(statuses);
    } on PermissionException catch (e) {
      return Left(PermissionFailure(e.message));
    } on Exception catch (_) {
      return const Left(CacheFailure('Failed to load statuses'));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveStatus(StatusEntity status) async {
    try {
      await localDataSource.saveStatus(status as StatusModel);
      return const Right(unit);
    } on PermissionException catch (e) {
      return Left(PermissionFailure(e.message));
    } on StorageException catch (e) {
      return Left(StorageFailure(e.message));
    } on Exception catch (_) {
      return const Left(StorageFailure('Unknown error while saving'));
    }
  }
}
