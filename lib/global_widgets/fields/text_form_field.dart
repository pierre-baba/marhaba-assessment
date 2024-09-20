import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/utils/locale_edge_insets.dart';
import 'package:marhaba_auctions_assessment/core/values/colors.dart';

class ASAPTextFormField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final String? initialValue;
  final String? error;
  final ValueChanged<String>? onChanged;
  final Widget? icon;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;
  final bool enabled;
  final Widget? prefix;
  final VoidCallback? onPressed;
  final bool obscureText;
  final bool multiline;
  final bool showBorders;
  final int minLine;
  final int maxLine;
  final InputBorder? border;
  final InputBorder? disabledBorder;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final bool autoFocus;

  const ASAPTextFormField({
    Key? key,
    this.textEditingController,
    this.disabledBorder,
    this.focusNode,
    this.border,
    this.textInputAction,
    this.onFieldSubmitted,
    this.hintText,
    this.initialValue,
    this.error,
    this.keyboardType,
    this.onChanged,
    this.icon,
    this.labelStyle,
    this.hintStyle,
    this.textStyle,
    this.errorStyle,
    this.label,
    this.enabled = true,
    this.prefix,
    this.onPressed,
    this.obscureText = false,
    this.multiline = false,
    this.showBorders = true,
    this.minLine = 1,
    this.maxLine = 1,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  State<ASAPTextFormField> createState() => _ASAPTextFormFieldState();
}

class _ASAPTextFormFieldState extends State<ASAPTextFormField> {
  late bool _showPassword;

  @override
  void initState() {
    super.initState();
    _showPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Container(
            margin: LocaleEdgeInsets.only(start: 20.w, bottom: 10.h),
            child: Text(
              widget.label!,
              style: widget.labelStyle,
            ),
          ),
        Flexible(
          child: GestureDetector(
            onTap: widget.onPressed,
            child: SizedBox(
              height: widget.error != null
                  ? widget.multiline
                      ? null
                      : 59.h
                  : widget.multiline
                      ? null
                      : 59.h,
              child: TextFormField(
                controller: widget.textEditingController,
                autofocus: widget.autoFocus,
                focusNode: widget.focusNode,
                keyboardType: widget.keyboardType,
                initialValue: widget.initialValue,
                onChanged: widget.onChanged,
                enabled: widget.enabled,
                obscureText: widget.obscureText && !_showPassword,
                minLines: widget.minLine,
                maxLines: widget.maxLine,
                textInputAction: widget.textInputAction,
                onFieldSubmitted: widget.onFieldSubmitted,
                cursorColor: AppColors.lightPrimary,
                // style: widget.textStyle,
                textAlignVertical: TextAlignVertical.center,
                decoration: (const InputDecoration())
                    .applyDefaults(Get.theme.inputDecorationTheme)
                    .copyWith(
                      hintText: widget.hintText,
                      disabledBorder: widget.disabledBorder,
                      enabledBorder: widget.border,
                      error: widget.error != null ? const SizedBox() : null,
                      suffixIcon: widget.error != null
                          ? Tooltip(
                              message: widget.error,
                              triggerMode: TooltipTriggerMode.tap,
                              showDuration: const Duration(seconds: 3),
                              child: const Icon(
                                Icons.info,
                                color: AppColors.lightError,
                              ),
                            )
                          : widget.obscureText
                              ? _handlePasswordIcon()
                              : widget.icon,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget? _handlePasswordIcon() {
    if (!widget.obscureText) return null;
    return GestureDetector(
      onTap: () {
        setState(() {
          _showPassword = !_showPassword;
        });
      },
      child: Icon(
        _showPassword ? Icons.visibility_off : Icons.visibility,
        // color: AppColors.lightBlack.withOpacity(0.5),
      ),
    );
  }
}
