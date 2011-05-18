//
//  Cliente.m
//  projectoListaClientes
//
//  Created by Tiago Sousa on 12/05/2011.
//  Copyright (c) 2011 ArquiConsult. All rights reserved.
//

#import "Cliente.h"


@implementation Cliente
@synthesize Nome;
@synthesize Morada;
@synthesize Contacto;
@synthesize Notas;

-(id)init
{
    self = [super init];
    if (self)
    {
        Nome = @"";
        Morada = @"";
        Contacto = @"";
        Notas = @"";
    }
    return self;
}

@end
