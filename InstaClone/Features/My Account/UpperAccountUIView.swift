//
//  UpperAccountUIView.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 04/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import SwiftUI

// MARK: - Constants

struct TextStackData {
    let num: String
    let value: String
}

struct ButtonConfig {
    let title: String
    // TODO: - Add action
}

struct StoryData {
    let image: String
    let title: String
}


// MARK: - Views

@available(iOS 13.0, *)
struct TextStack: View {
    let TextStackData: TextStackData
    var body: some View {
        VStack {
            Text(TextStackData.num)
                .fontWeight(.bold)
                .font(.system(size: 14))
            Text(TextStackData.value)
                .font(.system(size: 14))
        }
    }
}

@available(iOS 13.0, *)
struct HeaderView: View {

    let cellData: [TextStackData] = [
        TextStackData(num: "123", value: "Posts"),
        TextStackData(num: "133", value: "Followers"),
        TextStackData(num: "341", value: "Following")
    ]
    
    var body: some View {
        ZStack {
            HStack {
                Image("Home")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                Spacer()
                TextStack(TextStackData: cellData[0])
                Spacer()
                TextStack(TextStackData: cellData[1])
                Spacer()
                TextStack(TextStackData: cellData[2])
            }
            Image("plus-simple-7")
                .resizable()
                .frame(width: 20, height: 20)
                .cornerRadius(10)
                .offset(x: -90, y: 40)
        }
    }
}

@available(iOS 13.0, *)
struct BodyView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name")
                .font(.system(size: 14))
                .fontWeight(.bold)
            Text("Account Type")
                .font(.system(size: 14))
            Text("Discription")
                .font(.system(size: 13))
        }
    }
}

@available(iOS 13.0, *)
struct CustomButton: View {
    let btnConfig: ButtonConfig
    var body: some View {
        Button(action: {
            print("Got u!")
        }) {
            Text(btnConfig.title)
                .foregroundColor(.black)
                .font(.body)
        }
        .frame(width: 110, height: 30)
        .border(Color.gray, width: 1)
        .cornerRadius(5)
    }
}

@available(iOS 13.0, *)
struct ButtonView: View {
    var body: some View {
        HStack {
            CustomButton(btnConfig: ButtonConfig(title: "Edit Profile"))
            CustomButton(btnConfig: ButtonConfig(title: "Promotions"))
            CustomButton(btnConfig: ButtonConfig(title: "Contact"))
        }
    }
}

@available(iOS 13.0, *)
struct StoryCellView: View {
    let cellData: StoryData
    var body: some View {
        VStack {
            Image("Home")
                .resizable()
                .frame(width: 64, height: 64)
                .cornerRadius(32)
//                .border(Color.gray, width: 1)
            Text(cellData.title)
                .font(.system(size: 13))
        }
    }
}

@available(iOS 13.0, *)
struct StoryScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                StoryCellView(cellData: StoryData(image: "", title: "Home"))
                StoryCellView(cellData: StoryData(image: "", title: "Home"))
                StoryCellView(cellData: StoryData(image: "", title: "Home"))
                StoryCellView(cellData: StoryData(image: "", title: "Home"))
                StoryCellView(cellData: StoryData(image: "", title: "Home"))
                StoryCellView(cellData: StoryData(image: "", title: "Home"))
                StoryCellView(cellData: StoryData(image: "", title: "Home"))
                StoryCellView(cellData: StoryData(image: "", title: "Home"))
            }
        }
    }
}


// MARK: - Main View

@available(iOS 13.0, *)
struct UpperAccountUIView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HeaderView()
            BodyView()
            ButtonView()
            StoryScrollView()
        }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

@available(iOS 13.0, *)
struct UpperAccountUIView_Previews: PreviewProvider {
    static var previews: some View {
        UpperAccountUIView()
    }
}
