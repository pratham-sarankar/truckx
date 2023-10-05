import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:transport/app/data/repositories/chat_repository.dart';
import 'package:transport/app/data/repositories/consignments_repository.dart';
import 'package:transport/app/data/repositories/place_repository.dart';
import 'package:transport/app/data/repositories/user_repository.dart';
import 'package:transport/app/data/repositories/vehicle_repository.dart';
import 'package:transport/app/data/services/auth_service.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthService());

  //Lazy Put Repositories
  Get.create<VehicleRepository>(() => VehicleRepository());
  Get.create<ConsignmentRepository>(() => ConsignmentRepository());
  Get.create<ChatRepository>(() => ChatRepository());
  Get.create<UserRepository>(() => UserRepository());
  Get.create<PlaceRepository>(() => PlaceRepository());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 20,
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: true,
          selectedItemColor: Colors.black.withOpacity(0.75),
          unselectedItemColor: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(4),
            overlayColor: MaterialStatePropertyAll(Colors.blue.shade400),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
            ),
          ),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          space: 0,
          color: Colors.grey.shade300,
        ),
        listTileTheme: const ListTileThemeData(
          minLeadingWidth: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.blue,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
        ),
      ),
    ),
  );
}
