//
//  RootViewController.h
//  NavigationTest
//
//  Created by Tiago Sousa on 16/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
#import "Cliente.h"

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
    Cliente *selectedEntity;
}

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) Cliente *selectedEntity;

- (void) insertNewObject: (Cliente *) client;

- (void) formNewClientReturned: (Cliente *) client sender: (UIViewController *)form;

@end
