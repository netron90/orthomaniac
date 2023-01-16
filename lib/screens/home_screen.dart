import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:orthomaniac/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:orthomaniac/screens/question_screen.dart';
import 'package:orthomaniac/services/ad_helper.dart';

class OrthoManiacApp extends StatefulWidget {
  const OrthoManiacApp({Key? key}) : super(key: key);

  @override
  State<OrthoManiacApp> createState() => _OrthoManiacAppState();
}

class _OrthoManiacAppState extends State<OrthoManiacApp> {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              _interstitialAd?.dispose();
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
   
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  Future<dynamic> resultEnd(BuildContext context) {
    _loadInterstitialAd();
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return QuestionScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/logo1.png'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  children: [
                    Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 2, color: kPrimaryColorApp),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 35.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColorApp, width: 1.0),
                      ),
                      child: Text(
                        kAppHomeText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Heebo',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async{
                  print('Begin Statement');
                  
                    var data = await resultEnd(context);
                print(data);

                  if (_interstitialAd != null) {
                    _interstitialAd?.show();
                  } else {}
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 28.0),
                  child: Text(
                    'COMMENCER',
                    style: TextStyle(
                        fontFamily: 'Heebo', fontWeight: FontWeight.w700),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColorApp,
                ),
              ),
              if (_bannerAd != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: _bannerAd!.size.width.toDouble(),
                    height: _bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd!),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }
}
