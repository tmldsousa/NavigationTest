//
//  NewClientViewController.h
//  NavigationTest
//
//  Created by Tiago Sousa on 17/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewClientViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate> {
    IBOutlet UITextField * txtFieldNome;
    IBOutlet UITextField * txtFieldContacto;
    IBOutlet UITextField * txtFieldMorada;
    IBOutlet UITextView * txtViewNotas;
    
    UIViewController *caller;    
}

@property(nonatomic, retain)  UITextField * txtFieldNome;
@property(nonatomic, retain)  UITextField * txtFieldContacto;
@property(nonatomic, retain)  UITextField * txtFieldMorada;
@property(nonatomic, retain)  UITextView * txtViewNotas;

@property(nonatomic, retain) UIViewController * caller;

- (IBAction) buttonCrateClick;
- (IBAction) dismissKeyboard;

@end

