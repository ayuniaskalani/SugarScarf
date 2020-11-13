package Bean;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserBean {
String name,ic,address;
String email,password,username;
String cpassword,phone,gender;
String birthdate;
boolean valid;

	//for login validation
	public void setValid(boolean valid) {this.valid=valid;}
	public boolean isValid() {return valid;}
	
	//for 
	public void setName(String name) {this.name=name;}
	public void setUser(String username) {this.username=username;}
	public void setAddress(String address) {this.address=address;}
	public void setEmail(String email) {this.email=email;}
	public void setPassword(String password) {this.password=password;}
	public void setPhone(String phone) {this.phone=phone;}
	public void setBirthdate(String birthdate) {this.birthdate = birthdate;}
	public void setBirthdate(Date birthdate) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		this.birthdate = dateFormat.format(birthdate);
	}
	public void setGender(String gender) {this.gender=gender;}
	
	
	
	public String getName() {return name;}
	public String getUser() {return username;}
	public String getEmail() {return email;}
	public String getPassword() {return password;}
	public String getCpassword() {return cpassword;}
	public String getPhone() {return phone;}
	public String getGender() {return gender;}
	public String getBirthdate() {return birthdate;}
	public String getAddress() {return address;}
}
