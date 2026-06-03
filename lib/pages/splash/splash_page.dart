import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travel_app/pages/register/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  bool _isNavigating = false; // ikki marta o'tishni oldini oladi

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkInternet();
    });
  }

  Future<void> _checkInternet() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<ConnectivityResult> result = await Connectivity().checkConnectivity();
    if (result.contains(ConnectivityResult.none)) {
      _showNoInternetDialog();
    } else {
      _goHome();
    }
  }

  void _goHome() {
    if (mounted && !_isNavigating) {
      _isNavigating = true; // faqat bir marta o'tsin
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingPage()),
      );
    }
  }

  void _showNoInternetDialog() {
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Internet yo\'q'),
        content: const Text('Iltimos, internet aloqasini tekshiring.'),
        actions: [
          TextButton(
            onPressed: () async {
              final List<ConnectivityResult> result = await Connectivity().checkConnectivity();
              if (!result.contains(ConnectivityResult.none)) {
                if (ctx.mounted) Navigator.pop(ctx);
                _goHome();
              }
            },
            child: const Text('Qayta urinish'),
          ),
        ],
      ),
    );

    // internet yoqilsa avtomatik
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      if (!result.contains(ConnectivityResult.none)) {
        if (mounted && Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        _goHome();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Row(
            mainAxisAlignment: .center,
            children: [
              Image.asset("assets/logo/img.png",width: 40,),
              SizedBox(width: 10,),
              Text("TRALTO",style: GoogleFonts.aBeeZee(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)
            ],
          ),
          Positioned(
            bottom: 60,
              child: LoadingAnimationWidget.hexagonDots(color: Colors.white, size: 50))
        ],
      ),
    );
  }
}
