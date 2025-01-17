//
//  MapVC.swift
//  brainGroom
//
//  Created by Satya Mahesh on 12/08/17.
//  Copyright © 2017 Mahesh. All rights reserved.
//

import UIKit
import GoogleMaps
import FCAlertView


class CVCell : UICollectionViewCell
{
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var dateAndTimeLbl: UILabel!
    @IBOutlet weak var eventIcon: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var descLbl: UILabel!
}

class MapVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,CLLocationManagerDelegate, FCAlertViewDelegate,GMSMapViewDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var mapVW: GMSMapView!
    @IBOutlet weak var CV: UICollectionView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var constrintHeightTblView: NSLayoutConstraint!
    
    var locationManager = CLLocationManager()
    
    var latitude = Double()
    var longitude = Double()
    
    var categoryArray = NSArray()
    var dataArray = NSArray()
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var selectedCategory : String = ""
    var mapDistance : Float = 10.0
    var selectedClassData = NSMutableArray()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        CV.delegate = self
        CV.dataSource = self
        
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(UINib.init(nibName: "CustomMapClassTVC", bundle: nil), forCellReuseIdentifier: "CustomMapClassTVC")
        
        categoryDataFromServer()
        CV.isHidden = false
    }
    
    func setLocation()
    {
        
        self.locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        mapVW.delegate = self
        
    }
    
    @IBAction func clickToSearch(_ sender: Any)
    {
        searchTxt.text = ""
        searchView.isHidden = false
    }
    
    @IBAction func clickToDone(_ sender: Any)
    {
        searchTxt.text = ""
        searchView.isHidden = true
    }
    
    @IBAction func clickToCloseListView(_ sender: Any)
    {
        listView.removeFromSuperview()
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView?  //first tap on Map Pin
    {
        let dict : NSDictionary = (marker.userData as? NSDictionary)!
        print(dict)
        getMarkerClassFromServer(dict: dict)
        
//        let selectedLat : String = dict["latitude"] as? String ?? ""
//        let selectedLong : String = dict["longitude"] as? String ?? ""
//
//        selectedClassData = NSMutableArray()
//        for i in 0..<self.dataArray.count
//        {
//            let newDict : NSDictionary = self.dataArray.object(at: i) as! NSDictionary
//            let newLat : String = newDict["latitude"] as? String ?? ""
//            let newLong : String = newDict["longitude"] as? String ?? ""
//
//            if (selectedLat == newLat) && (selectedLong == newLong)
//            {
//                selectedClassData.add(self.dataArray.object(at: i) as! NSDictionary)
//            }
//        }
//
//        AFWrapperClass.displaySubViewtoParentView(self.view, subview: listView)
//        tblView.reloadData()
//        constrintHeightTblView.constant = tblView.contentSize.height
//        if constrintHeightTblView.constant > UIScreen.main.bounds.size.height-100 {
//            constrintHeightTblView.constant = UIScreen.main.bounds.size.height-100
//        }
//        print(selectedClassData)
//        print(constrintHeightTblView.constant)
        return UIView()
    }

    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker)
    {
        let dic = marker.userData as? NSDictionary
        print("Marker Info--->\(String(describing: dic))")
        getMarkerClassFromServer(dict: dic!)
    }
    
    //MARK: ------------------------ Location Delegate ----------------------------
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        latitude = locValue.latitude
        longitude = locValue.longitude
        
//        latitude = 13.082680
//        longitude = 80.270718
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude:longitude, zoom: 12);
        self.mapVW.camera = camera
        self.mapVW.addSubview(gradientView)
        
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
        self.getDataFromServer()
    }
//MARK: --------------------------- API Hitting --------------------------
    
    func categoryDataFromServer()
    {
        let baseURL: String  = String(format:"%@getCategory",Constants.mainURL)
        
        AFWrapperClass.svprogressHudShow(title: "Loading...", view: self)
        
        AFWrapperClass.requestPOSTURL(baseURL, params: nil, success: { (responseDict) in
            
            print("DDD: \(responseDict)")
            AFWrapperClass.svprogressHudDismiss(view: self)
            let dic:NSDictionary = responseDict as NSDictionary
            if (dic.object(forKey: "res_code")) as! String == "1"
            {
                self.categoryArray = dic.object(forKey: "braingroom") as! NSArray
                print(self.categoryArray)
                self.CV.reloadData()
                if (self.categoryArray.count > 0)
                {
                    self.setLocation()
                }
                else
                {
                    self.displayAlert(resString: dic.object(forKey: "res_msg") as! String)
                }
            }
            else
            {
                self.displayAlert(resString: dic.object(forKey: "res_msg") as! String)
            }
        }) { (error) in
            AFWrapperClass.svprogressHudDismiss(view: self)
            self.appDelegate.displayServerError()
        }
    }
    
    func getDataFromServer()
    {
        let baseURL: String  = String(format:"%@exploreDashboard",Constants.mainURL)
        let innerParams : [String: String] = [
            "lat": String(format:"%f",latitude),
            "lng" : String(format:"%f",longitude)
        ]
        let params : [String: AnyObject] = [
            "braingroom": innerParams as AnyObject
        ]
        print(params)
        
        AFWrapperClass.svprogressHudShow(title: "Loading...", view: self)
        
        AFWrapperClass.requestPOSTURLVersionChange(baseURL, params: params, success: { (responseDict) in
            
            print("DDD: \(responseDict)")
            AFWrapperClass.svprogressHudDismiss(view: self)
            let dic:NSDictionary = responseDict as NSDictionary
            if (dic.object(forKey: "res_code")) as! String == "1"
            {
                self.dataArray = dic["braingroom"] as! NSArray
                if (self.dataArray.count > 0)
                {
                    self.mapVW.clear()
                    for i in 0..<self.dataArray.count
                    {
                        let latStr = String(format:"%@",(self.dataArray.object(at: i) as! NSDictionary).object(forKey: "latitude") as! String)
                        let lonStr = String(format:"%@",(self.dataArray.object(at: i) as! NSDictionary).object(forKey: "longitude") as! String)
                        
                        let lat: Double = Double(latStr) ?? 0.0
                        let lon: Double = Double(lonStr) ?? 0.0
                        
                        let center = CLLocationCoordinate2D(latitude:lat, longitude:lon)
                       
                        let marker = GMSMarker()
                        marker.position = center
                        marker.snippet = (self.dataArray.object(at: i) as! NSDictionary).object(forKey: "class_topic") as? String
                        marker.appearAnimation = .pop
                        marker.icon = UIImage.init(named: "pinPlaceholder")
                        marker.icon = GMSMarker.markerImage(with: AFWrapperClass.colorWithHexString(((self.dataArray.object(at: i) as! NSDictionary).object(forKey: "color_code") as? String)!))
                        marker.map = self.mapVW
                        marker.userData = self.dataArray.object(at: i) as? NSDictionary
                        
                        if i == self.dataArray.count-1
                        {
                            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude:lon, zoom: 12);
                            self.mapVW.camera = camera
                        }
                    }
                }
                else
                {
                    self.displayAlert(resString: "No results found in your location")
                }
            }
            else
            {
                self.displayAlert(resString: "")
            }
        }) { (error) in
            AFWrapperClass.svprogressHudDismiss(view: self)
            self.displayAlert(resString: error.localizedDescription)
        }
    }
    
    func getDataWithCategoryFromServer()
    {
        let baseURL: String  = String(format:"%@exploreFilter",Constants.mainURL)
        
        let innerParams : [String: String] = [
            "lat": String(format:"%f",latitude),
            "lng" : String(format:"%f",longitude),
            "category_id" : selectedCategory,
            "distance" : String(mapDistance),
            "location" : searchTxt.text!,
        ]
        
        let params : [String: AnyObject] = [
            "braingroom": innerParams as AnyObject
        ]
        print(params)
        
        AFWrapperClass.svprogressHudShow(title: "Loading...", view: self)
        
        AFWrapperClass.requestPOSTURLVersionChange(baseURL, params: params, success: { (responseDict) in
            
            print("DDD: \(responseDict)")
            AFWrapperClass.svprogressHudDismiss(view: self)
            let dic:NSDictionary = responseDict as NSDictionary
            if (dic.object(forKey: "res_code")) as! String == "1"
            {
                self.dataArray = dic["braingroom"] as! NSArray
                if (self.dataArray.count > 0)
                {
                    self.mapVW.clear()
                    for i in 0..<self.dataArray.count
                    {
                        let latStr = String(format:"%@",(self.dataArray.object(at: i) as! NSDictionary).object(forKey: "latitude") as! String)
                        let lonStr = String(format:"%@",(self.dataArray.object(at: i) as! NSDictionary).object(forKey: "longitude") as! String)
                        
                        let lat: Double = Double(latStr) ?? 0.0
                        let lon: Double = Double(lonStr) ?? 0.0
                        
                        let center = CLLocationCoordinate2D(latitude:lat, longitude:lon)
                        
                        let marker = GMSMarker()
                        marker.position = center
                        marker.snippet = (self.dataArray.object(at: i) as! NSDictionary).object(forKey: "class_topic") as? String
                        marker.appearAnimation = .pop
                        marker.icon = UIImage.init(named: "pin")
                        marker.icon = GMSMarker.markerImage(with: AFWrapperClass.colorWithHexString(((self.dataArray.object(at: i) as! NSDictionary).object(forKey: "color_code") as? String)!))
                        marker.map = self.mapVW
                        marker.userData = self.dataArray.object(at: i) as? NSDictionary
                        if i == self.dataArray.count-1
                        {
                            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude:lon, zoom: 12);
                            self.mapVW.camera = camera
                        }
                    }
                }
                else
                {
                    self.displayAlert(resString: "No results found in your location")
                }
            }
            else
            {
                self.displayAlert(resString: "")
            }
        }) { (error) in
            AFWrapperClass.svprogressHudDismiss(view: self)
            self.displayAlert(resString: error.localizedDescription)
        }
    }
    
    func getMarkerClassFromServer(dict : NSDictionary)
    {
        let baseURL: String  = String(format:"%@exploreMarkerData",Constants.mainURL)
        let innerParams : [String: String] = [
            "lat": dict["latitude"] as? String ?? "",
            "lng" : dict["longitude"] as? String ?? ""
        ]
        let params : [String: AnyObject] = [
            "braingroom": innerParams as AnyObject
        ]
        print(params)
        
        AFWrapperClass.requestPOSTURLVersionChange(baseURL, params: params, success: { (responseDict) in
            
            print("DDD: \(responseDict)")
            let dic:NSDictionary = responseDict as NSDictionary
            if (dic.object(forKey: "res_code")) as! String == "1"
            {
                let tempArr : NSArray = dic["braingroom"] as! NSArray
                if (tempArr.count > 0)
                {
                    self.selectedClassData = NSMutableArray(array: tempArr)
                    
                }
                else
                {
                    self.selectedClassData = NSMutableArray()
                    self.selectedClassData.add(dict)
                }
                AFWrapperClass.displaySubViewtoParentView(self.view, subview: self.listView)
                self.tblView.reloadData()
                self.constrintHeightTblView.constant = self.tblView.contentSize.height
                if self.constrintHeightTblView.constant > UIScreen.main.bounds.size.height-100 {
                    self.constrintHeightTblView.constant = UIScreen.main.bounds.size.height-100
                }
            }
            else
            {
                self.displayAlert(resString: "")
            }
        }) { (error) in
            AFWrapperClass.svprogressHudDismiss(view: self)
            self.displayAlert(resString: error.localizedDescription)
        }
    }
    
    //MARK: ----------------------- CV Delegates & DataSource -----------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CVCell
        cell.eventIcon.layer.cornerRadius = cell.eventIcon.frame.size.width/2
        cell.eventIcon.layer.masksToBounds = true
        let dict : NSDictionary = categoryArray[indexPath.row] as! NSDictionary
        
        cell.eventIcon.sd_setImage(with: URL(string : (dict["category_image"] as? String)!))
        cell.eventTitle.text = dict["category_name"] as? String
        cell.backView.layer.cornerRadius = 10
        cell.backView.clipsToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let dict : NSDictionary = categoryArray[indexPath.row] as! NSDictionary
        selectedCategory = (dict["id"] as? String)!
        getDataWithCategoryFromServer()
        
    }
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 153, height: 50);
    }
    
    @IBAction func backBtn(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return selectedClassData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : CustomMapClassTVC = tblView.dequeueReusableCell(withIdentifier: "CustomMapClassTVC") as! CustomMapClassTVC
        let dict : NSDictionary = selectedClassData[indexPath.row] as! NSDictionary
        cell.titleLbl?.text = (dict.value(forKey: "class_topic") as? String)!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        clickToCloseListView(self)
        let dict : NSDictionary = selectedClassData[indexPath.row] as! NSDictionary
        let dvc = self.storyboard?.instantiateViewController(withIdentifier: "DetailItemViewController2") as! DetailItemViewController2
        dvc.catID = (dict.object(forKey: "class_id") as? String)!
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    
    func displayAlert(resString : String)
    {
        let alert = FCAlertView()
        alert.blurBackground = false
        alert.cornerRadius = 15
        alert.bounceAnimations = true
        alert.dismissOnOutsideTouch = false
        alert.delegate = self
        alert.makeAlertTypeWarning()
        alert.showAlert(withTitle: "Braingroom", withSubtitle: resString, withCustomImage: nil, withDoneButtonTitle: nil, andButtons: nil)
        alert.hideDoneButton = true;
        alert.addButton("OK", withActionBlock: {
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchTxt
        {
            getDataWithCategoryFromServer()
            searchTxt.resignFirstResponder()
        }
        
        return true
    }
    
}


