//
//  SwiftUIView.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 25.06.2021.
//

import SwiftUI
import SwiftUIX

struct SwiftUIView: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.leading)
            TextField("Search", text: $search)
        }
        .frame(height: 45)
        .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark).cornerRadius(12.0))
        .padding()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
