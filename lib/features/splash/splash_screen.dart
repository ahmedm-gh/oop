import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tuts/core/services/routes.dart';

Future<void> init(void Function() onDone) async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await Future<void>.delayed(const Duration(seconds: 2));
  onDone();
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    init(() {
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
    });

    return const Material(
      child: Center(
        child: CircularProgressIndicator(strokeCap: .round, strokeWidth: 4),
      ),
    );
  }
}
