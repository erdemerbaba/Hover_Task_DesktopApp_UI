import SwiftUI

struct WindowModifier: ViewModifier {
    let screenWidth = NSScreen.main?.frame.width ?? 0
    let screenHeight = NSScreen.main?.frame.height ?? 0
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if let window = NSApplication.shared.windows.first {
                    // Position window at the left middle edge
                    let windowWidth: CGFloat = 400 // Set your desired window width
                    let windowHeight: CGFloat = 600 // Set your desired window height
                    
                    let xPos: CGFloat = 0 // Left edge of the screen
                    let yPos: CGFloat = (screenHeight - windowHeight) / 2 // Vertically center the window
                    
                    window.setFrame(CGRect(x: xPos, y: yPos, width: windowWidth, height: windowHeight), display: true)
                    
                    // Apply corner rounding
                    window.isOpaque = false
                    window.hasShadow = true
                    window.backgroundColor = .clear
                    window.titleVisibility = .hidden
                    window.titlebarAppearsTransparent = true
                    
                    // Set content view layer properties
                    window.contentView?.wantsLayer = true
                    window.contentView?.layer?.cornerRadius = 70 // Set the corner radius to 50
                    window.contentView?.layer?.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner] // Round the top-right and bottom-right corners
                    window.contentView?.layer?.masksToBounds = true
                    
                    // Set the background color to black
                    window.contentView?.layer?.backgroundColor = NSColor.black.cgColor
                }
            }
    }
}

// Extension for easy application of the modifier
extension View {
    func customWindowStyle() -> some View {
        self.modifier(WindowModifier())
    }
}
