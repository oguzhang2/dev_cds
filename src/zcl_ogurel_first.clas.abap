class ZCL_OGUREL_FIRST definition
  public
  create public .

public section.

  interfaces ZIF_OGUREL_ADDITION .
  interfaces ZIF_OGUREL_SUBSTRACT .
protected section.

  methods DIVISION
    importing
      !IV_FIRST type DECFLOAT16
      !IV_SECOND type DECFLOAT16
    changing
      !CV_THIRD type DECFLOAT16
    raising
      CX_SY_ZERODIVIDE .
private section.
ENDCLASS.



CLASS ZCL_OGUREL_FIRST IMPLEMENTATION.


  METHOD division.

    TRY.
        cv_third = iv_first / iv_second.
      CATCH cx_sy_zerodivide INTO DATA(lx_zero).
        RAISE EXCEPTION lx_zero.
    ENDTRY.


  ENDMETHOD.


  METHOD zif_ogurel_addition~addition.

    ev_result = zif_ogurel_addition~mv_value_addition = iv_first + iv_second.

  ENDMETHOD.


  METHOD zif_ogurel_substract~substract.

    rv_result = zif_ogurel_substract~mv_value_substract = iv_first - iv_second.

  ENDMETHOD.
ENDCLASS.
