//
//  CustomFeedPinAnnotation.swift
//  transit-ios
//
//  Created by Eugene Lu on 2021-02-10.
//

import Foundation
import MapKit

class CustomFeedPinAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var imageColor: UIColor

    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, imageColor: UIColor) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.imageColor = imageColor
    }
}
