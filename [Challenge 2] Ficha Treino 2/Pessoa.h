//
//  Pessoa.h
//  CDtesteDBA
//
//  Created by Victor Watanabe on 29/01/14.
//  Copyright (c) 2014 KNA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class HistoricoTreinamento, Treinamentos;

@interface Pessoa : NSManagedObject

@property (nonatomic, retain) NSNumber * altura;
@property (nonatomic, retain) NSDate * dataDeNascimento;
@property (nonatomic, retain) NSString * nomeCompleto;
@property (nonatomic, retain) NSNumber * sexoMasculino;
@property (nonatomic, retain) HistoricoTreinamento *historicoTreinamento;
@property (nonatomic, retain) Treinamentos *treinamentos;

@end
