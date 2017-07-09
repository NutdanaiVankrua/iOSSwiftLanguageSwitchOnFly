import Foundation

class LanguageManager: NSObject {
    
    // MARK: - Constructor
    
    static let shareInstance = LanguageManager()
    
    // MARK: - Parameters
    
    let NSNotificationLanguageChange = NSNotification.Name(rawValue: "LanguageChangeNotification")
    private var currentLanguage = Languages.EN
    
    // MARK: - Events
    
    func notifyLanguageChange() {
        if (currentLanguage == Languages.EN) {
            currentLanguage = Languages.TH
        } else {
            currentLanguage = Languages.EN
        }
        NotificationCenter.default.post(name: NSNotificationLanguageChange, object: nil)
    }
    
    // MARK: - Getters
    
    func getCurrentLanguage() -> String {
        return currentLanguage
    }
    
}

extension String {
    
    func localized() -> String {
        let language = LanguageManager.shareInstance.getCurrentLanguage()
        guard let path = Bundle.main.path(forResource: language == "en" ? "Base" : language, ofType: "lproj") else {
            let basePath = Bundle.main.path(forResource: "Base", ofType: "lproj")!
            return Bundle(path: basePath)!.localizedString(forKey: self, value: "", table: nil)
        }
        return Bundle(path: path)!.localizedString(forKey: self, value: "", table: nil)
    }
    
}
