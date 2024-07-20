//
//  ContentView.swift
//  SwiftUI Basics
//
//  Created by Chaitanya Soni on 20/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                Page1()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                Page2()
                    .tabItem {
                        Image(systemName: "bookmark.circle.fill")
                        Text("Bookmark")
                    }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        Image("dietSnap")
                            .aspectRatio(contentMode: .fit)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Help") {
                        print("Help tapped!")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Help") {
                        print("Help tapped!")
                    }
                }
            }
        }
    }


}

struct Page1: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Today")
                    .font(.headline)
                Text("Thursdat, 22nd Oct")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                Spacer()
            }
        }
    }
}
struct Page2: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, you!")
        }
    }
}




#Preview {
    ContentView()
}
