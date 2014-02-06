//
//  AddExercicioViewController.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/5/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BegymModel.h"
#import "GerenciarTreinoViewController.h"
#import "ExerciciosTemporarios.h"

@interface AddExercicioViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *exercicios;
@property (nonatomic, strong) GerenciarTreinoViewController *treinoViewController;

@end
