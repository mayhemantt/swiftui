//
//  Home.swift
//  designcode
//
//  Created by Hemant Joshi on 22/05/21.
//

import SwiftUI

struct Home: View {
    @State var show = false
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            
            ContentView().background(Color.white).cornerRadius(30).shadow(radius: 20).animation(.spring(response: 0.2, dampingFraction: 2, blendDuration: 0.2)).offset(y:showProfile ? 40 : UIScreen.main.bounds.height)
            
                MenuButton(show:$showProfile)
                    .offset(x: -16, y: showProfile ? 0:88 ).animation(.spring())
                
            MenuRight(show: $show).offset(x:-16, y:showProfile ? 0: 88).animation(.spring())
            MenuView(show: $show)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home()
            Home()
        }
            
            
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    var body: some View {
      return HStack{
            
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text(text).font(.headline)
            Spacer()
        }
    }
}

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
    
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),Menu(title: "Team", icon: "person.and.person"),Menu(title: "Sign out", icon: "arrow.uturn.down"),
]

struct MenuView: View {
    var menu = menuData
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(menu){
                item in
                MenuRow(image: item.icon, text: item.title)
            }
            
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth: 0,maxWidth: .infinity, alignment: .center)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .rotation3DEffect(
            Angle(degrees: show ? 0 : 50),
            axis: (x: 0.0, y: 10.0, z: 0.0)
        )
        .animation(.default)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width )
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct CircleButton: View {
    var icon: String;
    var body: some View {
        HStack{
            Image(systemName: icon)
                .foregroundColor(.black)
        }.frame(width:44, height: 44).background(Color.white).cornerRadius(30).shadow(color: Color("buttonShadow"), radius: 10, x:0, y:10)
    }
}

struct MenuButton: View {
    @Binding var show: Bool
    var body: some View {
        VStack{
            HStack{
                Button(action :{self.show.toggle()}){
                    HStack{
                        Spacer()
                        Image(systemName: "list.dash")
                            .foregroundColor(.black)
                    }.padding(.trailing, 20).frame(width:90, height: 60).background(Color.white).cornerRadius(30).shadow(color: Color("buttonShadow"), radius: 10, x:0, y:10)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct MenuRight: View {
    @Binding var show: Bool;
    var body: some View {
        VStack{
            HStack{
                Spacer()
                HStack {
                    Button(action :{self.show.toggle()}){
                        CircleButton(icon:"person.crop.circle")
                    }
                    Button(action :{self.show.toggle()}){
                        CircleButton(icon:"bell")
                    }
                    
                }
            }
            Spacer()
        }
    }
}
