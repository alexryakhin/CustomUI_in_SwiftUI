//
//  DetailsView.swift
//  Unknown1
//
//  Created by Alexander Ryakhin on 1/29/22.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    var index: Int
    
    var body: some View {
        ZStack {
            Color("DetailsBackground")
                .ignoresSafeArea()
            content
            VStack {
                navBar
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
    
    private var navBar: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            HStack {
                Text("Details")
                    .font(.system(.largeTitle, design: .rounded)).bold()
                    .padding()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
//        .background(VisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial)).ignoresSafeArea())
    }
    
    private var content: some View {
        VStack {
            Text("Index \(index)")
        }
        .padding(.top, 90)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(index: 0)
    }
}
