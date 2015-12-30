//
//  ViewController.m
//  RecordVideoDemo
//
//  Created by wd on 15/12/30.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<RETableViewManagerDelegate>

@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) RETableViewManager    *tableViewManager;
@property (nonatomic, strong) RETableViewSection    *tableViewSection;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Record";
    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViews
{
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"录制" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightItem;
    rightItem.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        return [RACSignal empty];
    }];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableViewManager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    self.tableViewSection = [RETableViewSection section];
    [self.tableViewManager addSection:self.tableViewSection];
    
    @weakify(self);
    RETableViewItem * item = [RETableViewItem itemWithTitle:@"Test"
                                              accessoryType:UITableViewCellAccessoryDisclosureIndicator
                                           selectionHandler:^(RETableViewItem *item) {
                                               @strongify(self);
                                               UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:item.indexPath];
                                               cell.selected = NO;
                                               
                                           }];
    [self.tableViewSection addItem:item];
    
}



@end
