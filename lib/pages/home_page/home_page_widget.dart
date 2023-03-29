//library that has color
import 'package:object_3d/object_3d.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';
import 'package:flutter_cube/flutter_cube.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  //intializer for obj
  Object betterboard = Object(
    fileName: "assets/betterboard.obj", //3d model of a board
    scale: Vector3(2, 2, 2),
    lighting: true,
  );
  Object board = Object(
    // 2d model of a board (cant see other side)
    fileName: "assets/board.obj",
    scale: Vector3(2, 2, 2),
  );
  Object cylinder = Object(
    fileName: "assets/cylinder.obj", // file path
    scale: Vector3(.5, .5, .5), // size
    position: Vector3(0, .45, 0), // postion
    lighting: true,
  );

  // object 3d stuff
  // Object3D cylinder2 = Object3D(
  //   color: Colors.blue,
  //   size: Size(100, 100),
  //   path: "assets/smallcylinder.obj",
  // );
  // Object3D board3d = Object3D(
  //   color: Colors.redAccent,
  //   size: Size(0, 0),
  //   path: "assets/board.obj",
  // );

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Cylinder and Board',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.red,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-0.04, -0.52),
                child: Container(child: Cube(
                  onSceneCreated: (Scene scene) {
                    scene.world.add(betterboard);
                    scene.world.add(cylinder);
                    scene.camera.zoom = 2;
                    scene.light.setColor(Colors.blue, 1, 1, 1);
                  },
                )),
              ),
              //Code from a different library that has color.
              // Align(
              //   alignment: AlignmentDirectional(0.0, -0.22),
              //   child: Row(
              //     children: [Container(child: board3d)],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
