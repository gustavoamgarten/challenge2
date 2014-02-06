//
//  FinishAddExercicioViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/6/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "FinishAddExercicioViewController.h"

@interface FinishAddExercicioViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nomeExercicioLabel;
@property (weak, nonatomic) IBOutlet UITextField *pesoTextField;
@property (weak, nonatomic) IBOutlet UITextField *repeticoesTextField;
@property (weak, nonatomic) IBOutlet UITextField *sequenciasTextField;

@end

@implementation FinishAddExercicioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.nomeExercicioLabel.text = self.exercicioPadrao.nome;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addExercicio:(UIButton *)sender {
}

@end
