import 'package:travel_ease/AuthScreens/SplashScreen.dart';

import 'constants.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //     //  options:  const FirebaseOptions(
  //     //   apiKey:'AIzaSyBRwCx_7VDQjaOY2pKEoaGEDQxDoPReD2E', // Your apiKey
  //     //   appId: '1:773400151234:web:7cce499908c0158539a75b',
  //     //   messagingSenderId: '773400151234',// Your messagingSenderId
  //     //   projectId: 'pak-riders',
  //     // ),

  //     );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}
