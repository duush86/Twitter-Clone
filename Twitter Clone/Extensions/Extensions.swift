//
//  Extensions.swift
//  Twitter Clone
//
//  Created by Antonio Orozco on 12/26/19.
//  Copyright © 2019 Antonio Orozco. All rights reserved.
//

import UIKit


let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageURLString : NSString?
    
    func cacheThumbnail(forThumbnailURL thumbnailURLString: NSString){
        
        guard  let thumbnailURL = URL(string: thumbnailURLString as String) else {
            
            return
            
        }
        
        imageURLString = thumbnailURLString
        
        image = UIImage(named: "placeholder")
        
        if let imageFromCache = imageCache.object(forKey: thumbnailURLString)  {
            
            self.image = imageFromCache as? UIImage
            
            print("cache image")
            
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: thumbnailURL) { (data, response, error) in
            
            if error != nil {
                
                print(error as! Error)
                
                return
                
            }
            
            DispatchQueue.main.async {
                
                guard let imageData = data else
                {
                    print("Unable to gather image data")
                    
                    return
                    
                }
                
                guard let imageToCache = UIImage(data: imageData) else {
                    
                    print("unable to gather image")
                    
                    return
                }
                                
                if self.imageURLString == thumbnailURLString {
                    
                    self.image = imageToCache
                    
                    print("Loading image")
                    
                    imageCache.setObject(imageToCache, forKey: thumbnailURLString)
                    
                }
                
                
                
            }
            
            
        }
        
        task.resume()
        
    }
    
}
