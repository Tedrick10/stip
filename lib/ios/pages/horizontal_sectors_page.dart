// Dart: Properties & Libraries
import 'dart:io';
import 'dart:async';

// Flutter: Existing Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Flutter: External Libraries (Dependencies)
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
// import 'package:connectivity/connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:provider/provider.dart';

// Providers
import '../../theme_provider.dart';

// Pages
import '../../splash_page.dart';
import '../../no_internet_page.dart';

// Widgets
import '../widgets/drawer_widget.dart';

// HorizontalSectorsPage: StatelessWidget Class
class HorizontalSectorsPage extends StatefulWidget {
  // Static Final Class Properties
  static String title = "HORIZONTAL SECTORS";
  static String routeName = "/horizontal-sectors";

  // Constructor
  const HorizontalSectorsPage({Key? key}) : super(key: key);

  @override
  _HorizontalSectorsPageState createState() => _HorizontalSectorsPageState();
}

// _HorizontalSectorsPageState State Class
class _HorizontalSectorsPageState extends State<HorizontalSectorsPage> {
  // Static Class Properties
  static bool isStart = true;
  // Normal Class Properties
  late InAppWebViewController webView;
  String url = "";
  int scrollPosition = 0;
  double progress = 0;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // Private Class Properties
  bool _isLoading = true;
  bool _isConnectedInternet = false;

  // Final Class Properties
  final Connectivity _connectivity = Connectivity();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Future Class Methods
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    print("[home.page.dart: 91] => The connectivity result is $result.");
    if (result == ConnectivityResult.none && isStart == true) {
      print("This is the way 01");
      setState(() {
        _isLoading = true;
        _isConnectedInternet = false;
      });
    } else if (result != ConnectivityResult.none && isStart != true) {
      print("This is the way 02");
      webView.reload();
      setState(() {
        _isConnectedInternet = false;
      });
    } else {
      print("This is the way 03");
      setState(() {
        _isConnectedInternet = true;
      });
    }
  }

  // Lifecycle Hook Methods
  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Future Class Methods
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit the app.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                    color: Color.fromRGBO(30, 49, 110, 1),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: Color.fromRGBO(30, 49, 110, 1),
                  ),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  // Widget Class Properties
  Widget mainPage() {
    // Final: Method Properties
    final ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);

    // return WillPopScope(
    //   onWillPop: _onWillPop,
    //   child:
    return Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: Container(
      //   padding: const EdgeInsets.only(
      //     bottom: 60.0,
      //   ),
      //   child: (scrollPosition != 0)
      //       ? FloatingActionButton(
      //           child: const Icon(
      //             Icons.arrow_upward_rounded,
      //           ),
      //           onPressed: () {
      //             webView.scrollTo(
      //               x: 0,
      //               y: 0,
      //               animated: true,
      //             );
      //             setState(
      //               () {
      //                 scrollPosition = 0;
      //               },
      //             );
      //           },
      //         )
      //       : null,
      // ),
      body: SizedBox(
        // padding: const EdgeInsets.symmetric(
        //   // horizontal: 10.0,
        //   // vertical: 5.0,
        // ),
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  // url: Uri.parse("http://163.44.150.187"),
                  url: Uri.parse(
                      "https://www.servicetrade.gov.mm/horizontal-laws?Horizontal=1"),
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                  // ignore: unnecessary_null_comparison
                  if (webView != null) {
                    print("The webview is not null!");
                  }
                  print(
                    "[home.page.dart: 128] => The webview is $webView.",
                  );
                },
                onLoadStart: (InAppWebViewController controller, Uri? url) {
                  setState(() {
                    this.url = url.toString();
                    // this._isLoading = true;
                  });
                  print('Loading the page started!');
                },
                onLoadStop:
                    (InAppWebViewController controller, Uri? url) async {
                  await Future.delayed(
                    const Duration(
                      seconds: 3,
                    ),
                    () {
                      setState(() {
                        _isLoading = false;
                        this.url = url.toString();
                      });
                    },
                  );
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(
                    () {
                      this.progress = progress / 100;
                    },
                  );
                },
                onScrollChanged:
                    (InAppWebViewController controller, int x, int y) {
                  setState(
                    () {
                      scrollPosition = y;
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 50.0,
                ),
                decoration: BoxDecoration(
                  color: _themeProvider.getTheme
                      ? Colors.black87
                      : Colors.lightBlue,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                alignment: Alignment.bottomCenter,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            webView.canGoBack().then(
                              (value) {
                                if (value) {
                                  webView.goBack();
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "You are in home page",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.grey,
                                  );
                                }
                              },
                            );
                          },
                          icon: Icon(
                            (Platform.isIOS)
                                ? Icons.arrow_back_ios_outlined
                                : Icons.arrow_back_outlined,
                            // color: const Color.fromRGBO(30, 49, 110, 1),
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            webView.canGoForward().then(
                              (value) {
                                if (value) {
                                  webView.goForward();
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "No Forward History",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.grey,
                                  );
                                }
                              },
                            );
                          },
                          icon: Icon(
                            (Platform.isIOS)
                                ? Icons.arrow_forward_ios_outlined
                                : Icons.arrow_forward_outlined,
                            // color: const Color.fromRGBO(30, 49, 110, 1),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            Share.share(
                              url,
                            );
                          },
                          icon: const Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            webView.reload();
                            Fluttertoast.showToast(
                              msg: "Reloading",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.grey,
                            );
                          },
                          icon: const Icon(
                            Icons.replay_outlined,
                            // color: Color.fromRGBO(30, 49, 110, 1),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }

  // Build Method
  @override
  Widget build(BuildContext context) {
    // Final: Method Properties
    final ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);

    // Returning Widgets
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            width: 30.0,
            height: 30.0,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color:
                  _themeProvider.getTheme ? Colors.black87 : Colors.lightBlue,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.lightBlue),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // centerTitle: true,
        // title: Text(IOSHomePage.title),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        minimum: const EdgeInsets.only(top: 30.0),
        child: mainPage(),
        // child: (_isConnectedInternet)
        //     ? Stack(
        //         children: [
        //           mainPage(),
        //           // if (_isLoading == true) SplashPage(),
        //           // SplashPage()
        //         ],
        //       )
        //     : const NoInternetPage(),
      ),
    );
    ;
  }
}
