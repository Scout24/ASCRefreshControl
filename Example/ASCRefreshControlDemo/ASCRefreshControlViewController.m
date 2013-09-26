//  ASCRefreshControlDemo
//
//  Created by Felix Schulze on 8/26/2013.
//  Copyright 2013 AutoScout24 GmbH. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "ASCRefreshControlViewController.h"
#import "ASCRefreshControl.h"

@interface ASCRefreshControlViewController ()

@end

@implementation ASCRefreshControlViewController {
    ASCRefreshControl *refreshControl;
}

- (id)init {
    self = [super initWithNibName:@"ASCRefreshControlViewController" bundle:nil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"RefreshControl";

    refreshControl = [[ASCRefreshControl alloc] initWithTableView:_tableView];
    refreshControl.delegate = self;
}

#pragma mark - ASCRefreshControlDelegate

- (void)refreshControlDidBeginRefreshing:(ASCRefreshControl *)thePullToRefreshControl {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
        [refreshControl endRefreshing];
    });
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"refreshCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Cell-%d", indexPath.row];
    return cell;
}


@end