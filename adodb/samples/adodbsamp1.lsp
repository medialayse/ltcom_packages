(defun C:adodbsamp1 ( / ii iMax inset nm et sID sType sHnd sSubMarker sLayer sSql)
  ;; �R�l�N�V�����I�u�W�F�N�g�̍쐬
  (ado_connection "new" "con1" T)
  ;; �v���o�C�_�̓o�^
  (if (ado_connection "provider" "con1" "Microsoft.Jet.OLEDB.4.0")
    (progn
      ;; �f�[�^�[�x�[�X�ɐڑ�
      (if (ado_connection "connect" "con1" (findfile "adodbsamp1.mdb") )
        (progn
          ;; �N�G���[�I�u�W�F�N�g�̍쐬
          (ado_query "new" "con1" "que1")
          ;; SQL���̐ݒ�
          (ado_query "sql" "que1" "DELETE FROM MODEL_TBL")
          ;; SQL���̎��s
          (ado_query "exec" "que1")

          ;; �I���Z�b�g�̎擾
          (setq inset (ssget) )
          ;; �I�����ꂽ�}�`�̐����擾
          (setq iMax (1- (sslength inset) ) )
          (setq ii 0)
          (while (<= ii iMax)
            ;; �}�`���̎擾
            (setq nm (ssname inset ii) )
            ;; �}�`�f�[�^�̎擾
            (setq et (entget nm) )
            ;; �G���e�B�e�B�E�^�C�v�̎擾
            (setq sType (cdr (assoc 0 et) ) )
            ;; �n���h���ԍ��̎擾
            (setq sHnd (cdr (assoc 5 et) ) )
            ;; �T�u�N���X �}�[�J�[�̎擾
            (setq sSubMarker (cdr (assoc 100 et) ) )
            ;; ��w���̎擾
            (setq sLayer (cdr (assoc 8 et) ) )
            ;; ID��ݒ�
            (setq sID (itoa (1+ ii) ) )
            ;; SQL���̍쐬
            (setq sSql (strcat "INSERT INTO MODEL_TBL VALUES (" sID ", '" sType "', '" sHnd "', '" sSubMarker "', '" sLayer "');" ) )
            (ado_query "sql" "que1" sSql)
            (ado_query "exec" "que1")

            (setq ii (1+ ii) )
          )
          (ado_query "sql" "que1" "SELECT * FROM MODEL_TBL;")

          ;; SQL�������s
          (ado_query "open" "que1" 1)

          (print "����")
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
