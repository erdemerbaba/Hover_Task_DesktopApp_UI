import Cocoa
import SwiftUI

@main
struct projectApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow?
    var monitoringEnabled = true
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create the window
        if let window = NSApplication.shared.windows.first {
            self.window = window
            self.window?.setContentSize(NSSize(width: 400, height: 600))
            self.window?.center()
            self.window?.makeKeyAndOrderFront(nil)
            self.window?.level = .normal
            
            startMonitoringMousePosition()
        }
    }
    
    func startMonitoringMousePosition() {
        NSEvent.addGlobalMonitorForEvents(matching: .mouseMoved) { [weak self] event in
            self?.handleMouseMoved(event: event)
        }
    }
    
    func handleMouseMoved(event: NSEvent) {
        guard let screen = NSScreen.main else { return }
        
        // Define notch area (Top center of the screen)
        let notchAreaWidth: CGFloat = 60
        let notchAreaHeight: CGFloat = 30
        let screenWidth = screen.frame.width
        let screenHeight = screen.frame.height
        
        let notchArea = NSRect(x: (screenWidth - notchAreaWidth) / 2, y: screenHeight - notchAreaHeight, width: notchAreaWidth, height: notchAreaHeight)
        
        if notchArea.contains(event.locationInWindow) {
            // If the cursor is in the notch area, bring the window to the front
            if let window = window, !window.isVisible {
                window.makeKeyAndOrderFront(nil)
            }
        }
    }
}
