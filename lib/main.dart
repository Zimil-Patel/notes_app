import 'package:flutter/material.dart';
import 'package:notes_app/provider/note_provider.dart';
import 'package:notes_app/services/database_service.dart';
import 'package:notes_app/theme/app_theme.dart';
import 'package:notes_app/view/home%20page/home_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.databaseService.createDatabase();

  runApp(NoteManager());
}

class NoteManager extends StatelessWidget {
  const NoteManager({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: NoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: HomePage(),
      ),
    );
  }
}
