import SwiftUI

struct IntroSliderView: View {
    @State private var currentPage = 0
    
    
    let backgroundColors: [Color] = [
        Color.blue.opacity(0.2),
        Color.orange.opacity(0.2),
        Color.pink.opacity(0.2)
    ]
    
    var body: some View {
        NavigationStack{
            ZStack {
                backgroundColors[currentPage]
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    TabView(selection: $currentPage) {
                        IntroPageView(imageName: "dollar.circle.fill", title: "Welcome to Dsurf.", description: "Get monthly money tips and stay on top of your finance")
                            .tag(0)
                        IntroPageView(imageName: "creditcard.fill", title: "Understand your financial habits", description: "Analyze your finance with beautiful, simple and easy to understand.")
                            .tag(1)
                        IntroPageView(imageName: "person.fill", title: "Make your spending stress-free", description: "You can follow me if you wanted comment on any to get some freebies")
                            .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle())
                    
                    
                    IntroButtonView(currentPage: $currentPage) {
                        
                        NavigationLink {
                           LoginView()
                        } label: {
                            Label("Work Folder", systemImage: "folder")
                        }

                        
                     
                    }
        
                }
                
            }
        }
    }
}



struct IntroSliderView_Previews: PreviewProvider {
    static var previews: some View {
        IntroSliderView()
    }
}

//NavigationLink(destination: LoginView()) {
//    Text("Skip")
//        .foregroundColor(.gray)
//}
