import 'package:flutter_modular/src/domain/services/route_service.dart';
import 'package:flutter_modular/src/shared/either.dart';
import 'package:modular_core/modular_core.dart';

abstract class ReportPush {
  Either<ModularError, Unit> call(ModularRoute route);
}

class ReportPushImpl implements ReportPush {
  final RouteService service;

  ReportPushImpl(this.service);

  @override
  Either<ModularError, Unit> call(ModularRoute route) {
    return service.reportPush(route);
  }
}
