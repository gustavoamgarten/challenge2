//
//  Treinamentos.h
//  CDtesteDBA
//
//  Created by Victor Watanabe on 29/01/14.
//  Copyright (c) 2014 KNA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FichaDeTreino, Pessoa;

@interface Treinamentos : NSManagedObject

@property (nonatomic, retain) Pessoa *pessoa;
@property (nonatomic, retain) NSSet *fichasDeTreino;
@end

@interface Treinamentos (CoreDataGeneratedAccessors)

- (void)addFichasDeTreinoObject:(FichaDeTreino *)value;
- (void)removeFichasDeTreinoObject:(FichaDeTreino *)value;
- (void)addFichasDeTreino:(NSSet *)values;
- (void)removeFichasDeTreino:(NSSet *)values;

@end
