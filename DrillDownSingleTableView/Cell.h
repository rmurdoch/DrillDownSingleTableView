//
//  Cell.h
//  DrillDownSingleTableView
//
//  Created by Andrew Murdoch on 3/19/14.
//  Copyright (c) 2014 RAM4LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrillDelegate.h"

@interface Cell : UITableViewCell <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIImageView *arrowImage;
@property (nonatomic) NSInteger cellCount;
@property (nonatomic, weak) id <DrillDelegate> drillDelegate;

@end
