//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <desktop_webview_auth/desktop_webview_auth_plugin.h>
#include <flutter_localization/flutter_localization_plugin_c_api.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  DesktopWebviewAuthPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DesktopWebviewAuthPlugin"));
  FlutterLocalizationPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterLocalizationPluginCApi"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
