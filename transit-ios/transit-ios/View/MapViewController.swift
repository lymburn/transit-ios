//
//  MapViewController.swift
//  transit-ios
//
//  Created by Eugene Lu on 2021-02-10.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    private var mapPresenter: MapPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setupPresenter()
        
        mapPresenter.fetchFeeds()
    }
    
    var feedPinAnnotations: [CustomFeedPinAnnotation] = []
    
    let annotationViewIdentifier = "AnnotationViewIdentifier"

    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        return mapView
    }()
    
    func setFeedPins(feedViewModel: FeedViewModel) {
        let latitude = feedViewModel.latitude
        let longitude = feedViewModel.longitude
        let coordinate = CLLocationCoordinate2D(latitude: latitude,
                                                longitude: longitude)
        let name = feedViewModel.name
        let city = feedViewModel.city
        let pinColor = feedViewModel.pinColor
        let pin = CustomFeedPinAnnotation(coordinate: coordinate, title: name, subtitle: city, imageColor: pinColor)
        feedPinAnnotations.append(pin)
    }
    
    func updateMapView() {
        mapView.addAnnotations(feedPinAnnotations)
    }
}

// MARK: Setup
extension MapViewController {
    fileprivate func setupViews() {
        view.backgroundColor = .white
        view.addSubview(mapView)
    }
    
    fileprivate func setupConstraints() {
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    fileprivate func setupPresenter() {
        let networkService = NetworkService()
        mapPresenter = MapPresenter(networkService: networkService)
        mapPresenter.setPresenterDelegate(mapPresenterDelegate: self)
    }
}

// MARK: MKMapViewDelegate functions
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if var imageColor: UIColor = UIColor.hexToColor(hex: MapPinColorHex.other) {
            if let customAnnotation = annotation as? CustomFeedPinAnnotation {
                imageColor = customAnnotation.imageColor
            }
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationViewIdentifier)

            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationViewIdentifier)
                annotationView!.canShowCallout = true
            } else {
                annotationView!.annotation = annotation
            }
            
            // Always set image with expected country code color
            let image = UIImage(named: ImageNames.pin)?.tinted(with: imageColor)
            annotationView!.image = image

            return annotationView
        }
        
        return nil
    }
}

// MARK: Map presenter functions
extension MapViewController: MapPresenterDelegate {
    func updateFeedsOnMap(feedViewModels: [FeedViewModel]) {
        for feedViewModel in feedViewModels {
            setFeedPins(feedViewModel: feedViewModel)

            // Run on main thread to update UI
            DispatchQueue.main.async {
                self.updateMapView()
            }
        }
    }
}


