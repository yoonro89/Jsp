package vo;

public class UserVO {
	
	private String id, pwd;
	private int age;
	
	//setters대신 생성자로 받을 수도 있다
	public UserVO(String id, String pwd, int age) {
		this.id = id;
		this.pwd = pwd;
		this.age = age;
	}

	public String getId() {
		return id;
	}

	public String getPwd() {
		return pwd;
	}

	public int getAge() {
		return age;
	}
	
	

}
