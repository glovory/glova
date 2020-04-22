import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';

class TuxTextFormField extends StatelessWidget {
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
  final FormFieldValidator<String> validator;
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
    this.contentPadding,
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
    this.contentPadding,
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
    this.contentPadding,
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
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: TuxColorUtils.colorByStatus(
          tuxStatus: tuxStatus,
          defaultColor: TuxColor.primary,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // show label if not null
          if (label != null) ...[
            Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 6.0),
          ],
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            style: style,
            obscureText: obscureText,
            onChanged: onChanged,
            onTap: onTap,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            onSaved: onSaved,
            validator: validator,
            enabled: enabled,
            maxLines: maxLines,
            // decoration by status
            decoration: InputDecoration(
              prefixIcon: (isPrefix) ? icon : null,
              suffixIcon: (!isPrefix) ? icon : null,
              filled: filled,
              contentPadding: contentPadding,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  width: 0.2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  width: 0.2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: TuxColorUtils.colorByStatus(
                    tuxStatus: tuxStatus,
                    defaultColor: Theme.of(context).buttonColor, // change color from theme
                  ),
                  width: widthBorder,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: TuxColor.danger,
                  width: widthBorder,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: TuxColor.danger,
                  width: widthBorder,
                ),
              ),
              errorStyle: TextStyle(
                color: TuxColor.danger,
              ),
              hintText: hint,
            ),
          ),
          // show description if not null
          if (description != null) ...[
            SizedBox(height: 6.0),
            Text(
              description,
              style: TextStyle(),
            ),
          ],
        ],
      ),
    );
  }
}
