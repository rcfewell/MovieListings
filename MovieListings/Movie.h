//
//  Movie.h
//  MovieListings
//
//  Created by Riley Fewell on 3/23/15.
//  Copyright (c) 2015 Riley Fewell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Movie : NSObject

- (id) initWithDicitonary: (NSDictionary *) dictionary;
-(void) addValue: (NSString *) attrVal forAttribute: (NSString *) attrName;;
-(NSString *) getValueForAttribute: (NSString *) attr;
-(NSString *) title;
-(CGSize) sizeOfListEntryView;
-(UIImage *)  imageForListEntry;
-(NSString *) imageNameForDetailedView;
-(NSAttributedString *) compose: (NSString *) str withBoldPrefix: (NSString *) prefix;
-(NSAttributedString *) descriptionForListEntry;
-(NSAttributedString *) titleForListEntry;
-(NSAttributedString *) genreForListEntry;
-(NSAttributedString *) directorForListEntry;
-(NSString *) htmlDescriptionForDetailedView;
-(void) print;

@end
