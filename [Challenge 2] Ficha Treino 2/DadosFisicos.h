//
//  DadosFisicos.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 03/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Pessoa;

@interface DadosFisicos : NSManagedObject

@property (nonatomic, retain) NSArray* dadosFisicos;
@property (nonatomic, retain) Pessoa *pessoa;

@end
