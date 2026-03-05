import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../core/theme/app_colors.dart';
import '../features/analysis/presentation/screens/analysis_screen.dart';
import '../features/learn/presentation/screens/learn_screen.dart';
import '../features/settings/presentation/screens/settings_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

abstract final class AppRoutes {
  static const analysis = '/';
  static const learn = '/learn';
  static const settings = '/settings';
}

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.analysis,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.analysis,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AnalysisScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.learn,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: LearnScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.settings,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SettingsScreen(),
          ),
        ),
      ],
    ),
  ],
);

class AppShell extends StatelessWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith(AppRoutes.learn)) return 1;
    if (location.startsWith(AppRoutes.settings)) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final index = _currentIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.bgSecondary,
        indicatorColor: AppColors.accentGold.withValues(alpha: 0.15),
        selectedIndex: index,
        onDestinationSelected: (i) {
          switch (i) {
            case 0:
              context.go(AppRoutes.analysis);
            case 1:
              context.go(AppRoutes.learn);
            case 2:
              context.go(AppRoutes.settings);
          }
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.auto_fix_high_outlined),
            selectedIcon: const Icon(Icons.auto_fix_high, color: AppColors.accentGold),
            label: l10n.navAnalyze,
          ),
          NavigationDestination(
            icon: const Icon(Icons.menu_book_outlined),
            selectedIcon: const Icon(Icons.menu_book, color: AppColors.accentGold),
            label: l10n.navLearn,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings, color: AppColors.accentGold),
            label: l10n.navSettings,
          ),
        ],
      ),
    );
  }
}
