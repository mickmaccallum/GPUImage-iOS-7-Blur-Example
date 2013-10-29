//
//  SecondViewController.m
//  GPUImage iOS 7 Blur Example
//
//  Created by Mick on 10/29/13.
//  Copyright (c) 2013 HappTech Development. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (strong , nonatomic) GPUImageView *gpuImageView;

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    self.gpuImageView = [[GPUImageView alloc] initWithFrame:self.view.bounds];
    [self.gpuImageView setFillMode:kGPUImageFillModePreserveAspectRatioAndFill];

    UIImage *image = [UIImage imageNamed:@"image.png"];

    [self addBlurredImage:image toGPUImageView:self.gpuImageView];

    [self.view addSubview:self.gpuImageView];

}

- (void)addBlurredImage:(UIImage *)image toGPUImageView:(GPUImageView *)imageView
{
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:image];

    GPUImageiOSBlurFilter *blurFilter = [GPUImageiOSBlurFilter new];
    [blurFilter setSaturation:2.0];
    [blurFilter setDownsampling:3.0];
    [blurFilter setBlurRadiusInPixels:10.0];

    [stillImageSource addTarget:blurFilter];

    [blurFilter prepareForImageCapture];

    [blurFilter addTarget:imageView];

    [stillImageSource processImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
