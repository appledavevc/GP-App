//
//  AppDelegate.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 08/07/2023.
//

import OneSignal
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)

        OneSignal.initWithLaunchOptions(launchOptions)
        OneSignal.setAppId("33d6d6cc-d0f5-41fe-af21-1074df0a1450")

        OneSignal.promptForPushNotifications(userResponse: { accepted in
            print("User accepted notifications: \(accepted)")
        })

        // Get the user's preference for dark mode or light mode or use system preferences
        if let mode = UserDefaults.standard.string(forKey: "AppMode") {
            setAppWideMode(mode)
        } else {
            // Default to use system preferences
            setAppWideMode("SystemPreferences")
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    private func setAppWideMode(_ mode: String) {
        switch mode {
        case "DarkMode":
            applyDarkMode()
        case "LightMode":
            applyLightMode()
        default:
            applySystemPreferencesMode()
        }
    }

    private func applyDarkMode() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            for window in windowScene.windows {
                window.overrideUserInterfaceStyle = .dark
            }
        }
    }

    private func applyLightMode() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            for window in windowScene.windows {
                window.overrideUserInterfaceStyle = .light
            }
        }
    }

    private func applySystemPreferencesMode() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            for window in windowScene.windows {
                window.overrideUserInterfaceStyle = .unspecified
            }
        }
    }
}
