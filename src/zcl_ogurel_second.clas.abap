class ZCL_OGUREL_SECOND definition
  public
  inheriting from ZCL_OGUREL_FIRST
  final
  create public .

public section.

  methods CALL
    importing
      !IV_FIRST type DECFLOAT16
      !IV_SECOND type DECFLOAT16
    changing
      !CV_THIRD type DECFLOAT16
    raising
      CX_SY_ZERODIVIDE .
protected section.

  methods DIVISION
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_OGUREL_SECOND IMPLEMENTATION.


  METHOD call.

    TRY.
        division(
          EXPORTING
            iv_first  =  iv_first
                iv_second = iv_second
          CHANGING
            cv_third  = cv_third
        ).
      CATCH cx_sy_zerodivide into data(lx_zero).
        RAISE EXCEPTION lx_zero.
    ENDTRY.

  ENDMETHOD.


  METHOD division.

    TRY.
        super->division(
          EXPORTING
            iv_first  = iv_first
            iv_second = iv_second
          CHANGING
            cv_third  = cv_third
        ).
*      CATCH cx_a4c_com_secure_store INTO DATA(lx_zero).
      CATCH cx_sy_zerodivide INTO DATA(lx_zero).
        RAISE EXCEPTION lx_zero.
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
