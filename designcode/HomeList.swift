//
//  HomeList.swift
//  designcode
//
//  Created by Mayank Joshi on 22/05/21.
//

import SwiftUI

struct HomeList: View {
    @State var showModal = false
    var courses = courseData
    var body: some View {
        //            NavigationView {
        ScrollView(.horizontal,showsIndicators: false
        ) {
            HStack (spacing:30){
                ForEach(courses) { item in
                    Button(action :{
                        self.showModal=true
                    }) {
                        CourseView(title: item.title, image: item.image, color: item.color, shadowColor: item.shadowColor)
                    }.sheet(isPresented: self.$showModal, content: {
                        ContentView()
                    })
                }

            }.padding(.leading, 30)
            Spacer()

        }
    }
    
    struct HomeList_Previews: PreviewProvider {
        static var previews: some View {
            HomeList()
            
        }
    }
    
    struct CourseView: View {
        var title:String = "Design Code"
        var image = "Illustartion1"
        var color = Color("background3")
        var shadowColor = Color("backgeoundShadow3")
        var body: some View {
            VStack(alignment: .leading){
                Text(title).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.white).lineLimit(5).padding([.top, .leading, .bottom], 25.0).frame(width: 150)
                Spacer()
                Image(image).resizable()
                    .renderingMode(.original).aspectRatio(contentMode: .fit).frame(width: 246, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.bottom, 30)
            }.background(color).cornerRadius(30).frame(width: 246, height: 360, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .shadow(color: shadowColor, radius: 20, x: 0.0, y: 20.0)
        }
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let courseData = [
    Course(
        title: "Build an app with swiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow3")
    ),
    
    Course(
        title: "Design Course",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow4")
    )
    
]
