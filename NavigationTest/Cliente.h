//
//  Cliente.h
//  projectoListaClientes
//
//  Created by Tiago Sousa on 12/05/2011.
//  Copyright (c) 2011 ArquiConsult. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Cliente : NSManagedObject {
    NSString * Nome;
    NSString * Morada;
    NSString * Contacto;
    NSString * Notas;
}

@property (nonatomic, retain) NSString * Nome;
@property (nonatomic, retain) NSString * Morada;
@property (nonatomic, retain) NSString * Contacto;
@property (nonatomic, retain) NSString * Notas;

- (id)init;

@end
