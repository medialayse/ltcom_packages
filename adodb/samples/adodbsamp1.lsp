(defun C:adodbsamp1 ( / ii iMax inset nm et sID sType sHnd sSubMarker sLayer sSql)
  ;; コネクションオブジェクトの作成
  (ado_connection "new" "con1" T)
  ;; プロバイダの登録
  (if (ado_connection "provider" "con1" "Microsoft.Jet.OLEDB.4.0")
    (progn
      ;; データーベースに接続
      (if (ado_connection "connect" "con1" (findfile "adodbsamp1.mdb") )
        (progn
          ;; クエリーオブジェクトの作成
          (ado_query "new" "con1" "que1")
          ;; SQL文の設定
          (ado_query "sql" "que1" "DELETE FROM MODEL_TBL")
          ;; SQL文の実行
          (ado_query "exec" "que1")

          ;; 選択セットの取得
          (setq inset (ssget) )
          ;; 選択された図形の数を取得
          (setq iMax (1- (sslength inset) ) )
          (setq ii 0)
          (while (<= ii iMax)
            ;; 図形名の取得
            (setq nm (ssname inset ii) )
            ;; 図形データの取得
            (setq et (entget nm) )
            ;; エンティティ・タイプの取得
            (setq sType (cdr (assoc 0 et) ) )
            ;; ハンドル番号の取得
            (setq sHnd (cdr (assoc 5 et) ) )
            ;; サブクラス マーカーの取得
            (setq sSubMarker (cdr (assoc 100 et) ) )
            ;; 画層名の取得
            (setq sLayer (cdr (assoc 8 et) ) )
            ;; IDを設定
            (setq sID (itoa (1+ ii) ) )
            ;; SQL文の作成
            (setq sSql (strcat "INSERT INTO MODEL_TBL VALUES (" sID ", '" sType "', '" sHnd "', '" sSubMarker "', '" sLayer "');" ) )
            (ado_query "sql" "que1" sSql)
            (ado_query "exec" "que1")

            (setq ii (1+ ii) )
          )
          (ado_query "sql" "que1" "SELECT * FROM MODEL_TBL;")

          ;; SQL文を実行
          (ado_query "open" "que1" 1)

          (print "成功")
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
