//
//  EditarExercicioViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/7/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "EditarExercicioViewController.h"

@interface EditarExercicioViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nomeExercicioLabel;
@property (weak, nonatomic) IBOutlet UITextField *pesoTextField;
@property (weak, nonatomic) IBOutlet UITextField *repeticoesTextField;
@property (weak, nonatomic) IBOutlet UITextField *sequenciasTextField;

@property (nonatomic) NSInteger peso;
@property (nonatomic) NSInteger repeticoes;
@property (nonatomic) NSInteger sequencias;

@end

@implementation EditarExercicioViewController

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
    
    self.pesoTextField.text = [NSString stringWithFormat:@"%@", self.exercicio.peso];
    self.repeticoesTextField.text = [NSString stringWithFormat:@"%@", self.exercicio.repeticoes];
    self.sequenciasTextField.text = [NSString stringWithFormat:@"%@", self.exercicio.sequencias];
    self.nomeExercicioLabel.text = self.exercicio.detalhesDoExercicio.nome;
    
    self.peso = [self.exercicio.peso integerValue];
    self.repeticoes = [self.exercicio.repeticoes integerValue];
    self.sequencias = [self.exercicio.sequencias integerValue];
}

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

- (IBAction)salvaExercicio:(UIButton *)sender {
    [self.exercicio editExercicioPeso:self.peso editRepeticoes:self.repeticoes editSequencias:self.sequencias];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
