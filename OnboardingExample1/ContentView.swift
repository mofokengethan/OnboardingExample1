//
//  ContentView.swift
//  OnboardingExample1
//
//  Created by Ethan Mofokeng on 12/17/22.
//  Design Credit: https://dribbble.com/shots/19942973-AdaKita-Onboarding-Screen
//

import SwiftUI

struct ContentView: View {
    @State var page: Int = 0
    
    var body: some View {
        ZStack {
            
            // MARK: Onboarding Background
            switch page {
                case 0:
                    Color.lightGreen.ignoresSafeArea()
                case 1:
                    Color.lightPurple.ignoresSafeArea()
                case 2:
                    Color.lightBrown.ignoresSafeArea()
                default:
                    Color.clear
            }
            
            // MARK: Onboarding Pages
            switch page {
                case 0:
                    VStack{
                        ProgressBar(page: $page)
                        OnboardingScreen1()
                            .tag(page)
                        // MARK: Progress Bar And Controller
                        VStack {
                        
                            ProgressController(page: $page) .padding()
                        }
                    }
                case 1:
                    VStack{
                        ProgressBar(page: $page)
                        OnboardingScreen2()
                            .tag(page)
                        // MARK: Progress Bar And Controller
                        VStack {
                        
                            ProgressController(page: $page) .padding()
                        }
                    }
                case 2:
                    VStack{
                        ProgressBar(page: $page)
                        OnboardingScreen3()
                            .tag(page)
                        // MARK: Progress Bar And Controller
                            ProgressController(page: $page) .padding()
                    }
                default:
                    EmptyView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: Onboarding Screen 1
struct OnboardingScreen1: View {
    var body: some View {
        VStack {
            Image("1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Group {
                Text("Saving Is Now Easier, More Practical, And Safer With AdaKita")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 10)
                Text("Storing safely, accurately and reliably, who else if not us, save now!")
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)
            }
            .opacity(0.9)
        }
    }
}

// MARK: Onboarding Screen 2
struct OnboardingScreen2: View {
    var body: some View {
        VStack {
            Group {
                Text("Saving Is Now Easier, More Practical, And Safer With AdaKita")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 10)
                Text("Storing safely, accurately and reliably, who else if not us, save now!")
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)
            }
            .opacity(0.9)
            Image("2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom)
        }
    }
}

// MARK: Onboarding Screen 3
struct OnboardingScreen3: View {
    var body: some View {
        VStack {
            Image("3")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Group {
                Text("Saving Is Now Easier, More Practical, And Safer With AdaKita")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 10)
                Text("Storing safely, accurately and reliably, who else if not us, save now!")
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
            }
            .opacity(0.9)
        }
    }
}

// MARK: Progress Bar
struct ProgressBar: View {
    @Binding var page: Int
    
    var body: some View {
        HStack {
            Spacer()
            RoundedRectangle(cornerRadius: 8)
                .frame(width: UIScreen.main.bounds.width / 4, height: 10)
                .opacity(0.9)
            Spacer()
            RoundedRectangle(cornerRadius: 8)
                .frame(width: UIScreen.main.bounds.width / 3, height: 10)
                .opacity(page > 0 ? 0.9 : 0.1)
            Spacer()
            RoundedRectangle(cornerRadius: 8)
                .frame(width: UIScreen.main.bounds.width / 3, height: 10)
                .opacity(page > 1 ? 0.9 : 0.1)
            Spacer()
        }
    }
}

// MARK: Progress Controller 
struct ProgressController: View {
    @Binding var page: Int
    
    var body: some View {
        VStack {
            
            // MARK: NEXT ONBOARDING BUTTON
            ButtonComp(buttonCompDesign: ButtonComp.ButtonCompDesign(
                title: "Next",
                backgroundColor: .black,
                foregroundColor: .white,
                padding: 20)
            ) {
                
                // MARK: ONBOARDING PAGE LIMITER
                if page != 2 { page += 1 }
            }
            
            // MARK: SKIP ONBOARDING BUTTON
            ButtonComp(buttonCompDesign: ButtonComp.ButtonCompDesign(
                title: "Skip",
                backgroundColor: .clear,
                foregroundColor: .black,
                padding: 10)
            ) {
                
                // MARK: ONBOARDING PAGE LIMITER
                if page != 0 { page -= 1 }
            }
        }
    }
}

// MARK: MAIN BUTTON COMPONENT
struct ButtonComp: View {
    let buttonCompDesign: ButtonCompDesign
    let buttonAction: () -> Void
    
    var body: some View {
        Button(action: {
            
            // MARK: BUTTON ACTION FOR PAGE LIMITER
            buttonAction()
        }, label: {
            
            // MARK: ButtonCompDesign.title
            Text(buttonCompDesign.title)
                .bold()
                .frame(maxWidth: .infinity)
                .padding(buttonCompDesign.padding)
                .background(buttonCompDesign.backgroundColor.opacity(0.9))
                .cornerRadius(8)
                .padding(.horizontal)
                .foregroundColor(buttonCompDesign.foregroundColor)
        })
    }
}

extension ButtonComp {
    
    // MARK: Button Component Modifiers
    struct ButtonCompDesign {
        let title: String
        let backgroundColor: Color
        let foregroundColor: Color
        let padding: CGFloat
        
        init(title: String, backgroundColor: Color, foregroundColor: Color, padding: CGFloat) {
            self.title = title
            self.backgroundColor = backgroundColor
            self.foregroundColor = foregroundColor
            self.padding = padding
        }
    }
}
