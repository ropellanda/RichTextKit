//
//  RichTextColorPickerGroup.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-12-08.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to list ``RichTextColorPicker`` views
 for a ``RichTextColorPicker/PickerColor`` collection.

 Since this view controls multiple values, it binds directly
 to a ``RichTextContext`` instead of individual values.
 */
public struct RichTextColorPickerGroup: View {

    /**
     Create a rich text color picker.

     - Parameters:
       - context: The context to affect.
       - colors: The colors to list, by default ``RichTextColorPicker/PickerColor/all``.
     */
    public init(
        context: RichTextContext,
        colors: [RichTextColorPicker.PickerColor] = .all
    ) {
        self._context = ObservedObject(wrappedValue: context)
        self.colors = colors
    }

    private let colors: [RichTextColorPicker.PickerColor]

    @ObservedObject
    private var context: RichTextContext

    public var body: some View {
        HStack(spacing: 5) {
            ForEach(colors) {
                RichTextColorPicker(color: $0, context: context)
            }
        }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 9.0, *)
struct RichTextColorPickerGroup_Previews: PreviewProvider {

    struct Preview: View {

        @StateObject
        private var context = RichTextContext()

        var body: some View {
            RichTextColorPickerGroup(context: context)
                .padding()
        }
    }

    static var previews: some View {
        Preview()
    }
}
