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

@synthesize scrollView;

@synthesize caller;

@synthesize activeTextField;
@synthesize activeTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        activeTextField = nil;
        activeTextView = nil;
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
    scrollView.bounces = YES;
    scrollView.alwaysBounceVertical = YES;
    scrollView.alwaysBounceHorizontal = NO;
    
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(keyboardWasShown:) 
                                                 name:UIKeyboardDidShowNotification 
                                               object:self.view.window];
    // register for keyboard notifications
    /*[[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(keyboardWillHide:) 
                                                 name:UIKeyboardWillHideNotification 
                                               object:self.view.window];
    */
    
    txtFieldNome.delegate = self;
    txtFieldContacto.delegate = self;
    txtFieldMorada.delegate = self;
    
    txtViewNotas.delegate = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil]; 
   /* // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:UIKeyboardWillHideNotification 
                                                  object:nil];  
    */
    //[myView setTransform:CGAffineTransformMakeTranslation(0, -keyboardSize.height)];
}



/*
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    svos = scrollView.contentOffset;
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:scrollView];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 60;

    [scrollView setContentOffset:pt animated:YES];           
}
*/

#pragma mark - Keyboard and text input handling

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    /*
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, activeTextField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, activeTextField.frame.origin.y-kbSize.height);
        [scrollView setContentOffset:scrollPoint animated:YES];
    }
     */
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    /*CGRect bkgndRect = activeTextField.superview.frame;
    bkgndRect.size.height += kbSize.height;
    [activeTextField.superview setFrame:bkgndRect];*/    
    CGRect textFrame;
    if(activeTextField != nil)
        textFrame = activeTextField.frame;   
    else
        textFrame = activeTextView.frame;
    
        switch ([[UIApplication sharedApplication] statusBarOrientation]) {
            case UIInterfaceOrientationPortrait:
            case UIInterfaceOrientationPortraitUpsideDown:
                
                if(activeTextField.frame.origin.y + textFrame.size.height > self.view.frame.size.height - kbSize.height)
                {
                    float kbTopBorder = (self.view.frame.size.height - kbSize.height);
                    float textBottomBorder = (textFrame.origin.y + textFrame.size.height);
                    if( textBottomBorder > kbTopBorder)
                        [scrollView setContentOffset:CGPointMake(0.0, kbTopBorder - textBottomBorder - 10) animated:YES];
                }
                
                break;
            case UIInterfaceOrientationLandscapeLeft:
            case UIInterfaceOrientationLandscapeRight:
                if(textFrame.origin.y + textFrame.size.height > self.view.frame.size.height - kbSize.height)
                {
                    float kbTopBorder = (self.view.frame.size.width - kbSize.width);
                    float textBottomBorder = (textFrame.origin.y + textFrame.size.height);
                    if(textBottomBorder > kbTopBorder )
                        [scrollView setContentOffset:CGPointMake(0.0, textBottomBorder - kbTopBorder + 10) animated:YES];
                }
                break;
            default:
                break;
        }
        
    
    [scrollView setBounces:NO];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeTextField = nil;
    [textField resignFirstResponder];
    [scrollView setBounces:YES];
    [scrollView setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    activeTextView = textView;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    activeTextView = nil;
    [textView resignFirstResponder];
    [scrollView setBounces:YES];
    [scrollView setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
    return YES;
}

- (IBAction) dismissKeyboard
{
    [scrollView setBounces:YES];
    [activeTextField endEditing:YES];
    [activeTextView endEditing:YES];
}


#pragma mark - Response/Return methods

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


#pragma mark - Rotate/Interface Orientation methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
