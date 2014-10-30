//
//  KWStringLexicalEquivalentMatcher.h
//  Kiwi
//
//  Created by Adam Sharp on 11/12/2013.
//  Copyright (c) 2013 Allen Ding. All rights reserved.
//

#import "KWMatcher.h"

@interface KWStringLexicalEquivalentMatcher : KWMatcher

- (void)beLexicalEquivalentOf:(NSString *)equivalent;
- (void)beLexicalEquivalentOf:(NSString *)equivalent diacriticInsensitive:(BOOL)diacriticInsensitive;
- (void)beLexicalEquivalentOf:(NSString *)equivalent caseInsensitive:(BOOL)caseInsensitive;
- (void)beLexicalEquivalentOf:(NSString *)equivalent caseInsensitive:(BOOL)caseInsensitive diacriticInsensitive:(BOOL)diacriticInsensitive;

@end
