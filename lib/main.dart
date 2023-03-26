import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/Pages/calendarpage/components/calendar.dart';
import 'package:health_hub/Pages/listpage/components/ListAndPacientDetails.dart';
import 'package:health_hub/Pages/login/login_page.dart';
import 'package:health_hub/Pages/sidePages/about.dart';
import 'package:health_hub/Pages/sidePages/contact.dart';
import 'package:health_hub/main_page.dart';
import 'package:health_hub/profileDecider.dart';
import 'package:health_hub/Pages/signin/pending.dart';
import 'package:health_hub/Pages/signin/signin_medic/signin_page.dart';
import 'package:health_hub/Pages/firstpage/first_page.dart';
import 'package:health_hub/Pages/signin/signin_user/cont_creat.dart';
import 'package:health_hub/Pages/userprofile/main_userprofile.dart';
import 'package:health_hub/dynamic_link.dart';
import 'package:health_hub/firebase_options.dart';
import 'Pages/calendarpage/main_calendar.dart';
import 'Pages/medicprofile/main_medicprofile.dart';
import 'Pages/signin/signin_user/signin_page_user.dart';
import 'Pages/listpage/main_listpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloudinary_dart/cloudinary.dart';
import 'package:cloudinary_dart/transformation/transformation.dart';
import 'package:flutter/material.dart';
import 'package:cloudinary_dart/transformation/effect/effect.dart';
import 'package:cloudinary_dart/transformation/resize/resize.dart';

var cloudinary = Cloudinary.fromStringUrl(
    'cloudinary://977979647278431:9YSUkAPnadZ_5qgGVezbONeLfkM@deliqz1t8');

void main() async {
  cloudinary.config.urlConfig.secure = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //final PendingDynamicLinkData? _initialLink =
  //await FirebaseDynamicLinks.instance.getInitialLink();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState

    initDynamicLinks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == '/profile') {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => ProfileDecider());
        }
        if (settings.name == '/list') {
          return PageRouteBuilder(
              settings: settings, pageBuilder: (_, __, ___) => MainListPage());
        }
        if (settings.name == '/calendar') {
          return PageRouteBuilder(
              settings: settings, pageBuilder: (_, __, ___) => CalendarPage());
        }
        return null;
      },
      routes: {
        '/': (context) => FirstPage(),
        '/login': (context) => LoginPage(),
        '/signin/user': (BuildContext context) => SignInPage_user(),
        '/signin/medic': (context) => SignInPage_medic(),
        //'/medicprofile': (context) => MainMedicProfile(),
        '/pending': (context) => Pending(),
        '/signin/user/contCreat': (context) => ContCreat(),
        //'/list': (context) => MainListPage(),
        //'/userprofile': (context) => MainProfile(),
        //'/medicprofile': (context) => MainMedicProfile(),
        //'/calendar': (context) => CalendarPage(),
        //'/profile': (context) => ProfileDecider(),
        '/main': (context) => MainPage(),
        '/about': (context) => AboutPage(),
        '/contact': (context) => ContactPage()
      },
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
            TargetPlatform.values,
            value: (dynamic _) =>
                const FadeUpwardsPageTransitionsBuilder(), //applying old animation
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

void initDynamicLinks() async {
  FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
    final Uri? deeplink = dynamicLinkData.link;
    if (deeplink != null) {
      print("deeplink data " + deeplink.queryParameters.values.first);
      Get.toNamed('/signin/user');
    }
  }).onError((error) {
    // Handle errors
  });
}
