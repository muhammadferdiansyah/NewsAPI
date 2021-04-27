//
//  Profile.swift
//  NewsAPI
//
//  Created by Dandy Ferdiansyah on 15/04/21.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack{
            Image("Profile")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            Text("Muhammad Dandy Ferdiansyah").font(.title).padding(.top, 16)
            Text("dandyferdiansyah2801@gmail.com").font(.body).padding(.top, 16)
        }
    }
}

