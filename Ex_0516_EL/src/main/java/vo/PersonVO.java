package vo;

public class PersonVO {
	private int age;
	private String name;
	
	public PersonVO(String name, int age) {
		this.name = name;
		this.age = age;
	}

	public int getAge() {
		return age;
	}

	public String getName() {
		return name;
	}
	
}
