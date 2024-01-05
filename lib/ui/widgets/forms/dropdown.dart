import 'package:apexive/data/models/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu<T> extends StatefulWidget {
  final String label;
  final CustomFormField<T> value;
  final List<T> items;
  final Widget Function(T) itemBuilder;
  final Widget Function(T?) selectedItemBuilder;
  final void Function(T?) onSelected;
  const CustomDropDownMenu(
      {super.key,
      required this.label,
      required this.items,
      required this.itemBuilder,
      required this.onSelected,
      required this.value,
      required this.selectedItemBuilder});

  @override
  State<CustomDropDownMenu<T>> createState() => _CustomDropDownMenuState<T>();
}

class _CustomDropDownMenuState<T> extends State<CustomDropDownMenu<T>> {
  bool isExpanded = false;
  bool hasError = false;
  T? selectedItem;
  @override
  void initState() {
    selectedItem = widget.value.value;
    hasError = widget.value.isValid == false;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomDropDownMenu<T> oldWidget) {
    if (oldWidget.value != widget.value) {
      setState(() {
        selectedItem = widget.value.value;
        hasError = widget.value.isValid == false;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildUnselectedMenu(),
          if (isExpanded) buildSelectedMenu(),
        ],
      ),
    );
  }

  //build selected menu
  Widget buildSelectedMenu() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      constraints:
          BoxConstraints(maxHeight: 0.6 * MediaQuery.of(context).size.height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            final T item = widget.items[index];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => onItemSelected(item),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: widget.itemBuilder(item),
                  ),
                ),
                const Divider()
              ],
            );
          }),
    );
  }

  //on project selected
  void onItemSelected(T item) {
    setState(() {
      isExpanded = false;
      hasError = false;
      selectedItem = item;
    });
    widget.onSelected(selectedItem);
  }

  //build unselected menu
  Widget buildUnselectedMenu() {
    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: hasError
                    ? Colors.red
                    : isExpanded
                        ? Colors.white
                        : const Color.fromRGBO(255, 255, 255, 0.16),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.selectedItemBuilder(selectedItem),
                const Icon(CupertinoIcons.chevron_down),
              ],
            ),
          ),
          if (hasError)
            Text(
              widget.value.error!,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.red),
            )
        ],
      ),
    );
  }
}
