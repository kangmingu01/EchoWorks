package echoworks.dto;

/*
이름                   널?       유형            
-------------------- -------- ------------- 
PRODUCT_STOCK_NO     NOT NULL NUMBER        
PRODUCT_STOCK_PNO             NUMBER        
PRODUCT_STOCK_OPTION          VARCHAR2(100) 
PRODUCT_STOCK_STOCK           NUMBER        
PRODUCT_STOCK_PRICE           NUMBER        
 */

public class ProductStockDTO {
	private int pS_No;
	private int pS_pNo;
	private String pS_Option;
	private int pS_Stock;
	private int pS_price;
	
	public ProductStockDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductStockDTO(int pS_No, int pS_pNo, String pS_Option, int pS_Stock, int pS_price) {
		super();
		this.pS_No = pS_No;
		this.pS_pNo = pS_pNo;
		this.pS_Option = pS_Option;
		this.pS_Stock = pS_Stock;
		this.pS_price = pS_price;
	}

	public int getpS_No() {
		return pS_No;
	}

	public void setpS_No(int pS_No) {
		this.pS_No = pS_No;
	}

	public int getpS_pNo() {
		return pS_pNo;
	}

	public void setpS_pNo(int pS_pNo) {
		this.pS_pNo = pS_pNo;
	}

	public String getpS_Option() {
		return pS_Option;
	}

	public void setpS_Option(String pS_Option) {
		this.pS_Option = pS_Option;
	}

	public int getpS_Stock() {
		return pS_Stock;
	}

	public void setpS_Stock(int pS_Stock) {
		this.pS_Stock = pS_Stock;
	}

	public int getpS_price() {
		return pS_price;
	}

	public void setpS_price(int pS_price) {
		this.pS_price = pS_price;
	}

	
	
	
}
