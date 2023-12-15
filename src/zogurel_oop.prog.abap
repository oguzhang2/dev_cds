*&---------------------------------------------------------------------*
*& Report ZOGUREL_OOP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zogurel_oop.

PARAMETERS: p_num1 TYPE decfloat16 OBLIGATORY,
            p_num2 TYPE decfloat16 OBLIGATORY,
            p_num3 TYPE decfloat16 OBLIGATORY,
            p_num4 TYPE decfloat16 OBLIGATORY.

DATA: lo_first_1  TYPE REF TO zcl_ogurel_first,
      lo_first_2  TYPE REF TO zcl_ogurel_first,
      lo_second   TYPE REF TO zcl_ogurel_second,

      lv_division TYPE decfloat16.

START-OF-SELECTION.

  CREATE OBJECT: lo_first_1, lo_first_2, lo_second.

  lo_first_1->zif_ogurel_addition~addition(
    EXPORTING
      iv_first  = p_num1
      iv_second = p_num2
    IMPORTING
      ev_result = DATA(lv_add_1)
  ).

  lo_first_1->zif_ogurel_substract~substract(
    EXPORTING
      iv_first  = p_num1
      iv_second = p_num2
    RECEIVING
      rv_result = DATA(lv_subs_1)
  ).

  lo_first_2->zif_ogurel_addition~addition(
  EXPORTING
    iv_first  = p_num3
    iv_second = p_num4
  IMPORTING
    ev_result = DATA(lv_add_2)
).

  lo_first_2->zif_ogurel_substract~substract(
    EXPORTING
      iv_first  = p_num3
      iv_second = p_num4
    RECEIVING
      rv_result = DATA(lv_subs_2)
  ).
  TRY.
      lo_second->call(
        EXPORTING
          iv_first  = p_num1
          iv_second = p_num2
        CHANGING
          cv_third  = lv_division
      ).
    CATCH cx_sy_zerodivide.
  ENDTRY.

  write: / 'Class 1.1 : Instance : ' && lo_first_1->zif_ogurel_addition~mv_value_addition && ' Static : ' && lo_first_1->zif_ogurel_substract~mv_value_substract.
  write: / 'Class 1.2 : Instance : ' && lo_first_2->zif_ogurel_addition~mv_value_addition && ' Static : ' && lo_first_2->zif_ogurel_substract~mv_value_substract.
  write: / 'Class 2.1 : Instance : ' && lo_second->zif_ogurel_addition~mv_value_addition && '  Static : ' && lo_second->zif_ogurel_substract~mv_value_substract.
