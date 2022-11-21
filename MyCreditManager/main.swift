//
//  main.swift
//  MyCreditManager
//
//  Created by wony on 2022/11/21.
//

import Foundation

let functions = [1, 2, 3, 4, 5]
let score: [String: Double] = ["A+": 4.5,
                            "A": 4,
                            "B+": 3.5,
                            "B": 3,
                            "C+": 2.5,
                            "C": 2,
                            "D+": 1.5,
                            "D": 1,
                            "F": 0]

while true {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")

    if let functioninput = readLine(), !functioninput.isEmpty {
        if let number = Int(functioninput), functions.contains(number) {
            continue
        } else if functioninput == "X" {
            print("프로그램을 종료합니다...")
            break
        }
    }
    print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
}
