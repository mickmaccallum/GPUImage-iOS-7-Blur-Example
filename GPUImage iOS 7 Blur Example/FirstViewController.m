//
//  FirstViewController.m
//  GPUImage iOS 7 Blur Example
//
//  Created by Mick on 10/29/13.
//  Copyright (c) 2013 HappTech Development. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (strong , nonatomic) UIImageView *imageView;

@end


@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];

    UIImage *image = [UIImage imageNamed:@"image.png"];

    UIImage *blurredImage = [self blurredImageFromImage:image];

    [self.imageView setImage:blurredImage];

    [self.view addSubview:self.imageView];
}

- (UIImage *)blurredImageFromImage:(UIImage *)image
{
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:image];

    GPUImageiOSBlurFilter *blurFilter = [GPUImageiOSBlurFilter new];
    [blurFilter setSaturation:2.0];
    [blurFilter setDownsampling:3.0];
    [blurFilter setBlurRadiusInPixels:10.0];

    [stillImageSource addTarget:blurFilter];

    [blurFilter prepareForImageCapture];

    [stillImageSource processImage];

    return [blurFilter imageFromCurrentlyProcessedOutput];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
