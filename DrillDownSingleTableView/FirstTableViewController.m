//
//  FirstTableViewController.m
//  DrillDownSingleTableView
//
//  Created by Andrew Murdoch on 3/19/14.
//  Copyright (c) 2014 RAM4LLC. All rights reserved.
//

#import "FirstTableViewController.h"
#import "Cell.h"

@interface FirstTableViewController ()

@end

@implementation FirstTableViewController
{
    NSIndexPath *selectedIndex;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell == nil)
        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.label.text = [NSString stringWithFormat:@"Item: %li", (long)indexPath.row];
    cell.cellCount = arc4random() % 10 + 10;
    cell.drillDelegate = self;
    cell.tag = indexPath.row;
    
    if ([selectedIndex isEqual:indexPath])
        cell.arrowImage.transform = CGAffineTransformMakeRotation(M_PI_2);
    else
        cell.arrowImage.transform = CGAffineTransformMakeRotation(M_PI*2);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath isEqual:selectedIndex])
        return 400;

    return 46;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Cell *cell = (Cell *)[tableView cellForRowAtIndexPath:selectedIndex];      //Tapping on cell that is already expanded will now close
    
    [UIView animateWithDuration:0.3 animations:^
     {
         cell.arrowImage.transform = CGAffineTransformMakeRotation(M_PI*2);
     }];
    
    if (![selectedIndex isEqual:indexPath])  //Expand cell to show details
    {
        Cell *cell = (Cell *)[tableView cellForRowAtIndexPath:indexPath];
        [UIView animateWithDuration:0.3 animations:^
         {
             cell.arrowImage.transform = CGAffineTransformMakeRotation(M_PI_2);
         }];
        
        selectedIndex = indexPath;
    }
    else //Dismiss selectedIndex so expanded cell won't be expanded again
        selectedIndex = nil;
    
    [tableView beginUpdates];
    [tableView endUpdates];
    
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)didSelectedCell:(Cell *)cell indexPath:(NSIndexPath *)indexPath
{
    cell.label.text = [NSString stringWithFormat:@"Item: %li:%li", (long)cell.tag, (long)indexPath.row];
    [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:cell.tag inSection:0]];
}

@end
