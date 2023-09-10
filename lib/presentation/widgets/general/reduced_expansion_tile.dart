import 'package:flutter/material.dart';

const Duration _kExpand = Duration(milliseconds: 200);


class ReducedExpansionTileController extends ValueNotifier<bool> {
 ReducedExpansionTileController({ 
   bool? value 
 }) : super(value ?? false);

 bool get isExpanded => value;

 void expand() => value = true;

 void collapse() => value = false;

 void toggle() => value = !value;
}

/// Измененная версия [ExpansionTile]
class ReducedExpansionTile extends StatefulWidget {
  const ReducedExpansionTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.tilePadding,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
    this.childrenPadding,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.textColor,
    this.collapsedTextColor,
    this.iconColor,
    this.collapsedIconColor,
    this.shape,
    this.collapsedShape,
    this.clipBehavior,
    this.controlAffinity,
    required this.controller,
  }) : assert(
       expandedCrossAxisAlignment != CrossAxisAlignment.baseline,
       'CrossAxisAlignment.baseline is not supported since the expanded children '
           'are aligned in a column, not a row. Try to use another constant.',
       );

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final Color? backgroundColor;
  final Color? collapsedBackgroundColor;
  final Widget? trailing;
  final bool initiallyExpanded;
  final bool maintainState;
  final EdgeInsetsGeometry? tilePadding;
  final Alignment? expandedAlignment;
  final CrossAxisAlignment? expandedCrossAxisAlignment;
  final EdgeInsetsGeometry? childrenPadding;
  final Color? iconColor;
  final Color? collapsedIconColor;
  final Color? textColor;
  final Color? collapsedTextColor;
  final ShapeBorder? shape;
  final ShapeBorder? collapsedShape;
  final Clip? clipBehavior;
  final ListTileControlAffinity? controlAffinity;
  final ReducedExpansionTileController controller;

  @override
  State<ReducedExpansionTile> createState() => _ReducedExpansionTileState();
}

class _ReducedExpansionTileState extends State<ReducedExpansionTile> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

  final ShapeBorderTween _borderTween = ShapeBorderTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _animationController;
  late Animation<double> _heightFactor;
  late Animation<ShapeBorder?> _border;
  late Animation<Color?> _backgroundColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _animationController.drive(_easeInTween);
    _border = _animationController.drive(_borderTween.chain(_easeOutTween));
    _backgroundColor = _animationController.drive(_backgroundColorTween.chain(_easeOutTween));

    _isExpanded = widget.controller.value;

    widget.controller.addListener(() => _toggleExpansion(widget.controller.value));
    
    if (_isExpanded) _animationController.value = 1.0;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion(bool isExpanded) {
    setState(() {
      _isExpanded = isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.maybeOf(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    final ShapeBorder expansionTileBorder = _border.value ?? const Border(
            top: BorderSide(color: Colors.transparent),
            bottom: BorderSide(color: Colors.transparent),
          );
    final Clip clipBehavior = widget.clipBehavior ?? expansionTileTheme.clipBehavior ?? Clip.none;
    return Container(
      clipBehavior: clipBehavior,
      decoration: ShapeDecoration(
        color: _backgroundColor.value ?? expansionTileTheme.backgroundColor ?? Colors.transparent,
        shape: expansionTileBorder,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRect(
            child: Align(
              alignment: widget.expandedAlignment
                ?? expansionTileTheme.expandedAlignment
                ?? Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    final bool closed = !_isExpanded && _animationController.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: widget.childrenPadding ?? expansionTileTheme.childrenPadding ?? EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: widget.expandedCrossAxisAlignment ?? CrossAxisAlignment.center,
            children: widget.children,
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _animationController.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}
