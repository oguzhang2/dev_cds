interface ZIF_OGUREL_ADDITION
  public .


  data MV_VALUE_ADDITION type DECFLOAT16 .

  methods ADDITION
    importing
      !IV_FIRST type DECFLOAT16
      !IV_SECOND type DECFLOAT16
    exporting
      !EV_RESULT type DECFLOAT16 .
endinterface.
