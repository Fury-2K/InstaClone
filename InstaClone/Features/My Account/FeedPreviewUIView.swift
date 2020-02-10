//
//  FeedPreviewUIView.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 04/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import SwiftUI

// MARK: - Constants

@available(iOS 13.0, *)
struct SegmentedPageData {
    let image: String
    let title: String
    let view: String
}

// MARK: - Helper Views

@available(iOS 13.0, *)
struct CellView: View {
    var body: some View {
        VStack {
            Image("Home")
                .resizable()
                .scaledToFit()
        }
    }
}

@available(iOS 13.0, *)
struct Row: View {
    var body: some View {
        HStack(spacing: 0) {
            CellView()
            CellView()
            CellView()
        }
    }
}

@available(iOS 13.0, *)
struct FeedGridView: View {
    var body: some View {
        VStack(spacing: 0) {
            Row()
            Row()
            Row()
            Row()
            Row()
            Row()
            Row()
            Row()
            Row()
        }
    }
}

@available(iOS 13.0, *)
struct TagFeedGridView: View {
    var body: some View {
        VStack(spacing: 0) {
            Row()
            Row()
        }
    }
}

//@available (iOS 13.0, *)
//struct XView: View {
//
//    @State private var selectedPageIndex = 0
//    var pages = [
//        SegmentedPageData(image: "square-individual-nine-7", title: "Feed", view: "FeedGridView"),
//        SegmentedPageData(image: "filing-7", title: "TaggedFeed", view: "TagFeedGridView")
//    ]
//
//    var body: some View {
//        Picker(selection: $selectedPageIndex, label: Text("What is your favorite color?")) {
//            ForEach(0..<pages.count) { index in
//                Image(self.pages[index].image).tag(index)
//            }
//        }
//        .pickerStyle(SegmentedPickerStyle())
//        .background(Color.clear)
//        .foregroundColor(Color.red)
//    }
//}

@available(iOS 13.0, *)
struct FeedPreviewHeaderView: View {
    
    @State var selectedPageIndex = 0
    var pages = [
        SegmentedPageData(image: "square-individual-nine-7", title: "Feed", view: "FeedGridView"),
        SegmentedPageData(image: "filing-7", title: "TaggedFeed", view: "TagFeedGridView")
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Picker(selection: $selectedPageIndex, label: Text("What is your favorite color?")) {
                    ForEach(0..<pages.count) { index in
                        Image(self.pages[index].image).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.clear)
                .foregroundColor(Color.red)
                
                if selectedPageIndex == 0 {
                    FeedGridView()
                } else {
                    TagFeedGridView()
                }
            }
        }
    }
}


// MARK: - SegmentedView

var selectedPageIndex = 0

@available(iOS 13.0, *)
struct SegmentedPageView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        guard let view = SegmentedPageViewController().view else { return UIView() }
        let vc = SegmentedPageViewController()
        selectedPageIndex = vc.selectedViewIndex
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        print(1)
    }
    
}


// MARK: - Main UIViews

@available(iOS 13.0, *)
struct FeedPreviewUIView: View {
    var body: some View {
        VStack {
            FeedPreviewHeaderView()
            //SegmentedPageView()
        }
    }
}

@available(iOS 13.0, *)
struct FeedPreviewUIView_Previews: PreviewProvider {
    static var previews: some View {
        FeedPreviewUIView()
    }
}
