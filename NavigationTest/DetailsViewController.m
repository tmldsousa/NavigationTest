//
//  DetailsViewController.m
//  NavigationTest
//
//  Created by Tiago Sousa on 17/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import "DetailsViewController.h"
#import "GoogleMapView.h"

@class GoogleMapView;

@implementation DetailsViewController

@synthesize lblNome;
@synthesize lblMorada;
@synthesize lblContacto;
@synthesize lblNotas;
@synthesize imagePhoto;

@synthesize selectedClient;

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
    // Do any additional setup after loading the view from its nib.
    lblNome.text = selectedClient.Nome;
    lblMorada.text = selectedClient.Morada;
    lblContacto.text = selectedClient.Contacto;
    lblNotas.text = selectedClient.Notas;
    
    self.title = @"Detalhes";
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

-(IBAction) googleMapsInfoButtonClick
{
    GoogleMapView *googleMapView = [[GoogleMapView alloc] initWithNibName:@"GoogleMapView" bundle:nil];

    googleMapView.address = self.selectedClient.Morada;
    
    [self.navigationController pushViewController:googleMapView animated:YES];
    [googleMapView autorelease];
}

@end
