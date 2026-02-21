import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';
import 'adapt_fab_menu_item.dart';

/// Animated expandable FAB with a semi-transparent backdrop.
///
/// Tap the FAB to expand — it rotates 45°, a backdrop fades in, and
/// [items] slide up and fade in with a 50 ms stagger between each item.
/// Tap the backdrop or the FAB again to collapse.
///
/// - [items] — list of [AdaptFabMenuItem] shown when expanded.
///   Index 0 is positioned closest to the FAB.
class AdaptFabMenu extends StatefulWidget {
  const AdaptFabMenu({super.key, required this.items});

  final List<AdaptFabMenuItem> items;

  @override
  State<AdaptFabMenu> createState() => _AdaptFabMenuState();
}

class _AdaptFabMenuState extends State<AdaptFabMenu>
    with SingleTickerProviderStateMixin {
  static const _duration = Duration(milliseconds: 200);
  static const double _staggerFraction = 50 / 200; // 50 ms / 200 ms
  static const double _itemWidth = 200.0;
  static const double _itemSpacing = 60.0;
  static const double _fabGap = 12.0;

  late final AnimationController _controller;
  OverlayEntry? _entry;
  final GlobalKey _fabKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
  }

  @override
  void dispose() {
    _removeOverlay();
    _controller.dispose();
    super.dispose();
  }

  void _removeOverlay() {
    _entry?.remove();
    _entry = null;
  }

  void _toggle() {
    if (_entry == null) {
      _open();
    } else {
      _close();
    }
  }

  void _open() {
    final renderBox = _fabKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final fabOffset = renderBox.localToGlobal(Offset.zero);
    final fabSize = renderBox.size;
    _entry = _buildOverlay(fabOffset, fabSize);
    Overlay.of(context).insert(_entry!);
    _controller.forward(from: 0);
  }

  Future<void> _close() async {
    if (_entry == null) return;
    await _controller.reverse();
    if (!mounted) return;
    _removeOverlay();
  }

  OverlayEntry _buildOverlay(Offset fabOffset, Size fabSize) {
    final fabCenterX = fabOffset.dx + fabSize.width / 2;

    return OverlayEntry(
      builder: (context) {
        final screenHeight = MediaQuery.of(context).size.height;
        // Distance from screen bottom to the top edge of the FAB.
        final baseBottom = screenHeight - fabOffset.dy + _fabGap;

        return Material(
          color: Colors.transparent,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Stack(
                children: [
                  // Semi-transparent backdrop — tap to collapse.
                  GestureDetector(
                    onTap: _close,
                    child: Container(
                      color: Color.fromRGBO(0, 0, 0, 0.5 * _controller.value),
                    ),
                  ),

                  // Menu items; index 0 is closest to the FAB.
                  ...List.generate(widget.items.length, (index) {
                    final item = widget.items[index];
                    final start = (index * _staggerFraction).clamp(0.0, 1.0);
                    final itemAnim = CurvedAnimation(
                      parent: _controller,
                      curve: Interval(start, 1.0, curve: Curves.easeOut),
                    );

                    return Positioned(
                      bottom: baseBottom + index * _itemSpacing,
                      left: fabCenterX - _itemWidth / 2,
                      width: _itemWidth,
                      child: Opacity(
                        opacity: itemAnim.value.clamp(0.0, 1.0),
                        child: Transform.translate(
                          offset: Offset(0, 16.0 * (1 - itemAnim.value)),
                          child: _FabMenuItemRow(
                            item: item,
                            onTap: () => _close().then((_) => item.onTap()),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return FloatingActionButton(
          key: _fabKey,
          onPressed: _toggle,
          backgroundColor: AppColors.primary,
          elevation: 4,
          child: Transform.rotate(
            angle: _controller.value * math.pi / 4,
            child: const Icon(
              Icons.add_rounded,
              color: AppColors.textPrimary,
            ),
          ),
        );
      },
    );
  }
}

class _FabMenuItemRow extends StatelessWidget {
  const _FabMenuItemRow({required this.item, required this.onTap});

  final AdaptFabMenuItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacing16,
          vertical: AppDimensions.spacing12,
        ),
        decoration: BoxDecoration(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            item.leading,
            const SizedBox(width: AppDimensions.spacing12),
            Expanded(
              child: Text(item.label, style: AppTextStyles.bodyLarge),
            ),
          ],
        ),
      ),
    );
  }
}
