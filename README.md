# ios-tableview-swipe-action-demo
iOS TableViewCellをスワイプする機能

```swift: ViewController.swift
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
```
