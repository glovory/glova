import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';

class TuxTextFormField extends StatefulWidget {
  /// Using parameter from TextFormField, Material.
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextStyle style;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final GestureTapCallback onTap;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final Function(String) validator;
  final bool enabled;
  final EdgeInsetsGeometry contentPadding;
  final TuxStatus tuxStatus;
  final double widthBorder;
  final double radius;
  final String hint;
  final Icon icon;
  final bool filled;
  final bool isPrefix;
  final String label;
  final String description;
  final int maxLines;

  const TuxTextFormField({
    this.controller,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.obscureText = false,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.enabled,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.tuxStatus,
    this.widthBorder = 1,
    this.radius = 4,
    this.hint,
    this.icon,
    this.filled = false,
    this.isPrefix = false,
    this.label,
    this.description,
    this.maxLines = 1,
  });

  /// Text with Icon on the left
  const TuxTextFormField.withPrefixIcon({
    this.controller,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.obscureText = false,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.enabled,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.tuxStatus,
    this.widthBorder = 1,
    this.radius = 4,
    this.hint,
    this.icon,
    this.filled = false,
    this.label,
    this.description,
    this.maxLines = 1,
  }) : this.isPrefix = true;

  /// Text with Icon on the right
  const TuxTextFormField.withSuffixIcon({
    this.controller,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.obscureText = false,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.enabled,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.tuxStatus,
    this.widthBorder = 1,
    this.radius = 4,
    this.hint,
    this.icon,
    this.filled = false,
    this.label,
    this.description,
    this.maxLines = 1,
  }) : this.isPrefix = false;

  @override
  _TuxTextFormFieldState createState() => _TuxTextFormFieldState();
}

class _TuxTextFormFieldState extends State<TuxTextFormField> {
  String errorText;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: TuxColorUtils.colorByStatus(
          tuxStatus: widget.tuxStatus,
          defaultColor: TuxColor.primary,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // show label if not null
          if (widget.label != null) ...[
            Text(
              widget.label.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 6.0),
          ],
          TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            textCapitalization: widget.textCapitalization,
            style: widget.style,
            obscureText: widget.obscureText,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: widget.onFieldSubmitted,
            onSaved: widget.onSaved,
            validator: (val) {
              setState(() {
                errorText = widget.validator.call(val);
              });

              return widget.validator.call(val);
            },
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            // decoration by status
            decoration: InputDecoration(
              prefixIcon: (widget.isPrefix) ? widget.icon : null,
              suffixIcon: (!widget.isPrefix) ? widget.icon : null,
              filled: widget.filled,
              contentPadding: widget.contentPadding,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  width: 0.2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  width: 0.2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  color: TuxColorUtils.colorByStatus(
                    tuxStatus: widget.tuxStatus,
                    defaultColor: Theme.of(context).buttonColor, // change color from theme
                  ),
                  width: widget.widthBorder,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  color: TuxColor.danger,
                  width: widget.widthBorder,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  color: TuxColor.danger,
                  width: widget.widthBorder,
                ),
              ),
              errorStyle: TextStyle(
                color: TuxColor.danger,
                fontSize: 0,
                height: 0,
              ),
              hintText: widget.hint,
            ),
          ),
          // show description if not null
          if (widget.description != null || errorText != null) ...[
            SizedBox(height: 4.0),
            Text(
              (errorText != null) ? errorText : widget.description,
              style: (errorText != null) ? TextStyle(color: TuxColor.danger) : TextStyle(),
            ),
          ],
        ],
      ),
    );
  }
}
