//
//  DPViewController.m
//  DemoChart
//
//  Created by Durgesh Dhurve on 06/03/14.
//  Copyright (c) 2014 Diaspark. All rights reserved.
//

#import "DPViewController.h"
#import <ShinobiCharts/ShinobiChart.h>

@interface DPViewController () <SChartDatasource>
{
    ShinobiChart *chart;
}

@property float divConstant;

@end

@implementation DPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _divConstant = 5.0;
    
    CGFloat margin = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) ? 20.0 : 50.0;
    chart = [[ShinobiChart alloc] initWithFrame:CGRectInset(self.view.bounds, margin, margin)];
    chart.title = @"Trignometric Function";
    chart.licenseKey = @"MmjXy0PJ6pT0Mq7MjAxNDA0MDVpbmZvQHNoaW5vYmljb250cm9scy5jb20=QiYPWocTYPbX4LKMNB+EdnyXVDNZj3aWDPcpcIJbTop1sMTdGrWY7vbplUyqc1R0pq8T49+K69a5zdqWzy9QCzSOhlEQHZqRiJJ70A01DtzQDX77gSY0siGcZxudrF2uVSi4vs3L5AJd8gloBYWQf0BhEG1Y=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";
    
    chart.autoresizingMask = ~ UIViewAutoresizingNone;
    //chart.legend.hidden = NO;
    //chart.canvasAreaBackgroundColor = [UIColor greenColor];
    //chart.backgroundColor = [UIColor grayColor];
    //chart.plotAreaBackgroundColor = [UIColor grayColor];
    //chart.gestureDoubleTapResetsZoom = YES;
   // chart.gestureDoubleTapEnabled = NO;
    
    SChartNumberAxis *XAxis = [[SChartNumberAxis alloc] init];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
//    
//    NSString *startStringDate = @"01/01/1990";
//    NSDate *startDate = [dateFormatter dateFromString:startStringDate];
//    
//    SChartDateRange *dateRange = [[SChartDateRange alloc] initWithDateMinimum:startDate andDateMaximum:[NSDate date]];
//    
//    SChartDateTimeAxis *XAxis = [[SChartDateTimeAxis alloc] initWithRange:dateRange];
    XAxis.title = @"X Axis";
    chart.xAxis = XAxis;
    
    SChartNumberAxis *YAxis = [[SChartNumberAxis alloc] init];
    YAxis.title = @"Y Axis";
    chart.yAxis = YAxis;
    
    chart.datasource = self;
    
    [self.view addSubview:chart];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SChartDataSource

- (NSInteger) numberOfSeriesInSChart:(ShinobiChart *)chart{
    return 4;
}

- (SChartSeries*) sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index{
    
    SChartLineSeries *series = [[SChartLineSeries alloc] init];

    //SChartPieSeries, SChartPointSeries, SChartRadialSeries
    series.style.showFill = YES;
  //  series.style.areaColor = [UIColor grayColor];
//    series.style.areaColorBelowBaseline = [UIColor redColor];
    //series.style.lineColor = [UIColor redColor];
   // series.style.lineWidth = @2;
    
    if (index == 0) {
        series.title = [NSString stringWithFormat:@"y = sin(x)"];
        series.style.lineColor = [UIColor redColor];
    }else if (index == 1){
        series.title = [NSString stringWithFormat:@"y = cos(x)"];
        series.style.lineColor = [UIColor greenColor];
    }
    else if (index == 2){
        series.title = [NSString stringWithFormat:@"y = tan(x)"];
        series.style.lineColor = [UIColor purpleColor];
    }else{
        series.title = [NSString stringWithFormat:@"y = sin(x)"];
        series.style.lineColor = [UIColor brownColor];
    }
    return series;
}

- (NSInteger) sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex{
    return 100;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex{
    
    SChartDataPoint *dataPoint = [[SChartDataPoint alloc] init];
    
    double xValue = dataIndex / _divConstant;
    dataPoint.xValue = [NSNumber numberWithDouble:xValue];
    
    if (seriesIndex == 0) {
        dataPoint.yValue = [NSNumber numberWithDouble:(dataIndex/5.0)];
        //dataPoint.yValue = [NSNumber numberWithDouble:sinf(xValue)];
    }else if (seriesIndex ==1){
        //dataPoint.yValue = [NSNumber numberWithDouble:cosf(xValue)];
        dataPoint.yValue = [NSNumber numberWithDouble:(dataIndex/15.0)];
    }else if (seriesIndex == 2){
        //dataPoint.yValue = [NSNumber numberWithDouble:tanf(xValue)];
        dataPoint.yValue = [NSNumber numberWithDouble:(dataIndex/20.0)];
    }else{
        //dataPoint.yValue = [NSNumber numberWithDouble:sinf(xValue)];
        dataPoint.yValue = [NSNumber numberWithDouble:(dataIndex/5.0)];
    }
    
    NSLog(@"%@",dataPoint);
    
    _divConstant = _divConstant+2.0;
    
    return dataPoint;
}

@end
