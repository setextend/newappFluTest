import 'package:flutter/material.dart';
import '../widgets/list_element.dart';
import '../widgets/expanded_content.dart';

class TestSliverListPage extends StatefulWidget {
  const TestSliverListPage({super.key});

  @override
  State<TestSliverListPage> createState() => _TestSliverListPageState();
}

class _TestSliverListPageState extends State<TestSliverListPage> {
  // Track which items are expanded
  final List<bool> _isExpanded = List.generate(10, (index) => false);
  // Content for each expanded section
  final List<String> _expandedContent = [
    "This is the detailed content for item 1. It can contain multiple paragraphs of text, images, or other widgets.",
    "Item 2 details: When expanded, this section reveals additional information about the second element in the list.",
    "Third item content: The expansion pushes down all subsequent elements, creating a clean, focused interface.",
    "Fourth element details: Notice how only one item can be expanded at a time for a clean user experience.",
    "Fifth section: The expanded content smoothly animates into view when the item is tapped.",
    "Sixth item: The collapse functionality allows users to hide the expanded content when they're done reading.",
    "Seventh element: This implementation uses a CustomScrollView with SliverList for optimal performance.",
    "Eighth item: The expansion mechanism works by tracking the state of each list element individually.",
    "Ninth section: Try scrolling through the list to see how the expanded content integrates with the scrolling behavior.",
    "Tenth element: This pattern is commonly used in settings screens, FAQs, and content-heavy applications.",
  ];
  void _toggleExpansion(int index) {
    setState(() {
      // Collapse all other items
      for (int i = 0; i < _isExpanded.length; i++) {
        if (i != index) {
          _isExpanded[i] = false;
        }
      }

      // Toggle the current item
      _isExpanded[index] = !_isExpanded[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  // The clickable list element
                  GestureDetector(
                    onTap: () => _toggleExpansion(index),
                    child: ListElement(index: index),
                  ),

                  // The expandable content section
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: _isExpanded[index]
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: const SizedBox.shrink(),
                    secondChild: ExpandedContent(
                      content: _expandedContent[index],
                    ),
                  ),
                ],
              );
            }, childCount: 5),
          ),
        ],
      ),
    );
  }
}
