//
//  ViewController.h
//  NadaYoussef_todoApp
//
//  Created by Nada youssef on 30/04/2023.
//

#import <UIKit/UIKit.h>
#import "AddProtocol.h"
#import "Task.h"
#import "AddTaskViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,AddProtocol>

- (IBAction)addBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segOut;
- (IBAction)segAct:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *displayOptions;
@property NSMutableArray <Task *> *segmentFilteration;
@property NSMutableArray <Task *> *task;
@property NSMutableArray <Task *> *tableData;
@property long choosedFilter;

@property NSMutableArray *tasksArray;
@property NSMutableArray<Task*> *toDoArray;
@property NSMutableArray<Task*> *inProgressArray;
@property NSMutableArray <Task*> *doneArray;
@property NSMutableArray <Task*> *filterdArray;


@property NSMutableArray *lowArray;
@property NSMutableArray *midArray;
@property NSMutableArray *highArray;
@end

