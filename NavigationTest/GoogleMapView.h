//
//  GoogleMapView.h
//  NavigationTest
//
//  Created by Tiago Sousa on 18/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GoogleMapView : UIViewController {
    IBOutlet UIWebView * googleMapWebView;
    NSString * address;
}

@property (nonatomic, retain) UIWebView * googleMapWebView;
@property (nonatomic, retain) NSString * address;

@end
