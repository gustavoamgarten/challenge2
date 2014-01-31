//
//  Exercicios.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 1/31/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Exercicios : NSManagedObject

@property (nonatomic, retain) NSNumber * categoria;
@property (nonatomic, retain) NSString * nome;

@end
