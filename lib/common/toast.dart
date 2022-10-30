import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/theme/color.dart';

enum CherryType {
  success,
  warning,
  error,
  info,
  custom,
}

enum Position {
  top,
  bottom,
}

enum AnimationType {
  fromTop,
  fromLeft,
  fromRight,
}

enum ToastLayout {
  ltr,
  rtl,
}

const Color errorColor = Color(0xFFE01B00);
const Color errorColorLight = Color.fromRGBO(224, 27, 0, 0.1);
const Color successColor = ColorTheme.success;
const Color lightSuccess = ColorTheme.lightSuccess;
const Color infoColor = Color(0xFF4E5CB9);
const Color warningColor = Color(0xffFC9F00);

// ignore: must_be_immutable
class CherryToast extends StatefulWidget {
  CherryToast({
    Key? key,
    required this.title,
    required this.icon,
    required this.themeColor,
    required this.background,
    required this.color,
    this.iconColor = Colors.black,
    this.action,
    this.actionHandler,
    this.description,
    this.displayTitle = true,
    this.toastPosition = Position.top,
    this.animationDuration = const Duration(
      milliseconds: 700,
    ),
    this.animationCurve = Curves.ease,
    this.animationType = AnimationType.fromLeft,
    this.autoDismiss = true,
    this.toastDuration = const Duration(
      milliseconds: 1990,
    ),
    this.layout = ToastLayout.ltr,
    this.displayCloseButton = true,
    this.borderRadius = 20,
    this.displayIcon = true,
    this.enableIconAnimation = true,
    this.iconSize = 20,
  }) : super(key: key);

  CherryToast.success(
      {Key? key,
      required this.title,
      this.action,
      this.actionHandler,
      this.description,
      this.displayTitle = true,
      this.toastPosition = Position.top,
      this.animationDuration = const Duration(
        milliseconds: 700,
      ),
      this.animationCurve = Curves.ease,
      this.animationType = AnimationType.fromLeft,
      this.autoDismiss = true,
      this.toastDuration = const Duration(
        milliseconds: 1990,
      ),
      this.layout = ToastLayout.ltr,
      this.displayCloseButton = true,
      this.borderRadius = 20,
      this.displayIcon = true,
      this.enableIconAnimation = true,
      this.color = successColor,
      this.background = lightSuccess})
      : super(key: key) {
    icon = SvgPicture.asset("assets/svg/IconCompleteActive.svg");
    _initializeAttributes(successColor);
  }

  CherryToast.error(
      {Key? key,
      required this.title,
      this.action,
      this.actionHandler,
      this.description,
      this.displayTitle = true,
      this.toastPosition = Position.top,
      this.animationDuration = const Duration(
        milliseconds: 700,
      ),
      this.animationCurve = Curves.ease,
      this.animationType = AnimationType.fromLeft,
      this.autoDismiss = true,
      this.toastDuration = const Duration(
        milliseconds: 1990,
      ),
      this.layout = ToastLayout.ltr,
      this.displayCloseButton = true,
      this.borderRadius = 20,
      this.displayIcon = true,
      this.color = errorColor,
      this.enableIconAnimation = true,
      this.background = errorColorLight})
      : super(key: key) {
    icon = SvgPicture.asset("assets/svg/IconErrorToast.svg");
    _initializeAttributes(errorColor);
  }

  CherryToast.warning(
      {Key? key,
      required this.title,
      this.action,
      this.actionHandler,
      this.description,
      this.color = errorColor,
      this.displayTitle = true,
      this.toastPosition = Position.top,
      this.animationDuration = const Duration(
        milliseconds: 700,
      ),
      this.animationCurve = Curves.ease,
      this.animationType = AnimationType.fromLeft,
      this.autoDismiss = true,
      this.toastDuration = const Duration(
        milliseconds: 1990,
      ),
      this.layout = ToastLayout.ltr,
      this.displayCloseButton = true,
      this.borderRadius = 20,
      this.displayIcon = true,
      this.enableIconAnimation = true,
      this.background = ColorTheme.lightSuccess})
      : super(key: key) {
    icon = SvgPicture.asset("assets/svg/IconComplete2.svg");
    _initializeAttributes(warningColor);
  }

  CherryToast.info(
      {Key? key,
      required this.title,
      this.action,
      this.actionHandler,
      this.description,
      this.color = errorColor,
      this.displayTitle = true,
      this.toastPosition = Position.top,
      this.animationDuration = const Duration(
        milliseconds: 700,
      ),
      this.animationCurve = Curves.ease,
      this.animationType = AnimationType.fromLeft,
      this.autoDismiss = true,
      this.toastDuration = const Duration(
        milliseconds: 1990,
      ),
      this.layout = ToastLayout.ltr,
      this.displayCloseButton = true,
      this.borderRadius = 20,
      this.displayIcon = true,
      this.enableIconAnimation = true,
      this.background = ColorTheme.lightSuccess})
      : super(key: key) {
    icon = SvgPicture.asset("assets/svg/IconComplete2.svg");
    _initializeAttributes(infoColor);
  }

  void _initializeAttributes(Color color) {
    themeColor = color;
    iconColor = color;
    iconSize = 20;
  }

  ///Text widget displayed as a title in the toast
  ///required parameter for all toast types
  final Text title;

  ///Text widget displayed as a description in the toast
  final Text? description;

  ///THe action button displayed below description
  ///by default there's no action added
  final Text? action;

  ///indicates whether display or not the title
  ///
  final bool displayTitle;

  ///the toast icon, it's required when using the default constructor
  ///
  late Widget icon;

  ///the Icon color
  ///this parameter is only available on the default constructor
  ///for the built-in themes the color  will be set automatically
  late Color iconColor;

  ///the icon size
  ///by default is 20
  ///this parameter is available in default constructor
  late double iconSize;

  ///the toast display postion, possible values
  ///```dart
  ///{
  ///top,
  ///bottom
  ///}
  ///```
  final Position toastPosition;

  ///The color that will be applied on the circle behind the icon
  ///for better rendering the action button must have the same color
  ///
  late Color themeColor;

  ///the function invoked when clicking on the action button
  ///
  final Function? actionHandler;

  ///The duration of the animation by default it's 1.5 seconds
  ///
  final Duration animationDuration;

  ///the animation curve by default it's set to `Curves.ease`
  ///
  final Cubic animationCurve;

  ///The animation type applied on the toast
  ///```dart
  ///{
  ///fromTop,
  ///fromLeft,
  ///fromRight
  ///}
  ///```
  final AnimationType animationType;

  ///indicates whether the toast will be hidden automatically or not
  ///
  final bool autoDismiss;

  ///the duration of the toast if [autoDismiss] is true
  ///by default it's 3 seconds
  ///
  final Duration toastDuration;

  ///the layout of the toast
  ///```dart
  ///{
  ///ltr,
  ///rtl
  ///}
  ///```
  final ToastLayout layout;

  ///Display / Hide the close button icon
  ///by default it's true
  final bool displayCloseButton;

  ///define the border radius applied on the toast
  ///by default it's 20
  ///
  final double borderRadius;

  ///Define whether the icon will be  rendered or not
  ///
  final bool displayIcon;

  ///Define wether the animation on the icon will be rendered or not
  ///
  final bool enableIconAnimation;
  final Color background;
  final Color color;

  ///Display the created cherry toast
  ///[context] the context of the application
  ///
  void show(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        fullscreenDialog: false,
        barrierColor: Colors.transparent,
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (context, _, __) => GestureDetector(
          onTap: Navigator.of(context).pop,
          child: SafeArea(
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Column(
                mainAxisAlignment: toastPosition == Position.bottom
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: this,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  _CherryToastState createState() => _CherryToastState();
}

class _CherryToastState extends State<CherryToast>
    with TickerProviderStateMixin {
  late Animation<Offset> offsetAnimation;
  late AnimationController slideController;
  late BoxDecoration toastDecoration;
  Timer? autoDismissTimer;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    toastDecoration = BoxDecoration(
      color: widget.background,
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );
    if (widget.autoDismiss) {
      autoDismissTimer = Timer(widget.toastDuration, () {
        slideController.reverse();
        Timer(widget.animationDuration, () {
          Navigator.maybePop(context);
        });
      });
    }
  }

  @override
  void dispose() {
    autoDismissTimer?.cancel();
    slideController.dispose();
    super.dispose();
  }

  ///Initialize animation parameters [slideController] and [offsetAnimation]
  void _initAnimation() {
    slideController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    switch (widget.animationType) {
      case AnimationType.fromLeft:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(-2, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: widget.animationCurve,
          ),
        );
        break;
      case AnimationType.fromRight:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(2, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: widget.animationCurve,
          ),
        );
        break;
      case AnimationType.fromTop:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(0, -2),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: widget.animationCurve,
          ),
        );
        break;
      default:
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      slideController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.layout == ToastLayout.ltr) {
      return _renderLeftLayoutToast(context);
    } else {
      return _renderRightLayoutToast(context);
    }
  }

  ///render a left layout toast if [this.widget.layout] set to LTR
  ///
  Widget _renderLeftLayoutToast(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: widget.toastPosition == Position.top
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          SlideTransition(
            position: offsetAnimation,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.borderRadius),
                bottomLeft: Radius.circular(widget.borderRadius),
              ),
              child: Container(
                decoration: toastDecoration,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(width: 2, color: widget.color))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            crossAxisAlignment: widget.description == null &&
                                    widget.action == null
                                ? CrossAxisAlignment.center
                                : CrossAxisAlignment.start,
                            children: [
                              widget.displayIcon
                                  ? CherryToastIcon(
                                      color: widget.themeColor,
                                      icon: widget.icon,
                                      iconSize: widget.iconSize,
                                      iconColor: widget.iconColor,
                                      enableAnimation:
                                          widget.enableIconAnimation,
                                    )
                                  : Container(),
                              _renderToastContent(),
                            ],
                          ),
                        ),
                        widget.displayCloseButton
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  right: 10,
                                ),
                                child: _renderCloseButton(context),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///render a right layout toast if [this.widget.layout] set to RTL
  ///
  Column _renderRightLayoutToast(BuildContext context) {
    return Column(
      mainAxisAlignment: widget.toastPosition == Position.top
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        SlideTransition(
          position: offsetAnimation,
          child: Container(
            decoration: toastDecoration,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.displayCloseButton
                      ? Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                          ),
                          child: _renderCloseButton(context),
                        )
                      : Container(),
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment:
                          widget.description == null && widget.action == null
                              ? CrossAxisAlignment.center
                              : CrossAxisAlignment.start,
                      children: [
                        _renderToastContent(),
                        CherryToastIcon(
                          color: widget.themeColor,
                          icon: widget.icon,
                          iconSize: widget.iconSize,
                          iconColor: widget.iconColor,
                          enableAnimation: widget.enableIconAnimation,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// render the close button icon with a clickable  widget that
  /// will hide the toast
  ///
  InkWell _renderCloseButton(BuildContext context) {
    return InkWell(
      onTap: () {
        slideController.reverse();
        autoDismissTimer?.cancel();
        Timer(
          widget.animationDuration,
          () {
            Navigator.pop(context);
          },
        );
      },
      child: Icon(
        Icons.close,
        color: Colors.grey[500],
        size: 15,
      ),
    );
  }

  ///render the toast content (Title, Description and Action)
  ///
  Expanded _renderToastContent() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: widget.layout == ToastLayout.ltr
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            widget.displayTitle ? widget.title : Container(),
            widget.description == null
                ? Container()
                : Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      widget.description!
                    ],
                  ),
            widget.action != null
                ? Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          widget.actionHandler?.call();
                        },
                        child: widget.action,
                      )
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

class CherryToastIcon extends StatefulWidget {
  ///the color that will be applied on the circle behind the icon
  ///(required)
  final Color color;

  ///The toast icon widget (required)
  ///
  final Widget icon;

  ///the size of the icon (required)
  ///
  final double iconSize;

  ///the icon color (required)
  final Color iconColor;

  ///define wether the animation will be applied on the icon or not
  ///
  final bool enableAnimation;

  const CherryToastIcon({
    Key? key,
    required this.color,
    required this.icon,
    required this.iconSize,
    required this.iconColor,
    required this.enableAnimation,
  }) : super(key: key);

  @override
  _CherryToastIconState createState() => _CherryToastIconState();
}

class _CherryToastIconState extends State<CherryToastIcon>
    with TickerProviderStateMixin {
  late Animation _heartAnimation;
  late AnimationController _heartAnimationController;

  @override
  void initState() {
    super.initState();
    if (widget.enableAnimation) {
      _heartAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 1200,
        ),
      );
      _heartAnimation = Tween(
        begin: widget.iconSize * 0.7,
        end: widget.iconSize * 0.95,
      ).animate(
        CurvedAnimation(
          curve: Curves.bounceOut,
          parent: _heartAnimationController,
        ),
      );

      _heartAnimationController.addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _heartAnimationController.repeat();
        }
      });
      _heartAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.icon,
    );
  }

  @override
  void dispose() {
    if (widget.enableAnimation) {
      _heartAnimationController.dispose();
    }
    super.dispose();
  }
}
