import 'package:flutter/material.dart';

class SidebarOption extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;
  final List<String>? subOptions;

  const SidebarOption({
    Key? key,
    required this.icon,
    required this.title,
    required this.isExpanded,
    required this.onTap,
    this.subOptions,
  }) : super(key: key);

  @override
  _SidebarOptionState createState() => _SidebarOptionState();
}

class _SidebarOptionState extends State<SidebarOption> {
  bool isHovered = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          cursor: SystemMouseCursors.click,
          child: Container(
            color: isHovered ? Colors.blueGrey[700] : Colors.transparent,
            child: ListTile(
              leading: Icon(widget.icon, color: Colors.white),
              title: widget.isExpanded
                  ? Text(
                widget.title,
                style: TextStyle(color: Colors.white),
              )
                  : null,
              trailing: widget.subOptions != null
                  ? IconButton(
                icon: Icon(
                    isExpanded ? Icons.remove : Icons.add,
                    color: Colors.white),
                onPressed: () => setState(() => isExpanded = !isExpanded),
              )
                  : null,
              onTap: widget.onTap,
            ),
          ),
        ),
        if (isExpanded && widget.subOptions != null)
          ...widget.subOptions!.map((subOption) => Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: ListTile(
              title: Text(
                subOption,
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () {
                // Handle sub-option tap
              },
            ),
          )),
      ],
    );
  }
}