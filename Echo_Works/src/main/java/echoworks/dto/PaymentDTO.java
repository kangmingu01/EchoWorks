package echoworks.dto;
 
public class PaymentDTO {
    private int paymentNo;           // PAYMENT_NO
    private int paymentPsno;         // PAYMENT_PSNO
    private int paymentHno;          // PAYMENT_HNO
    private int paymentNum;          // PAYMENT_NUM
    private String paymentTotal;     // PAYMENT_TOTAL
    private String paymentDate;      // PAYMENT_DATE
    private int paymentStatus;       // PAYMENT_STATUS
    private String paymentJname;     // PAYMENT_JNAME
    private String paymentPhone;     // PAYMENT_PHONE
    private String paymentZipcode;   // PAYMENT_ZIPCODE
    private String paymentAddress1;  // PAYMENT_ADDRESS1
    private String paymentAddress2;  // PAYMENT_ADDRESS2
    private String paymentOmesg;     // PAYMENT_OMESG
    
    public PaymentDTO() {
		// TODO Auto-generated constructor stub
	}
  
    public int getPaymentNo() {
        return paymentNo;
    }

    public void setPaymentNo(int paymentNo) {
        this.paymentNo = paymentNo;
    }

    public int getPaymentPsno() {
        return paymentPsno;
    }

    public void setPaymentPsno(int paymentPsno) {
        this.paymentPsno = paymentPsno;
    }

    public int getPaymentHno() {
        return paymentHno;
    }

    public void setPaymentHno(int paymentHno) {
        this.paymentHno = paymentHno;
    }

    public int getPaymentNum() {
        return paymentNum;
    }

    public void setPaymentNum(int paymentNum) {
        this.paymentNum = paymentNum;
    }

    public String getPaymentTotal() {
        return paymentTotal;
    }

    public void setPaymentTotal(String paymentTotal) {
        this.paymentTotal = paymentTotal;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public int getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(int paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getPaymentJname() {
        return paymentJname;
    }

    public void setPaymentJname(String paymentJname) {
        this.paymentJname = paymentJname;
    }

    public String getPaymentPhone() {
        return paymentPhone;
    }

    public void setPaymentPhone(String paymentPhone) {
        this.paymentPhone = paymentPhone;
    }

    public String getPaymentZipcode() {
        return paymentZipcode;
    }

    public void setPaymentZipcode(String paymentZipcode) {
        this.paymentZipcode = paymentZipcode;
    }

    public String getPaymentAddress1() {
        return paymentAddress1;
    }

    public void setPaymentAddress1(String paymentAddress1) {
        this.paymentAddress1 = paymentAddress1;
    }

    public String getPaymentAddress2() {
        return paymentAddress2;
    }

    public void setPaymentAddress2(String paymentAddress2) {
        this.paymentAddress2 = paymentAddress2;
    }

    public String getPaymentOmesg() {
        return paymentOmesg;
    }

    public void setPaymentOmesg(String paymentOmesg) {
        this.paymentOmesg = paymentOmesg;
    }
}
