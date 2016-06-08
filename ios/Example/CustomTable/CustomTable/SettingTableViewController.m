//
//  SettingTableViewController.m
//  CustomTable
//
//  Created by David June Kang on 2016. 6. 8..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "SettingTableViewController.h"
#import "SettingTableViewCell.h"
#import "DataCenter.h"
#import "WeatherTableViewController.h"

@interface SettingTableViewController () <UITableViewDelegate, UITableViewDataSource, SettingTableViewCellDelegate>

@property (nonatomic, strong) DataCenter *dataCenter;

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataCenter = [DataCenter defaultData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//섹션갯수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}
//섹션내 로우 갯수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}

//Cell표현에 대한 함수
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *dataArray = [self.dataCenter settingTableDataForSection:indexPath.section];
    NSString *text = [dataArray objectAtIndex:indexPath.row];
    
    if(indexPath.section == 0){
        //커스텀셀생성을 위한 초기화 - 셀 identifier를 선언
        SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
        
        //만약 셀이 생성이 안되었을시 생성
        if(cell == nil){
            cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingCell"];
            cell.delegate = self;
            cell .selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        //셀내 액세서리 파트 스위치 값
        BOOL isFunctionOn = [self.dataCenter isOnForSetting:indexPath.row];
        [cell.settingSwitch setOn:isFunctionOn];
        
        //셀내컨텐츠 항목설정
        [cell.textLabel setText:text];
        
        return cell;
    
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubtitleCell" forIndexPath:indexPath];
        
        cell.textLabel.text = text;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
}

//섹션의 헤더의 이름 설정
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.dataCenter settingTableHeaderForSection:section];
}

#pragma mark - Setting Table View Cell Delegate

//셀 스위치 이벤트 처리 ( Delegate )
-(void)settingTableViewCellSwitchValueChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn{
    NSIndexPath *cellIndex = [self.tableView indexPathForCell:cell];
    
    if(cellIndex.section == 0){
        [self.dataCenter setSetting:cellIndex.row isOn:isOn];
        NSLog(@"Cell Index = %ld - %ld, isOn %d",cellIndex.section, cellIndex.row, isOn);
    }
    
}

#pragma mark - UITableView delegate
//셀 셀렉트시 이벤트 처리
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"Row Selected : %ld - %ld", indexPath.section, indexPath.row);
    
    if(indexPath.section == 0){
        return;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //화면 이동할때 셀의 내용을 전달?ㄱ
    UITableViewCell *sender = [tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"ShowDetailWeather" sender:sender];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UITableViewCell *senderCell = (UITableViewCell *)sender;
    
    NSLog(@"segue will action : %@",senderCell.textLabel.text);
    
    if([[segue identifier]isEqualToString:@"ShowDetailWeather"]){
        WeatherTableViewController *tableViewController = segue.destinationViewController;
        
        if([senderCell.textLabel.text isEqualToString:@"한국날씨"]){
            tableViewController.wetherType = WeatherTypeKorea;
        }else{
            tableViewController.wetherType = WaatherTypeWorld;
        }
    }
    

    
}


@end
