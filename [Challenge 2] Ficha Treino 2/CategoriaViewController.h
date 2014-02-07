//
//  CategoriaViewController.h
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 1/29/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BegymModel.h"
#import "FichaViewController.h"

@interface CategoriaViewController : UIViewController

@property (nonatomic, strong) Ficha *ficha;
@property (nonatomic, strong) Treinos *treino;
@property (nonatomic, strong) FichaViewController *rootController;

@end
