//
//  HomeViewController.swift
//  TryCatch Firebase app
//
//  Created by Chaitanya Soni on 04/08/24.
//

import UIKit
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }
        }
    }
}
#Preview {
    HomeView()
}
class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let swiftUIContent = UIHostingController(rootView: HomeView())
        
        self.addChild(swiftUIContent)
        
        swiftUIContent.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(swiftUIContent.view)
        
        swiftUIContent.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        swiftUIContent.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        swiftUIContent.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        swiftUIContent.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}
