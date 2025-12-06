import 'package:clint_ledger/widgets/botton.dart';
import 'package:clint_ledger/widgets/textfild.dart';
import 'package:clint_ledger/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool isLogin = true;
  bool loading = false;
  String errorMessage = "";

  void submit() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        (!isLogin && nameController.text.isEmpty)) {
      setState(() => errorMessage = "يرجى تعبئة جميع الحقول");
      return;
    }

    setState(() {
      loading = true;
      errorMessage = "";
    });

    try {
      final supa = Supabase.instance.client;

      if (isLogin) {
        /// ---------------- Login ----------------
        await supa.auth.signInWithPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        // الانتقال للصفحة الرئيسية:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        /// ---------------- Signup ----------------
        final res = await supa.auth.signUp(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (res.user == null) throw "فشل إنشاء الحساب";

        /// إضافة الاسم لجدول profiles
        await supa.from("profiles").insert({
          "id": res.user!.id,
          "name": nameController.text.trim(),
        });
      }

      setState(() => loading = false);
    } catch (e) {
      setState(() {
        loading = false;
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset("assets/images/log.png", height: 130),
              const SizedBox(height: 20),
              Text(
                isLogin ? "تسجيل دخول" : "إنشاء حساب",
                style: const TextStyle(
                  fontSize: 26,
                  color: Color(0xff073c69),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              if (!isLogin)
                Column(
                  children: [
                    CustomInputField(
                      controller: nameController,
                      label: "الاسم",
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              CustomInputField(
                controller: emailController,
                label: "البريد الإلكتروني",
              ),
              const SizedBox(height: 16),
              CustomInputField(
                controller: passwordController,
                label: "كلمة المرور",
                obscure: true,
              ),
              const SizedBox(height: 16),
              if (errorMessage.isNotEmpty)
                Text(errorMessage, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 20),
              MainButton(
                title: isLogin ? "تسجيل الدخول" : "إنشاء حساب",
                loading: loading,
                onPressed: submit,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLogin = !isLogin;
                        errorMessage = "";
                      });
                    },
                    child: Text(
                      isLogin ? " إنشاء حساب" : "تسجيل دخول",
                      style: const TextStyle(
                        color: Color(0xff073c69),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    isLogin ? "لا تملك حساب؟" : "لديك حساب؟",
                    style: const TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
