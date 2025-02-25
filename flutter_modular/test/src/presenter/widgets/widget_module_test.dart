import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_interfaces/src/di/bind.dart';

void main() {
  testWidgets('WidgetModule', (tester) async {
    final modularApp = ModularApp(module: CustomModule(), child: AppWidget());
    await tester.pumpWidget(modularApp);

    await tester.pump();
    final finder = find.byKey(key);
    expect(finder, findsOneWidget);
    expect(Modular.get<double>(), 0.0);

    final result = tester.widget<CustomWidgetModule>(find.byType(CustomWidgetModule));

    await result.isReady();
    result.remove();
    result.removeScopedBind();

    // final state = tester.state<NavigationListenerState>(find.byKey(key));
    // state.listener();
  });
}

final key = UniqueKey();

class CustomModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => 'test'),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => CustomWidgetModule()),
      ];
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp().modular();
  }
}

class CustomWidgetModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind.instance<double>(0.0),
      ];

  @override
  Widget get view => Container(key: key);
}
