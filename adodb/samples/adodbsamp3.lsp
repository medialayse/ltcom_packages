(defun C:adodbsamp3 ( / cur3 sReturn)
  ;; �R�l�N�V�����I�u�W�F�N�g���쐬
  (ado_connection "new" "con3" T)
  ;; �v���o�C�_��o�^
  (if (ado_connection "provider" "con3" "MSDASQL")
    (progn
      ;; DSN���w�肵�ăf�[�^�x�[�X�ɐڑ�
      (if (ado_connection "connect" "con3" "adodbsamp2")
        (progn
          ;; �N�G���[�I�u�W�F�N�g���쐬
          (ado_query "new" "con3" "que3")
          ;; SQL����ݒ�
          (ado_query "sql" "que3" "SELECT * FROM LINE_TBL;")
          ;; SQL�������s
          (setq cur3 (ado_query "open" "que3") )

          ;; SQL���̎��s���ʂ��_�C�A���O�ŕ\��
          (setq sReturn (ado_dialog "showrecord" "que3" "Select Dialog" "LINE_NAME" T T) )
          ;; �_�C�A���O�őI�����ꂽ���R�[�h�̎w��t�B�[���h��\��
          (print sReturn)
        )
        (progn
          (print "���s")
        )
      )
    )
    (progn
      (print "���s")
    )
  )
  (princ)
)