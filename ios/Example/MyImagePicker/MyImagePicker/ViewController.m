//
//  ViewController.m
//  MyImagePicker
//
//  Created by David June Kang on 2016. 6. 10..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *gesture;

@end

@implementation ViewController


-(IBAction)touchImageView:(id)sender{
    NSLog(@"touchImageView");
    
    UIAlertController *alertSheet = [UIAlertController alertControllerWithTitle:@"사진소스"
                                                                        message:@"사진을 가져올 소스를 선택하세요."
                                                                 preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cameraAtion = [UIAlertAction actionWithTitle:@"라이브러리"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            [self showImagePckerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                                                        }];
    
    UIAlertAction *libraryAtion = [UIAlertAction actionWithTitle:@"앨범에서 선택"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            [self showImagePckerWithSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
                                                        }];
    
    UIAlertAction *cancleAtion = [UIAlertAction actionWithTitle:@"취소"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             
                                                         }];

    [alertSheet addAction:cameraAtion];
    [alertSheet addAction:libraryAtion];
    [alertSheet addAction:cancleAtion];
    
    [self presentViewController:alertSheet animated:YES completion:nil];
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.gesture translationInView:self.imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    NSLog(@"%@", gestureRecognizer);
    return YES;
}

-(void)showImagePckerWithSourceType:(UIImagePickerControllerSourceType)soureType{
    
    //시뮬레이터에서는 접근의 한계가 있다 (카메라 접근 ㄴㄴ) 그렇기 때문에 이녀석을 넣어서 만든다
    if([UIImagePickerController isSourceTypeAvailable:soureType] == NO){
        
        return;
    }
    
    
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    
    [pickerController setSourceType:soureType];
    
    [pickerController setDelegate:self];
    
    [pickerController setAllowsEditing:YES]; //이미지 수정 여부
    
    
    [self presentViewController:pickerController animated:YES completion:nil];
}

#pragma mark - UIImagePicker Controller Delegate

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil]; //picker의 모달을 내려준다.
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *pickedOriginalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self.imageView setImage:pickedOriginalImage];

    
    //이미지 변경
    UIImage *editImage = [info objectForKey:UIImagePickerControllerEditedImage]; //이미지 수정창을 띄운다
    
    [self.imageView setImage:editImage];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
