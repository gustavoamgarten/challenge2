//
//  AddSexViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 2/3/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "AddSexViewController.h"
#import "AddBirthdayViewController.h"

@interface AddSexViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *sexoSegmentedControl;

@end

@implementation AddSexViewController

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
    
    self.sexo = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToAddBirthday:(UIButton *)sender {
    self.sexo = self.sexoSegmentedControl.selectedSegmentIndex;
    [self performSegueWithIdentifier:@"addBirthday" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AddBirthdayViewController *destController = segue.destinationViewController;
    destController.nome = self.nome;
    destController.sexo = self.sexo;
}

@end
