//
//  HeadingView.swift
//  Africa
//
//  Created by Pavan Shisode on 16/05/22.
//

import SwiftUI

struct HeadingView: View {
    //MARK: - PROPERTIES
    var headingImage: String
    var headingText: String
    //MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in picture")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
