package echoworks.dto;


/*
이름                    널?       유형            
--------------------- -------- ------------- 
PRODUCT_NO            NOT NULL NUMBER        
PRODUCT_NAME                   VARCHAR2(200) 
PRODUCT_IMG                    VARCHAR2(50)  
PRODUCT_IMG_DETAIL             VARCHAR2(200) 
PRODUCT_PRICE                  NUMBER        
PRODUCT_CATEGORY_MAIN          VARCHAR2(50)  
PRODUCT_CATEGORY_SUB           VARCHAR2(50)   
PRODUCT_VIDEO_URL              VARCHAR2(100) 
  
 */
public class ProductDTO {
	private int PRODUCT_NO;
	private String PRODUCT_NAME;
	private String PRODUCT_IMG;
	private String PRODUCT_IMG_DETAIL;
	private int PRODUCT_PRICE;
	private String PRODUCT_CATEGORY_MAIN;
	private String PRODUCT_CATEGORY_SUB;
	
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}


	public ProductDTO(int pRODUCT_NO, String pRODUCT_NAME, String pRODUCT_IMG, String pRODUCT_IMG_DETAIL,
			int pRODUCT_PRICE, String pRODUCT_CATEGORY_MAIN, String pRODUCT_CATEGORY_SUB) {
		super();
		PRODUCT_NO = pRODUCT_NO;
		PRODUCT_NAME = pRODUCT_NAME;
		PRODUCT_IMG = pRODUCT_IMG;
		PRODUCT_IMG_DETAIL = pRODUCT_IMG_DETAIL;
		PRODUCT_PRICE = pRODUCT_PRICE;
		PRODUCT_CATEGORY_MAIN = pRODUCT_CATEGORY_MAIN;
		PRODUCT_CATEGORY_SUB = pRODUCT_CATEGORY_SUB;
	}


	public int getPRODUCT_NO() {
		return PRODUCT_NO;
	}


	public void setPRODUCT_NO(int pRODUCT_NO) {
		PRODUCT_NO = pRODUCT_NO;
	}


	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}


	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}


	public String getPRODUCT_IMG() {
		return PRODUCT_IMG;
	}


	public void setPRODUCT_IMG(String pRODUCT_IMG) {
		PRODUCT_IMG = pRODUCT_IMG;
	}


	public String getPRODUCT_IMG_DETAIL() {
		return PRODUCT_IMG_DETAIL;
	}


	public void setPRODUCT_IMG_DETAIL(String pRODUCT_IMG_DETAIL) {
		PRODUCT_IMG_DETAIL = pRODUCT_IMG_DETAIL;
	}


	public int getPRODUCT_PRICE() {
		return PRODUCT_PRICE;
	}


	public void setPRODUCT_PRICE(int pRODUCT_PRICE) {
		PRODUCT_PRICE = pRODUCT_PRICE;
	}


	public String getPRODUCT_CATEGORY_MAIN() {
		return PRODUCT_CATEGORY_MAIN;
	}


	public void setPRODUCT_CATEGORY_MAIN(String pRODUCT_CATEGORY_MAIN) {
		PRODUCT_CATEGORY_MAIN = pRODUCT_CATEGORY_MAIN;
	}


	public String getPRODUCT_CATEGORY_SUB() {
		return PRODUCT_CATEGORY_SUB;
	}


	public void setPRODUCT_CATEGORY_SUB(String pRODUCT_CATEGORY_SUB) {
		PRODUCT_CATEGORY_SUB = pRODUCT_CATEGORY_SUB;
	}

	

	
	
	
}
