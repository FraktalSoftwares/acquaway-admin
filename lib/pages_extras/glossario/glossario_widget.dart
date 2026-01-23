import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'glossario_model.dart';
export 'glossario_model.dart';

class GlossarioWidget extends StatefulWidget {
  const GlossarioWidget({super.key});

  static String routeName = 'glossario';
  static String routePath = '/glossario';

  @override
  State<GlossarioWidget> createState() => _GlossarioWidgetState();
}

class _GlossarioWidgetState extends State<GlossarioWidget> {
  late GlossarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlossarioModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(
              24.0,
              24.0,
              24.0,
              0.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Logo_(3).png',
                              width: 183.6,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      FlutterFlowWebView(
                        content: 'https://acquaway.lovable.app/glossario',
                        bypass: false,
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.9,
                        verticalScroll: false,
                        horizontalScroll: false,
                      ),
                    ]
                    .divide(const SizedBox(height: 24.0))
                    .addToEnd(const SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
