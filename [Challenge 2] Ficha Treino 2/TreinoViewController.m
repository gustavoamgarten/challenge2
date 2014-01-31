//
//  TreinoViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Gustavo Amgarten de Lêdo on 1/29/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "TreinoViewController.h"
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface TreinoViewController ()

@property(nonatomic) NSInteger seconds;
@property(nonatomic, strong) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *clockLabel;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;

@property (strong,nonatomic) AVAudioPlayer *messageSound;

@end

@implementation TreinoViewController

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
    
    self.clockLabel.text = [NSString stringWithFormat:@"00:03"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finishExercise:(id)sender {
    if (![self.timer isValid]) {
        //Initialize the exercise interval.
        self.seconds = 3;
        
        //Specify time interval in seconds.
        NSDate *clock = [NSDate dateWithTimeIntervalSinceReferenceDate:self.seconds];
        
        //Set the time format.
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"mm:ss";
        
        //Update the Clock Label.
        self.clockLabel.text = [dateFormatter stringFromDate:clock];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateClock) userInfo:nil repeats:YES
                      ];
        self.finishButton.enabled = NO;
        [self.finishButton setAlpha:0.5];
        //self.finishButton.titleLabel.text = [NSString stringWithFormat:@"Aguarde o intervalo"];
        [self.finishButton setTitle:@"Aguarde o intervalo" forState:UIControlStateDisabled];
    }
}

- (void)updateClock {
    //Decrement time.
    self.seconds--;
    
    //Specify time interval in seconds.
    NSDate *clock = [NSDate dateWithTimeIntervalSinceReferenceDate:self.seconds];
    
    //Set the time format.
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"mm:ss";
    
    //Update the Clock Label.
    self.clockLabel.text = [dateFormatter stringFromDate:clock];
    
    if (self.seconds == 0) {
        [self.timer invalidate];
        self.finishButton.enabled = YES;
        [self.finishButton setAlpha:1.0];
        //self.finishButton.titleLabel.text = [NSString stringWithFormat:@"Terminei o exercício"];
        [self.finishButton setTitle:@"Terminei o exercício" forState:UIControlStateNormal];
        
        //TODO
        //Send notification to user.
        
        //Problema resolvido: A instância estava sendo criada nesse método. Como estava rodando de forma assíncrona, o método terminava antes do som ser enviado, o que fazia o mesmo perder a referência e não ser tocado.
        //Solução: Criar uma propriedade do view controller para armazenar o som, assim, a referência não é perdida com o fim do método.
        NSString *soundPath = [[NSBundle mainBundle]pathForResource:@"hehehe1" ofType:@"wav"];
        NSURL *soundURL = [[NSURL alloc]initFileURLWithPath:soundPath];
        NSError *error;
        self.messageSound = [[AVAudioPlayer alloc]initWithContentsOfURL:soundURL error:&error];
        [self.messageSound play];
        
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        
    }
}
@end
