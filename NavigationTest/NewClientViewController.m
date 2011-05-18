//
//  NewClientViewController.m
//  NavigationTest
//
//  Created by Tiago Sousa on 17/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import "NewClientViewController.h"
#import "Cliente.h"
#import "RootViewController.h"

@implementation NewClientViewController

@synthesize txtFieldNome;
@synthesize txtFieldContacto;
@synthesize txtFieldMorada;
@synthesize txtViewNotas;

@synthesize caller;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Novo Cliente";
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
    
    
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(keyboardWillShow:) 
                                                 name:UIKeyboardWillShowNotification 
                                               object:self.view.window];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(keyboardWillHide:) 
                                                 name:UIKeyboardWillHideNotification 
                                               object:self.view.window];
    
    
    txtFieldNome.delegate = self;
    txtFieldContacto.delegate = self;
    txtFieldMorada.delegate = self;
    
    txtViewNotas.delegate = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:UIKeyboardWillShowNotification 
                                                  object:nil]; 
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:UIKeyboardWillHideNotification 
                                                  object:nil];  
     
    //[myView setTransform:CGAffineTransformMakeTranslation(0, -keyboardSize.height)];
}
- (void)keyboardWillHide:(NSNotification *)n
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [self.view setTransform:CGAffineTransformMakeTranslation(0, 0)];
    [UIView commitAnimations];
}
- (void)keyboardWillShow:(NSNotification *)n
{
    if([txtViewNotas isFirstResponder])
    {
        NSDictionary* userInfo = [n userInfo];
    
        // get the size of the keyboard
        NSValue* boundsValue = [userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
        CGSize keyboardSize = [boundsValue CGRectValue].size;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        [self.view setTransform:CGAffineTransformMakeTranslation(0, -(keyboardSize.height/2))];
        [UIView commitAnimations];
    }
}

- (IBAction) buttonCrateClick
{
    Cliente * newClient = [[Cliente alloc] init];
    newClient.Nome = [txtFieldNome text];
    newClient.Contacto = [txtFieldContacto text];
    newClient.Morada = [txtFieldMorada text];
    newClient.Notas = [txtViewNotas text];
    
    [newClient autorelease];
    [caller formNewClientReturned:newClient sender:self];
}

- (IBAction) buttonCancelClick
{
    [caller formNewClientReturned:nil sender:self];
}

- (IBAction) dismissKeyboard
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)sender
{   
    [sender resignFirstResponder];
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
