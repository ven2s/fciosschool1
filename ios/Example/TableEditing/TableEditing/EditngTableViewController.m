//
//  EditngTableViewController.m
//  TableEditing
//
//  Created by David June Kang on 2016. 6. 9..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "EditngTableViewController.h"
#import "DataCenter.h"

@interface EditngTableViewController ()

@property(nonatomic, strong) DataCenter *dataCenter;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addItem;
-(IBAction)clickInserNewItemButton:(id)sender;
@end

@implementation EditngTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataCenter = [DataCenter defaultData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataCenter numberOfRowInSection:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    //데이터 센터의 데이터를 출력하는 함수를 호출(섹션마다 데이터를 가져오도록 설정)
    NSMutableArray *loadData = [self.dataCenter dataForSection:indexPath.section];
    
    if(indexPath.section == 0){
        cell.textLabel.text = [loadData objectAtIndex:indexPath.row];
    
    
    }else{
        
        cell.textLabel.text = [loadData objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
    
    }
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    
//    if(indexPath.section == 0 && indexPath.row == 0){
//        return NO;
//    }
    return YES;
}

//테이블 셀의 수정 여부의 스타일을 정한다
//typedef NS_ENUM(NSInteger, UITableViewCellEditingStyle) {
//    UITableViewCellEditingStyleNone,
//    UITableViewCellEditingStyleDelete,
//    UITableViewCellEditingStyleInsert
//};

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        return UITableViewCellEditingStyleDelete;
    }
    
    return UITableViewCellEditingStyleInsert;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //데이터를 삭제한다.
        [self.dataCenter removeFirstSectionItemAtIndex:indexPath.row];
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)clickInserNewItemButton:(id)sender{
    NSLog(@"call");
    
    NSArray *secondData = [self. dataCenter dataForSection:1];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:secondData.count inSection:1];
    
    [self.dataCenter insertNewItemInSecondSection];

    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
