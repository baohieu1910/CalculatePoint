//
//  CustomKeyboard.swift
//  CalculatePoint
//
//  Created by Hieu Le on 2/13/24.
//

import Foundation
import SwiftUI
import UIKit

extension View {
    @ViewBuilder
    func inputView<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
        self
            .background {
                SetTFKeyboard(keyboardContent: content())
            }
    }
}

fileprivate struct SetTFKeyboard<Content: View>: UIViewRepresentable {
    var keyboardContent: Content
    func makeUIView(context: Context) -> UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
            if let textFieldContainerView = uiView.superview?.superview {
                if let textField = textFieldContainerView.findTextField {
                    let hostingController = UIHostingController(rootView: keyboardContent)
                    hostingController.view.frame = .init(origin: .zero, size: hostingController.view.intrinsicContentSize)
                } else {
                    print("Failed")
                }
            }
        }
    }
}

fileprivate extension UIView {
    var allSubViews: [UIView] {
        return subviews.flatMap { [$0] + $0.subviews }
    }
    
    var findTextField: UITextField? {
        if let textField = allSubViews.first(where: { view in
            view is UITextField
        }) as? UITextField {
            return textField
        }
        return nil
        
    }
    
}

struct CustomKeyboardView: View {
    @State private var text: String = ""

    var body: some View {
        VStack {
            TextField("Enter number", text: $text)
                .inputView(content: {
                    ZStack {
                        Color.red
                    }
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
        }
    }
}

struct CustomKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        CustomKeyboardView()
    }
}
