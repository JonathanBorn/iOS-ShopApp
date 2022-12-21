//
// ItemDetailView.swift
//  ShopApp
//
//  Created by Jonathan Born on 2021-10-06.
//

import SwiftUI

struct ItemDetailView: View {
    var name: String = ""
    var image: String = ""
    var price: String = ""
    
    var body: some View {
        ZStack{
            VStack (alignment: .leading) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.top)
                
                VStack (alignment: .leading) {
                    Text(name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    HStack (spacing: 2){
                        ForEach (0 ..< 5 ) { item in
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        }
                        
                        Text("(4.9)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(.leading)
                    
                    Text("Description")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .opacity(0.5)
                        .padding()
                    
                    Text("This is a fancy chair, This is a fancy chair, This is a fancy chair, This is a fancy chair, This is a fancy chair, This is a fancy chair, This is a fancy chair")
                        .font(.body)
                        .padding(.leading)
                    
                    Spacer()
                }
                .padding(.top)
                .background(.white)
                .cornerRadius(30)
                .offset(y: -50)
                
                Text(price)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Spacer()
            }
            .offset(y: -100)
        }
    }
}


struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView()
    }
}
