//
//  View.swift
//  ApiSwiftUI
//
//  Created by Sanjay Sharma on 27/08/24.
//

import SwiftUI


extension View {
    func navigate<Destination: View>(to destination: Destination, when shouldNavigate: Binding<Bool>) -> some View {
        NavigationLink(
            destination: destination,
            isActive: shouldNavigate,
            label: { EmptyView() }
        ).hidden()
    }
}

