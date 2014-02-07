//
//  EditarExercicioViewController.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/7/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BegymModel.h"
#import "FichaViewController.h"

@interface EditarExercicioViewController : UIViewController

@property (nonatomic, strong) Exercicio *exercicio;
@property (nonatomic, strong) FichaViewController *rootController;

@end
