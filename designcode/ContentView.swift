//
//  ContentView.swift
//  designcode
//
//  Created by Hemant Joshi on 19/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var show = false;
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            TitleView().blur(radius:show ? 6 :0).animation(.default)
            
            CardBottomView().blur(radius: show ? 6 :0).animation(.default)
            
            
            // Card 1
            
            CardView()
                .background(show ? Color.red : Color("background8"))
                .cornerRadius(25)
                .shadow(radius: 20)
                .offset(x:0, y: show ? -400 : -40).scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ?15 :0))
                .rotation3DEffect(
                    Angle(degrees: show ? 50 :0),
                    axis: (x: 10.0, y: 10.0, z: 10.0)
                ).blendMode(.hardLight).animation(.easeOut(duration: 0.42)).offset(x:viewState.width, y:viewState.height)
            
            
            // Card 2
            
            CardView().background(show ? Color("background5") : Color("background9"))
                .cornerRadius(25)
                .shadow(radius: 20)
                .offset(x:0, y:show ? -200 : -20).scaleEffect(0.9).rotationEffect(Angle(degrees: show ?10 :0)).rotation3DEffect(
                Angle(degrees: show ? 40 : 0),
                axis: (x: 10.0, y: 10.0, z: 10.0)
            ).blendMode(.hardLight).animation(.easeIn(duration: 0.42)).offset(x:viewState.width, y:viewState.height)
            
            
            // Certificate Card
            
            CertificateView()
                .offset(x:viewState.width, y:viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 1)).rotation3DEffect(
                    Angle(degrees: show ? 30 : 0),
                    axis: (x: 10.0, y: 10.0, z: 10.0)
                ).animation(.spring(response: 0.4, dampingFraction: 1, blendDuration: 3)).onTapGesture {
                    self.show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged {value in
                            self.viewState = value.translation
                            self.show = true
                            
                        }
                        .onEnded(){
                            value in
                            self.viewState = CGSize.zero
                            self.show=false
                        }
                )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack{
            Text("Card Back")
        }
        .frame(width: 340.0, height: 220.0)
    }
}

struct CertificateView: View {
    var body: some View {
        VStack{
            HStack {
                VStack(alignment:.leading){
                    Text("UI Design")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .padding(.top)
                    Text("Certificate")
                        .foregroundColor(.white)
                }
                Spacer()
                Image("Logo").resizable().frame(width: 30, height: 30)
            }
            .padding(.horizontal)
            Spacer()
            Image("Background")
        }
        .frame(width:340, height: 220)
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 25)
    }
}

struct TitleView: View {
    var body: some View {
        VStack{
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
        }.padding()
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle().frame(width: 60, height: 6).cornerRadius(3).opacity(0.1)
            
            Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.").lineLimit(5)
            Spacer()
        }.frame(minWidth:0, maxWidth: .infinity)
        .padding().padding(.horizontal).background(Color.white).cornerRadius(30).shadow(radius: 20).offset(y:600)
    }
}
