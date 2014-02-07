//
//  ExibeExercicioViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/6/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "ExibeExercicioViewController.h"
#import "EditarExercicioViewController.h"

@interface ExibeExercicioViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pesoLabel;
@property (weak, nonatomic) IBOutlet UILabel *repeticoesLabel;
@property (weak, nonatomic) IBOutlet UILabel *sequenciasLabel;
@property (weak, nonatomic) IBOutlet UILabel *nomeLabel;

@end

@implementation ExibeExercicioViewController

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
    
    //Atualiza dados
    self.nomeLabel.text = self.exercicio.detalhesDoExercicio.nome;
    self.pesoLabel.text = [NSString stringWithFormat:@"%@", self.exercicio.peso];
    self.repeticoesLabel.text = [NSString stringWithFormat:@"%@", self.exercicio.repeticoes];
    self.sequenciasLabel.text = [NSString stringWithFormat:@"%@", self.exercicio.sequencias];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editExercicio:(id)sender {
    [self performSegueWithIdentifier:@"editarExercicio" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EditarExercicioViewController *destController = segue.destinationViewController;
    
    destController.exercicio = self.exercicio;
    destController.rootController = self.rootController;
}

@end
