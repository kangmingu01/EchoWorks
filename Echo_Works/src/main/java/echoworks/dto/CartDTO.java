package echoworks.dto;

/*
이름          널?       유형     
----------- -------- ------ 
CART_NO     NOT NULL NUMBER 
CART_PSNO            NUMBER 
CART_MEMBER          NUMBER 
CART_NUM             NUMBER 
*/
public class CartDTO {
	private int cart_no;
	private int cart_psno;
	private int cart_member;
	private int cart_num;

	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public CartDTO(int cart_psno, int cart_member, int cart_num) {
		super();
		this.cart_psno = cart_psno;
		this.cart_member = cart_member;
		this.cart_num = cart_num;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public int getCart_psno() {
		return cart_psno;
	}

	public void setCart_psno(int cart_psno) {
		this.cart_psno = cart_psno;
	}

	public int getCart_member() {
		return cart_member;
	}

	public void setCart_member(int cart_member) {
		this.cart_member = cart_member;
	}

	public int getCart_num() {
		return cart_num;
	}

	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	
	
}