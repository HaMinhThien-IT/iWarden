library motion_toast;

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';

const Color successColor = ColorTheme.success;
const Color warningColor = Color(0xffFFC107);
const Color errorColor = Color(0xFFE01B00);
const Color infoColor = Color(0xFF230DA1);
const Color deleteColor = Color(0xFF62AECA);

/// Render the motion toast widget
class MotionToast extends StatefulWidget {
  @override
  State<MotionToast> createState() => _MotionToastState();

  /// Used to create a custom motion toast with given [icon], [description] and  [primaryColor]
  MotionToast({
    Key? key,
    required this.icon,
    required this.description,
    required this.primaryColor,
    this.title,
    this.width,
    this.height,
    this.constraints,
    this.iconSize = 40,
    this.enableAnimation = true,
    this.layoutOrientation = ToastOrientation.ltr,
    this.animationType = AnimationType.fromBottom,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.toastDuration = const Duration(
      seconds: 3,
    ),
    this.animationCurve = Curves.ease,
    this.position = MotionToastPosition.bottom,
    this.borderRadius = 20,
    this.onClose,
    this.dismissable = true,
    this.secondaryColor,
    this.backgroundType = BackgroundType.lighter,
    this.barrierColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
  }) : super(key: key) {
    _assertValidValues();
    motionToastType = MotionToastType.custom;
    iconType = IconType.materialDesign;
  }

  /// Render a success motion toast
  /// [primaryColor] is set to [successColor]
  /// [icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.SUCCESS]`
  /// or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.SUCCESS]`
  /// [description] is required
  ///
  /// the text style by default: `TextStyle(color: Colors.black)`
  MotionToast.success({
    Key? key,
    required this.description,
    this.title,
    this.iconType = IconType.materialDesign,
    this.width,
    this.height,
    this.constraints,
    this.iconSize = 40,
    this.enableAnimation = true,
    this.layoutOrientation = ToastOrientation.ltr,
    this.animationType = AnimationType.fromBottom,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.toastDuration = const Duration(
      seconds: 3,
    ),
    this.animationCurve = Curves.ease,
    this.position = MotionToastPosition.bottom,
    this.borderRadius = 20,
    this.onClose,
    this.dismissable = true,
    this.barrierColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
  }) : super(key: key) {
    motionToastType = MotionToastType.success;
    _assertValidValues();
    _initializeParameters();
  }

  /// Render a warning motion toast
  /// [primaryColor] is set to [warningColor]
  /// [icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.WARNING]`
  /// or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.WARNING]`
  /// [description] is required
  ///
  /// the text style by default: `TextStyle(color: Colors.black)`
  MotionToast.warning({
    Key? key,
    required this.description,
    this.title,
    this.iconType = IconType.materialDesign,
    this.width = 350,
    this.height = 80,
    this.constraints,
    this.iconSize = 40,
    this.enableAnimation = true,
    this.layoutOrientation = ToastOrientation.ltr,
    this.animationType = AnimationType.fromBottom,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.toastDuration = const Duration(
      seconds: 3,
    ),
    this.animationCurve = Curves.ease,
    this.position = MotionToastPosition.bottom,
    this.borderRadius = 20,
    this.onClose,
    this.dismissable = true,
    this.barrierColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
  }) : super(key: key) {
    motionToastType = MotionToastType.warning;
    _assertValidValues();
    _initializeParameters();
  }

  /// Render an error motion toast
  /// [primaryColor] is set to [errorColor]
  /// [icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.ERROR]`
  /// or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.ERROR]`
  /// [description] is required
  ///
  /// the text style by default: `TextStyle(color: Colors.black)`
  MotionToast.error({
    Key? key,
    required this.description,
    this.title,
    this.iconType = IconType.materialDesign,
    this.width = 350,
    this.height = 80,
    this.constraints,
    this.iconSize = 40,
    this.enableAnimation = true,
    this.layoutOrientation = ToastOrientation.ltr,
    this.animationType = AnimationType.fromBottom,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.toastDuration = const Duration(
      seconds: 3,
    ),
    this.animationCurve = Curves.ease,
    this.position = MotionToastPosition.bottom,
    this.borderRadius = 20,
    this.onClose,
    this.dismissable = true,
    this.barrierColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
  }) : super(key: key) {
    motionToastType = MotionToastType.error;
    _assertValidValues();
    _initializeParameters();
  }

  /// Render Info motion toast
  /// [primaryColor] is set to [infoColor]
  /// [icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.INFO]`
  /// or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.INFO]`
  /// [description] is required
  ///
  /// the text style by default: `TextStyle(color: Colors.black)`
  MotionToast.info({
    Key? key,
    required this.description,
    this.title,
    this.iconType = IconType.materialDesign,
    this.width = 350,
    this.height = 80,
    this.constraints,
    this.iconSize = 40,
    this.enableAnimation = true,
    this.layoutOrientation = ToastOrientation.ltr,
    this.animationType = AnimationType.fromBottom,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.toastDuration = const Duration(
      seconds: 3,
    ),
    this.animationCurve = Curves.ease,
    this.position = MotionToastPosition.bottom,
    this.borderRadius = 20,
    this.onClose,
    this.dismissable = true,
    this.barrierColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
  }) : super(key: key) {
    motionToastType = MotionToastType.info;
    _assertValidValues();
    _initializeParameters();
  }

  /// Render delete motion toast
  /// [primaryColor] is set to [deleteColor]
  /// [icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.DELETE]`
  /// or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.DELETE]`
  /// [description] is required
  ///
  /// the text style by default: `TextStyle(color: Colors.black)`
  MotionToast.delete({
    Key? key,
    required this.description,
    this.title,
    this.iconType = IconType.materialDesign,
    this.width = 350,
    this.height = 80,
    this.constraints,
    this.iconSize = 40,
    this.enableAnimation = true,
    this.layoutOrientation = ToastOrientation.ltr,
    this.animationType = AnimationType.fromBottom,
    this.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    this.toastDuration = const Duration(
      seconds: 3,
    ),
    this.animationCurve = Curves.ease,
    this.position = MotionToastPosition.bottom,
    this.borderRadius = 20,
    this.onClose,
    this.dismissable = true,
    this.barrierColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
  }) : super(key: key) {
    motionToastType = MotionToastType.delete;
    _assertValidValues();
    _initializeParameters();
  }

  /// initialize [icon] and [primaryColor] based on the selected [motionToastType]
  void _initializeParameters() {
    if (iconType == IconType.cupertino) {
      icon = motionToastIconsCupertino[motionToastType]!;
    } else {
      icon = motionToastIconsMD[motionToastType]!;
    }
    primaryColor = motionToastColors[motionToastType]!;
    secondaryColor = motionToastColors[motionToastType]!;
    backgroundType = BackgroundType.lighter;
  }

  /// assert valid values when creating a motion toast widget
  void _assertValidValues() {
    if (width != null || height != null) {
      assert(
        width != null && height != null,
        'You need to provide both width and height or use constraints attribute',
      );
    }
    assert(
      (position == MotionToastPosition.bottom &&
              animationType != AnimationType.fromTop) ||
          (position == MotionToastPosition.top &&
              animationType != AnimationType.fromBottom) ||
          (position == MotionToastPosition.center),
    );
  }

  /// the text widget used for description message
  final Widget description;

  /// The title of the motion toast
  /// if it's null it will not be rendered in the widget
  final Widget? title;

  /// The motion toast type possible values:
  /// ```dart
  /// {
  ///  sucess
  ///  error
  ///  warning
  ///  info
  ///  delete
  ///  custom
  /// }
  /// ```
  late final MotionToastType motionToastType;

  /// The motion toast icon, for types other than custom
  /// the icon will get the default type icon
  ///
  /// if [motionToastType] set to [MotionToastType.custom] the icon parameter is required
  late final IconData icon;

  /// The motion toast background color
  /// if `motionToastType == MOTION_TOAST_TYPE.CUSTOM` color parameter is required
  /// else the color will get the default type color from [motionToastColors]
  ///
  late final Color primaryColor;

  /// Color applied on the motion toast side widget (sidebar) and the icon
  /// if it's null secondary color will be the primary color
  /// can be customized when using the default constructor
  late final Color? secondaryColor;

  /// the type  of the background that will be applied on the motion toast content
  /// available values:
  /// - solid: the primary color will be applied as it is on the content background
  /// - transparent: an opacity will be added to the primary color
  /// - lighter: a white background added to the motion toast with little opacity added to the primary color
  late final BackgroundType backgroundType;

  /// The design type icon (Material design or Cupertino)
  /// if [motionToastType] set to [MOTION_TOAST_TYPE.CUSTOM] [iconType] will not be used
  /// possible values
  /// ```dart
  /// {
  /// MATERIAL_DESIGN,
  /// CUPERTINO
  /// }
  /// ```
  late final IconType? iconType;

  /// The motion toast width by default it's set to 250
  final double? width;

  /// define the height of the motion toast
  final double? height;

  /// The constraint of the motion toast to size itself to the content
  /// for responsive design
  ///
  /// If it's `null`, then [width] and [height] will be used as it is.
  final BoxConstraints? constraints;

  /// the motion toast icon size
  /// by default it's 40
  final double iconSize;

  /// disable or enable the heartbeat animation on the icon
  /// by default the animation is enabled
  final bool enableAnimation;

  /// The layout ToastOrientation (from right to left or from left to right)
  /// ```dart
  /// {
  /// LTR,
  /// RTL
  /// }
  /// ```
  final ToastOrientation layoutOrientation;

  /// The type of animation, by default it's [AnimationType.fromBottom]
  /// ```dart
  /// {
  /// FROM_BOTTOM,
  /// FROM_LEFT,
  /// FROM_RIGHT
  /// }
  /// ```
  final AnimationType animationType;

  /// the Duration of the toast animation
  /// by default it's 1.5 seconds
  final Duration animationDuration;

  /// How long the toast will be shown
  /// by default it's 3 seconds.
  final Duration toastDuration;

  /// The toast animation curve
  /// by default it's `Curves.ease`
  final Curve animationCurve;

  /// The position where the motion toast will be displayed
  /// possible values
  /// ```dart
  /// {
  /// CENTER,
  /// TOP,
  /// BOTTOM
  /// }
  /// ```
  final MotionToastPosition position;

  /// Define the border radius of the toast
  /// by default it's 20
  final double borderRadius;

  /// Function invoked when the toast is closed
  final Function? onClose;

  /// define whether the motion toast can be dismissed or not
  /// applied on bottom motion toast
  final bool dismissable;

  /// The barrier color applied to the dialog display
  /// by default the barrier is transparent [Colors.transparent]
  final Color barrierColor;

  ///padding added to the main widget motion taost
  ///by default the padding is set to 0
  final EdgeInsets padding;

  /// Display the created motion toast based on the [position] attribute
  /// [context]: the actual context of the application
  void show(BuildContext context) {
    switch (position) {
      case MotionToastPosition.center:
      case MotionToastPosition.top:
        Navigator.of(context).push(
          PageRouteBuilder<Widget>(
            fullscreenDialog: false,
            barrierColor: barrierColor,
            pageBuilder: (BuildContext context, _, __) => this,
            opaque: false,
            barrierDismissible: dismissable,
          ),
        );
        break;
      default:
        showModalBottomSheet(
          isDismissible: dismissable,
          backgroundColor: Colors.transparent,
          constraints: BoxConstraints(
            maxHeight: (height ?? constraints?.maxHeight ?? 100) * 1.3,
          ),
          barrierColor: barrierColor,
          context: context,
          builder: (_) => this,
        );
    }
  }
}

class _MotionToastState extends State<MotionToast>
    with TickerProviderStateMixin {
  late Animation<Offset> offsetAnimation;
  late AnimationController slideController;
  late Timer toastTimer;

  void _popCurrentToast() {
    if (mounted) {
      Navigator.of(context).pop();
      widget.onClose?.call();
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    toastTimer = Timer(
      widget.toastDuration,
      _popCurrentToast,
    );
  }

  /// initialize the animation that will be applied when displaying the toast
  ///  based on [this.widget.animationDuration], [this.widget.animationType] and [this.widge]
  ///
  void _initializeAnimation() {
    slideController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    var curveAnimation = CurvedAnimation(
      parent: slideController,
      curve: widget.animationCurve,
    );

    switch (widget.animationType) {
      case AnimationType.fromLeft:
        if (widget.position == MotionToastPosition.top) {
          offsetAnimation = Tween<Offset>(
            begin: const Offset(-0.3, 0.3),
            end: const Offset(0, 0.3),
          ).animate(curveAnimation);
        } else {
          offsetAnimation = Tween<Offset>(
            begin: const Offset(-0.3, -0.3),
            end: const Offset(0, -0.3),
          ).animate(curveAnimation);
        }
        break;
      case AnimationType.fromRight:
        if (widget.position == MotionToastPosition.top) {
          offsetAnimation = Tween<Offset>(
            begin: const Offset(0.5, 0.3),
            end: const Offset(0, 0.3),
          ).animate(curveAnimation);
        } else {
          offsetAnimation = Tween<Offset>(
            begin: const Offset(1.3, -0.3),
            end: const Offset(0, -0.3),
          ).animate(curveAnimation);
        }
        break;
      case AnimationType.fromTop:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(0, -0.3),
          end: const Offset(0, 0.3),
        ).animate(curveAnimation);
        break;
      default:
        offsetAnimation = Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, -0.3),
        ).animate(curveAnimation);
    }

    /// ! To support Flutter < 3.0.0
    /// This allows a value of type T or T?
    /// to be treated as a value of type T?.
    ///
    /// We use this so that APIs that have become
    /// non-nullable can still be used with `!` and `?`
    /// to support older versions of the API as well.
    T? _ambiguate<T>(T? value) => value;

    _ambiguate(WidgetsBinding.instance)?.addPostFrameCallback(
      (_) => slideController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.dismissable ? _popCurrentToast : null,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: widget.padding,
            child: _buildToast(),
          ),
        ),
      ),
    );
  }

  Widget _buildToast() {
    switch (widget.position) {
      case MotionToastPosition.top:
        return _renderTopMotionToast();
      case MotionToastPosition.center:
        return _renderCenterMotionToast();
      case MotionToastPosition.bottom:
        return _renderBottomMotionToast();
    }
  }

  /// Create a bottom motion toast with all the given attributes
  Widget _renderBottomMotionToast() {
    return Center(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: widget.height,
          width: widget.width,
          constraints: widget.height == null && widget.width == null
              ? widget.constraints ??
                  BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                    minWidth: 200,
                    maxHeight: 100,
                  )
              : null,
          child: SlideTransition(
            position: offsetAnimation,
            child: _buildMotionToast(),
          ),
        ),
      ),
    );
  }

  /// render center displayed motion toast with all the given attributes
  Widget _renderCenterMotionToast() {
    return Center(
      child: Container(
        height: widget.height,
        width: widget.width,
        constraints: widget.height == null && widget.width == null
            ? widget.constraints ??
                BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                  minWidth: 200,
                  maxHeight: 100,
                )
            : null,
        child: _buildMotionToast(),
      ),
    );
  }

  /// render a top positionned motion toast with all the given attributes
  Widget _renderTopMotionToast() {
    return Center(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: widget.height,
          width: widget.width,
          constraints: widget.height == null && widget.width == null
              ? widget.constraints ??
                  BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                    minWidth: 200,
                    maxHeight: 100,
                  )
              : null,
          child: SlideTransition(
            position: offsetAnimation,
            child: _buildMotionToast(),
          ),
        ),
      ),
    );
  }

  Widget _buildMotionToast() {
    return MotionToastBackground(
      backgroundColor: widget.primaryColor,
      borderRadius: widget.borderRadius,
      backgroundType: widget.backgroundType,
      child: MotionToastContent(
        color: widget.secondaryColor ?? widget.primaryColor,
        description: widget.description,
        icon: widget.icon,
        iconSize: widget.iconSize,
        radius: widget.borderRadius,
        title: widget.title,
        withAnimation: widget.enableAnimation,
        isReversed: widget.layoutOrientation == ToastOrientation.rtl,
      ),
    );
  }

  @override
  void dispose() {
    slideController.dispose();
    toastTimer.cancel();
    super.dispose();
  }
}

const motionToastColors = {
  MotionToastType.success: successColor,
  MotionToastType.error: errorColor,
  MotionToastType.warning: warningColor,
  MotionToastType.info: infoColor,
  MotionToastType.delete: deleteColor
};

/// Material Icons for the different types of motion toast.
const motionToastIconsMD = {
  MotionToastType.success: Icons.check_circle_outline,
  MotionToastType.error: Icons.error,
  MotionToastType.warning: Icons.warning,
  MotionToastType.info: Icons.info,
  MotionToastType.delete: Icons.delete
};

/// Cupertino Icons for the different types of motion toast.
const motionToastIconsCupertino = {
  MotionToastType.success: CupertinoIcons.checkmark_alt_circle,
  MotionToastType.error: CupertinoIcons.exclamationmark_circle_fill,
  MotionToastType.warning: CupertinoIcons.exclamationmark_triangle_fill,
  MotionToastType.info: CupertinoIcons.info_circle_fill,
  MotionToastType.delete: CupertinoIcons.delete_simple,
};

/// Type of motion toast to show.
enum MotionToastType { success, error, warning, info, delete, custom }

/// The design of the toast.
enum IconType { materialDesign, cupertino }

/// Text direction used to determine which direction to draw the toast
enum ToastOrientation { ltr, rtl }

/// The fade in animation direction of the toast.
enum AnimationType { fromBottom, fromLeft, fromRight, fromTop }

/// The position of the toast on the screen.
enum MotionToastPosition { center, bottom, top }

/// The appearance of the background of the toast.
enum BackgroundType { transparent, solid, lighter }

class MotionToastBackground extends StatelessWidget {
  /// Border radius of the background.
  final double borderRadius;

  /// The color of the background.
  final Color backgroundColor;

  /// Widget to render on top of the background.
  final Widget child;

  /// Appearance type of the background.
  final BackgroundType backgroundType;

  /// Creates a widget that renders the child
  /// on top of customizable background.
  const MotionToastBackground({
    Key? key,
    required this.borderRadius,
    required this.backgroundColor,
    required this.child,
    required this.backgroundType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (backgroundType == BackgroundType.lighter) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        child: _renderWidgetChild(opacity: 0.4),
      );
    }
    return _renderWidgetChild();
  }

  Widget _renderWidgetChild({double opacity = 0.8}) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundType == BackgroundType.solid
            ? backgroundColor
            : backgroundColor.withOpacity(opacity),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      child: child,
    );
  }
}

class MotionToastSideBar extends StatelessWidget {
  /// The color of the background.
  final Color color;

  /// Radius of the toast side bar.
  final double radius;

  const MotionToastSideBar({
    Key? key,
    required this.color,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    );
  }
}

enum ContentLayoutType { normal, reversed }

class MotionToastContent extends StatelessWidget {
  MotionToastContent({
    Key? key,
    required this.color,
    required this.description,
    required this.icon,
    required this.iconSize,
    required this.radius,
    required this.title,
    required this.withAnimation,
    bool isReversed = false,
  }) : super(key: key) {
    _contentLayoutType = ContentLayoutType.values[isReversed ? 1 : 0];
  }

  /// The flow of the contents in the motion toast.
  late final ContentLayoutType _contentLayoutType;

  /// The color of the toast background.
  final Color color;

  /// Border radius of the toast.
  final double radius;

  /// Size of the toast icon.
  final double iconSize;

  /// Icon to display on the toast.
  final IconData icon;

  /// Set to `true` to show animation of the toast.
  final bool withAnimation;

  /// Title [Text] widget of the toast.
  final Widget? title;

  /// Description [Text] widget of the toast.
  final Widget description;

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}

class Seperator extends StatelessWidget {
  // The distance between the contents of the toast.
  final double size;

  const Seperator.double(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
    );
  }
}

class MotionToastIcon extends StatelessWidget {
  /// Size of the icon.
  final double iconSize;

  /// Set to `true` to show animation of the toast.
  final bool withAnimation;

  /// Icon to display on the toast.
  final IconData icon;

  /// The color of the toast icon.
  final Color color;

  const MotionToastIcon({
    Key? key,
    required this.iconSize,
    required this.color,
    required this.icon,
    required this.withAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: iconSize,
      child: withAnimation
          ? HeartBeatIcon(
              icon: icon,
              color: color,
              size: iconSize,
            )
          : Icon(
              icon,
              color: color,
              size: iconSize,
            ),
    );
  }
}

class HeartBeatIcon extends StatefulWidget {
  /// The icon that will be animated
  final IconData icon;

  /// The icon color
  final Color color;

  /// The default icon size
  final double size;

  /// Creates a stateful widget that renders a heartbeat animated icon
  const HeartBeatIcon({
    Key? key,
    required this.icon,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  State<HeartBeatIcon> createState() => _HeartBeatIconState();
}

class _HeartBeatIconState extends State<HeartBeatIcon>
    with TickerProviderStateMixin {
  late Animation _heartAnimation;
  late AnimationController _heartAnimationController;

  @override
  void initState() {
    super.initState();
    _heartAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _heartAnimation = Tween(
      begin: widget.size * 0.7,
      end: widget.size * 0.85,
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

  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.icon,
      color: widget.color,
      size: _heartAnimation.value,
    );
  }

  @override
  void dispose() {
    _heartAnimationController.dispose();
    super.dispose();
  }
}
