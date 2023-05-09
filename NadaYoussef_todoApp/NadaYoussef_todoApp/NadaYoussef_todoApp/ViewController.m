//
//  ViewController.m
//  NadaYoussef_todoApp
//
//  Created by Nada youssef on 30/04/2023.
//

#import "ViewController.h"
#import "DetailsViewController.h"
@interface ViewController ()

@end

@implementation ViewController


@synthesize filterdArray;
@synthesize toDoArray;
@synthesize inProgressArray;


@synthesize lowArray;
@synthesize midArray;
@synthesize highArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    Task *task1=[Task new];
//    Task *task2=[Task new];
//    Task *task3=[Task new];
//    Task *task4=[Task new];
    _tableView.delegate = self;
    _tableView.dataSource= self;
    _task = [NSMutableArray new];
    _tableData = [NSMutableArray new];
    _segmentFilteration=[NSMutableArray new];
    
    
    /*_displayOptions = @[@"All Tasks", @"To-do", @"In-progress", @"Done", @"Priority"];

        [self.segOut removeAllSegments];

        [_displayOptions enumerateObjectsUsingBlock:^(NSString *option, NSUInteger idx, BOOL *stop) {

            [_segOut insertSegmentWithTitle:option atIndex:idx animated:NO];

        }];*/
    
//    task1.name=@"task1";
//    task1.description=@"one";
//    task1.status=@"1";
//    task1.priority=@"To do";
//
//
//    task2.name=@"task2";
//    task2.description=@"one";
//    task2.status=@"1";
//    task2.priority=@"In progress";
//
//    task3.name=@"task3";
//    task3.description=@"one";
//    task3.status=@"1";
//    task3.priority=@"To do";
//
//    task4.name=@"task4";
//    task4.description=@"one";
//    task4.status=@"1";
//    task4.priority=@"To do";
//
//
//
//    [_task addObject:task1];
//    [_task addObject:task2];
//    [_task addObject:task3];
//    [_task addObject:task4];
    _tableData=_task;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch(_segOut.selectedSegmentIndex){
        case 0:
            return _tableData.count;
            break;
        case 1:
            return toDoArray.count;
            break;
        case 2:
            return inProgressArray.count;
            break;
        case 3:
            return _doneArray.count;
            break;
        case 4:
            return _tableData.count;
            break;
        default:
            return 0;
            break;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *strCell = @"cell";
      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
      if(cell==nil)
      {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
      }
    switch(_segOut.selectedSegmentIndex){
        case 0:
            cell.textLabel.text = _tableData[indexPath.row].name;
            break;
        case 1:
            cell.textLabel.text = toDoArray[indexPath.row].name;
            break;
        case 2:
            cell.textLabel.text = inProgressArray[indexPath.row].name;
            break;
        case 3:
            cell.textLabel.text=_doneArray[indexPath.row].name;
            break;
        case 4:
            cell.textLabel.text=_tableData[indexPath.row].name;
            break;
        default:
            return 0;
            break;
    }
      
  
      return cell;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
  @try
  {
    [_tableData removeAllObjects];
   
    NSString *name = @"";
    if ([searchText length] > 0)
    {
        for (int i = 0; i < [_task count] ; i++)
        {
            name = [_task objectAtIndex:i].name;
            if (name.length >= searchText.length)
            {
                NSRange titleResultsRange = [name rangeOfString:searchText options:NSCaseInsensitiveSearch];
                if (titleResultsRange.length > 0)
                {
                    [_tableData addObject:[_task objectAtIndex:i]];
                }
            }
        }
    }
    else
    {
        [_tableData addObjectsFromArray:_task];
    }
    [_tableView reloadData];
}
@catch (NSException *exception) {
}
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)SearchBar
{
  SearchBar.showsCancelButton=YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)theSearchBar
{
  [theSearchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)SearchBar
{
  @try
  {
    SearchBar.showsCancelButton=NO;
    [SearchBar resignFirstResponder];
    [_tableView reloadData];
  }
  @catch (NSException *exception) {
  }
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)SearchBar
{
  [SearchBar resignFirstResponder];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    DetailsViewController *detailsVC=[self.storyboard instantiateViewControllerWithIdentifier:@"details"];
        
            detailsVC.task=[_tableData objectAtIndex:indexPath.row];
      
    [self.navigationController pushViewController:detailsVC animated:YES];
}

- (IBAction)addBtn:(UIButton *)sender {
    
    AddTaskViewController *addVC=[self.storyboard instantiateViewControllerWithIdentifier:@"addTask"];
    addVC.mainVC = self;
    [self.navigationController pushViewController:addVC animated:YES];
}
- (IBAction)segAct:(UISegmentedControl *)sender {

    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
         NSInteger selectedIndex = segmentedControl.selectedSegmentIndex;
        _choosedFilter=(long)selectedIndex;
        switch(_choosedFilter){
            case 0:
                NSLog(@"Selected index: %ld", _choosedFilter);
                [_tableView reloadData];
                break;
            case 1:
                NSLog(@"Selected index: %ld", _choosedFilter);
                 toDoArray= [NSMutableArray array];
                for(Task* data in _tableData){
                    if([data.status isEqual:@"To do"]){
                        [toDoArray addObject:data];
                    }
                }
                [_tableView reloadData];
                break;
            case 2:
                NSLog(@"Selected index: %ld", _choosedFilter);
                inProgressArray= [NSMutableArray array];
                for(Task* data in _tableData){
                    if([data.status isEqual:@"In progress"]){
                        [inProgressArray addObject:data];
                    }
                }
                [_tableView reloadData];
                break;
            case 3:
                NSLog(@"Selected index: %ld", _choosedFilter);
                _doneArray= [NSMutableArray array];
                for(Task* data in _tasksArray){
                    if([data.status isEqual:@"Done"]){
                        [_doneArray addObject:data];
                    }
                }
                [_tableView reloadData];
                break;
            case 4:
                lowArray= [NSMutableArray array];
                midArray= [NSMutableArray array];
                highArray= [NSMutableArray array];
                for(Task* data in _tableData){
                    if([data.priority isEqual:@"Easy"]){
                        [lowArray addObject:data];
                    }
                }
                for(Task* data in _tableData){
                    if([data.priority isEqual:@"Medium"]){
                        [midArray addObject:data];
                    }
                }
                for(Task* data in _tableData){
                    if([data.priority isEqual:@"Hard"] ){
                        [highArray addObject:data];
                    }
                }
                [_tableView reloadData];
                NSLog(@"Selected index: %ld", _choosedFilter);
                break;
            default:
                printf("error");
                
        }
        
        

       
}
-(void)filterTasksWithState:(NSInteger)state {
    switch (state) {
        case 0:
            _tableData = _task;
            break;
        case 1:
            // New
            _tableData = [_task filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"state == %@", @(0)]];
            break;
        case 2:
            // In Progress
            _tableData = [_task filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"state == %@", @(1)]];
            break;
        case 3:
            // Done
            _tableData = [_task filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"state == %@", @(2)]];
            break;
            
        case 4:
            break;
    
    
        
    }
    [_tableView reloadData];
}
-(void) addTask:(Task *) task{
    [_task addObject:task];
    
    NSLog(@"%@", task.name);
    [_tableView reloadData];
}

-(void) replaceTask:(Task*) oldTask andTheNewTaskIs:(Task*)new{
    NSUInteger index = [_task indexOfObject:oldTask];
    [_task replaceObjectAtIndex:index withObject:new];
    [_tableView reloadData];
    NSLog(@"%@", oldTask.name);
    NSLog(@"%@", new.name);

}

@end
