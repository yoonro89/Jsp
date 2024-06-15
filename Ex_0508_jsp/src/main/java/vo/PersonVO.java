package vo;

public class PersonVO {
	//VO(value object)
	//DTO(data transaction object)
	//정보를 묶어서 저장하는 클래스
	private String name;
	private int age;
	private String tel;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
