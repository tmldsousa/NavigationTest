//
//  DetailsViewController.h
//  NavigationTest
//
//  Created by Tiago Sousa on 17/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cliente.h"

@interface DetailsViewController : UIViewController {
    IBOutlet UILabel * lblNome;
    IBOutlet UILabel * lblContacto;
    IBOutlet UILabel * lblMorada;
    IBOutlet UILabel * lblNotas;
    IBOutlet UIImageView * imagePhoto;
    
    Cliente * selectedClient;
}

@property(nonatomic, retain) UILabel * lblNome;
@property(nonatomic, retain) UILabel * lblContacto;
@property(nonatomic, retain) UILabel * lblMorada;
@property(nonatomic, retain) UILabel * lblNotas;
@property(nonatomic, retain) UIImageView * imagePhoto;

@property(nonatomic, retain) Cliente * selectedClient;

-(IBAction) googleMapsInfoButtonClick;

@end
