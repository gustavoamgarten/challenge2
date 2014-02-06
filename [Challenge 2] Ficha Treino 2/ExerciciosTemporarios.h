//
//  ExerciciosTemporarios.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/6/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BegymModel.h"

@interface ExerciciosTemporarios : NSObject

@property (nonatomic) NSInteger peso;
@property (nonatomic) NSInteger repeticoes;
@property (nonatomic) NSInteger sequencias;
@property (nonatomic, strong) Exerciciopadrao *detalheExercicio;

@end
