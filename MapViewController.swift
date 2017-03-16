//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by 张蓉蓉 on 17/3/14.
//  Copyright © 2017年 rong. All rights reserved.
//

import UIKit
import MapKit
class MapViewController : UIViewController{
    
    var mapView: MKMapView!
    
    override func loadView() {
        //声明一个mapView
        mapView = MKMapView()
        //将当前View Contoller作为mapView
        view = mapView
        //分段表示地图的不同场景
        let segmentenControl = UISegmentedControl(items:["Standard","Hybrid","Satellite"])
        segmentenControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentenControl.selectedSegmentIndex = 0
        
        segmentenControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        segmentenControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentenControl)
        //below status bar
        /*
        let topCostraint = segmentenControl.topAnchor.constraint(equalTo: view.topAnchor)
        let leadingConstraint = segmentenControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = segmentenControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
          */
        
        let topCostraint = segmentenControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor,constant:8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentenControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentenControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topCostraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    func mapTypeChanged(_ segControl:UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view.")
    }
    
}

