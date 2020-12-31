//
//  PreferencesView.swift
//  Pika
//
//  Created by Charlie Gleason on 24/12/2020.
//

import Defaults
import KeyboardShortcuts
import SwiftUI

struct PreferencesView: View {
    @Default(.colorFormat) var colorFormat

    var body: some View {
        HStack(spacing: 0) {
            VersionView()
                .padding([.all], 30.0)
                .frame(width: 150.0)

            Divider()

            VStack(spacing: 10.0) {
                Form {
                    Picker(selection: $colorFormat, label: Text("Colour Scheme:")) {
                        ForEach(ColorFormatKeys.allCases, id: \.self) { value in
                            Text(value.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Text("Preferences")
                    .font(.title3)

                HStack {
                    Text("Global Pika:")
                    KeyboardShortcuts.Recorder(for: .togglePika)
                }

                HStack {}
            }
            .padding(.all, 20.0)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
