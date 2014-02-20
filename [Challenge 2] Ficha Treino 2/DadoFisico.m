//
//  DadoFisico.m
//  [Challenge 2] Ficha Treino 2
//
//  Created by Victor Watanabe on 31/01/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "DadoFisico.h"

@implementation DadoFisico

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeFloat:self.braco forKey:@"braco"];
    [aCoder encodeFloat:self.cintura forKey:@"cintura"];
    [aCoder encodeFloat:self.coxa forKey:@"coxa"];
    [aCoder encodeFloat:self.ombro forKey:@"ombro"];
    [aCoder encodeFloat:self.panturrilha forKey:@"panturrilha"];
    [aCoder encodeFloat:self.antebraco forKey:@"antebraco"];
    [aCoder encodeFloat:self.quadris forKey:@"quadris"];
    [aCoder encodeFloat:self.porcentagemDeGordura forKey:@"porcentagemDeGordura"];
    [aCoder encodeFloat:self.altura forKey:@"altura"];
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.braco = [[aDecoder decodeObjectForKey:@"braco"] floatValue];
        self.cintura = [[aDecoder decodeObjectForKey:@"cintura"] floatValue];
        self.coxa = [[aDecoder decodeObjectForKey:@"coxa"] floatValue];
        self.ombro = [[aDecoder decodeObjectForKey:@"ombro"] floatValue];
        self.panturrilha = [[aDecoder decodeObjectForKey:@"panturrilha"] floatValue];
        self.antebraco = [[aDecoder decodeObjectForKey:@"antebraco"] floatValue];
        self.quadris = [[aDecoder decodeObjectForKey:@"quadris"] floatValue];
        self.porcentagemDeGordura = [[aDecoder decodeObjectForKey:@"porcentagemDeGordura"] floatValue];
        self.altura = [[aDecoder decodeObjectForKey:@"altura"] floatValue];
    }
    
    return self;
}

@end
