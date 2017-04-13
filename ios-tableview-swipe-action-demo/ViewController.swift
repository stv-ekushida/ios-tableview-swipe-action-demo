//
//  ViewController.swift
//  ios-tableview-swipe-action-demo
//
//  Created by Eiji Kushida on 2017/04/13.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = "セル\(indexPath.row + 1)"
        cell.detailTextLabel?.text = "\(indexPath.row + 1)番目のセルの説明"
        return cell
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return addSwipeEvent()
    }

    /// セルのアクションを有効にする
    ///
    /// - Parameters:
    ///   - tableView: TableView
    ///   - indexPath: インデックスパス
    /// - Returns: 有効か？
    func tableView(_ tableView: UITableView,
                   canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    /// スワイプされたときの処理
    ///
    /// - Parameters:
    ///   - content: タイトル
    ///   - index: セルのインデックス
    func swipeContentsTap(content: String, index: Int) {
        print(index.description + "番のセル　→　" + "内容:" + content)
    }

    /// Swipeイベントを登録する
    ///
    /// - Returns: Swipeイベント一覧
    private func addSwipeEvent() -> [UITableViewRowAction]? {

        let swipeCellA = UITableViewRowAction(style: .default, title: "内容A") { _, index in
            self.swipeContentsTap(content: "CellA", index: index.row)
        }
        let swipeCellB = UITableViewRowAction(style: .default, title: "内容B") { _, index in
            self.swipeContentsTap(content: "CellB", index: index.row)
        }
        let swipeCellC = UITableViewRowAction(style: .default, title: "内容C") { _, index in
            self.swipeContentsTap(content: "CellC", index: index.row)
        }
        swipeCellA.backgroundColor = .blue
        swipeCellB.backgroundColor = .red
        swipeCellC.backgroundColor = .green

        return [swipeCellC, swipeCellB, swipeCellA] // A,B,Cという順で表示される
    }
}
