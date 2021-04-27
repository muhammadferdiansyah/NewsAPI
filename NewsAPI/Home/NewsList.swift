//
//  NewsList.swift
//  NewsAPI
//
//  Created by Dandy Ferdiansyah on 15/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsList: View {
    @ObservedObject var newsViewModel = NewsViewModel()
    
    var body: some View{
        NavigationView{
            List(newsViewModel.data){ item in
                NavigationLink(destination: NewsDetail(news: item)){
                    HStack{
                        if item.image != ""{
                            WebImage(url: URL(string: item.image)!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 170)
                                .background(Image("loader")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 30, height: 60))
                                .cornerRadius(10)
                        }
                        else{
                            Image("loader")
                                .resizable()
                                .frame(width: 120, height: 170)
                                .cornerRadius(10)
                        }
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text(item.title).fontWeight(.bold)
                            
                            Text(item.description).font(.caption)
                                .lineLimit(4)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("News"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

