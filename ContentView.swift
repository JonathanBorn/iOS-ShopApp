//
//  ContentView.swift
//  ShopApp
//
//  Created by Jonathan Born on 2021-10-06.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex:  Int = 0
    
    private let categories = ["All", "Chairs", "Sofas", "Lamps", "Kitchen", "Tables"]
    
    var body: some View {
        NavigationView  {
            ZStack{
                Color("backgroundColor")
                    .ignoresSafeArea(.all)
                
                VStack (alignment: .leading){
                    NavBar()
                    TitleAndSearch()
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< categories.count) { item in
                                CategoryView(isActive: item == selectedIndex, item: categories[item])
                                    .onTapGesture {
                                        selectedIndex = item
                                    }
                            }
                        }
                    }
                    .padding()
                    
                    Divider()
                        .background(Color("anyColor"))
                        .frame(width: UIScreen.main.bounds.size.width - 50)
                        .offset(x: 25)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack (alignment: .leading) {
                            Text("Popular")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            ItemCardView()
                            
                            Text("New")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            ItemCardView()
                            
                            Text("Favorites")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            ItemCardView()
                        }
                    }
                }
                NavTabBar()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonNavBarItem: View {
    let image: String
    var body: some View {
        Button { } label: {
            Image(systemName: image)
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
        }
    }
}

struct TitleAndSearch: View {
    @State private var search: String = ""
    var body: some View {
        VStack (alignment: .leading){
            Text("Find Your Furniture!")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color("anyColor"))
                .padding()
            
            HStack {
                Button { } label: {
                    Image(systemName: "magnifyingglass")
                        .frame(width:  20, height: 20, alignment: .leading)
                        .padding(.trailing, 8)
                        .cornerRadius(10)
                        .background(.white)
                }
                TextField("Search Furniture", text: $search)
            }
            .padding()
            .background(.white)
            .cornerRadius(10)
            .padding(.horizontal)
            
            
        }
    }
}

struct CategoryView: View {
    
    let isActive: Bool
    let item: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text(item)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("anyColor") : .black.opacity(0.5))
            
            if isActive {
                Color("anyColor")
                    .frame(width:  15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
        
    }
}

struct NavTabBar: View {
    var body: some View {
        HStack{
            ButtonNavBarItem(image: "house.fill")
            ButtonNavBarItem(image: "heart")
            ButtonNavBarItem(image: "cart")
            ButtonNavBarItem(image: "person")
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding(.horizontal)
        .tint(Color("anyColor"))
        .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct ItemCard: View {
    
    let name: String
    let image: String
    let price: String
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 210, height: 300)
                .cornerRadius(20)
            
            Text(name)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack (spacing: 2){
                ForEach (0 ..< 5 ) { item in
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                }
                
                Spacer()
                
                Text(price)
                    .font(.title3)
                    .fontWeight(.bold)
                
            }
            .padding(.vertical, 1)
        }
        .frame(width: 210)
        .padding()
        .background(Color.white.opacity(0.6))
        .cornerRadius(20)
        .padding(.trailing)
    }
}

struct NavBar: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
                Image(systemName: "list.bullet")
                    .foregroundColor(Color("anyColor"))
                    .padding(.horizontal)
            })
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .padding(.horizontal)
            })
        }
    }
}

struct ItemCardView: View {
    let chairs = ["chair_1", "chair_2", "chair_3", "chair_4"]
    let prices = ["$1299", "$599", "$150", "$2400"]
    let names = ["Luxury Swedian Chair", "Modern German Chair", "Bold Swiss Chair", "Easy Peasy Chair"]
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< names.count) { item in
                    NavigationLink(destination:
                                    ItemDetailView(name: names[item],
                                                   image: chairs[item],
                                                   price: prices[item])
                                   , label: {
                        ItemCard(name: names[item],
                                 image: chairs[item],
                                 price: prices[item])
                    })
                        .navigationBarHidden(true)
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
    }
}
