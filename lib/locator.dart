import 'package:get_it/get_it.dart';
import 'package:imagineapps_leal/data/data.dart';
import 'package:imagineapps_leal/domain/domain.dart';

GetIt locator = GetIt.instance;

void startServiceLocator() {
  locator.registerSingleton<LoginRepository>(LoginRepositoryImpl());
}
