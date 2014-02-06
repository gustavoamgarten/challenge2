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
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@property(nonatomic) NSInteger peso;
@property(nonatomic) NSInteger repeticoes;
@property(nonatomic) NSInteger sequencias;

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
    self.peso = 0;
    self.repeticoes = 0;
    self.sequencias = 0;
    
    NSLog(@"Passou exercicio padrao: %@", self.exercicioPadrao);
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    
//    self.addButton.enabled = YES;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)editPeso:(UITextField *)sender {
    self.peso = [sender.text integerValue];
}

- (IBAction)editRepeticoes:(UITextField *)sender {
    self.repeticoes = [sender.text integerValue];
}

- (IBAction)editSequencias:(UITextField *)sender {
    self.sequencias = [sender.text integerValue];
}

- (IBAction)addExercicio:(UIButton *)sender {
    
    ExerciciosTemporarios *ex = [[ExerciciosTemporarios alloc] init];
    ex.peso = self.peso;
    ex.repeticoes = self.repeticoes;
    ex.sequencias = self.sequencias;
    ex.detalheExercicio = self.exercicioPadrao;
    
    //[self.treino addExercicio:self.exercicioPadrao comPeso:self.peso comRepeticoes:self.repeticoes comSequencias:self.sequencias];
    [self.exercicios addObject:ex];
    
    //[self.navigationController];
    //self.addButton.enabled = NO;
    [self.navigationController popToViewController:self.treinoViewController animated:YES];
}

@end
