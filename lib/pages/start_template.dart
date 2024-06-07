import 'package:flutter/material.dart';

import '../Widgets/container_widget.dart';

class StartWithTemplate extends StatefulWidget {
  const StartWithTemplate({super.key});

  @override
  State<StartWithTemplate> createState() => _StartWithTemplateState();
}

class _StartWithTemplateState extends State<StartWithTemplate> {
  int _selectedIndex = -1;
  final List<String> _chipLabels = [
    'All',
    'Business',
    'Design',
    'Education',
    'Engineering',
    'Marketing',
    'HR & Operations',
    'Personal',
    'Project Management',
    'Remote Work',
    'Sales',
    'Support',
    'Team Management',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            )),
        title: const Text(
          'Start with a template',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_chipLabels.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: Text(_chipLabels[index]),
                        selected: _selectedIndex == index,
                        selectedColor: Colors.grey,
                        checkmarkColor: Colors.white,
                        onSelected: (bool value) {
                          setState(() {
                            _selectedIndex = value ? index : -1;
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    InkWell(
                      child: const ContainerWidget(),
                      onTap: () {
                        Navigator.pushNamed(context, 'basicboard');
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
