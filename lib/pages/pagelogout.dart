import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> showLogoutDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          "تأكيد تسجيل الخروج",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "هل تريد تسجيل الخروج؟",
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // إلغاء
            },
            child: const Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () async {
              await Supabase.instance.client.auth.signOut();
              Navigator.pop(context); // أغلق الرسالة
            },
            child: const Text("تسجيل الخروج"),
          ),
        ],
      );
    },
  );
}
