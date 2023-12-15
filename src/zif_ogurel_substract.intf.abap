interface ZIF_OGUREL_SUBSTRACT
  public .


  class-data MV_VALUE_SUBSTRACT type DECFLOAT16 .

  class-methods SUBSTRACT
    importing
      !IV_FIRST type DECFLOAT16
      !IV_SECOND type DECFLOAT16
    returning
      value(RV_RESULT) type DECFLOAT16 .
endinterface.
