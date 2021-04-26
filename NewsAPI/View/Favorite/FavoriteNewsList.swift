//
//  FavoriteNewsList.swift
//  NewsAPI
//
//  Created by Dandy Ferdiansyah on 20/04/21.
//


import SwiftUI
import SDWebImageSwiftUI

struct FavoriteNewsList: View {
  
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(entity: FavoriteNews.entity(), sortDescriptors: []) var favoriteNews: FetchedResults<FavoriteNews>
  
    var body: some View {
      NavigationView{
        VStack{
          List{
            ForEach(favoriteNews, id: \.self){ item in
              NavigationLink(destination: FavoriteNewsDetail(data: item)){
                HStack{
                  //jika fotonya ada
                  if item.image != ""{
                    WebImage(url: URL(string: item.wrappedImage)!)
                      .resizable()
                      .frame(width: 120, height: 170)
                      .background(Image("loader")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 30))
                      .cornerRadius(10)
                  }
                  else{
                    Image("loader")
                      .resizable()
                      .frame(width: 120, height: 170)
                      .cornerRadius(10)
                  }
                  
                  VStack(alignment: .leading, spacing: 10){
                    Text(item.wrappedTitle).fontWeight(.bold)
                    
                    Text(item.wrappedIDesc).font(.caption)
                      .lineLimit(4)
                      .multilineTextAlignment(.leading)
                  }
                }
              }
            }.onDelete(perform: deleteNewsList)
            
          }
        }
        .navigationBarTitle(Text("Favorite News"))
      }
    }
  
  private func deleteNewsList(at offsest: IndexSet){
    for index in offsest{
      let favorite = favoriteNews[index]
      moc.delete(favorite)
      
      do{
        try moc.save()
      } catch{
        print(error)
      }
    }
  }
}

struct FavoriteNewsList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteNewsList()
    }
}
