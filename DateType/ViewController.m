//
//  ViewController.m
//  DateType
//
//  Created by kunren10 on 2014/03/13.
//  Copyright (c) 2014年 Hajime Maeda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// [簡易表示]ボタンを押す
- (IBAction)proc01:(id)sender {
    
    // 表示対象（現在日時（システム日付））
    NSDate *dt =[NSDate date];
    
    // パターン１ description:説明
    NSString *str01 = [dt description];
    NSLog(@"%@",str01);
    
    // パターン２
    NSString *str02 = [dt descriptionWithLocale:[NSLocale currentLocale]];
    NSLog(@"%@",str02);
    
    
}

// [表示（書式スタイル設定）]ボタンを押す
- (IBAction)proc02:(id)sender {
    
    // 表示対象
    NSDate *dt =[NSDate date];
    
    //日時書式作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    // スタイル１
    df.dateStyle = NSDateFormatterShortStyle;
    df.timeStyle = NSDateFormatterShortStyle;
    
    NSLog(@"1. %@",[df stringFromDate:dt]);
    
    // スタイル２
    df.dateStyle = NSDateFormatterMediumStyle;
    df.timeStyle = NSDateFormatterMediumStyle;
    
    NSLog(@"2. %@",[df stringFromDate:dt]);
    
    // スタイル３
    df.dateStyle = NSDateFormatterLongStyle;
    df.timeStyle = NSDateFormatterLongStyle;
    
    NSLog(@"3. %@",[df stringFromDate:dt]);
    
    // スタイル４
    df.dateStyle = NSDateFormatterFullStyle;
    df.timeStyle = NSDateFormatterFullStyle;
    
    NSLog(@"4. %@",[df stringFromDate:dt]);
    
    // スタイル５
    df.dateStyle = NSDateFormatterNoStyle;
    df.timeStyle = NSDateFormatterNoStyle;
    
    NSLog(@"5. %@",[df stringFromDate:dt]);
    
}

// [表示（書式設定）]ボタンを押す
- (IBAction)proc03:(id)sender
{
    // 表示対象
    NSDate *dt =[NSDate date];
    
    //日時書式作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    // パターン１
    df.dateFormat = @"yyyy/MM/dd";
    NSLog(@"1. %@",[df stringFromDate:dt]);
    
    // パターン２
    df.dateFormat = @"HH/mm/ss";
    NSLog(@"2. %@",[df stringFromDate:dt]);
    
    // パターン３ AD Anno Domini
    df.dateFormat =
        @"GGGGyyyy年MM月dd日(EEEE)"
        @"HH時mm分ss秒";
    
    NSLog(@"3. %@",[df stringFromDate:dt]);
}

// [表示（言語環境（書式（ロケール）、カレンダー）設定）]ボタンを押す
- (IBAction)proc04:(id)sender {
    
    // 表示対象
    NSDate *dt =[NSDate date];
    
    //日時書式作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    // パターン１（システム設定）
    df.locale = [NSLocale currentLocale];
    df.calendar = [NSCalendar currentCalendar];
    
    df.dateStyle = df.timeStyle = NSDateFormatterFullStyle; // 識別子:4 でも処理出来る
    // 日付型　文字列変換
    NSLog(@"1. %@",[df stringFromDate:dt]);

    // パターン２（設定：英語　ー　アメリカ合衆国、西暦）
    df.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    df.calendar = [[NSCalendar alloc]
                   initWithCalendarIdentifier:NSGregorianCalendar];
    
    df.dateFormat =@"yyyy/MM/dd(EEEE)" @"HH:mm:ss";
    NSLog(@"2. %@",[df stringFromDate:dt]);
    
    // パターン３（設定：日本語　ー　日本、和暦）
    df.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    df.calendar = [[NSCalendar alloc]
                   initWithCalendarIdentifier:NSJapaneseCalendar];
    
    // (EE)金 (EEEE)金曜日
    df.dateFormat =@"GGyy年MM月/dd日(EEEE)" @"ahh:mm:ss";
    NSLog(@"3. %@",[df stringFromDate:dt]);
    
}

// [表示（ロケール識別子一覧）]ボタンを押す
- (IBAction)proc04s:(id)sender {
    
    // 利用可能な「言語/国コード」
    NSArray *arr = [NSLocale availableLocaleIdentifiers];
    NSLog(@"3. %@",arr);
    
}

// [表示（タイムゾーン設定）]ボタンを押す
- (IBAction)proc05:(id)sender {
    
    // 表示対象
    NSDate *dt =[NSDate date];
    
    //日時書式作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = df.timeStyle = NSDateFormatterFullStyle;
    
    // パターン１（システム設定）日本標準時
    df.timeZone = [NSTimeZone systemTimeZone];
    NSLog(@"1. %@",[df stringFromDate:dt]);
    
    // パターン２（タイムゾーン名の設定）アメリカロサンゼルス標準時
    df.timeZone = [NSTimeZone timeZoneWithName:@"America/Los_Angeles"];
    NSLog(@"2. %@",[df stringFromDate:dt]);
    
    // パターン３（タイムゾーン略称の設定）グリニッジ標準時
    df.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    NSLog(@"2. %@",[df stringFromDate:dt]);
}

// [タイムゾーン一覧]ボタンを押す
- (IBAction)proc05s:(id)sender {
    
    NSDictionary *dic = [NSTimeZone abbreviationDictionary];
    NSLog(@"%@",dic);
    
}

// [文字列から変換]ボタンを押す
- (IBAction)proc06:(id)sender {
    
    // 日時書式の作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    
    // 日付型へ変換
    NSString *str = @"1957/02/15 23:59:59";
    NSDate *dt = [df dateFromString:str];
    
    NSLog(@"%@",[dt descriptionWithLocale:
                 [NSLocale currentLocale]]);
}

// [経過日時の取得]ボタンを押す
- (IBAction)proc07:(id)sender {
    
    // 基準日時
    NSDate *dt01 =[NSDate date];
    
    //経過日時の取得（単位：秒）
//    NSDate *dt02 = [[NSDate dateWithTimeInterval:60.0 // double型
//                                       sinceDate:dt01] init];
    // 分 X 時間 X 日　過去日付　-　（マイナスにすれば良い）
    NSDate *dt02 = [[NSDate dateWithTimeInterval:60.0 * 60 * 24.0 // double型
                                       sinceDate:dt01] init];
    
    NSLog(@"%@",[dt01 descriptionWithLocale:[NSLocale currentLocale]]);
    NSLog(@"%@",[dt02 descriptionWithLocale:[NSLocale currentLocale]]);
    
}

// [一致判定]ボタンを押す
- (IBAction)proc08:(id)sender {
    
    // 日時書式の作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    
    NSDate *dt01 = [df dateFromString:@"2000/01/01 01:01:01"];
    NSDate *dt02 = [df dateFromString:@"2000/01/01 01:01:01"];
    
    //
    BOOL res = [dt01 isEqualToDate:dt02];
    
    if (res) { // (res == YES)
        NSLog(@"一致");
    } else {
        NSLog(@"不一致");
    }
}

// [大小判定]ボタンを押す
- (IBAction)proc09:(id)sender {
    
    // 日時書式の作成
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    
    NSDate *dt01 = [df dateFromString:@"2000/01/01 01:01:01"];
    NSDate *dt02 = [df dateFromString:@"2000/01/01 01:01:09"];
    
    // 大小判定 compare 比較
    NSComparisonResult res = [dt01 compare:dt02];
    
    switch (res) {
        case NSOrderedAscending:    // 昇順
            NSLog(@"dt01 < dt02");
            break;
        case NSOrderedSame:         // 同じ
            NSLog(@"dt01 = dt02");
            break;
        case NSOrderedDescending:   // 降順
            NSLog(@"dt01 > dt02");
            break;
            
        default:
            break;
    }
}
@end
