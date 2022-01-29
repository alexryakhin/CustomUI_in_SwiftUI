//
//  ContentView.swift
//  Unknown1
//
//  Created by Alexander Ryakhin on 1/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var orientation = UIDeviceOrientation.portrait
    @State private var searchText = ""
    @State private var isSearching = false
        
    var body: some View {
        NavigationView {
            ZStack {
                background
                content
                VStack(spacing: 0) {
                    navBar
                    Spacer()
                    if !isSearching {
                        tabBar
                    }
                }
            }
            .navigationBarHidden(true)
            selectItemIpad
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name.isSearching, object: nil)) { output in
            if let userInfo = output.userInfo, let isSearching = userInfo["isSearching"] as? Bool {
                withAnimation {
                    self.isSearching = isSearching
                }
            }
        }
    }
    
    private var background: some View {
        Color("ListBackground")
            .ignoresSafeArea()
    }
    
    private var navBar: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Nav bar")
                    .font(.system(.headline, design: .rounded))
                    .padding(.top)
            }
            SearchTextField(title: "Search", searchText: $searchText)
            
        }
        .frame(maxWidth: .infinity)
        .background(.regularMaterial)
    }
    
    private var tabBar: some View {
        HStack {
            ForEach(0..<4) { index in
                Button {
                    //
                } label: {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 20))
                        .padding()
                        .background(Color.white.opacity(0.01))
                }
                
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 30)
        .background(.regularMaterial)
        .transition(AnyTransition.move(edge: .bottom))
    }
    
    private var content: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0..<20) { index in
                    NavigationLink {
                        DetailsView(index: index)
                    } label: {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Cell \(index)")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(.primary)
                            .padding()
                            Divider().opacity(index == 19 ? 0 : 1)
                            
                            
                        }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .buttonStyle(.automatic)
                }
            }
            .background(.regularMaterial)
            .cornerRadius(15)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, 100)
            .padding(.bottom, 50)
            
        }
    }
    
    private var selectItemIpad: some View {
        ZStack {
            Color("DetailsBackground")
                .ignoresSafeArea()
                .onRotate { newOrientation in
                    orientation = newOrientation
                }
                Text("Select an item portrait")
                    .font(.system(.headline, design: .rounded))
                    .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

struct DetailsView: View {
    var index: Int
    
    var body: some View {
        ZStack {
            Color("DetailsBackground")
                .ignoresSafeArea()
            Text("Details \(index)")
        }
        .navigationBarHidden(true)
    }
}


