//
//  theaters.h
//  MovieListings
//
//  Created by Riley Fewell on 3/22/15.
//  Copyright (c) 2015 Riley Fewell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface theaters : NSObject

- (id) initWithDictionary: (NSMutableDictionary *) dictionary;
- (void) addValue: (NSString *) attrVal forAttribute: (NSString *) attrName;
- (NSString *) getValueForAttribute: (NSString *) attr;
- (NSString *) title;
- (NSString *) cityTitle;
- (CGSize) sizeOfListEntryView;
- (NSAttributedString *) compose: str withBoldPrefix: (NSString *) prefix;
- (void) print;

@end
