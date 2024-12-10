(defun C:adodbsamp3 ( / cur3 sReturn)
  ;; コネクションオブジェクトを作成
  (ado_connection "new" "con3" T)
  ;; プロバイダを登録
  (if (ado_connection "provider" "con3" "MSDASQL")
    (progn
      ;; DSNを指定してデータベースに接続
      (if (ado_connection "connect" "con3" "adodbsamp2")
        (progn
          ;; クエリーオブジェクトを作成
          (ado_query "new" "con3" "que3")
          ;; SQL文を設定
          (ado_query "sql" "que3" "SELECT * FROM LINE_TBL;")
          ;; SQL文を実行
          (setq cur3 (ado_query "open" "que3") )

          ;; SQL文の実行結果をダイアログで表示
          (setq sReturn (ado_dialog "showrecord" "que3" "Select Dialog" "LINE_NAME" T T) )
          ;; ダイアログで選択されたレコードの指定フィールドを表示
          (print sReturn)
        )
        (progn
          (print "失敗")
        )
      )
    )
    (progn
      (print "失敗")
    )
  )
  (princ)
)