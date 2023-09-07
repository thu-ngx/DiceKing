import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // Get preferred language code
    let defaultLanguage = UserDefaults.standard.string(forKey: "AppLanguage") ?? "en"
    
    // Set bundle for localization
    Bundle.main.path(forResource: defaultLanguage, ofType: "lproj")
    
    // Sync default AppleLanguages to bundle
    UserDefaults.standard.set([defaultLanguage], forKey: "AppleLanguages")
    UserDefaults.standard.synchronize()
    
    return true
  }
}
