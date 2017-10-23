//: Playground - noun: a place where people can play

import UIKit

// Swift中 let 声明不变量  var声明变量
var str = "Hello, playground"

print(str)

let constA = 43

print(constA)

//可选字符串

var myStr:String!

myStr = "Hello Swift!"

if myStr != nil {
    
    print(myStr)
}else{
    print("myStr 的值为 nil")
}

// 字面量
//所谓字面量，就是指像特定数字、字符串或者是布尔值这样，能够直接了当地指出自己的类型并未变量进行赋值的值
let aNumber = 3 //整型字面量
let aString = "Hello" //字符串字面量
let aBool   = true     //布尔值字面量

//整型字面量
let decimalInteger = 17 //17 - 十进制
let binaryInteger = 0b10001 //17 - 二进制
let octalInteger = 0o21     //17 - 八进制
let hexadecimalInteger = 0x11 //17 - 十六制

//浮点字面量
let decimalDouble = 12.1875 //十进制浮点型字面量
let exponentDouble = 1.21875e1 //十进制浮点型字面量
let hexadecimalDouble = 0xC.3p0 //十六进制浮点型字面量

//字符字面量

/*
 
 \0 空字符
 \\ 反斜线 \
 \b 退格（BS），将当前位置移到前一列
 \f 换页(FF)， 将当前位置移到下页开头
 \n 换行符
 \r 回车符
 \t 水平制表符
 \v 垂直制表符
 \' 单引号
 \" 双引号
 \000 1到3位8进制数所代表的任意字符
 \xhh…… 1到2位十六进制数代表的任意数
 
 */

let string = "Hello\tworld\n\n百度:\'http:www.baidu.com\'"
print(string)

//布尔字面量
// true 表示真  false 表示假  nil 表示没有值

//数组
var someAry = ["hello", "小米", "小明"]

for str in someAry {  //for in 遍历
    if str == "小米" {
        print(str)
    }else{
        print("--str:\(str)")
    }
}

// 创建一个初始化大小数组的语法
//var someAry = [SomeType](repeating:InitialValue, count: NumberOfElements)

//创建类型为int ,数量为3，初始值为0 的空数组
var someIntAry = [Int](repeating:0, count:3)

var someIntAry2:[Int] = [20 , 30 ,50]
print(someIntAry2[2])

someIntAry2.append(20)
someIntAry2.remove(at: 0)

print(someIntAry2)

someIntAry2 += [80]

for (index, item) in someIntAry2.enumerated() {
    print("在index = \(index) 上的item为：\(item) --- AryCount:\(someIntAry2.count)")
}

//字典
// var someDic = [keyType: valueType]

//var someDic = [Int: String]()  //创建个空字典

var someDict = ["Prime":"One", "Fibonacci":"Two", "Square":"Three"]

for (key, value) in someDict.enumerated() {
    print("---key:\(key)---value:\(value)")
}

//函数定义
// Swift定义函数使用关键字func (function)

func studentNameWithAgeWithHeight(name:NSString, age:Int, height:Double) ->String{
    return ("\(name)年龄：\(age)身高：\(height)")
}

var studentInfo = studentNameWithAgeWithHeight(name: "小明", age: 10, height: 135.6)

print(studentInfo)

func minAndMax(ary: [Int]) ->(min:Int, max:Int){
    var  currentMin = ary[0];
    var  currentMax = ary[0];
    
    for  value in ary {
        
        if value < currentMin {
            currentMin = value;
        }else if value > currentMax{
            currentMax = value;
        }
    }
    
    return (currentMin, currentMax)
    
}

let bounds = minAndMax(ary: [8, -6, 0, 10, 98])

print("最小的值：\(bounds.min),最大的值:\(bounds.max)")



















