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
    
    let cellView: [CellView] = [
        CellView(),
        CellView(),
        CellView(),
        CellView(),
        CellView(),
        CellView(),
        CellView()
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("asd")
            }
            .navigationBarItems(leading: Text("UserName"), trailing: Image("list-fat-7"))
            .navigationBarTitle(Text(""), displayMode: .inline)
        }
        
    }
}

@available(iOS 13.0, *)
struct AccountUIView_Previews: PreviewProvider {
    static var previews: some View {
        AccountUIView()
    }
}
