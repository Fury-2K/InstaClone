//
//  AccountUIView.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 03/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//
import SwiftUI

@available(iOS 13.0, *)
struct AccountUIView: View {
    
    @State var selectedPageIndex = 0
    var pages = [
        SegmentedPageData(image: "square-individual-nine-7", title: "Feed", view: "FeedGridView"),
        SegmentedPageData(image: "filing-7", title: "TaggedFeed", view: "TagFeedGridView")
    ]
    
    let viewModel: MyAccountViewModel = MyAccountViewModel()
    
    var user: User = User()
    
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
        
        // Hit and trial
//        UITableView.appearance().allowsSelection = false
//        UITableViewCell.appearance().selectionStyle = .none
        
        user = viewModel.getCurrentUserData()
    }
    
    // TODO - Add tap gesture for the 3 buttons in ButtonView of UpperAccountUIView
    
    var body: some View {
        List {
            UpperAccountUIView()

            Section(header:
                Picker(selection: self.$selectedPageIndex, label: Text("What is your favorite color?")) {
                    ForEach(0..<self.pages.count) { index in
                        Image(self.pages[index].image).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.clear)
                .foregroundColor(Color.red)) {
                    // Cell
                    if self.selectedPageIndex == 0 {
                        FeedGridView()
                    } else {
                        TagFeedGridView()
                    }
            }
        }.padding(EdgeInsets(top: 0, leading: -16, bottom: 0, trailing: -16))
    }
}

@available(iOS 13.0, *)
struct AccountUIView_Previews: PreviewProvider {
    static var previews: some View {
        AccountUIView()
    }
}
