//
//  MainButton.swift
//  OTUS
//
//  Created by Nikita Spekhin on 10.12.2023.
//

import SwiftUI

struct MainButton: UIViewRepresentable {
    let title: String
    let action: () -> ()
    func makeUIView(context: Context) -> some UIView {
        let button = UIButton(type: .system)
        button.setTitle(self.title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(.systemOrange, for: .normal)
        button.addTarget(context.coordinator, action: #selector(Coordinator.doAction(_ :)), for: .touchUpInside)
        return button
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeCoordinator() -> Coordinator { Coordinator(self) }
    
    class Coordinator: NSObject {
        var parent: MainButton
        
        init(_ mainButton: MainButton) {
            self.parent = mainButton
            super.init()
        }
        
        @objc func doAction(_ sender: Any) {
            self.parent.action()
        }
    }
}
