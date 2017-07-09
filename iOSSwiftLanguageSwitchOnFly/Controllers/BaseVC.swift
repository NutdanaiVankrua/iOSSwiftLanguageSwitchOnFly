import UIKit

class BaseVC: UIViewController {
    
    // MARK: - Parameters
    
    var languageListener: LanguageListener?
    
    // MARK: - Main Methods
    
    override func viewDidLoad() {
        setUpLanguageNotificationListener()
    }
    
    // MARK: - Language Handling
    
    func setUpLanguageNotificationListener() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.onLanguageChange),
            name: LanguageManager.shareInstance.NSNotificationLanguageChange,
            object: nil)
    }
    
    func setLanguageListener(languageListener: LanguageListener) {
        self.languageListener = languageListener
    }
    
    func onLanguageChange() {
        languageListener?.onLanguageChange()
    }
    
}
