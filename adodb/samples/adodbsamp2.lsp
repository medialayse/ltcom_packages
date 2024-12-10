(defun ConnectAdodbsamp2 ( / result)
  ;; コネクションオブジェクトを作成
  (ado_connection "new" "con2")

  ;; プロバイダを登録
  (if (ado_connection "provider" "con2" "MSDASQL")
    (progn

      ;; DSNを指定してデータベースに接続
      (if (ado_connection "connect" "con2" "adodbsamp2")
        (progn
          (setq result T)
        )
        (progn
          (setq result nil)
        )
      )
    )
    (progn
      (setq result nil)
    )
  )
)

(defun C:adodbsamp2set ( / )
  (if (ConnectAdodbsamp2)
    (progn
      ;; クエリーオブジェクトを作成
      (ado_query "new" "con2" "que2")

      ;; SQL文を設定
      (ado_query "sql" "que2" "DELETE FROM LINE_TBL")

      ;; SQL文を実行
      (ado_query "exec" "que2")

      (ado_query "sql" "que2" "INSERT INTO LINE_TBL VALUES (1, 'star1',   0,    0, -30, -100);")
      (ado_query "exec" "que2")
      (ado_query "sql" "que2" "INSERT INTO LINE_TBL VALUES (2, 'star2', -30, -100,  50,  -25);")
      (ado_query "exec" "que2")
      (ado_query "sql" "que2" "INSERT INTO LINE_TBL VALUES (3, 'star3',  50,  -25, -50,  -25);")
      (ado_query "exec" "que2")
      (ado_query "sql" "que2" "INSERT INTO LINE_TBL VALUES (4, 'star4', -50,  -25,  30, -100);")
      (ado_query "exec" "que2")
      (ado_query "sql" "que2" "INSERT INTO LINE_TBL VALUES (5, 'star5',  30, -100,   0,    0);")
      (ado_query "exec" "que2")
      (print "成功")
    )
    (progn
      (print "失敗")
    )
  )
  (princ)
)

(defun C:adodbsamp2draw ( / cur2 flg startX, startY. endX, endY pt1 pt2 inPt)
  (if (ConnectAdodbsamp2)
    (progn

      ;; クエリーオブジェクトを作成
      (ado_query "new" "con2" "que2")

      ;; SQL文を設定
      (ado_query "sql" "que2" "SELECT * FROM LINE_TBL WHERE LINE_NAME LIKE 'star%';")

      ;; SQL文を実行
      (setq cur2 (ado_query "open" "que2") )

      (setq inPt (getpoint "座標を指定") )

      ;; 検索結果の先頭に移動
      (ado_query "first" cur2)

      ;; ループの終了判定
      (setq flg (not (ado_query "eof" cur2) ) )
      (while flg

        (setq startX (ado_query "int" cur2 "LINE_START_X") )

        (setq startX (+ startX (car inPt) ) )
        (setq startY (ado_query "int" cur2 "LINE_START_Y") )
        (setq startY (+ startY (cadr inPt) ) )
        (setq endX (ado_query "int" cur2 "LINE_END_X") )
        (setq endX (+ endX (car inPt) ) )
        (setq endY (ado_query "int" cur2 "LINE_END_Y") )
        (setq endY (+ endY (cadr inPt) ) )

        (setq pt1 (list startX startY) )
        (setq pt2 (list endX endY) )

        ;; "LINE"コマンドを実行
        (command "line" pt1 pt2 "")

        ;; 次に移動
        (setq flg (ado_query "next" cur2) )
      )
    )
    (progn
      (print "失敗")
    )
  )
  (princ)
)
