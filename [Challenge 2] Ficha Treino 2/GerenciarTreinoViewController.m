//
//  GerenciarTreinoViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/5/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "GerenciarTreinoViewController.h"

@interface GerenciarTreinoViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *ordemTreinoLabel;
@property (nonatomic, strong) Treinos *treino;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *exercicios;

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
    
    NSInteger ordemTreino = [[self.ficha getListaTreinos] count];
    ordemTreino = ordemTreino + 1;
    [self.ficha addTreino:[NSString stringWithFormat:@"%d", ordemTreino]];
    NSLog(@"Criou Treino");
    
    self.ordemTreinoLabel.text = [NSString stringWithFormat:@"%d", ordemTreino];
    
    self.treino = [[self.ficha getListaTreinos] objectAtIndex:(ordemTreino - 1)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    [self.tableView reloadData];
    self.exercicios = [self.treino getListaExercicios];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.treino getListaExercicios] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gerenciarTreinoCell"];
    
    cell.textLabel.text = [self.exercicios objectAtIndex:indexPath.row];
    
    return cell;
}

- (IBAction)goAdicionarExercicioButton:(UIButton *)sender {
    [self performSegueWithIdentifier:@"goAdicionarExercicio" sender:self];
}

@end
