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


// MARK: - Helper Views

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
        TextStackData(num: "10", value: "Posts"),
        TextStackData(num: "13.3K", value: "Followers"),
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
                .frame(width: 24, height: 24)
                .background(Color.blue)
                .border(Color.white, width: 4)
                .cornerRadius(14)
                .offset(x: -90, y: 40)
        }.padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
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
        }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
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
    .buttonStyle(DefaultButtonStyle())
    }
}

@available(iOS 13.0, *)
struct ButtonView: View {
    var body: some View {
        HStack {
            CustomButton(btnConfig: ButtonConfig(title: "Edit Profile"))
            CustomButton(btnConfig: ButtonConfig(title: "Promotions"))
            CustomButton(btnConfig: ButtonConfig(title: "Contact"))
            
        }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
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
            }.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        }
    }
}


// MARK: - Embedded a collectionView in SwiftUI View

@available(iOS 13.0, *)
struct FeedHeader: UIViewRepresentable {
    
    let dummyData: [FeedData] = [
        FeedData("username", "fname", "lname", "email", ["Home", "Home", "Home"], uid: "1"),
        FeedData("username", "fname", "lname", "email", ["Home", "Home", "Home"], uid: "1"),
        FeedData("username", "fname", "lname", "email", ["Home", "Home", "Home"], uid: "1"),
        FeedData("username", "fname", "lname", "email", ["Home", "Home", "Home"], uid: "1"),
        FeedData("username", "fname", "lname", "email", ["Home", "Home", "Home"], uid: "1"),
        FeedData("username", "fname", "lname", "email", ["Home", "Home", "Home"], uid: "1"),
        FeedData("username", "fname", "lname", "email", ["Home", "Home", "Home"], uid: "1")
    ]
    
    func makeUIView(context: Context) -> FeedHeader.UIViewType {
        
        //Create and configure your layout flow seperately
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 25, left: 0, bottom: 25, right: 0)
        flowLayout.scrollDirection = .horizontal


        //And create the UICollection View
        let collectionView = FeedHeaderCollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 50), collectionViewLayout: flowLayout)
        
        collectionView.backgroundColor = .clear
        
        return collectionView
    }
    
    func updateUIView(_ feedCollectionView: FeedHeaderCollectionView, context: Context) {
        feedCollectionView.data = dummyData
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
        }
    }
}

@available(iOS 13.0, *)
struct UpperAccountUIView_Previews: PreviewProvider {
    static var previews: some View {
        UpperAccountUIView()
    }
}
