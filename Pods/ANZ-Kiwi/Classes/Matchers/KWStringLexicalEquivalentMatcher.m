//
//  KWStringLexicalEquivalentMatcher.m
//  Kiwi
//
//  Created by Adam Sharp on 11/12/2013.
//  Copyright (c) 2013 Allen Ding. All rights reserved.
//

#import "KWStringLexicalEquivalentMatcher.h"

@interface KWStringLexicalEquivalentMatcher ()
@property (nonatomic, copy) NSString *equivalent;
@property (nonatomic, getter=isCaseInsensitive) BOOL caseInsensitive;
@property (nonatomic, getter=isDiacriticInsensitive) BOOL diacriticInsensitive;
@end

@implementation KWStringLexicalEquivalentMatcher

+ (NSArray *)matcherStrings {
    return @[@"beLexicalEquivalentOf:", @"beLexicalEquivalentOf:caseInsensitive:"];
}

- (void)beLexicalEquivalentOf:(NSString *)equivalent {
    [self beLexicalEquivalentOf:equivalent caseInsensitive:NO diacriticInsensitive:YES];
}

- (void)beLexicalEquivalentOf:(NSString *)equivalent diacriticInsensitive:(BOOL)diacriticInsensitive {
    [self beLexicalEquivalentOf:equivalent];
    self.diacriticInsensitive = diacriticInsensitive;
}

- (void)beLexicalEquivalentOf:(NSString *)equivalent caseInsensitive:(BOOL)caseInsensitive {
    [self beLexicalEquivalentOf:equivalent];
    self.caseInsensitive = caseInsensitive;
}

- (void)beLexicalEquivalentOf:(NSString *)equivalent caseInsensitive:(BOOL)caseInsensitive diacriticInsensitive:(BOOL)diacriticInsensitive {
    self.equivalent = equivalent;
    self.caseInsensitive = caseInsensitive;
    self.diacriticInsensitive = diacriticInsensitive;
}

- (BOOL)evaluate {
    NSStringCompareOptions options = 0;
    if ([self isCaseInsensitive]) {
        options |= NSCaseInsensitiveSearch;
    }
    if ([self isDiacriticInsensitive]) {
        options |= NSDiacriticInsensitiveSearch;
    }

    NSRange range = NSMakeRange(0, [self.subject length]);

    return [self.subject compare:self.equivalent options:options range:range locale:[NSLocale currentLocale]] == NSOrderedSame;
}

- (NSString *)failureMessageForShould {
    return [NSString stringWithFormat:@"expected subject to be localized equivalent of %@, got %@", self.equivalent, self.subject];
}

- (NSString *)failureMessageForShouldNot {
    return [NSString stringWithFormat:@"expected subject not to be localized equivalent of %@", self.equivalent];
}

@end
