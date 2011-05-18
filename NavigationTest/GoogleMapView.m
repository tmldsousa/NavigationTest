//
//  GoogleMapView.m
//  NavigationTest
//
//  Created by Tiago Sousa on 18/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import "GoogleMapView.h"


@implementation GoogleMapView

@synthesize googleMapWebView;
@synthesize address;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = address;
    
    NSString * stringURL = [NSString stringWithFormat:@"file:///Users/tspinguim/Documents/iOSProjects/getGoogleMap.htm?clientAddress=%@",[address stringByReplacingOccurrencesOfString:@" " withString:@"_"]];
    NSURL * url = [NSURL URLWithString:stringURL];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [googleMapWebView loadRequest:request];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
