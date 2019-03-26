import UIKit
import PDFKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = ViewController()
    window?.makeKeyAndVisible()
    return true
  }
}

class ViewController: UIViewController {
  override func loadView() {
    let pdfView = PDFView(frame: .zero)

    // This will cause a crash on iOS 12.2
    pdfView.usePageViewController(true, withViewOptions: [:])

    pdfView.document = PDFDocument(url: Bundle.main.url(forResource: "sample", withExtension: "pdf")!)!

    view = pdfView
  }
}

