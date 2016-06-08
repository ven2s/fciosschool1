//
//  ViewController.m
//  TableViewExample
//
//  Created by youngmin joo on 2016. 6. 6..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) DataCenter *dataCenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
    
    self.dataCenter = [DataCenter defaultData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"call didReceiveMemoryWarning");
}

-(void) creatView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDelgate, UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *tableViewCellID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellID];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellID];
    }
    
    NSArray *titles = [self.dataCenter sectionTitles];
    NSDictionary *animals = [self.dataCenter allAnimals];
    
    NSString *indexName = [titles objectAtIndex:indexPath.section];
    NSArray *rows = [animals objectForKey:indexName];
    
//    NSLog(@"%ld, %ld, %@",indexPath.section, indexPath.row, indexName);
   
    NSString *animal = [NSString stringWithFormat:@"%@",[rows objectAtIndex:indexPath.row]];
//    NSLog(@"%@",animal);
   
    UIImage *image = [UIImage imageNamed:[self.dataCenter imageNameWithAnimal:animal]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor clearColor]];
    
    cell.textLabel.text = animal;
    cell.imageView.image = image;
   // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   // cell.accessoryView = button;
    
    return cell;

}

//섹션당 로우갯수
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSArray *titles = [self.dataCenter sectionTitles];
    NSDictionary *animals = [self.dataCenter allAnimals];
    
    NSString *title = [titles objectAtIndex:section];
    NSArray *rows = [animals objectForKey:title];
    
    return rows.count;
}

//섹션의 갯수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.dataCenter sectionCount];
}

//헤더에 타이틀을 표시한다.
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSArray *titles = [self.dataCenter sectionTitles];
    NSString *indexName = [titles objectAtIndex:section];
    return indexName;
}

//인덱스리스트를 표현한다.
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.dataCenter sectionTitles];
}

//로우의 크기를 정한다
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    //[self performSegueWithIdentifier:@"SHOW_DETAIL" sender:[tableView cellForRowAtIndexPath:indexPath]];
    
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UINavigationController *naviController;
    
    DetailViewController *detailView = [storyBoard instantiateViewControllerWithIdentifier:@"DETAIL_VIEW"];
    
    naviController = [[UINavigationController alloc]initWithRootViewController:detailView];
    
    [self presentViewController:naviController animated:YES completion:^{
        
    }];
}

//Cell선택시
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    DetailViewController *detailView = [storyBoard instantiateViewControllerWithIdentifier:@"DETAIL_VIEW"];
//    [self presentViewController:detailView animated:YES completion:^{
//        
//    }];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UINavigationController *naviController;
    
    DetailViewController *detailView = [storyBoard instantiateViewControllerWithIdentifier:@"DETAIL_VIEW"];
    
    naviController = [[UINavigationController alloc]initWithRootViewController:detailView];
    
    [self presentViewController:naviController animated:YES completion:^{
        
    }];

}
@end
