//
//  ContentView.swift
//  NewsAPI
//
//  Created by Dandy Ferdiansyah on 15/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            NewsList()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("News")
                }
            SearchList()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("search")
                }
            FavoriteNewsList()
                .tabItem{
                    Image(systemName: "heart")
                    Text("Favorite")
                }
            Profile()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("About")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
