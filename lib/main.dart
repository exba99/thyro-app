import 'package:flutter/material.dart';
import 'package:process_run/stdio.dart';
import 'package:thyroidclass/screen/Onboarding%20Page/OnBoarding%20Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(MyApp());
}

/*void startPythonServer() async {
  // Chemin vers le script Bash
  var bashScriptPath = '../start_server.sh';

  // Donner les permissions d'exécution si nécessaire
  await Process.run('chmod', ['+x', bashScriptPath]);

  // Lancer le script Bash
  var result = await Process.run(bashScriptPath, []);

  if (result.exitCode == 0) {
    print('Serveur Python démarré avec succès.');
    print('Sortie : ${result.stdout}');
  } else {
    print('Erreur au démarrage du serveur Python : ${result.stderr}');
  }
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thyro Care',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnboardingScreen(),
    );
  }
}
