//
//  GerenciarTreinoViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/5/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "GerenciarTreinoViewController.h"
#import "AddExercicioViewController.h"

@interface GerenciarTreinoViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *ordemTreinoLabel;
@property (nonatomic, strong) Treinos *treino;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *exercicios;
@property (nonatomic) NSInteger ordemTreino;

@end

@implementation GerenciarTreinoViewController

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
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //Receber e atualizar a tela com os dados do treino.
    //NSLog(@"Ficha: %@", self.ficha);
    
    self.ordemTreino = [[self.ficha getListaTreinos] count];
    self.ordemTreino = self.ordemTreino + 1;
    
    //Criar array para armazenar exercicios
    //[self.ficha addTreino:[NSString stringWithFormat:@"%d", ordemTreino]];
    self.exercicios = [[NSMutableArray alloc] init];
    NSLog(@"Criou Treino");
    
    self.ordemTreinoLabel.text = [NSString stringWithFormat:@"%d", self.ordemTreino];
    
    //self.treino = [[self.ficha getListaTreinos] objectAtIndex:(ordemTreino - 1)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    [self.tableView reloadData];
    //self.exercicios = [self.treino getListaExercicios];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [[self.treino getListaExercicios] count];
    return [self.exercicios count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gerenciarTreinoCell"];
    
    ExerciciosTemporarios *exercicio = [self.exercicios objectAtIndex:indexPath.row];
    cell.textLabel.text = exercicio.detalheExercicio.nome;
    NSString *detail = [NSString stringWithFormat:@"Peso: %d Repetições: %d Sequências: %d", exercicio.peso, exercicio.repeticoes, exercicio.sequencias];
    cell.detailTextLabel.text = detail;
    
    return cell;
}

#pragma mark - Botoes
- (IBAction)goAdicionarExercicioButton:(UIButton *)sender {
    [self performSegueWithIdentifier:@"goAdicionarExercicio" sender:self];
}

- (IBAction)salvarTreino:(UIButton *)sender {
    [self.ficha addTreino:[NSString stringWithFormat:@"%d", self.ordemTreino]];
    self.treino = [[self.ficha getListaTreinos] objectAtIndex:(self.ordemTreino - 1)];
    
    for (ExerciciosTemporarios *exTemp in self.exercicios) {
        [self.treino addExercicio:exTemp.detalheExercicio comPeso:exTemp.peso comRepeticoes:exTemp.repeticoes comSequencias:exTemp.sequencias];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Outros

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goAdicionarExercicio"]) {
        AddExercicioViewController *destController = segue.destinationViewController;
        destController.treinoViewController = self;
        destController.exercicios = self.exercicios;
    }
}

@end
