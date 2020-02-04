//
//  FeedPreviewUIView.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 04/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct FeedPreviewUIView: View {
    var body: some View {
        CellView()
    }
}

@available(iOS 13.0, *)
struct CellView: View {
    var body: some View {
        VStack {
            Image("Home")
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
            Text("Home").foregroundColor(.blue).foregroundColor(.red)
        }
    }
}


@available(iOS 13.0, *)
struct FeedPreviewUIView_Previews: PreviewProvider {
    static var previews: some View {
        FeedPreviewUIView()
    }
}
