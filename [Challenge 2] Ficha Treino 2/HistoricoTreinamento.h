//
//  HistoricoTreinamento.h
//  CDtesteDBA
//
//  Created by Victor Watanabe on 29/01/14.
//  Copyright (c) 2014 KNA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Pessoa;

@interface HistoricoTreinamento : NSManagedObject

@property (nonatomic, retain) NSArray *braco;
@property (nonatomic, retain) NSArray *cintura;
@property (nonatomic, retain) NSArray *coxa;
@property (nonatomic, retain) NSArray *ombro;
@property (nonatomic, retain) NSArray *peso;
@property (nonatomic, retain) Pessoa *pessoa;

@end
