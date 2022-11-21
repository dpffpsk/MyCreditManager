//
//  main.swift
//  MyCreditManager
//
//  Created by wony on 2022/11/21.
//

import Foundation

let userDefaults = UserDefaults.standard
let userDefaultsKey = "student"
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
            switch number {
            case 1:
                addStudent()
            case 2:
                deleteStudent()
            default:
                print("")
            }
            continue
        } else if functioninput == "X" {
            print("프로그램을 종료합니다...")
            break
        }
    }
    print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
}


// 학생 추가
func addStudent() {
    print("추가할 학생의 이름을 입력해주세요")

    var temp = [String: [String: String]]()
    if let studentInput = readLine(), !studentInput.isEmpty {
        // UserDefaults_student가 존재하는 경우
        if var studentList = userDefaults.dictionary(forKey: userDefaultsKey) as? [String: [String: String]] {
            if studentList.keys.contains(studentInput) { // student에 input 값이 존재하는 경우
                print("\(studentInput)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            } else { // student에 input 값이 존재하지 않는 경우
                studentList.updateValue([:], forKey: studentInput)
                userDefaults.set(studentList, forKey: userDefaultsKey)
                print("\(studentInput) 학생을 추가했습니다.")
            }
        } else { // UserDefaults_student가 존재하지 않는 경우
            temp.updateValue([:], forKey: studentInput)
            userDefaults.set(temp, forKey: userDefaultsKey)
            print("\(studentInput) 학생을 추가했습니다.")
        }
        return
    }
    print("입력이 잘못되었습니다. 다시 확인해주세요.")
}

// 학생 삭제
func deleteStudent() {
    print("삭제할 학생의 이름을 입력해주세요")

    if let studentInput = readLine(), !studentInput.isEmpty {
        // UserDefaults_student가 존재하는 경우
        if var studentList = userDefaults.dictionary(forKey: userDefaultsKey) as? [String: [String: String]] {
            // student에 input 값이 존재하는 경우
            if studentList.keys.contains(studentInput) {
                studentList.removeValue(forKey: studentInput)
                userDefaults.set(studentList, forKey: userDefaultsKey)
                print("\(studentInput) 학생을 삭제하였습니다.")
                return
            }
        }
        print("\(studentInput) 학생을 찾지 못했습니다.")
        return
    }
    print("입력이 잘못되었습니다. 다시 확인해주세요.")
}
