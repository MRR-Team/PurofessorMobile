import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/l10n/generated/app_localizations.dart';
import 'package:purofessor_mobile/src/features/server_status/presentation/controllers/server_status_controller.dart';
import 'package:purofessor_mobile/src/features/server_status/presentation/widgets/content_container.dart';
import 'package:purofessor_mobile/src/features/server_status/presentation/widgets/region_dropdown.dart';
import 'package:purofessor_mobile/src/features/server_status/presentation/widgets/server_status_details.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_background.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_button_navigation_bar.dart';

class ServerStatusPage extends StatefulWidget {
  const ServerStatusPage({super.key});

  @override
  State<ServerStatusPage> createState() => _ServerStatusPageState();
}

class _ServerStatusPageState extends State<ServerStatusPage> {
  final ScrollController _scrollController = ScrollController();
  String selectedRegion = 'euw1';
  bool _showRegionSelector = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ServerStatusController>().fetchStatus(selectedRegion);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ServerStatusController>();
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(localizations.serverStatusTitle)),
      bottomNavigationBar: const AppBottomNavigationBar(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is UserScrollNotification) {
            if (scrollNotification.direction == ScrollDirection.reverse &&
                _showRegionSelector) {
              setState(() => _showRegionSelector = false);
            } else if (scrollNotification.direction ==
                    ScrollDirection.forward &&
                !_showRegionSelector) {
              setState(() => _showRegionSelector = true);
            }
          }
          return true;
        },
        child: AppBackground(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child:
                      _showRegionSelector
                          ? RegionDropdown(
                            selectedRegion: selectedRegion,
                            onChanged: (region) {
                              setState(() => selectedRegion = region);
                              controller.fetchStatus(region);
                            },
                          )
                          : const SizedBox.shrink(),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ContentContainer(
                    child:
                        controller.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : controller.error != null
                            ? Center(child: Text('❌ ${controller.error}'))
                            : controller.status == null
                            ? Center(child: Text(localizations.noData))
                            : ServerStatusDetails(status: controller.status!),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension ServerStatusLocalizationExtension on AppLocalizations {
  String getTranslatedRegion(String code) {
    return switch (code) {
      'euw1' => regionName_euw1,
      'na1' => regionName_na1,
      'eun1' => regionName_eun1,
      'kr' => regionName_kr,
      'br1' => regionName_br1,
      'jp1' => regionName_jp1,
      'oc1' => regionName_oc1,
      'ru' => regionName_ru,
      'tr1' => regionName_tr1,
      _ => code.toUpperCase(),
    };
  }
}
