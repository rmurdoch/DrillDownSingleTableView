//
//  DrillDelegate.h
//  DrillDownSingleTableView
//
//  Created by Andrew Murdoch on 3/19/14.
//  Copyright (c) 2014 RAM4LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Cell;

@protocol DrillDelegate <NSObject>

- (void)didSelectedCell:(Cell *)cell indexPath:(NSIndexPath *)indexPath;

@end
