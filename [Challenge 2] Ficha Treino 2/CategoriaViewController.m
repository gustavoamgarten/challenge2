//
//  CategoriaViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 1/29/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "CategoriaViewController.h"
#import "ExibeExercicioViewController.h"

@interface CategoriaViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *exercicios;
@property (nonatomic) NSInteger exercicioSelecionado;

@end

@implementation CategoriaViewController

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
    
    self.exercicios = [self.treino getListaExercicios];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.treino getListaExercicios] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoriaCell" forIndexPath:indexPath];
    
    //TODO
    //Populate cell
    Exercicio *exercicio = [self.exercicios objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithRed:0.1137f green:0.3960f blue:0.4862f alpha:1];
    cell.textLabel.text = [NSString stringWithFormat:@"%d. %@", (indexPath.row + 1), exercicio.detalhesDoExercicio.nome];
    
    cell.detailTextLabel.textColor = [UIColor colorWithRed:0.9333f green:0.6078f blue:0.0666f alpha:1];
    
    
    NSInteger cat = [exercicio.detalhesDoExercicio.categoria integerValue];
    
    switch (cat) {
        case 1:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Abdominal"];
            break;
        case 2:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Biceps"];
            break;
        case 3:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Costas"];
            break;
        case 4:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Peito"];
            break;
        case 5:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Perna"];
            break;
        case 6:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Triceps"];
            break;
        case 7:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Ombro"];
            break;
        default:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Outro"];
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.exercicioSelecionado = indexPath.row;
    
    [self performSegueWithIdentifier:@"exibeDetalhesExercicio" sender:self];
}

#pragma mark - Outros

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ExibeExercicioViewController *destController = segue.destinationViewController;
    destController.exercicio = [self.exercicios objectAtIndex:self.exercicioSelecionado];
    destController.rootController = self.rootController;
}

@end
