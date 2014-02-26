//
//  GraficoViewController.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 20/02/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "GraficoViewController.h"
#import "AcompanhamentoFisicoViewController.h"
#import "GraphView.h"

@interface GraficoViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet GraphView *graphView;

@end

@implementation GraficoViewController
//@synthesize scroller;

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
    // Do any additional setup after loading the view from its nib.
    
    
    //[self.scroller addSubview:self.graphView];//if the contentView is not already inside your scrollview in your xib/StoryBoard doc
    
    //self.scroller.contentSize = self.graphView.frame.size;
    //self.scroller.contentSize = CGSizeMake(kDefaultGraphWidth, kGraphHeight);
    [self.scrollView setContentSize:CGSizeMake(kDefaultGraphWidth, kGraphHeight)];
    
    /*
    if(![self.scrollView.subviews containsObject:self.graphView])
        [self.scrollView addSubview:self.graphView];
    self.scrollView.delegate = self;
    */
    
    [self.scrollView addSubview:self.graphView];
    self.scrollView.contentSize = self.graphView.bounds.size;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = YES;
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.delegate = self;
    
    NSLog(@"scroll SUBS(%@)",self.scrollView.subviews);//frame.size.height,self.scroller.frame.size.width);
    NSLog(@"scroll(%f,%f)",self.scrollView.frame.size.height,self.scrollView.frame.size.width);
    NSLog(@"graph(%f,%f)",self.graphView.frame.size.height,self.graphView.frame.size.width);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
