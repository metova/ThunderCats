//
//  NSString+Utils.m
//  CategoryUtilsProject
//
//  Created by lgauthier on 11/10/13.
//  Copyright (c) 2013 Metova. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

- (BOOL)isValidEmailAddressFormat
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}


+ (NSString *)uuidWithLength:(NSInteger)length
{
    NSString *lettersString = @"a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z.A.B.C.D.E.F.G.H.I.J.K.L.M.N.O.P.Q.R.S.T.U.V.W.X.Y.Z.0.1.2.3.4.5.6.7.8.9";
    
    NSArray *letters = [lettersString componentsSeparatedByCharactersInSet:[NSCharacterSet punctuationCharacterSet]];
    NSString *randomString = @"";
    
    for (int i = 0; i <= length; i++)
    {
        NSString *character = [letters objectAtIndex:arc4random_uniform(99999999)%52];
        randomString = [NSString stringWithFormat:@"%@%@", randomString, character];
    }
    
    return [randomString copy];
}

@end
