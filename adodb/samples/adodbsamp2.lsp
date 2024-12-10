(defun ConnectAdodbsamp2 ( / result)
  ;; �R�l�N�V�����I�u�W�F�N�g���쐬
  (ado_connection "new" "con2")

  ;; �v���o�C�_��o�^
  (if (ado_connection "provider" "con2" "MSDASQL")
    (progn

      ;; DSN���w�肵�ăf�[�^�x�[�X�ɐڑ�
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
      ;; �N�G���[�I�u�W�F�N�g���쐬
      (ado_query "new" "con2" "que2")

      ;; SQL����ݒ�
      (ado_query "sql" "que2" "DELETE FROM LINE_TBL")

      ;; SQL�������s
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
      (print "����")
    )
    (progn
      (print "���s")
    )
  )
  (princ)
)

(defun C:adodbsamp2draw ( / cur2 flg startX, startY. endX, endY pt1 pt2 inPt)
  (if (ConnectAdodbsamp2)
    (progn

      ;; �N�G���[�I�u�W�F�N�g���쐬
      (ado_query "new" "con2" "que2")

      ;; SQL����ݒ�
      (ado_query "sql" "que2" "SELECT * FROM LINE_TBL WHERE LINE_NAME LIKE 'star%';")

      ;; SQL�������s
      (setq cur2 (ado_query "open" "que2") )

      (setq inPt (getpoint "���W���w��") )

      ;; �������ʂ̐擪�Ɉړ�
      (ado_query "first" cur2)

      ;; ���[�v�̏I������
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

        ;; "LINE"�R�}���h�����s
        (command "line" pt1 pt2 "")

        ;; ���Ɉړ�
        (setq flg (ado_query "next" cur2) )
      )
    )
    (progn
      (print "���s")
    )
  )
  (princ)
)
